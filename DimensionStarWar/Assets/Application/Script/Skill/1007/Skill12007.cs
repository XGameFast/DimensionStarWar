using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12007 : SkillBallistic
{
    private bool mainObjIsMoving = false;

    //特效结束
    public override void OnDispawn()
    {
        //特效返回
        ObjBackToSelf(mainObj);
        ObjBackToSelf(GatheringObj);
        ObjBackToSelf(exploreObj);

        //回收
        base.OnDispawn();
    }

    protected override void StraightLineMovement()
    {
        //技能移动 每帧都在刷新
        base.StraightLineMovement();
        if (!isHitTarget && mainObjIsMoving)//判断是否为击中以及在移动状态下
        {
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() * ARMonsterSceneDataManager.Instance.getARWorldScale*3f;
            GatheringObj.localRotation= Quaternion.Euler(mainObj.localRotation.eulerAngles.x,0,0);
        }
    }

    //击中时发生
    protected override void Explore()
    {
        base.Explore();
        //将击中特效放到指定位置
        SetObjtToTargetPoint(exploreObj.gameObject, mainObj.transform.position);//mainObj.transform 表示技能主体在击中时的位置
        ObjBackToSelf(mainObj);
        mainObj.gameObject.SetTargetActiveOnce(false);
    }

    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        //击中时执行

        //击中后2秒消除
        ResetDestory(2f);

        //mainObj.gameObject.SetTargetActiveOnce(false);

        //击中后停止移动
        mainObjIsMoving = false;
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
        //技能开始
        base.StartSkill();

        //5秒后销毁
        ResetDestory(5f);


        GatheringObj.transform.parent = null;
        //初始化特效位置  host为 monster
        //GatheringObj.transform.position = insPoint.position;
        GatheringObj.gameObject.SetInto(host.leftLeg);
        SetObjtToTargetPoint(GatheringObj.gameObject, host.leftLeg.position, false);

        //初始化 可击中单位的Layer
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects", "Defense", "Skill" };

        //注册被击中事件
        dandao.RegisterEvent(Hit, hitLayer, 0);

    }

    protected override void RunningSkill()
    {
        //当技能动画到某帧时触发

        base.RunningSkill();
        //技能执行
        mainObjIsMoving = true;

        //设置移动特效起始位置
        SetObjtToTargetPoint(mainObj.gameObject, host.leftLeg.position, true);

      
        //激活特效
        GatheringObj.gameObject.SetTargetActiveOnce(true);
    }
}
