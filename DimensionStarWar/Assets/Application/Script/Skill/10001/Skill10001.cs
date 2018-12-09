using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill10001 : SkillBallistic {

    private bool mainObjIsMoving=false;

    public override void OnDispawn()
    {
        ObjBackToSelf(mainObj);
        ObjBackToSelf(exploreObj);
        ObjBackToSelf(GatheringObj);
        base.OnDispawn();
    }

    protected override void StraightLineMovement()
    {
        base.StraightLineMovement();
        if(!isHitTarget && mainObjIsMoving)
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() ;
    }

    protected override void Explore()
    {
        base.Explore();
        SetObjtToTargetPoint(exploreObj.gameObject , mainObj.transform.position);
        mainObj.gameObject.SetActive(false);
    }


    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        //击中后就延迟2秒消除
        ResetDestory(2f);
        mainObjIsMoving=false;
        if (host != null) host.ControllerHitEnemy();
        base.Hit(hitTarget, hitLayer);

    }

    protected override void StartSkill()
    {
        base.StartSkill();
        ResetDestory(5f);
       // Attack10000 attack10000 = AndaDataManager.Instance.InstantiateOtherObj<Attack10000>("Attack10000");
     //   attack10000.transform.parent = null;
     //   attack10000.transform.position = insPoint.transform.position;
        GatheringObj.gameObject.SetTargetActiveOnce(true);
        GatheringObj.transform.position = insPoint.transform.position;
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects","Defense" ,"Skill"};
        dandao.RegisterEvent(Hit, hitLayer, 0);
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        mainObjIsMoving = true;
        ObjBackToSelf(GatheringObj);
        SetObjtToTargetPoint(mainObj.gameObject, insPoint.position, true);
    }

}
