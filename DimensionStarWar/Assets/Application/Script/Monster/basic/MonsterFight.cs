using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class MonsterFight  {

    public MonsterBasic self;

    private int currentSkillID;//这个当前技能属性里面，小技能的ID，（因为组合技能技能是由多个小技能组合而成）

    private SkillBasic currentSkillBasic;//这个脚本 也有可能是组合技能中的小技能

    private Vector3 currentTargetPoint;
    private Transform currentTarget;

    private PlayerSkillAttribute tmpPlayerSkillAttribute;
    
    public MonsterDataValue monsterDataValue
    {
        get { return self.monsterDataValue; }
    }
    public PlayerSkillAttribute currentPlayerSkillAttribute
    {
        get { return monsterDataValue.curretnPlayerAttribute; }
    }

    public void DownloadMessage(MonsterBasic mb)
    {
        self = mb;
        InitValue();
    }
    public void InitValue()
    {

        InitSkillValue();
    }
    private void InitSkillValue()
    {

        currentSkillBasic = null;
        currentSkillID = 0;
        currentTargetPoint = Vector3.zero;
        tmpPlayerSkillAttribute = null;
        currentTarget = null;
    }

    private void SetTempSkillAtrribute()
    {
        tmpPlayerSkillAttribute = currentPlayerSkillAttribute; 
    }

   


  
    //调用这个会到达指定位置
    public void SetAttackPoint(Vector3 targetPoint )
    {
        currentTargetPoint = targetPoint;
        //Debug.Log("currentTargetPoint" + currentTargetPoint);
        SetTempSkillAtrribute();
    }
    //调用这个攻击 会锁定目标，
    public void SetAttackTarget(Transform target)
    {
        currentTarget = target;
        currentTargetPoint = currentTarget.position;
        SetTempSkillAtrribute();
    }

    public void InstantiateSkill(Transform fromPoint)
    {
        AndaObjectBasic aob = AndaDataManager.Instance.InstantaiteSkillObj(currentSkillID.ToString()); //c.GetComponent<AndaObjectBasic>();
        currentSkillBasic = aob.GetComponent<SkillBasic>();
        aob.transform.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        aob.transform.position = self.selfPostion;
        PlayerSkillAttribute psa = monsterDataValue.GetPlayerSkillAttribute(currentSkillID) ;
        if (psa == null) Debug.Log("技能屎空的啊");
        currentSkillBasic.SetSkillInfo(monsterDataValue.GetPlayerSkillAttribute(currentSkillID), self ,fromPoint, currentTargetPoint);
    }

    public void PlaySkillStep00()
    {
        currentSkillBasic.ReadySkill();
    }

    public void PlaySkillStep01()
    {
        currentSkillBasic.UsingSkill();
    }

    public void PlaySkillStep02()
    {

    }

    public void PlayerSkillStep03()
    {

    }



    public void AnimationMaigcSkill()
    {

    }

    //-----AnimationEvent
    public void AnimatorStartSkill(Transform targetPoint)
    {
        currentSkillID = tmpPlayerSkillAttribute.baseSkillAttribute.skillIDList[0];
        InstantiateSkill(targetPoint);
    }
    public void AnimatorStartCombinationSkill(Transform targetPoint, int index)
    {
        
        currentSkillID = tmpPlayerSkillAttribute.baseSkillAttribute.skillIDList[index];
        InstantiateSkill(targetPoint);
    }


    
    //这个方法是由攻击动画调用，如果执行了这里。技能是不会被打断。 如果没由调这里。技能是会打段
    public void AnimatorUsingSkill()
    {
        currentSkillBasic.UsingSkill();
    }
    
    /// <summary>
    /// 提前结束
    /// </summary>
    public void AnimatorEndSkill()
    {
        
    }
    /// <summary>
    /// 退出动画
    /// </summary>
    public void AnimatorOutSkill()
    {
       

    }
    /// <summary>
    /// 当前的攻击动画被打断。 Hitd动画有权调用这个脚本
    /// </summary>
    public void AnimatorStopSkill()
    {
       
    }
}


