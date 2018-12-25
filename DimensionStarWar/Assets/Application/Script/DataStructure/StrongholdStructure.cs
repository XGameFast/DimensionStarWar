using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StrongholdStructure {

}

public class BusinessActivity
{
    public int activityIndex { get; set; }
    public int hostInedex { get; set; }
    public string activeDescription { get; set; }
    public string activeURL { get; set; }
}

public class BusinessCoupon
{
    //优惠卷Index
    public int businesscouponIndex { get; set; }
    //商家Index
    public int userIndex { get; set; }
    //所属据点Index
    public int strongholdIndex { get; set; }
    //二维码预留字段
    public string code { get; set; }
    //优惠卷图片链接
    public string image { get; set; }
    //优惠卷标题
    public string title { get; set; }
    //优惠卷描述
    public string description { get; set; }
    //优惠卷状态（0上架1下架2作废）
    public int status { get; set; }
    //开始时间（当开始时间为0时代表无时间限制）
    public int starttime { get; set; }
    //结束时间
    public int endtime { get; set; }
    //持续时间（当持续时间不为0时表示在获得这个优惠卷开始计时一定时间后优惠卷失效）
    public int continueTime { get; set; }
    //图片更新时间
    public int porIsUpdate { get; set; }
    //优惠劵创建时间
    public int createTime { get; set; }
    //奖励掉落概率
    public int rewardDropRate { get; set; }
    //掉落个数 , 这个也用于 合成表里的需要多少个数量合成
    public int rewardDropCount { get; set; }
    //奖励构成，由哪几个奖励合成
    public List<BusinessCoupon> rewardcomposeID { get; set; }

    //总数
    public int totalCount { get; set; }

    /// <summary>
    /// 类别（0不可直接兑换1可直接兑换）
    /// </summary>
    public int type { get; set; }
}
public class PlayerCoupon
{
    //后段需要，前段不需要管：）
    public int playerIndex{get;set;}
    //在玩家数据库中的与玩家挂钩的主键
    public int playerCouponIndex { get; set; }
    //这张优惠券来自哪个商家挂钩的优惠券主键
    public int businessCouponIndex { get; set; }
    //玩家同种优化券有多少张
    public int count { get; set; }
    //优惠卷状态（0上架1下架2作废）
    public int status { get; set; }
    //过期时间
    public int expirationDate { get; set; }
    //建立时间
    public int createTime { get; set; }
    //优惠券详情
    public BusinessCoupon coupon { get; set; }

    public int businessIndex{get;set;}
 
}

public class StrongholdBaseConfigAttribute
{
    public int strongholdID { get; set; }

    public string strongholdTypeName { get; set; }

    public List<int> strongholdFightType { get; set; }


}

public class BusinessStrongholdConfigAttribute : StrongholdBaseConfigAttribute
{

    public List<int> businessStrongholdGrowupExp { get; set; }
    public List<string> businessStrongholdLevelName { get; set; }
    public List<int> businessStrongholdExpBlockCount { get; set; }
}

public class PlayerStrongholdConfigAttribute : StrongholdBaseConfigAttribute
{
    //据点每日固定产生的污染值
    public double playerStrongHoldFixPollution { get; set; }

    //据点升级需要的经验
    public List<int> playerStrongholdGrowUpExp { get; set; }

    //据点每个阶段恢复满体力需要的时间
    public List<double> playerStrongHoldRecoveryStrengthTime { get; set; }
    //据点的容量
    public List<int> playerStrongHoldCapacity { get; set; }
    //据点每日提供的精粹ID。有可能是 大经验精粹 也可能是小经验精粹
    public List<int> playerStrongholdExpID { get; set; }
    //据点每日产生经验块
    public List<int> playerStronghHoldExprienceBlockCount { get; set; }
    //据点覆盖范围
    public List<int> playerStrongHoldProtectRange { get; set; }
    //据点徽章等级名字
    public List<string> playerStrongholdMedalLeveLName { get; set; }
    //下一次更新需要的时间
    public List<int> strongHoldExpUpdateTime { get; set; }

}

/// <summary>
/// 据点留言结构（由g制作）
/// </summary>
public class StrongholdMessage
{
    public int strongholdMessageIndex { get; set; }
    public int strongholdIndex { get; set; }
    public int hostIndex { get; set; }
    public int writeHostIndex { get; set; }
    public string writeUserName { get; set; }
    public string message { get; set; }
    public int createTime { get; set; }

}

