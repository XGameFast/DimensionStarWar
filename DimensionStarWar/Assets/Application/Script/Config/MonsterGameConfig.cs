using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using GameRequest;
public class MonsterGameConfig {

	
}
/*
 * 命名规则 
 * 例如 LD_OBJ_4M : 
 * LD =localdata 即 “本地数据结构” 简称
 * OBJ = Object  即  “物件” 简称
 * 4M = ForMonster 即 “对应给小怪兽的” 简称。
 * 全称意思 ：“本地数据结构_对小怪兽使用的物件”
 * 
 * LD = "本地数据结构"简称
 * SD = "服务器数据"
 * CD = "配置文件数据"
 * 
 * OBJ = "物件"
 * MO = “怪兽”
 * SK =  “技能”
 * 
 * 4M = "ForMonster"
 * 4U = "ForUser"
 */


public class RewardData
{
    public int rewardID { get; set; }
    public int rewardCount { get; set; }
    public RewardCoupon rewardCoupon{get;set; }//优惠券用
}
/// <summary>
/// 优惠券
/// </summary>
public class RewardCoupon
{
    public string headImg{get;set;}
    public int bussiIndex{get;set;}//商家的index
    public string couponName{get;set;}
    public string couponDes{get;set;}
    public int count{get;set;}
}

#region 玩家数据 从服务器上来


public class SD_Pag4U
{
    public int hostIndex{get;set;}
    //数据库里的游标
    public int objectIndex { get; set; }
    //物件ID
    public int objectID { get; set; }
    //玩家拥有这个东西个数
    public int objectCount { get; set; }

    public int objectValue {get;set;}
}

#endregion


#region Objects 物品


//物件的配置文件
public class CD_ObjAttr
{
    public int objectID { get; set; }
    public List<string> objectName { get; set; }
    public List<int> objectBlood { get; set; }
    public List<string> objectDescription { get; set; }
    public List<int> values{get;set;}
}

public class CD_EXPBlock : CD_ObjAttr
{
    public List<int> giveExpvalue { get; set; }
}
public class CD_StrengthBlock : CD_ObjAttr
{
    public List<int> giveStrengthValue { get; set; }
}
public class CD_BloodBlock : CD_ObjAttr
{
    public List<int> giveBlockValue { get; set; }
}
public class CD_EnergyBlock : CD_ObjAttr
{
    public List<int> giveBlockValue{ get; set; }
}

public class CD_DimensionDoor : CD_ObjAttr
{
    public List<int> giveDistance { get; set; }
}
public class CD_ShDrawings : CD_ObjAttr
{
    public List<int> giveLevel { get; set; }
}
public class CD_Currency : CD_ObjAttr
{
    public List<int> exchangeValue { get; set; }
}

//本地 物件数据结构
public class LD_Obj
{
    public int objIndex { get; set; }
    public int objID { get; set; }
    public int objSmallID { get; set; }

    public string objName { get; set; }
    public string objDescription { get; set; }

    /// <summary>
    /// 物件 ObjectType
    /// </summary>
    public int objectType { get; set;} 
}

//玩家物件的结构， 经过本地转换了
public class LD_Objs : LD_Obj
{
    public int lessCount { get; set; }
    //这个值是多变，根据种类会有同的值
    public int giveValue {get;set;}
}
// For User
/*public class LD_Obj4U : LD_Obj
{
    public int lessCount { get; set; }
}*/
//经验
public class LD_EXP : LD_Objs
{
    public int value { get; set; }
}
//体力
public class LD_Strength : LD_Objs
{
    public int value { get; set; }
}

//生命
public class LD_BloodBlock : LD_Objs
{
    public int value { get; set; }
}
//能量
public class LD_EnergyBlock : LD_Objs
{
    public int value { get; set; }
}
//建设图纸
public class LD_ShDrawing : LD_Objs
{
    public int value { get; set; }
}
//传送门
public class LD_DimensionDoor : LD_Objs
{
    public int value { get; set; }
}
public class LD_Currency : LD_Objs
{
    public int value { get; set; }
}
#endregion


//CD = ConfigData 配置文件 CD_Mall = 商店配置文件
public class CD_Mall
{
    public int objectID { get; set; }

    //如果没有没有限制销售， sellingType  sellingLimit 可以不用填
    public List<int> sellingType{ get; set; }

    //是否限时销售 。 -1 不是 ，为UnixTime时，为到期日期
    public List<int> sellingLimit { get; set;}

    public int count { get; set; }
    /// <summary>
    /// 售卖方式  -1 不可销售， 0 = 星币 1 = 星石 ， 2 = 任务，3 = 成就  4 = RMB兑换
    /// </summary>

    public List<int> payType { get; set; }
    /// <summary>
    /// 根据销售方式的多样性，进行对应的添值
    /// </summary>
    public List<int> price { get; set; }

    public string tips { get; set; }
    
}

//CD = ConfigData 配置文件 CD_Mall = 商店配置文件
public class CD_MallDetail
{
    public int objectID { get; set; }

    //如果没有没有限制销售， sellingType  sellingLimit 可以不用填
    public List<int> sellingType { get; set; }

    //是否限时销售 。 -1 不是 ，为UnixTime时，为到期日期
    public List<int> sellingLimit { get; set; }

    /// <summary>
    /// 数量
    /// </summary>
    public int count { get; set; }

    /// <summary>
    /// 售卖方式  -1 不可销售，1=RMB, 2=星币，3星石，4赤金，5掉落
    /// </summary>
    public List<int> payType { get; set; }
    /// <summary>
    /// 根据销售方式的多样性，进行对应的添值
    /// </summary>
    public List<int> price { get; set; }

    public string tips { get; set; }

    //剩余数量
    public int Surplus { get; set; }
}



public class LD_Commodity
{
    public int c_id { get; set; }
    public string commodityName { get; set; }
    public List<int> sellingType { get; set; }
    public List<int> sellingLimit { get; set; }
    public List<int> payType { get; set; }
    public List<int> price { get; set; }
    public int count{ get; set; }
    public string tips { get; set; }
    public string des { get; set; }
}


public class LocalSaveMonsterUseList
{
    public int monsterIndex { get; set; }
    public int monsterID { get; set; }
}


public class GameAssetIDType
{ 
    public int type {get;set;}
    public string typeName {get;set;}
    public List<int> idRange{get;set;}
    public List<GameAssetIDType> subdivides {get;set;}//细分，细分里面还可以继续细分
}

public class FreeStrongholdMedalList
{
    public List<int> medalTextureID {get;set;}
}

/*public class BussinessStrongholdAttributeConvert: StrongholdBaseAttribution
{
    public int businessStrongholdIndex { get; set; }
    public List<int> businessStrongholdRewardListIndex { get; set; }
}*/



