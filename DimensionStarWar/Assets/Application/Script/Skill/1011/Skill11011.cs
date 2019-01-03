using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill11011 : SkillDefense {
    public GameObject defenseObj;
    public BoxCollider defenseBoxCollider;

    public override void OnDispawn()
    {
        defenseObj.gameObject.SetTargetActiveOnce(false);
        defenseBoxCollider.enabled = false;
        base.OnDispawn();
    }
    protected override void StartSkill()
    {
        base.RunningSkill();
        ResetDestory(1.533f);
        transform.SetInto(host.bot);
    }
    protected override void RunningSkill()
    {
        base.RunningSkill();
        gameObject.SetActive(true);
        transform.SetInto(host.bot);
        defenseObj.gameObject.SetTargetActiveOnce(true);
        defenseBoxCollider.enabled = true;
    }
}
