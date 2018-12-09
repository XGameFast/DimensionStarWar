using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill11003 : SkillDefense {
   
    public GameObject defenseObj;
    public BoxCollider defenseBoxCollider;

    public override void OnDispawn()
    {
        defenseObj.gameObject.SetTargetActiveOnce(false);
        defenseBoxCollider.enabled=false;
        base.OnDispawn();
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        defenseObj.gameObject.SetTargetActiveOnce(true);
        defenseBoxCollider.enabled=true;
        ResetDestory(3f);
        transform.position = host.body.transform.position;
    }

}
