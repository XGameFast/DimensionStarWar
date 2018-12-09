﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill11007 :SkillDefense
{

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
        gameObject.SetActive(true);
        transform.position = host.body.transform.position;
    }
    protected override void RunningSkill()
    {
        base.RunningSkill();
        defenseObj.gameObject.SetTargetActiveOnce(true);
        defenseBoxCollider.enabled = true;
    }
}
