using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class UserDataScirpt:UserDataBaseScript {
    public string token = "andatoken";
    public string phoneSecret;
    public PlayerData playerdata;
    public PlayerStrongholdAttribute defaultPlayerStrongholdAttribute;

    public List<LD_Objs> localData_objs;
    public List<LD_Objs> ld_obj4U_list;
    public List<LD_Objs> powerBlockList;//这是在游戏过程中能够使用的精粹药水。大中小
    public List<LD_Objs> BottleList;//储存瓶子
    public List<LD_Objs> powerExpblock;


    public override void InitValue()
    {
        base.InitValue();
        playerdata = new PlayerData();
        localData_objs = new List<LD_Objs>();
    }
    public override void SetData(UserBaseData userBaseData)
    {
        base.SetData(userBaseData);
        playerdata = userData as PlayerData;
        SetPlayerStorngholdAttribute(playerdata.storngholdList);
        SetPlayerExchangeSh(playerdata.exchangeList);
        SortObject(playerdata.playerObjects);
        CheckMonsterCurrentState();
    }

    protected virtual void SetPlayerStorngholdAttribute(List<PlayerStrongHoldGrowUpAttribute> list)
    {
        if (list == null|| list.Count==0)
            return;

        foreach (var go in list)
        {
            //double x =  go.strongholdPosition[0];
            //go.strongholdPosition[0] = go.strongholdPosition[1];
           //go.strongholdPosition[1] = x;
            UpdateStrongholdList(go);
        }

        defaultPlayerStrongholdAttribute = userStrongholdList[0] as PlayerStrongholdAttribute;
    }

    protected virtual void SetPlayerExchangeSh(List<Exchange> exchanges)
    {
        if(exchanges == null)return;
        userExchangeSHList = exchanges;
    }


    #region 转换
    
    #endregion






    protected virtual void SortObject(List<SD_Pag4U> list)
    {
        if (list == null) return;//不会获取其他玩家的物件信息，其他玩家的数据里，物件列表是会有空的情况
        int count = list.Count;
        for(int i = 0 ; i < count; i ++)
        {
            AddConsuambleItem(list[i]);
        }
    }




    #region 更新数据
    
    public virtual void UpdateStrongholdList(PlayerStrongHoldGrowUpAttribute sgb)
    {
        PlayerStrongholdAttribute psh = ConvertTool.ConvertToPlayerStrongholdAttribute(sgb);
        //psh.hostType = userType;
        userStrongholdList.Add(psh);
    }

    public virtual void UpdateStrongholdList(PlayerStrongholdAttribute playerStrongholdAttribute)
    {
        //playerStrongholdAttribute.hostType = userType;
        userStrongholdList.Add(playerStrongholdAttribute);
    }

    public virtual void UpdateExchangeStrongholdList(Exchange exchange)
    {
        if(userExchangeSHList == null) userExchangeSHList = new List<Exchange>();
        userExchangeSHList.Add(exchange);
    }

    /// <summary>
    /// 添加玩家的优惠券
    /// </summary>
    /// <param name="value">Player coupon.</param>
    public virtual void AddPlayerCoupon(PlayerCoupon value)
    {
        if(playerdata.playerCoupons == null) playerdata.playerCoupons = new List<PlayerCoupon>();
        int count = playerdata.playerCoupons.Count;
        if(count > 0)
        {

            for(int  i =0 ; i < count; i++)
            {
                if(playerdata.playerCoupons[i].playerCouponIndex == value.playerCouponIndex)
                {
                    playerdata.playerCoupons[i].count += value.count;
                    return;
                }
            }

            playerdata.playerCoupons.Add(value);

        }
        else
        {
            playerdata.playerCoupons.Add(value);
        }
     
    }




    //[添加物品]
    /// <summary>
    /// 物件盒子，如果givevalue == 0， 那么他们会堆叠，只在count 上做变化，，如果不为0 ，会添加在同种列列表里增加物件，并且物件数量也会增加。
    /// userObjBox的数据结构是为了更清晰的将 同种物品，由于提供不童的数值 区分开。
    /// dictionary <int , list<userobjbox>> int = 物件的idtype ， list<userobjbox> = 这个类别下 所有的物品， 他们被添加在统一的集合当中，
    /// 当然他们也有自己的个性，list 中每个 userobjbox 都是单独一个小类，小类里面有一个 <list type=<ld_obj> 是物件的数据，
    /// 只要提供的的数据不等于0，那么会就代表是会使用配置文件的默认，并且会默认展开堆叠， 如果，多个物件他们的提供的数值不等于0，但这多个物件的提供的数值相同，他们也会被堆
    /// </summary>
    /// <param name="sD_Pag4U">S d pag4 u.</param>
    public virtual void AddConsuambleItem(SD_Pag4U sD_Pag4U)
    {
        LD_Objs lD_Objs = ConvertTool.ConvertPlayerObjectAttributte(sD_Pag4U);
        //种类列表已经包好这个种类
        if(userObjs.Keys.Contains(lD_Objs.objectType))
        {
            //再判断一下这个种类 是否已经饱和这个小分类了 , userobjsbox 已经具体某一个物件了
            UserObjsBox tmp = userObjs[lD_Objs.objectType].FirstOrDefault(s=>s.id == lD_Objs.objID);
            if(tmp!=null) //包含！
            {
                if (tmp.lD_Objs == null) tmp.lD_Objs = new List<LD_Objs>();

                tmp.count += lD_Objs.lessCount;
                int itemslength = tmp.lD_Objs.Count;

                for (int i = 0; i < itemslength; i++)
                {
                    //寻找数量相投的物品堆叠
                    if (tmp.lD_Objs[i].giveValue.Equals(lD_Objs.giveValue))
                    {
                        tmp.lD_Objs[i].lessCount += lD_Objs.lessCount;
                        return;
                    }
                }

                tmp.lD_Objs.Add(lD_Objs);

            }else //不包含 
            {
                tmp = new UserObjsBox()
                {
                    id = lD_Objs.objID,
                    idType = lD_Objs.objectType,
                    count = lD_Objs.lessCount,
                    lD_Objs = new List<LD_Objs>(),
                };

                tmp.lD_Objs.Add(lD_Objs);

                userObjs[lD_Objs.objectType].Add(tmp);
            }
           
           

        }else //当前box 不包含这个种类， 新建一个 种类的集合 ，例如42030 （42030，42031，42032）《= 指的的 中等类
        {

            List<UserObjsBox> _userObjsBoxes = new List<UserObjsBox>();
            UserObjsBox _userObjsBox = new UserObjsBox()
            {
                id = lD_Objs.objID,
                idType = lD_Objs.objectType,
                count = lD_Objs.lessCount,
                lD_Objs = new List<LD_Objs>(){ lD_Objs }
            };
            //种类列表 添加该种类
            _userObjsBoxes.Add(_userObjsBox);
            //把种类列表添加进总列表
            userObjs.Add(lD_Objs.objectType , _userObjsBoxes);
        }
    }

    //[减少物品]
    public virtual void ReduceConsumableItem(int itemID)
    {
        int idType = AndaDataManager.Instance.GetObjTypeID(itemID);
        if(userObjs.Keys.Contains(idType))
        {
            UserObjsBox _userBox = userObjs[idType].FirstOrDefault(s=>s.id == itemID);
            if(_userBox!=null)
            {
                _userBox.lD_Objs.RemoveAt(_userBox.count - 1);
                _userBox.count -=1;
                if(_userBox.lD_Objs.Count <= 0)
                {
                    userObjs[idType].Remove(_userBox);
                }
            }
        }
    }


    public virtual void ReduceCoin(int itemCount)
    {
        userObjs[42030].FirstOrDefault(s=>s.id == 42030).count-=itemCount;
    }
    public virtual void ReduceDimond(int itemCount)
    {
        userObjs[42030].FirstOrDefault(s => s.id == 42031).count -= itemCount;
    }
    public virtual void ReduceRedCoin(int itemCount)
    {
        userObjs[42030].FirstOrDefault(s => s.id == 42032).count -= itemCount;
    }

    public virtual void ReduceConsumableItemWithGiveValue(int itemID, int itemCount , int itemGivevalue/*这个值很重要，用来决定是哪个堆物品*/ )
    {
        //现根据 物品 id 获取id typ
        int idType = AndaDataManager.Instance.GetObjTypeID(itemID);
        if (userObjs.Keys.Contains(idType)) //找到这个物件的组
        {
            List<UserObjsBox> userObjsBoxes = userObjs[idType];
            int count = userObjsBoxes.Count;
            for(int i = 0 ; i< count ; i ++)
            {
                if(userObjsBoxes[i].id == itemID) //找到这个物件
                {
                    int ldLength = userObjsBoxes[i].lD_Objs.Count;
                    for(int j = 0; j < ldLength; j++)
                    {
                        if(userObjsBoxes[i].lD_Objs[j].giveValue.Equals(itemGivevalue))
                        {
                            if(userObjsBoxes[i].lD_Objs[j].lessCount>= itemCount)
                            {
                                userObjsBoxes[i].lD_Objs[j].lessCount-= itemCount;
                                userObjsBoxes[i].count -= itemCount;
                            
                            }else
                            {
                                int tmpCount =  userObjsBoxes[i].lD_Objs[j].lessCount ;
                                userObjsBoxes[i].lD_Objs[j].lessCount = 0;
                                userObjsBoxes[i].count -= tmpCount;
                            }

                            if(userObjsBoxes[i].lD_Objs[j].lessCount.Equals(0))
                            {
                                userObjsBoxes[i].lD_Objs.RemoveAt(j);
                            }
                            return;
                        }
                    }
                }
            }
        }
    }

    public void ReduceBussinesCoupon(int couponIndex)
    {
        PlayerCoupon playerCoupon = playerdata.playerCoupons.FirstOrDefault(s => s.playerCouponIndex == couponIndex);
        if(playerCoupon!=null)
        {
            playerdata.playerCoupons.Remove(playerCoupon);
        }
    }



    public override void UpdateConsumableList(int objectID, int objectCount , int objectIndex)
    {
        SD_Pag4U sD_Pag4U = new SD_Pag4U
        {
            objectID = objectID,
            objectCount = objectCount,
            objectIndex = objectIndex,
            objectValue =  0,
        };

        AddConsuambleItem(sD_Pag4U);
    }

    public int UsePowerBlock(int __itemIndex)
    {
        //返回-1代表使用不成功
        if(powerBlockList[__itemIndex].lessCount >=1)
        {
            powerBlockList[__itemIndex].lessCount -=1;
            return powerBlockList[__itemIndex].giveValue;
        }

        return -1;
    }

    public int UseDetectProp(int ID)
    {
        int idType = AndaDataManager.Instance.GetObjTypeID(ID);
        if(userObjs.ContainsKey(idType))
        { 
            return userObjs[idType].FirstOrDefault(s=>s.id == ID)!=null ? 0 : -1;
        }else
        {
            return  -1;
        }
    }
    public bool CheckHasBaseStrogholdDrawing()
    {
        if(!userObjs.ContainsKey(42010))return false;
        return userObjs[ONAME.strongholdBaseDraw].FirstOrDefault(s=>s.id == 42010)!=null;
        //return localData_objs.FirstOrDefault(s=>s.objID == ONAME.strongholdBaseDraw)!=null;
    }

    //检查游戏内所有物件，判断玩家是否已经拥有此物件
    public bool CheckUserGetThisObject(int itemID)
    {
        int type = AndaDataManager.Instance.GetObjTypeID(itemID);
        if(userObjs.Keys.Contains(type))
        {
            return userObjs[type].FirstOrDefault(s=>s.id == itemID)!=null;
        }else
        {
            return false;
        }

    }

   

    #endregion

    #region 获取数据

    public virtual PlayerStrongholdAttribute GetPlayerStrongholdByGrowupData(PlayerStrongHoldGrowUpAttribute pshgua)
    {
        PlayerStrongholdAttribute psh = ConvertTool.ConvertToPlayerStrongholdAttribute(pshgua);
        //psh.hostType = userType;
        return psh;
    }

   
    public float GetMonsterPollutionAll(int strongholdIndex)
    {
        float pollution = 0;
        foreach (var go in userMonsterList)
        {
            if (go.belongStrongholdIndex == strongholdIndex)
            {
                pollution += go.pollution;
            }
        }

        return pollution;
    }

    public int GetMonstetCountBelongThisStronghold(int strongholdIndex)
    {
        int count = 0;
        foreach (var go in userMonsterList)
        {
            if (go.belongStrongholdIndex == strongholdIndex)
            {
                count += 1;
            }
        }

        return count;
    }
    public List<PlayerMonsterAttribute> GetMonsterAttributeBelongThisStronghold(int strongHoldIndex)
    {
        List<PlayerMonsterAttribute> list = new List<PlayerMonsterAttribute>();
        foreach (var go in userMonsterList)
        {
            if (go.belongStrongholdIndex == strongHoldIndex)
            {
                list.Add(go);
            }
        }
        return list;
    }


    public List<PlayerMonsterAttribute> GetCleanStateMonsterBelongthisStronghold(int strongholdIndex)
    {
        List<PlayerMonsterAttribute> list = null;
        List<PlayerMonsterAttribute> tmp = GetMonsterAttributeBelongThisStronghold(strongholdIndex);
        foreach (var go in tmp)
        {
            if (go.currentStateType == (int)OTYPE.MonsterStateType.clean)
            {
                if (list == null) list = new List<PlayerMonsterAttribute>();
                list.Add(go);
            }
        }
        return list;
    }

    public List<int> GetMonsterIDLIst(int strongholdIndex)
    {
        List<int> list = new List<int>();
        List<PlayerMonsterAttribute> tmp = GetMonsterAttributeBelongThisStronghold(strongholdIndex);
        foreach(var go in tmp)
        {
            if(!list.Contains(go.monsterID))
            {
                list.Add(go.monsterID);
            }
        }

        return list;
    }

    //获取意志力精粹集合
    public List<LD_Objs> GetUserProp_PowerList()
    {
        return null;// userObjs[AndaDataManager.Instance.GetObjTypeID(40000)];
    }
    //获取瓶子
    public List<UserObjsBox> GetBottleList()
    {
        if (userObjs.ContainsKey(40020))
        {
            return userObjs[40020];
        }
        return null;
    }
    //获取恢复药水
    public List<UserObjsBox> GetRecoveryList()
    {
        if (userObjs.ContainsKey(40000))
        {
            return userObjs[40000];
        }
        return null;
    }
    //获取星宿探索物品
    public List<UserObjsBox> GetMonsterSearchList()
    {
        if (userObjs.ContainsKey(42060))
        {
            return userObjs[42060];
        }
        return null;
    }
    //获取星宿幸运物
    public List<UserObjsBox> GetLuckyObjectList()
    {
        if (userObjs.ContainsKey(44000))
        {
            return userObjs[44000];
        }
        return null;
    }
    //获取金币
    public List<UserObjsBox> GetGoldList()
    {
        //
        if (userObjs.ContainsKey(42030))
        {
            return userObjs[42030];
        }
        return null;
    }
    public List<UserObjsBox> GetDetectorList()
    {
        if(userObjs.ContainsKey(42020))
        {
            return userObjs[42020];
        }
        return null;
    }


    public LD_Objs GetExpblockByItemIndex(int _index)
    {
        return powerBlockList[_index];
    }
    /// <summary>
    /// 获取消耗品合集
    /// </summary>
    /// <returns>The consumable list.</returns>
    public List<UserObjsBox> GetConsumableList()
    {
        List<UserObjsBox> userObjsBoxes = new List<UserObjsBox>();
        foreach(var go in userObjs.Keys)
        {
            if(go >=40000 && go <50000)
            {
                userObjsBoxes.AddRange(userObjs[go]); 
            }
        }

        return userObjsBoxes;
    }

    /// <summary>
    /// 获取消耗品合集，除了货币
    /// </summary>
    /// <returns>The consumable list except currency.</returns>
    public List<UserObjsBox> GetConsumableListExceptCurrency()
    {
        List<UserObjsBox> userObjsBoxes = new List<UserObjsBox>();
        foreach (var go in userObjs.Keys)
        {
            if (go >= 40000 && go < 50000)
            {
                int typeId = AndaDataManager.Instance.GetObjTypeID(go);
                if(typeId != 42030)//除去货币
                {
                    userObjsBoxes.AddRange(userObjs[go]);
                }
            }
        }

        return userObjsBoxes;
    }

    public List<int> GetUserAllDiffrenceObjects()
    {
        
        List<int> ids = new List<int>();
        int count = ld_obj4U_list.Count;
        for(int i = 0 ; i < count; i++)
        {
            int id = ld_obj4U_list[i].objID;
            if(ids.Contains(id))
            { 
                ids.Add(id);
            };
        }
        return ids;
    }

    #endregion

    #region 检查数据
    private void CheckMonsterCurrentState()
    {
        if (userMonsterList==null)
            return;
        foreach (var go in userMonsterList)
        {
            switch (go.currentStateType)
            {
                case (int)OTYPE.MonsterStateType.clean:
                    AndaDataManager.Instance.AddCleanTimeData(go.monsterIndex, go.finishCleanShTime);
                    break;
                case (int)OTYPE.MonsterStateType.treasure:
                    AndaDataManager.Instance.AddTreasureTimeData(go.monsterIndex, go.finishTreasureTime);
                    break;
                case (int)OTYPE.MonsterStateType.fight:
                    break;
                case (int)OTYPE.MonsterStateType.leisure:
                    AndaDataManager.Instance.AddRecoveryStrengthTimeData(go.monsterIndex, go.monsterRecoveryTime);
                    break;
            }
        }
    }

    #endregion

    #region 工具

    #endregion


}

public class UserObjsBox
{
    public int id{get;set;}//完整的ID
    public int idType {get;set;}//id种类
    public int count {get;set;}//数量
    public int putType {get;set;}//如果givevalue == 0 ，代表堆叠，==-1，代表拆分
    public List<LD_Objs> lD_Objs {get;set;}//每个对应提供的数值 //如果使用物品的话，请从最后一个开始消耗，
}
