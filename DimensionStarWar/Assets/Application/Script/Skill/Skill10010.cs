using System.Collections;
using System.Collections.Generic;
//using UnityEditor;
using UnityEngine;

public class Skill10010 : SkillBallistic {

    public List<Transform> mainObjs;
    public List<Transform> explores;
    public List<Transform> gathers;


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
        int skillNumber = GetSkillNumber();
        mainObj = mainObjs[skillNumber];

        exploreObj = explores[skillNumber];
        GatheringObj = gathers[skillNumber];
        dandao = mainObj.GetComponent<SkillTriggerEvent>();
        GatheringObj.transform.position = host.selfPostion;
        GatheringObj.gameObject.SetTargetActiveOnce(true);

    }


    protected override void RunningSkill()
    {
        mainObj.transform.parent = null;
        mainObj.transform.position = insPoint.position;
        mainObj.forward = toTargetPoint - mainObj.transform.position;
        mainObj.gameObject.SetTargetActiveOnce(true);
        List<string> hitLayer = new List<string> { host.isPlayer ? "Monster" : "Player", "Objects","Defense" ,"Skill"};
        dandao.RegisterEvent(Hit, hitLayer, 0);
        //EditorApplication.isPaused = true;
        ResetDestory(2f);

        base.RunningSkill();

    }


    protected override void Explore()
    {
        base.Explore();
        exploreObj.transform.parent =null;
        exploreObj.position = mainObj.transform.position;
        exploreObj.gameObject.SetTargetActiveOnce(true);
        ObjBackToSelf(mainObj);
        ResetDestory(2f);
    }



    protected override void Hit(AndaObjectBasic hitTarget, string hitLayer)
    {
        if (hitLayer == "Defense")
        {
            var item = AndaDataManager.Instance.InstantiateOtherObj(ONAME.commonDefenseEffectName);
            item.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;
            item.transform.position = mainObj.transform.position;
            ObjBackToSelf(mainObj);
            item.ResetDestory(2f);
        }
        else
            base.Hit(hitTarget, hitLayer);
    }
    protected override void StraightLineMovement()
    {
        base.StraightLineMovement();
        if(!isHitTarget)
            mainObj.transform.position += mainObj.transform.forward.normalized * Time.deltaTime * playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat() * ARMonsterSceneDataManager.Instance.getARWorldScale; 
    

    }


    private int GetSkillNumber()
    {

        int skillNumber = 0;
        int result = Random.Range(0,10);
        switch(playerSkillAttribute.skillLevel)
        {
            case 0:
                skillNumber = result <= 8? 0 : 1;
                return skillNumber;
            case 1:
                if(result <= 5)
                    skillNumber = 0;
                else 
                    skillNumber =1;
                 return skillNumber;
            case 2:
                if(result <= 3 )
                    skillNumber = 0;
                else if(result >3 && result <=6)
                    skillNumber = 1;
                else skillNumber = 2;
                return skillNumber ;
            case 3:
                if(result <= 5)
                    skillNumber = 1;
                else skillNumber = 2;
                return skillNumber;
        }

        return skillNumber;
                                   
    }




}
