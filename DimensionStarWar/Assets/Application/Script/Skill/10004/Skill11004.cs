using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill11004 : SkillDefense
{
    public GameObject defenseObj;
    public BoxCollider defenseBoxCollider;

    public GameObject xiaoshi;
    public GameObject chuxian;
    public override void OnDispawn()
    {
        host.body.gameObject.SetTargetActiveOnce(true);
        host.GetComponent<BoxCollider>().enabled = true;
        chuxian.SetTargetActiveOnce(false);
        base.OnDispawn();
    }
    protected override void StartSkill()
    {
        base.StartSkill();
        xiaoshi.transform.position = host.transform.position;
        chuxian.transform.position = host.transform.position;
        ResetDestory(3f);
    }
    protected override void RunningSkill()
    {
        base.RunningSkill();
        xiaoshi.SetTargetActiveOnce(true);
        host.body.gameObject.SetTargetActiveOnce(false);
        host.GetComponent<BoxCollider>().enabled = false;
        Invoke("Open", 1.5f);
    }
    public void Open()
    {
        chuxian.SetTargetActiveOnce(true);
        Invoke("Show", 0.3f);
    }
    public void Show()
    {
        xiaoshi.SetTargetActiveOnce(false);
        host.body.gameObject.SetTargetActiveOnce(true);
        host.GetComponent<BoxCollider>().enabled = true;
    }
}
