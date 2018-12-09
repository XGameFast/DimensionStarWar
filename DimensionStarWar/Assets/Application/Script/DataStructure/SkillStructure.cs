using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillStructure {
}
/// <summary>
/// 技能基础配置
/// </summary>
public class SkillBaseAttribute
{
    public int skillID { get; set; }
    public List<int> skillArchievementLimit{get;set;}
    /// <summary>
    /// 适用于组合技能类型的大招。
    /// </summary>
    public List<int> skillIDList { get; set; }
    public string skillName { get; set; }
    public double skillMoveSpeed { get; set; }
    public List<int> skillPower { get; set; }
    public List<int> skillCosumeEenrgy { get; set; }
    public List<double> skillCD { get; set; }
    public int skillEffectID { get; set; }

    // 攻击 = 0 ， 防御= 1 , 治疗=2，位移 = 3， 4 = 法术 5= 指向性
    public int skillType { get; set; }

    //普攻= 0 ， 组合 =1 ，施法 =2， 闪避 = 3（格挡或者位移闪避）；
    public int attackType { get; set; }

    public string skillDescription { get; set; }
}
/// <summary>
/// 技能的成长属性
/// </summary>
public class SkillGrowupAttribute
{
    public int skillIndex { get; set; }
    public int skillID { get; set; }
    public string skillNickName { get; set; }
    public int monsterIndex{get; set; }
    public int hostIndex{get;set;}
    public int skillAchievementValue { get; set; }

}
/// <summary>
/// 玩家当前带的技能 成长了的属性与基础属性的结合
/// </summary>
public class PlayerSkillAttribute
{
    public int skillIndex { get; set; }
    public int skillID { get; set; }
    public string skillName { get; set; }
    public string skillNickName { get; set; }
    public int skillPower { get; set; }
    public float skillCD { get; set; }
    public int skillEffectID { get; set; }
    public int skillCosumeEnergy { get; set; }
    public SkillBaseAttribute baseSkillAttribute { get; set; }
    public int skillLevel{get;set;}
    public int skillAchievement{get;set;}
}
