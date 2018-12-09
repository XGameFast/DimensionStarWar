using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill11001 : SkillDefense {
    public GameObject defenseObj;
    public Renderer[] effectRender;
    public BoxCollider defenseBoxCollider;
    protected override void StartSkill()
    {
        base.StartSkill();
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        defenseObj.gameObject.SetTargetActiveOnce(true);
        defenseBoxCollider.enabled=true;
        ResetDestory(4f);
        transform.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        transform.position = host.body.transform.position;
        transform.forward = - (ARMonsterSceneDataManager.Instance.mainCamera.transform.position - transform.position);
        // StartCoroutine(ExcuteDefenseEffect());
    }

    private IEnumerator ExcuteDefenseEffect()
    {
        float value = 0;
        while(value < 1)
        {
            value+=Time.deltaTime*2;
            for(int i = 0; i < effectRender.Length;i++)
            {
                effectRender[i].material.SetFloat("_value",value);
            }
            yield return null;
        }
        yield return new WaitForSeconds(0.5f);

        while(value >0)
        {
            value-=Time.deltaTime*2;
            for(int i = 0; i < effectRender.Length;i++)
            {
                effectRender[i].material.SetFloat("_value",value);
            }
            yield return null;
        }
        defenseBoxCollider.enabled=false;
    }
}
