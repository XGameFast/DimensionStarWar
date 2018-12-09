using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill11009 : SkillDefense
{
    public GameObject defenseObj;
    public BoxCollider defenseBoxCollider;

    public override void OnDispawn()
    {
        defenseObj.SetTargetActiveOnce(false);
        defenseBoxCollider.enabled = false;
        base.OnDispawn();
    }

    protected override void StartSkill()
    {
        base.StartSkill();
        ResetDestory(2f);
        defenseObj.transform.position = host.centerForward.transform.position;
    }
    protected override void RunningSkill()
    {
        base.RunningSkill();
        ResetDestory(3f);
        defenseObj.SetTargetActiveOnce(true);
        defenseBoxCollider.enabled = true;
    }
}
