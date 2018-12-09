using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MagicSkill_00 : SkillPrompt {
    /*
     * 显现技能，让隐藏的物体显现
     */

    public override void OnDispawn()
    {
        base.OnDispawn();
        gatherObj.gameObject.SetActive(false);
        gatherObj.transform.localPosition = Vector3.zero;

        mainObj.transform.localPosition = Vector3.zero;
        mainObj.gameObject.SetActive(false);

        exploreObj.gameObject.SetActive(false);
        exploreObj.transform.localPosition = Vector3.zero;
    }

    protected override void StartSkill()
    {
        base.StartSkill();
        gatherObj.gameObject.SetActive(true);
        gatherObj.transform.position = toTargetPoint;

       


        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects" };
        skillTriggerEvent.RegisterEvent(Hit, hitLayer, 0);
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        mainObj.transform.position = toTargetPoint;
        mainObj.gameObject.SetActive(true);
        ResetDestory(2f);
        
    }

    protected override void Explore()
    {
        base.Explore();
        exploreObj.gameObject.SetActive(true);
        exploreObj.transform.position = toTargetPoint;
    }

    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        base.Hit(hitTarget, hitLayer);
        ResetDestory(2f);
    }

}
