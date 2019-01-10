﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NetRequestData  {


}


public class baseIn
{
    public string token{get;set;}
}
public class Edit : baseIn
{
    public int index { get; set; }
    public string name { get; set; }
    public string oldpwd { get; set; }
    public string newpwd { get; set; }
    public string phone { get; set; }
    public int status { get; set; }
    public string openid { get; set; }
    //openID类型 0微信 1QQ 2微博
    public int type { get; set; }
}

/// <summary>
/// 结果信息
/// </summary>
public class Result
{
    public List<string> result { get; set; }
    /// <summary>
    /// 结果码
    /// </summary>
    public string code { get; set; }

    /// <summary>
    /// 详细信息
    /// </summary>
    public string detail { get; set; }

}

/// <summary>
/// 商家的活动回调
/// </summary>
public class BusinessActivityRequest :Result
{
    public BusinessActivity data { get;set;}
}


/// <summary>
/// 奖励回调 single
/// </summary>
public class BusinessCouponRequest : Result
{
    public BusinessCoupon data { get; set; }
}
/// <summary>
/// 奖励回调列表
/// </summary>
public class BusinessCouponsRequest : Result
{
    public List<BusinessCoupon> data { get; set; }
}


public class PlayerCouponRequest : Result
{
    public PlayerCoupon data { get; set; }
}
public class PlayerCouponsRequest : Result
{
    public List<PlayerCoupon> data { get; set; }
}

public class ServerMessageRequest : Result
{
    public List<ServerMessage> serverMessageList { get; set; }
}

public class ServerMessage
{
    public int serverMessageIndex { get; set; }
    public string serverMessageTitle { get; set; }
    public string serverMessageText { get; set; }
    public List<ServerMessageObject> objectList { get; set; }
    public int hostIndex { get; set; }
    public int sendTime { get; set; }
    public int receiveTime { get; set; }
}

public class ServerMessageObject
{
    public int hostIndex { get; set; }
    public int id { get; set; }
    public int count { get; set; }
    public int index { get; set; }
    public int type { get; set; }
    public MonsterGrowUpAttribute monsterGrowUpAttribute { get; set; }
    public SD_Pag4U sD_Pag4U { get; set; }
    public PlayerCoupon playerCoupon { get; set; }
}
public class ResultMonster : Result
{
    public MonsterGrowUpAttribute MonsterGrowUpAttribute{get;set;}
}

public class PlayerLogin : Result
{
    public string token { get; set; }
    public int type { get; set; }
    public string phoneSecrect { get; set; }
    public PlayerData PlayerData { get; set; }
    public BusinessData BusinessData { get; set; }
}

public class SD_Pag: Result
{
    public SD_Pag4U SD_Pag4U { get; set; }
}
//商店购买回调
public class MallSingle : Result
{
    public SD_Pag4U item { get; set; }
}
//商店购买回调
public class MallDetailRes : Result
{
    public List<CD_MallDetail> MallList { get; set; }
}
public class Region : Result
{
    public ResRegion resRegion { get; set; }
}

public class PlayerStrongHoldInfo : Result
{
    public PlayerStrongHoldGrowUpAttribute PlayerStrongHold { get; set;}
}

public class BusinessStrongHoldInfo : Result
{
    public BusinessStrongholdGrowUpAttribute BusinessStrongHold { get; set; }
}

public class StrongHold:Result
{
    public List<MonsterGrowUpAttribute> MonsterList {get; set;}
    public PlayerData pd{get;set;}
    public BusinessData bd {get;set;}
}

public class ResRegion
{
    public int Id { get; set; }
    public double PostionX { get; set; }
    public double PostionY { get; set; }
    public List<PlayerStrongHoldGrowUpAttribute> PlayerStrongHoldlist { get; set; }
    public List<BusinessStrongholdGrowUpAttribute> BusinessStrongHoldlist { get; set; }
    public List<Exchange> ExchangeList { get; set; }
}

public class ExchangeRequest : Result
{
    public Exchange exchangeInfo { get; set; }
}
public class ExchangeObjectRequest : Result
{
    public ExchangeObject exchangeObjectInfo { get; set; }
}

public class ExchangeCouponRequest:Result
{
    public ExchangeBusinessCoupon exchangeCouponInfo{get;set;}
}

