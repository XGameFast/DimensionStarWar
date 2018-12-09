using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IceArrow_02 : SkillBallistic {
    public override void OnDispawn()
    {
        ObjBackToSelf(mainObj);
        ObjBackToSelf(exploreObj);
        ObjBackToSelf(trailObj);
        base.OnDispawn();
    }
    
    public override void OnSpawn()
    {
        base.OnSpawn();
      
    }
    public IEnumerator YieldWait()
    {
        yield return new WaitForSeconds(0.5f);
    }


    public void DropGround(AndaObjectBasic hittarget, string Layer)
    {
        CheckHitEnemey(Layer);
    }
    protected override void Explore()
    {
        base.Explore();
        SetObjtToTargetPoint(exploreObj.gameObject, mainObj.transform.position);
        ObjBackToSelf(mainObj);
    }
    /// <summary>
    /// 这种范围伤害 再爆炸的时候在检测周围有没有敌人被击中
    /// </summary>
    private void CheckHitEnemey(string Layer)
    {
        foreach (var go in ARMonsterSceneDataManager.Instance.enemyList)
        {
            float distance = Vector3.Distance(mainObj.transform.position, go.transform.position);
            if (distance < 1)
            {
                Hit(go, Layer);
            }
        }
    }
    protected override void StartSkill()
    {
        base.StartSkill();
        SetObjtToTargetPoint(mainObj.gameObject, instanPoint);
        List<string> hitLayer = new List<string> {"Wall", "Objects" };
        dandao.RegisterEvent(DropGround, hitLayer, 1);
        UsingSkill();
    }
   
    protected override void OnUpdate()
    {
        base.OnUpdate();
        if (isExcuting)
        {
            trailObj.transform.position = mainObj.transform.position;
        }
        if (mainObj.gameObject.activeSelf)
        {
            fSounds.transform.position = mainObj.transform.position;
        }
        if (hSounds.gameObject.activeSelf)
        {
            hSounds.transform.position = exploreObj.transform.position;
        }
    }
}
