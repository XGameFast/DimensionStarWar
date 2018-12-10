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
}
