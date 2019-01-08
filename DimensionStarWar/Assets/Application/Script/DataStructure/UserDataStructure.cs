using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserDataStructure  {

}
//玩家基础配置
public class UserBaseConfig
{
    //玩家 = 0  ， 商家 = 1
    public List<int> userTypeList { get; set; }
    public List<int> userTypeName { get; set; }
}
//玩家数据基类
public class UserBaseData
{
    public int userIndex { get; set; }
    public int userType { get; set; }
    public string userName { get; set; }

    public string headImg{get;set;}
    public string autograph { get; set; }
    //玩家所有的宠物的等级之和
    public int userLevel { get; set; }

    public List<MonsterGrowUpAttribute> monsterList { get; set; }

    public List<SkillGrowupAttribute> skillList { get; set; }

    public List<SD_Pag4U> playerObjects { get; set; }

    public List<UserAddress> AddressList{get;set;}
}

public class UserAddress
{
    public int userAddressIndex { get; set; }
    //玩家索引Index
    public int userIndex { get; set; }
    //玩家名字
    public string userName { get; set; }
    //省
    public string province { get; set; }
    //市
    public string city { get; set; }
    //县、区
    public string area { get; set; }
    //街道
    public string street { get; set; }
    //详细地址
    public string address { get; set; }
    //联系电话
    public string phone { get; set; }
    //联系人姓名
    public string contacts { get; set; }
}

//玩家数据
public class PlayerData :UserBaseData
{
    public List<Exchange> exchangeList { get; set; }
    public List<PlayerStrongHoldGrowUpAttribute> storngholdList { get; set; }
    public List<PlayerCoupon> playerCoupons { get; set; }
}
//商家数据
public class BusinessData : UserBaseData
{
    public List<BusinessStrongholdGrowUpAttribute> strongholdList { get; set; }
    public List<BusinessCoupon> businessCoupons { get; set; }
    public List<BusinessActivity> ActiveData{get;set;}
    public List<PlayerCoupon> playerCoupons { get;set;}
}
