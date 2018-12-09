using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IceArrow_01 : SkillBallistic {
    
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
        SetObjtToTargetPoint(GatheringObj.gameObject, insPoint);
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects" };
        dandao.RegisterEvent(Hit, hitLayer, 0);
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        ObjBackToSelf(GatheringObj);
        SetObjtToTargetPoint(mainObj.gameObject, insPoint.position, true);
    }
  
    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        hitPoint = mainObj.transform.position;
        base.Hit(hitTarget, hitLayer);
        ResetDestory(5f);
    }
    protected override void Explore()
    {
        base.Explore();
        SetObjtToTargetPoint(exploreObj.gameObject, new Vector3(mainObj.transform.position.x, host.transform.position.y ,mainObj.transform.position.z));
        mainObj.gameObject.SetActive(false);

        StartCoroutine(BuildIceArrow());
    }
    private Vector3 hitPoint;

    private IEnumerator BuildIceArrow()
    {
        Vector3[] v3 = new Vector3[] { new Vector3(-0.5f, 2, 0), new Vector3(0.5f, 2, 0), new Vector3(0, 2, 0.5f) };
        SkillBaseAttribute skb = MonsterGameData.GetSkillBaseAttribute(10002);
        PlayerSkillAttribute psa = new PlayerSkillAttribute()
        {
            skillID = 10002,
            skillName = skb.skillName,
            skillPower = 50,
            skillCD = 0.5f,
            baseSkillAttribute = skb,
        };
        for (int i = 0; i < 3; i++)
        {
            AndaObjectBasic aob = AndaDataManager.Instance.InstantaiteSkillObj("10002");
            SkillBasic skillBasic = ((SkillBasic)aob);
            Vector3 tmpPoint = new Vector3(hitPoint.x + v3[i].x, hitPoint.y + v3[i].y, hitPoint.z + v3[i].z);
            skillBasic.SetSkillInfo(psa, host, tmpPoint, new Vector3(tmpPoint.x, ARMonsterSceneDataManager.Instance.arWolrdCenterPosition.y, tmpPoint.z));
            skillBasic.ReadySkill();
            yield return new WaitForSeconds(0.25f);
        }
    }

    protected override void OnUpdate()
    {
        base.OnUpdate();
    }

    
}
