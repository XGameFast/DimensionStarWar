using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeisureMonster : PlayerMonster {
    
    #region 执行喂养的功能。（包括自动注意到食物）
    private ObjectBasic ob;
    private System.Action<int> CallBack_GetEXPBlock;
    /// <summary>
    /// 注意力对焦物件
    /// </summary>
    private void FouseToOb()
    {
        if (ob == null) return;
       
        self.ControllerToRotateBodyByPoint(ob.selfPosZeroHeight);
    }

    private IEnumerator WaitTime()
    {
        yield return new WaitForSeconds(0.5f);
        if (self.CheckCanMove())
        {
            self.PlayAnimationState();
            self.ControllerFollowTarget(ob);
            //
        }
    }
    
    public void AttantionFeed(System.Action<int> callBack)
    {
        CallBack_GetEXPBlock = callBack;
        //筛选出离玩家最近的经验精粹
        ob = ARMonsterSceneDataManager.Instance.SortNearMonsterObjects(self);

        self.StartCoroutine(WaitTime());
    }
    
    /// <summary>
    /// 捡到物件
    /// </summary>
    private void DeterminiPickUp()
    {
        if (ob == null)
        {
            
            return;
        }
        float distance = Vector3.Distance(self.selfPostion, ob.selfPostion);
        if (distance < 0.3f)
        {
            self.ControllerEndMove();
            self.ControllerToIdle();

            if (CallBack_GetEXPBlock != null)
            {
                CallBack_GetEXPBlock(ob.objectDataValue.objectID);
            }

            //表演开心
            self.ControllPlayerMood(OTYPE.MonsterMoodStateType.happy);
            
            //会播放特效 并且成长经验
            ARMonsterSceneDataManager.Instance.consumableList.Remove(ob);
            ob.DestroyByAndaDataManager();
        }
        else
        {
            //注意力对焦物件
            FouseToOb();
        }
    }
    #endregion

    #region 执行清扫功能 ,但也会受到经验精粹的诱惑
    private float interval;//执行事件的时间间隔
    private float timeLimit;
    private bool isMoveEvent = false;
    private bool isCleanEvent = false;
    private int currentRootIndex;
    private List<Transform> adRoot;
    public void StartClen(List<Transform> cleanRoot )
    {
        currentRootIndex = 1;
        isCleanEvent = true;
        adRoot = cleanRoot;
        interval = Time.time;
        timeLimit = 5f;
    }
    /// <summary>
    /// 再移动期间。每隔一段时间就进行打扫动画。
    /// </summary>
    private void ExcuteMoveEvent()
    {
        Transform point = adRoot[currentRootIndex];
        if (self.CheckCanMove())
        {
            self.PlayAnimationState();
            self.ControllerMoveToTargetPoint(point.position,CallBack_FinishMove);
            self.ControllerToRotateBodyByPoint(point.position,0.25f);
        }
    }

    private void CallBack_FinishMove()
    {
        self.ControllerToIdle();
        currentRootIndex = currentRootIndex >= adRoot.Count ? 0 : currentRootIndex += 1;
        isMoveEvent = false;
        isCleanEvent = true;
        interval = Time.time;
    }
    /// <summary>
    /// 在清扫期间。每隔一段时间就进行移动
    /// </summary>
    private void ExcuteCleanEvent()
    {
        if (self.isMove)
        {
            self.ControllerEndMove();
        }
        //清扫
        Debug.Log("Clear");
    }
    
    //等待打扫结束 切换到自主寻路
    private void IntervalClean()
    {
        if (Time.time - interval > timeLimit)
        {
            ExcuteMoveEvent();
            isCleanEvent = false;
        }
        else
        {
            ExcuteCleanEvent();
        }
    }

    #endregion

    protected override void OnUpdate()
    {
        base.OnUpdate();
        DeterminiPickUp();

        if (isCleanEvent)
        {
            IntervalClean();
        }
        //FouseToOb();
    }
}
