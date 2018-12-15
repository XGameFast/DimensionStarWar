using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill10004 : SkillBallistic
{

    private bool mainObjIsMoving = false;
    //特效结束
    public override void OnDispawn()
    {
        mainObjIsMoving = false;
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
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat()* ARMonsterSceneDataManager.Instance.getARWorldScale;
    }

    //击中时发生
    protected override void Explore()
    {
        ResetDestory(2f);
        base.Explore();

        //将击中特效放到指定位置
        SetObjtToTargetPoint(exploreObj.gameObject, mainObj.transform.position);//mainObj.transform 表示技能主体在击中时的位置

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
        ResetDestory(1f);

        GatheringObj.transform.parent = null;//ARMonsterSceneDataManager.Instance.aRWorld.transform;
        //激活特效
        GatheringObj.gameObject.SetTargetActiveOnce(true);

        //初始化特效位置  host为 monster
        GatheringObj.transform.position = host.GetComponent<M_1004>().lefteye.transform.position;

        //设置移动特效起始位置
        SetObjtToTargetPoint(mainObj.gameObject, insPoint);
        //初始化 可击中单位的Layer
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster": "Player", "Objects", "Defense", "Skill" };

        //注册被击中事件
        dandao.RegisterEvent(Hit, hitLayer, 0);

    }
    /*protected override void OnUpdate()
    {
        base.OnUpdate();
        if (isRunning&&!mainObjIsMoving)//判断是否为击中以及在移动状态下
        {
            mainObj.gameObject.transform.position = insPoint.position;
        }

    }*/

    protected override void RunningSkill()
    {
        base.RunningSkill();
        ObjBackToSelf(GatheringObj);
        ResetDestory(2f);
        //技能执行
        mainObj.gameObject.transform.parent = null;
        mainObjIsMoving = true;

    }
}
