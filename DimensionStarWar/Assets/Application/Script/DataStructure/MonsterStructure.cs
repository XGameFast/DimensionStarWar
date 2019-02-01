using System.Collections;
using System.Collections.Generic;
public class MonsterStructure {

}

public class MonsterSkillAnimationConfig
{
    public int monsterID {get;set;}

    public List<SkillAnimationConfig> skillAnimationConfigs {get;set;}
}

public class SkillAnimationConfig
{
    public int skillID { get; set; }

    public float skillAnimationLength { get; set; }

    public List<float> skillAnimationInterval { get; set; }
}



/// <summary>
/// 怪兽配置数据结构
/// </summary>
public class MonsterBaseConfig :MonsterStructure
{
    //ID
    public int monsterID { get; set; }
    //固有名字
    public string monsterName { get; set; }
    //基础血量
    public int monsterBaseBlood { get; set; }
    //基础移动速度
    public double monsterBaseMoveSpeed { get; set; }
    //基础能量
    public int monsterBaseEnergy { get; set; }
    //基础体力
    public int monsterBaseStrength { get; set; }
    //血量成长系数
    public double bloodCoefficient { get; set; }
    //能量成长系数
    public double energyCoefficient { get; set; }
    //体力成长系数
    public double strengthCoefficient { get; set; }
    //技能ID列表
    public List<int> monsterBaseSkillList { get; set; }
    //每级需要的经验
    public List<int> growUpEXPLimit { get; set; }
    //每级污染度
    public List<double> pollution { get; set; }
    //稀有度
    public int rareType { get; set; }
    //描述
    public string monsterDescription { get; set; }
    //整型，调用时 除100
    public double maxLucky{get;set;}
    //整型 调用时 除100
    public double baseCleanValue {get ;set;}
    //秒
    public int baseCleanTime{get;set;}
}
/// <summary>
/// 怪兽成长属性，数值是动态变化的
/// </summary>
public class MonsterGrowUpAttribute
{
    public int playerIndex { get; set; }
    public int monsterIndex { get; set; }
    public int monsterID { get; set; }
    public int strongholdIndex { get; set; }
    public string monsterNickName { get; set; }
    //稀有度
    public int rareTypeGrowup { get; set; }

    public int monsterMaxPower { get; set; }
    public int monsterRecoveryStrengthFullTime { get; set; }
    //完成打扫的时间 这是一个UnixTime
    public int finishCleanShTime { get; set; }

    public double currentCleanValue { get; set; }
    public double currentLuckyValue { get; set; }

    //宠物当前心情
    public int currentMood { get; set; }

    //完成探险的时间 这是一个UnixTime
    public int startTreasureTime { get; set; }
    //完成探险的时间 这是一个UnixTime
    public int finishTreasureTime { get; set; }
    //当前体力值 ，每局游戏结束后 都需要向服务器同步一次
    public int monsterCurrentPower { get; set; }
    public int belongStrongholdIndex { get; set; }
    public int currentStateType { get; set; }
    public int skinIndex { get; set; }//皮肤游标 
    public List<SkillGrowupAttribute> monsterSkillIDList { get; set; }
}


/// <summary>
/// 将玩家的怪兽 成长属性与 基本属性进行结合
/// </summary>
public class PlayerMonsterAttribute
{
    public int hostIndex { get; set; }
    public int hostType { get; set; }
    public int monsterIndex { get; set; }
    public int monsterID { get; set; }

    public string monsterNickName { get; set; }
    public string monsterName { get; set; }

    public int mosterPower { get; set; }

    public int monsterMaxPower{get;set;}
  
    public float monsterMoveSpeed { get; set; }

    //体力恢复满的时间点，这是一个UnixTime
    public int monsterRecoveryTime { get; set; }
    //完成打扫的时间 这是一个UnixTime
    public int finishCleanShTime { get; set; }
    //探险完成的时间点。这是一个Unixtime
    public int finishTreasureTime { get; set; }
    public int monsterRareType { get; set; }
   
    public int monsterLevel { get; set; }
    //污染度
    public float pollution { get; set; }
    public float maxPollution { get; set; }

    public float lucykValue {get;set;}
    public float maxLucky {get;set;}

    //当前的打扫能力值
    public float curCleanValue{get;set;}
    //基础的打扫时间
    public float baseCleanTime{get;set;}

    public int belongStrongholdIndex { get; set; }


    public int currentStateType { get; set; }

    public string backgroundDes { get; set; }

    public int curMood{get;set;}
    public List<PlayerSkillAttribute> monsterSkillIDList { get; set; }
}
