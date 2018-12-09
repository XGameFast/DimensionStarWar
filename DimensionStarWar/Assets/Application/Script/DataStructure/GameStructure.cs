using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//游戏玩法上的一些数据结构，包括经验提升多少的数值或者是成就值的提升

public class GameStructure {
    
}

public class CatchGame
{
    
}

public class ProtectGame
{
    
}

public class ChanllengeGame
{
    //挑战成功的固定奖励
    public List<GameReward> fixedGameWinRewards{get;set;}
    //挑战成功时的额外随机奖励
    public List<GameReward> randomGameWinRewards{get;set;}
    //挑战失败时的固定奖励
    public List<GameReward> fixedGameFaildRewards{get;set;}
    //挑战失败是没有额外随机奖励的
}

public class GameReward
{

    //掉落的物件ID
    public int objectID{get;set;}
    //随机物件数量的范围
    public List<int> randomCount{get;set;}
    //随机物件的掉落概率范围
    public List<int> randomDropPercent{get;set;}
}

public class AndaLocalRewardData
{
    public int objID{get;set;}
    public int objCount{get;set;}
}


public class SkillArchievementValue
{
    //成就加成
    // index= 0 为成功 ， =1 为失败。。。。 
    public List<int> archievement { get; set; }

    // 根据skillType的值作为游标，来计算技能公式里的倍数
    public List<int> cucalTimes {get;set;}
}


