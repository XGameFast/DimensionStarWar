using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12009 : SkillBallistic
{

    private bool mainObjIsMoving = false;

    private Vector3 fly;
    private float flyeffect;
    private float targetPointZ;
    private float beginY;
    //特效结束
    public override void OnDispawn()
    {
        //特效返回
        ObjBackToSelf(mainObj);
        ObjBackToSelf(GatheringObj);
        ObjBackToSelf(exploreObj);
        flyeffect = 0;
        //回收
        base.OnDispawn();
    }

    protected override void StraightLineMovement()
    {
        flyeffect += Time.deltaTime * 5;
        var dis = (3.14f / targetPointZ) * flyeffect * (2 * ARMonsterSceneDataManager.Instance.getARWorldScale);
        fly.y = 2.5f * Mathf.Sin(Mathf.Clamp(dis, 0, 3.14f * 1.5f)) * ARMonsterSceneDataManager.Instance.getARWorldScale;
        //技能移动 每帧都在刷新
       // Debug.Log(fly.y);
        base.StraightLineMovement();
        if (!isHitTarget && mainObjIsMoving)//判断是否为击中以及在移动状态下
        {
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() * ARMonsterSceneDataManager.Instance.getARWorldScale;
            mainObj.transform.position = new Vector3(mainObj.transform.position.x, beginY + fly.y, mainObj.transform.position.z);
        }
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
        //击中后2秒消除
        ResetDestory(2f);

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
        flyeffect = 0;
    }

    protected override void StartSkill()
    {
        //技能开始
        base.StartSkill();

        //5秒后销毁
        ResetDestory(4f);

        //初始化 可击中单位的Layer
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects", "Defense", "Skill" };

        //注册被击中事件
        dandao.RegisterEvent(Hit, hitLayer, 0);

        targetPointZ = Vector3.Distance(toTargetPoint,host.transform.position);
        beginY = host.GetComponent<M_1009>().top.position.y;

        GatheringObj.transform.parent = null;
        //激活特效
        GatheringObj.gameObject.SetTargetActiveOnce(true);

        GatheringObj.transform.position = host.GetComponent<M_1009>().bot.position;

    }

    protected override void RunningSkill()
    {
        ObjBackToSelf(GatheringObj);

        ResetDestory(4f);
        //当技能动画到某帧时触发

        base.RunningSkill();
        //技能执行
        mainObjIsMoving = true;

      
        SetObjtToTargetPoint(mainObj.gameObject, host.GetComponent<M_1009>().top.position, true);
        //设置移动特效起始位置
        host.GetComponent<M_1009>().headrender.gameObject.SetTargetActiveOnce(false);
    }
}
