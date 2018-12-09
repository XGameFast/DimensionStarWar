using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillPrompt : SkillBasic {

    public GameObject gatherObj;
    public GameObject mainObj;
    public GameObject exploreObj;
    public SkillTriggerEvent skillTriggerEvent;
    
    protected override void RunningSkill()
    {
        base.RunningSkill();
    }

    private void SetSkillToTargetPoint()
    {
        mainObj.transform.position = toTargetPoint;
        exploreObj.transform.position = toTargetPoint;
    }

}