public class StrongholdGrowUpAttribute
{
    public int strongholdID { get; set; }
    public int strongholdIndex { get; set; }
    public int hostIndex { get; set; }
    public string strongholdNickName { get; set; }
    public List<double> strongholdPosition { get; set; }
    public int strongholdGloryValue { get; set; }
    public List<int> strongholdFightMonsterList { get; set; }
    public string strongholdLocationName{get;set;}
    public List<MonsterGrowUpAttribute> fightMonsters{get;set;}

    /// <summary>
    /// 据点留言g
    /// </summary>
    public List<StrongholdMessage> strongholdMessages { get; set; }
    /// <summary>
    /// 当前宠物数量
    /// </summary>
    public int monsterCount { get; set; }
    // 0 = 玩家 1= 商家
    public int hostType{get;set;}
    //雕像I
    public int statueID {get;set;}

    public int createTime { get; set; }

    public string headImage { get; set; }
    public string autograph { get; set; }

    public List<int> coupons { get; set; }

    public List<BusinessActivity> activitys { get; set; }
}

public class PlayerStrongHoldGrowUpAttribute: StrongholdGrowUpAttribute
{
    public int playerStrongholdMedalLevel { get; set; }
    public int playerStrongholdRoomID { get; set; }
   
    public int expUpdateTime { get; set; }
   
    public PlayerData PlayerData {get;set;}

    public double strongholdPolluteVaule { get; set; }
    public int strongholdPolluteUpdateTime { get; set; }
    //[已经收集的徽章列表，这是对应数据库里的勋章]
    public List<GameRequest.Medal> storngholdMedals { get; set; }
    //--
    public int currentExp { get; set; }
   
}

public class BusinessStrongholdGrowUpAttribute : StrongholdGrowUpAttribute
{ 
    public BusinessData BusinessData{get;set;}
    public List<BusinessCoupon> businessCoupons { get; set; }
    public List<BusinessActivity> businessActivity {get;set;}
}


/// <summary>
/// 据点基类
/// </summary>
public class StrongholdBaseAttribution
{
    //玩家的昵称
    public string hostNickName{get;set;}
    //头像链接
    public string headImage{get;set;}
    //据点签名
    public string autoGraph{get;set;}
    //玩家等级
    public int hostLevel{get;set;}
    //据点拥有者的游标
    public int hostIndex { get; set; }
    //玩家类型  0= 玩家 1= 商家
    public int hostType { get; set; }
    //据点的头像ID
    public int strongholdPorID { get; set; }

    public int strongholdID{ get;set;}
    //据点游标
    public int strongholdIndex { get; set; }
    //战斗模式 1V1 2V2 3V3
    public int storngholdFightype { get; set; }
    //据点荣誉值
    public int strongholdGloryValue { get; set; }
    //到下一级需要荣誉值
    public int strongholdMaxValue { get; set; }
    //据点等级
    public int strongholdLevel { get; set; }
    //据点等级名称
    public string strongholdLevelName { get; set; }
    //据点名称
    public string strongholdNickName { get; set; }
    //参与战斗的怪兽,在被挑战的时候，服务器会默认是使用玩家近期使用的怪兽
    public List<int> fightMonsterListIndex { get; set; }
    //据点坐标
    public List<double> strongholdPosition { get; set; }

    public Vector3 strongholdInMapPosition{get;set;}

    public GameRequest.Medal medalInfo {get;set;}

    public string strongholdLocationName{get;set;}

    public List<PlayerMonsterAttribute> fightMonsters {get;set;}

    public List<StrongholdMessage> strongholdMessages { get; set; }

    //当前怪兽数量
    public int monsterCount { get; set; }
    //覆盖范围
    public float protectRange{get;set;}
    //雕像ID
    public int statueID {get;set;}
}
/// <summary>
/// 玩家据点相关数据
/// </summary>
public class PlayerStrongholdAttribute : StrongholdBaseAttribution
{
    //当前的污染度
    public float currentPollution { get; set; }
    //当前的体力恢复时间
    public float playerStrongholdRecoveryStrengthTime { get; set; }
    //当前空间的容量
    public int playerStrongholdCapacity { get; set; }
    //当前空间产生的经验块
    public int playerStrongholdExpblockCount { get; set; }
    //最多多少个经验快
    public int playerStrongholdExpblockMax { get; set; }
    //经验块ID
    public int plaeerStorngholdEXPID { get; set; }
    //经验快更新时间
    public int expBlockUpdateTime { get; set; }
    //空间iD
    public int playerStrongholdRoomID { get; set; }
    //当前徽章等级
    public int medalLevel { get; set; }
    //当前怪兽数量
    public int currentMonsterCount { get; set; }
    //建立时间
    public int strongholdCreatTime{get;set;}
    
     public int currentExp { get; set; }

}
public class BusinessStrongholdAttribute : StrongholdBaseAttribution
{
    public BusinessData businessData {get;set;}
}