public class Exchange
{
    public int exchangeIndex { get; set; }
    public int exchangeID { get; set; }
    public int userIndex { get; set; }
    public string ExchangeName { get; set; }
    public double exchangePositionx { get; set; }
    public double exchangePositiony { get; set; }
    public string note { get; set; }
    public int createTime { get; set; }
    public int objectCount { get; set; }
    public string userName { get; set; }
    public string headImg { get; set; }
    public string gameWorldPosition { get; set; }
    public int payRate{get;set;}
    public List<ExchangeObject> exchangeObjects { get; set; }
    public List<ExchangeBusinessCoupon> exchangeCoupons{get;set;}
}

public class ExchangeObject
{
    public int exchangeObjectIndex { get; set; }
    public int userIndex { get; set; }
    public int exchangeIndex { get; set; }
    public int objectID { get; set; }
    public int objectCount { get; set; }
    public int objectValue { get; set; }
    public List<int> objectPrice { get; set; }
    public List<int> buyType { get; set; }
    public string objName{get;set;}
    public string objDescription{get;set;}
    public int objectIndex { get; set; }
    public int buyUserIndex { get; set; }
    public int exchangeStatus { get; set;}
    public int exchangeTime { get; set; }
    public int createTime { get; set; }
    public int royalty { get; set; }
    /// <summary>
    /// 提成方式（也就是结算方式）
    /// </summary>
    public int royaltyType { get; set; }


}

public class ExchangeBusinessCoupon
{
    //
    public int exchangeCouponIndex { get; set; }
    /// <summary>
    /// 上架优惠卷的玩家Indexs
    /// </summary>
    public int userIndex { get; set; }
    /// <summary>
    /// 上架优惠卷所在的交易所Index
    /// </summary>
    public int exchangeIndex { get; set; }
    /// <summary>
    /// Gets or sets the coupon count.
    /// </summary>
    /// <value>The coupon count.</value>
    public int couponCount { get; set; }
    public List<int> couponPrice { get; set; }
    /// <summary>
    /// 优惠卷商家Index
    /// </summary>
    public int businessIndex { get; set; }
    /// <summary>
    /// 商家优惠卷主键Index
    /// </summary>
    public int couponBusinessIndex { get; set; }

    /// <summary>
    /// 玩家优惠卷主键Index
    /// </summary>
    public int playerCouponIndex { get; set; }
    public List<int> buyType { get; set; }
    /// <summary>
    /// 购买玩家Index
    /// </summary>
    public int buyUserIndex { get; set; }
    public int exchangeStatus { get; set; }
    public int exchangeTime { get; set; }
    //创建时间
    public int createTime { get; set; }
    //提成
    public int royalty { get; set; }
    /// <summary>
    /// 优惠卷相关信息
    /// </summary>
    public BusinessCoupon coupon { get; set; }
    /// <summary>
    /// 提成方式（也就是结算方式）
    /// </summary>
    public int royaltyType { get; set; }
}

#region Battle

public class BattelApply //通过AES加密传输
{
    public int myStrongHoldIndex { get; set; }
    public int enemyStrongHoldIndex { get; set; }
    public int unixTime { get; set; }//申请时间戳 一定时间后作废 通过 AED 加密进行传输
}


public class Battel
{
    public string guid { get; set; }//GUID由服务器提供 在第一次 申请后返回
    public BattelApply apply {get;set;}//由服务器制作 前端不用填写 直接以aes的形式传送
    public string token { get; set; }
    public int userIndex { get; set; }
    public string aesText { get; set; }
    public string md5Text { get; set; }
    public string type { get; set; }//战斗类型：0PVE 1伪PVP 2抓宠物 3 = 打=靶 4搜寻物品
    public int status { get; set; }//状态：0 开始;  1 胜利 ; 2失败 ;3放弃
    public List<BattelResult> res { get; set; }
}

public class BattelResult
{
    public int monsterIndex { get; set; }
    public int monsterId { get; set; }
    public int currentMood { get; set; }
    public int maxPower { get; set; }
    public int currentPower { get; set; }
    public List<BattelSkill> skills { get; set; }

}

public class BattelSkill
{
    public int value { get; set; }
    public int skillIndex { get; set; }
    public int skillId { get; set; }
}
/// <summary>
/// 申请通过，直接得到结果 
/// </summary>
public class ApplyBattel : Result
{
    public string guid { get; set; }

    public List<SearchObject> searchObject {get;set;}

