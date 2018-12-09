using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill10003 : SkillBallistic {

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
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() * ARMonsterSceneDataManager.Instance.getARWorldScale;
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
            if (host != null) host.ControllerHitEnemy();
            base.Hit(hitTarget, hitLayer);
        }

    }

    protected override void StartSkill()
    {
        base.StartSkill();
        ResetDestory(2f);
        // Attack10000 attack10000 = AndaDataManager.Instance.InstantiateOtherObj<Attack10000>("Attack10000");
        // attack10000.transform.parent = null;
        // attack10000.transform.position = insPoint.transform.position;
        GatheringObj.gameObject.SetTargetActiveOnce(true);
        GatheringObj.transform.position = new Vector3( host.selfPosX, host.selfPosY ,  host.selfPosZ+0.1f*ARMonsterSceneDataManager.Instance.getARWorldScale);

        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects","Defense" ,"Skill"};
        
        dandao.RegisterEvent(Hit, hitLayer, 0);
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        ResetDestory(2f);
        mainObjIsMoving = true;
        ObjBackToSelf(GatheringObj);
        SetObjtToTargetPoint(mainObj.gameObject, host.rightHand.position, true);
         

    }

}
