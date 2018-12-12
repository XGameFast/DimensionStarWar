using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill10009 : SkillBallistic
{
    private bool mainObjIsMoving = false;

    public TrailRenderer l;
    public TrailRenderer r;
    //特效结束
    public override void OnDispawn()
    {
        l.Clear();
        r.Clear();
        //特效返回
        ObjBackToSelf(mainObj);
        ObjBackToSelf(GatheringObj);
        ObjBackToSelf(exploreObj);
        //回收
        host.GetComponent<M_1009>().leftHandP1.gameObject.SetTargetActiveOnce(true);
        host.GetComponent<M_1009>().rightHandP1.gameObject.SetTargetActiveOnce(true);
        base.OnDispawn();
    }

    protected override void StraightLineMovement()
    {

        //技能移动 每帧都在刷新
        base.StraightLineMovement();
        if (!isHitTarget && mainObjIsMoving)//判断是否为击中以及在移动状态下
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() * ARMonsterSceneDataManager.Instance.getARWorldScale; 
    }

    //击中时发生
    protected override void Explore()
    {
        base.Explore();

        //将击中特效放到指定位置
        SetObjtToTargetPoint(exploreObj.gameObject, mainObj.transform.position);//mainObj.transform 表示技能主体在击中时的位置

        mainObj.gameObject.SetTargetActiveOnce(false);
        //击中时执行
    }

    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {

        //特效回收
        ObjBackToSelf(GatheringObj);


        //击中后2秒消除
        ResetDestory(2f);

        //击中后停止移动
        mainObjIsMoving = false;

        host.GetComponent<M_1009>().leftHandP1.gameObject.SetTargetActiveOnce(true);
        host.GetComponent<M_1009>().rightHandP1.gameObject.SetTargetActiveOnce(true);

        if (hitLayer == "Defense")
        {
            var item = AndaDataManager.Instance.InstantiateOtherObj(ONAME.commonDefenseEffectName);
            item.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;
            item.transform.position = mainObj.transform.position;
            ObjBackToSelf(mainObj);
            item.ResetDestory(2f);
        }
        else
        {
            //判断Monster是否为null
            if (host != null) host.ControllerHitEnemy();

            //击中目标 发送相关事件
             base.Hit(hitTarget, hitLayer);
        }
    }

    protected override void StartSkill()
    {
        host.GetComponent<M_1009>().leftHandP1.gameObject.SetTargetActiveOnce(true);
        host.GetComponent<M_1009>().rightHandP1.gameObject.SetTargetActiveOnce(true);
        //技能开始
        base.StartSkill();

        //5秒后销毁
        ResetDestory(2f);

        //初始化 可击中单位的Layer
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects", "Defense", "Skill" };

        //注册被击中事件
        dandao.RegisterEvent(Hit, hitLayer, 0);

    }

    protected override void RunningSkill()
    {
        //当技能动画到某帧时触发

        base.RunningSkill();

        ResetDestory(2f);
        //技能执行
        mainObjIsMoving = true;

        GatheringObj.transform.parent = null;
        //激活特效
        GatheringObj.gameObject.SetTargetActiveOnce(true);

        l.Clear();
        r.Clear();

        GatheringObj.transform.position = insPoint.position;

        SetObjtToTargetPoint(mainObj.gameObject, insPoint.position, true);
        mainObj.gameObject.SetTargetActiveOnce(true);

        if (insPoint.name == "lefthand")
        {
            host.GetComponent<M_1009>().leftHandP1.gameObject.SetTargetActiveOnce(false);
            host.GetComponent<M_1009>().rightHandP1.gameObject.SetTargetActiveOnce(true);
        }
        else {
            host.GetComponent<M_1009>().leftHandP1.gameObject.SetTargetActiveOnce(true);
            host.GetComponent<M_1009>().rightHandP1.gameObject.SetTargetActiveOnce(false);
        }

    }
}