    public List<MonsterGrowUpAttribute> enemyMonsters { get; set; }
}

public class SD_PagsConsume : Result
{
    public SD_Pag4U SD_Pag4U { get; set; }
    public MonsterGrowUpAttribute monsterGrowUpAttribute { get; set; }
}
public class MonsterSearch : Result
{
    public MonsterGrowUpAttribute monsterGrowUpAttribute { get; set; }
    public List<GameRequest.BattelObject> objectList { get; set; }
    public string ImageUrl { get; set; }
}

public class BattelFinish : baseIn
{
    public string guid { get; set; }//GUID由服务器提供 在第一次 申请后返回
    public int status { get; set; }//状态：0 开始;  1 胜利 ; 2失败 ;3放弃
    public int type { get; set; }//战斗类型：0PVE 1伪PVP 2探索
    public string md5Text { get; set; }//前端加密
    public List<BattelResult> res { get; set; }//宠物战斗数据
    public List<SearchObject> searchObject {get;set;}
}

#endregion


#region 战斗结束回调

namespace GameRequest
{
    public class FinishBattel : Result
    {
        public int stongholdIndex { get; set; }
        //[当前据点的荣誉值]
        public int strongholdGloryValue { get; set; }
        //[徽章等级] 跟本判断 是否大于 本地的等级
        public int strongholdMedal { get; set; }
        //类别
        public int type { get; set; }
        //[获取的徽章信息]
        public Medal medalInfo { get; set; }     
        public List<BattelMonster> monsterList { get; set; }
        //最终结果
        public List<BattelObject> objectList { get; set; }
        //优惠券
        public List<BattelCoupon> couponList { get; set; }

    }

    public class BattelCoupon
    {
        public int PlayerCouponIndex { get; set; }
        public BusinessCoupon coupon { get; set; }
        public int addCount { get; set; }
    }

    public class BattelMonster
    {
        public int monsterIndex { get; set; }
        public int currentMoodValue { get; set; }
        public int monsterMaxPower { get; set; }
        public int monsterCurrentPower { get; set; }
        public List<BattelSkill> skillList { get; set; }

    }
    public class BattelSkill
    {
        public int skillIndex { get; set; }
        public int monsterIndex{get;set;}
        public int skillAChievementValue { get; set;}

    }
    public class BattelObject
    {
        public int objectIndex {get;set;}
        public int objectId { get; set; }
        public int objectCount { get; set; }
        public int addCount {get;set;}
    }

    public class Medal
    {
        public int medalIndex { get; set; }
        public int hostIndex { get; set; }
        public string medalName{ get; set; }
        public int belongStrongholdIndex { get; set; }
        public int fromStrongholdIndex { get; set; }
        public int medalLeave { get; set; }
        public int createTime{ get; set; }
        public int statueID{get;set;}
    }
}
#endregion

#region Search

public class Search : Result
{
    public List<SearchObject> List { get; set; }
}

public class SearchObject
{
    
    public double x { get; set; }
    public double y { get; set; }
    public double z { get; set; }
    public int objectID { get; set; }
    public int value { get; set; }
    public int count { get; set; }

}

public class MonsterSearchConfig
{
    //每阶段消耗的意志力
    public int consumePower { get; set; }
    //每阶段需要消耗的时间
    public int time { get; set; }

    //带上幸运物后添加的幸运值
    public int addLuckyValue { get; set; }

    //带上不对的幸运物后添加的幸运值
    public int addHalfLuckyValue { get; set; }
    public List<MonsterSearchObject> searchObjects { get; set; }
}


public class MonsterLuckyObjectConfig
{
    public int monsterID { get; set; }
    public int LuckyObjectID { get; set; }
}

public class MonsterSearchObject
{
    public int objectID { get; set; }
    public int type { get; set; }//0宠物 1物品

    //发现该物品需要消耗的ID
    public string needObject { get; set; }//0宠物 1物品

    public int minCount { get; set; }
    public int maxCount { get; set; }
    //掉落概率
    public double dropProbability { get; set; }
    public int minValue { get; set; }
    public int maxValue { get; set; }

    //出现范围
    public double minX { get; set; }
    public double minY { get; set; }
    public double minZ { get; set; }
    public double maxX { get; set; }
    public double maxY { get; set; }
    public double maxZ { get; set; }
}
#endregion

