using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12011 : SkillBallistic
{

    private bool mainObjIsMoving = false;

    //特效结束
    public override void OnDispawn()
    {
        //特效返回
        ObjBackToSelf(mainObj);
        ObjBackToSelf(GatheringObj);
        //回收
        base.OnDispawn();
    }
    //击中时发生
    protected override void Explore()
    {
        base.Explore();
    }

    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        //击中时执行

        //击中后2秒消除
        ResetDestory(2f);

        //mainObj.gameObject.SetTargetActiveOnce(false);

        //if (hitLayer == "Defense")
        //{
        //    var item = AndaDataManager.Instance.InstantiateOtherObj(ONAME.commonDefenseEffectName);
        //    item.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;
        //    item.transform.position = mainObj.transform.position;
        //    ObjBackToSelf(mainObj);
        //    item.ResetDestory(2f);
        //}
        //else
        //{
        //判断Monster是否为null
        if (host != null) host.ControllerHitEnemy();

        //击中目标 发送相关事件
        base.Hit(hitTarget, hitLayer);
        //}
    }

    protected override void StartSkill()
    {
        //技能开始
        base.StartSkill();
        //5秒后销毁
        ResetDestory(3f);
        //初始化 可击中单位的Layer
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects", "Defense", "Skill" };
        //注册被击中事件
        dandao.RegisterEvent(Hit, hitLayer, 0);
    }

    protected override void RunningSkill()
    {
        //当技能动画到某帧时触发

        base.RunningSkill();

        GatheringObj.SetInto(host.leftLeg);
        GatheringObj.gameObject.SetTargetActiveOnce(true);
       
        mainObj.transform.position = new Vector3(toTargetPoint.x, 0, toTargetPoint.z);
        mainObj.gameObject.SetTargetActiveOnce(true);
    }
}
