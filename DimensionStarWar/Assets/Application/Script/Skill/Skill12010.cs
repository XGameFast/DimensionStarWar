using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12010 : SkillBallistic {

    public override void OnDispawn()
    {
        ObjBackToSelf(mainObj);
        ObjBackToSelf(exploreObj);
        ObjBackToSelf(GatheringObj);
        base.OnDispawn();

    }

    protected override void StartSkill()
    {
        base.StartSkill();
      
        GatheringObj.transform.position = host.selfPostion;
        GatheringObj.gameObject.SetTargetActiveOnce(true);

    }

    protected override void RunningSkill()
    {
        mainObj.transform.parent = null;
        mainObj.transform.position = insPoint.position;
        mainObj.forward = toTargetPoint - mainObj.transform.position;
        mainObj.gameObject.SetTargetActiveOnce(true);
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects","Defense" ,"Skill"};
        dandao.RegisterEvent(Hit, hitLayer, 0);
        //EditorApplication.isPaused = true;
        ResetDestory(2f);

        base.RunningSkill();

    }
    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        if (hitLayer == "Defense")
        {
            var item = AndaDataManager.Instance.InstantiateOtherObj(ONAME.commonDefenseEffectName);
            item.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;
            item.transform.position = mainObj.transform.position;
            ObjBackToSelf(mainObj);
            item.ResetDestory(2f);
        }
        else
            base.Hit(hitTarget, hitLayer);
    }
    protected override void Explore()
    {
        base.Explore();
        exploreObj.transform.parent =null;
        exploreObj.position = mainObj.transform.position;
        exploreObj.gameObject.SetTargetActiveOnce(true);
        ObjBackToSelf(mainObj);
        ResetDestory(2f);
    }

    protected override void StraightLineMovement()
    {
        base.StraightLineMovement();
        if(!isHitTarget)
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() * ARMonsterSceneDataManager.Instance.getARWorldScale;


    }

}
