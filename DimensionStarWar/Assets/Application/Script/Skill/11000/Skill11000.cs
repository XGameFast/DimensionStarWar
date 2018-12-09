using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill11000 : SkillDefense {
    public GameObject hitLight;
    public BoxCollider defensecollider;
    protected override void StartSkill()
    {
        base.StartSkill();
        //ResetDestory(1f);
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        defensecollider.enabled=true;
        ResetDestory(2f);
        transform.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        transform.parent = null;
        transform.position = host.center.transform.position;
        transform.forward = host.transform.forward;
        //transform.forward = - (ARMonsterSceneDataManager.Instance.mainCamera.transform.position - transform.position);
        //StartCoroutine(ExcuteDefenseEffect());
    }




}
