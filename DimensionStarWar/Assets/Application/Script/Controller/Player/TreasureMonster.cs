using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreasureMonster : PlayerMonster {
    

    private Transform followTarget
    {
        get
        {
            return ARMonsterSceneDataManager.Instance.mainCamera.transform;
        }
    }
   
    public System.Action<bool> MonsterFindTargetPoint;
    private bool monsterFinding = false;
    private float findLoadTime;
    private float findTimeLimit;
    private bool isFound = false;
    private Vector3 targetFindPoint;
    private int randomCount;
    private int randomTimes;


    protected override void OnInitValue()
    {
        base.OnInitValue();
        findLoadTime = 0;
        findTimeLimit = 0;
        monsterFinding = false;
        randomCount = 0;
        randomTimes = 0;
        isFound = false;
        StartPlayerControll();
    }
    public void AutoFindTarget(Vector3 point)
    {
        if (monsterFinding) return;
        EndPlayerControll();
        targetFindPoint = point;
        findLoadTime = Time.time;
        findTimeLimit = 1;
        monsterFinding = true;
        randomCount = 0;
        randomCount = Random.Range(3, 5);
    }
    #region 发动自主寻找
    private void Finding()
    {
        if (Time.time - findLoadTime > findTimeLimit)
        {
            self.StartCoroutine(GotoNextPoint());
            findLoadTime = Time.time;
            findTimeLimit = Random.Range(10, 20f);
        }
        else
        {
            var t = targetFindPoint - self.selfPostion;
            var angle = Vector3.Angle(t, self.transform.forward);
            var distance = Vector3.Distance(targetFindPoint, self.selfPostion);
            if (angle < 45 && distance < 2f)
            {
                OverAutoFind();
            }

            if (self.selfPostion == tmpPoint)
            {
                findLoadTime = Time.time;
                findTimeLimit = 0;
            }

        }
    }
   
    
    
    //移动的目标位置
    private Vector3 tmpPoint;
    private IEnumerator GotoNextPoint()
    {
        randomTimes++;
        Vector3 pos2 = new Vector3();
        if (randomTimes >= randomCount)
        {
            pos2 = targetFindPoint;
        }
        else
        {
            /*   Vector2 p = Random.insideUnitCircle * 5;
              Vector2 pos = p.normalized * (.8f + p.magnitude);

              targetFindPoint += targetFindPoint.
              pos2 = targetFindPoint + new Vector3(, 0, pos.y);*/
            int i = Random.Range(0, 2);
            int angle = Random.Range(30, 45);
            int dir = i == 0 ? -1 : 1;
            float dis = Random.Range(0.5f, 1.2f);
            Quaternion r0 = Quaternion.Euler(self.selfRotation.eulerAngles.x, self.selfRotation.eulerAngles.y - dir* angle, self.selfRotation.eulerAngles.z);

            pos2 = (self.selfPostion + (r0 * Vector3.forward) * dis);
        }
      
        tmpPoint = pos2;

        Quaternion targetRotateHead = Quaternion.LookRotation(new Vector3(pos2.x, self.head.position.y , pos2.z) - self.head.position);
        self.ControllerRotateHeadToTargetDir(self.head.rotation,targetRotateHead ,0.25f);

        yield return new WaitForSeconds(0.25f);
        Quaternion targetRotateBody= Quaternion.LookRotation(pos2 - self.selfPostion);

        self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, targetRotateBody, 0.35f);
        ///
        if (self.CheckCanMove())
        {
            self.ControllerMoveToTargetPoint(self.selfPostion, pos2,moveSpeed);
            self.PlayAnimationState();
        }
    }


    private void OverAutoFind()
    {
        isFound = true;
        canUseSkill = true;

        self.StartCoroutine(MoveTargetTargetPointEdge());

        if (MonsterFindTargetPoint != null)
        {
            MonsterFindTargetPoint(true);
        }

        if (self.isMove)
        {
            self.ControllerEndAllActive();

            self.ControllerToIdle();
        }
        
        monsterFinding = false;
     
    }


    private IEnumerator MoveTargetTargetPointEdge()
    {
        yield return new WaitForSeconds(1f);
        Quaternion targetRotateBody = Quaternion.LookRotation(followTarget.position.GetTargetPointWithSelfY(self.selfPosY) - self.selfPostion);

        self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, targetRotateBody, 0.35f);
       
        yield return new WaitForSeconds(0.25f);

        Quaternion targetRotateHead = Quaternion.LookRotation(followTarget.position - self.head.position);
        self.ControllerRotateHeadToTargetDir(self.head.rotation, targetRotateHead, 0.25f);


        yield return new WaitForSeconds(0.5F);

        self.ControllerEndAllActive();

        self.ControllerToIdle();

        self.ControllPlayerMood(OTYPE.MonsterMoodStateType.happy);
    }
   
    #endregion




    protected override void OnUpdate()
    {
        base.OnUpdate();

        if (monsterFinding)
        {
            Finding();
            //自主寻找过程中，无法使用技能
            canUseSkill = false;
        }
        else
        {
            //结束了自主寻找，可以攻击了
            canUseSkill = true;
            if (isFound)
            {
                //找到了 就直接把攻击目标赋值给怪兽
                currentAttackTargetPoint = targetFindPoint;
                Debug.Log("targetFindPoint" + currentAttackTargetPoint);
            }
            else
            {
                //如果没有找到，则目标为玩家看向的地方
                currentAttackTargetPoint = hitPoint;
            }
        }
        
    }
    //
}
