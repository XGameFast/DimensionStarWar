using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12003 : SkillBallistic
{
    private bool mainObjIsMoving = false;

    public List<GameObject> danMuList;
    public List<float> danMuFlyTime;
    public List<bool> danMuFly;

    public float dis = 0.2f;
    public int count = 7;
    public int hitindex = 0;
    //特效结束
    public override void OnDispawn()
    {
        hitindex = 0;
        if (danMuList != null)
        {
            int count = danMuList.Count;

            for (int i = 0; i < count; i++)
            {
                Destroy(danMuList[i]);
            }
            ////特效返回
            //foreach (var m in danMuList)
            //{
            //    ObjBackToSelf(m);
            //}
            danMuList.Clear();
            danMuFly.Clear();
            danMuFlyTime.Clear();
        }
        GatheringObj.gameObject.SetTargetActiveOnce(false);
        ObjBackToSelf(exploreObj);
        //回收
        base.OnDispawn();
    }
   
    protected override void StraightLineMovement()
    {
        //技能移动 每帧都在刷新
        base.StraightLineMovement();
        if (danMuFlyTime != null && danMuFly != null && danMuFlyTime != null && danMuFly.Count != 0 && danMuFlyTime.Count!=0)
        {
            for (int i = 0; i < danMuList.Count; i++)
            {
                if (danMuFly[i])
                {
                    if (danMuFlyTime[i] <= 0)//控制间隔
                    {
                        danMuList[i].SetTargetActiveOnce(true);
                        if (danMuFlyTime[i] <= -0.1f)//控制间隔
                        {
                            danMuList[i].transform.position += danMuList[i].transform.forward.normalized* Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() * ARMonsterSceneDataManager.Instance.getARWorldScale;
                        }
                    }
                    danMuFlyTime[i] -= Time.deltaTime;
                }
            }
        }
    }

    //击中时发生
    protected override void Explore()
    {
        base.Explore();
        //将击中特效放到指定位置

        //选择特效

        //Debug.Log(danMuList[hitindex].transform.GetChild(1).position);
        var expobj = exploreObj.transform.GetChild(Random.Range(0, 3)).gameObject.Clone();
        expobj.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;
        SetObjtToTargetPoint(expobj, danMuList[hitindex].transform.GetChild(1).position);//mainObj.transform 表示技能主体在击中时的位置
        ObjBackToSelf(danMuList[hitindex]);
        Destroy(expobj, 2f);
        //mainObj.gameObject.SetTargetActiveOnce(false);
    }

    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        //击中时执行

        //击中后2秒消除
        ResetDestory(2f);

        danMuFly[hitindex] = false;
        danMuList[hitindex].gameObject.SetTargetActiveOnce(false);

        if (hitLayer == "Defense")
        {
            var item = AndaDataManager.Instance.InstantiateOtherObj(ONAME.commonDefenseEffectName);
            item.transform.localScale =Vector3.one *  ARMonsterSceneDataManager.Instance.getARWorldScale;
            item.transform.position = danMuList[hitindex].transform.position;
            ObjBackToSelf(danMuList[hitindex]);
            item.ResetDestory(2f);
        }
        else
        {
            //判断Monster是否为null
            if (host != null) host.ControllerHitEnemy();

            //击中目标 发送相关事件
            base.Hit(hitTarget, hitLayer);
        }

        hitindex++;
    }

    protected override void StartSkill()
    {
        this.gameObject.transform.position=host.transform.position;
        //this.transform.forward *= -1;

        //技能开始
        base.StartSkill();

        //5秒后销毁
        ResetDestory(5f);

        //激活特效
        GatheringObj.gameObject.SetTargetActiveOnce(true);

          
        //初始化 可击中单位的Layer
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects", "Defense", "Skill" };


        //注册被击中事件

      
        danMuList = new List<GameObject>();
        for (int i = 0; i < count; i++)
        {
            var dantou = mainObj.gameObject.Clone();
            danMuList.Add(dantou);
            dantou.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;  
                
            dantou.transform.position = GatheringObj.transform.position;
            dantou.transform.GetChild(1).GetComponent<SkillTriggerEvent>().RegisterEvent(Hit, hitLayer, 0);
            danMuList[i].transform.forward = (toTargetPoint - danMuList[i].transform.position);
        }

    }

    protected override void RunningSkill()
    {
        //当技能动画到某帧时触发

        base.RunningSkill();
        ResetDestory(5f);
        //技能执行

        for (int i = 0; i < count; i++)
        {
            danMuFly.Add(true);
            danMuFlyTime.Add(i * dis);
        }
        //目标位置
        

        //特效回收
        //ObjBackToSelf(GatheringObj);

        //设置移动特效起始位置
        foreach (var m in danMuList)
        {
            SetObjtToTargetPoint(m, GatheringObj.position, true);
            m.SetTargetActiveOnce(false);
        }
    }
}
