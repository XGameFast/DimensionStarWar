using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public static class ConvertTool{

    #region 转换怪兽数据
    public static PlayerMonsterAttribute ConvertToPlayerMonsterAttribute(MonsterGrowUpAttribute go)
    {
        if (go == null)
            return null;
        PlayerMonsterAttribute pma = new PlayerMonsterAttribute();
        MonsterBaseConfig mba = MonsterGameData.GetMonsterBaseConfig(go.monsterID);
        //int level = AndaDataManager.Instance.GetMonsterLevelValue(go.monsterGrowupExp, mba);
       // Debug.Log(mba.monsterBaseMoveSpeed);
        pma.monsterMoveSpeed = mba.monsterBaseMoveSpeed.DoubleToFloat();
        pma.monsterIndex = go.monsterIndex;
        pma.monsterID = go.monsterID;
        pma.monsterNickName = go.monsterNickName;
        pma.monsterName = mba.monsterName;
        pma.mosterPower = go.monsterCurrentPower;
        pma.monsterMaxPower = go.monsterMaxPower;
        pma.monsterRecoveryTime = go.monsterRecoveryStrengthFullTime;
        pma.monsterRareType = mba.rareType + go.rareTypeGrowup;
        if(go.monsterSkillIDList != null)
        {
            pma.monsterSkillIDList = ConverterToPlayerSkillAttribute(go.monsterSkillIDList);
        }
     
        //pma.monsterLevel = level;
        pma.backgroundDes = mba.monsterDescription;

        //pma.pollution = mba.pollution[level].DoubleToFloat();
        //pma.maxPollution = mba.pollution.Last().DoubleToFloat();

        pma.curCleanValue = (mba.baseCleanValue + go.currentCleanValue).DoubleToFloat();

        pma.baseCleanTime = mba.baseCleanTime;
        pma.curMood = go.currentMood;
        pma.lucykValue = go.currentLuckyValue.DoubleToFloat();
        pma.maxLucky = mba.maxLucky.DoubleToFloat();

        pma.finishCleanShTime = go.finishCleanShTime;
        pma.finishTreasureTime = go.finishTreasureTime;
        pma.currentStateType = go.currentStateType;
        pma.belongStrongholdIndex = go.belongStrongholdIndex;
        //userMonsterList.Add(pma);
        return pma;
    }

    public static List<PlayerSkillAttribute> ConverterToPlayerSkillAttribute(List<SkillGrowupAttribute> list)
    {
        Debug.Log("技能数量" + list.Count);
        PlayerSkillAttribute[] psaList = new PlayerSkillAttribute[list.Count]; 
        if(list == null) return null;

        foreach (var go in list)
        {
            PlayerSkillAttribute psa = new PlayerSkillAttribute();
            SkillBaseAttribute sba = MonsterGameData.GetSkillBaseAttribute(go.skillID);
            psa.skillAchievement = go.skillAchievementValue;
            psa.skillIndex = go.skillIndex;
            psa.skillID = go.skillID;
            psa.skillNickName = go.skillNickName;
            int level = AndaDataManager.Instance.GetSkillAchievementValue(go.skillAchievementValue,go.skillID);
            psa.skillLevel = level;
            psa.skillPower = sba.skillPower[level];
            psa.skillCosumeEnergy = sba.skillCosumeEenrgy[level];
            psa.skillCD = (float)sba.skillCD[level];//DoubleToFloat();
            psa.baseSkillAttribute = sba;
            //从左到右 
            // 0 = 防御， 1 = 普通攻击 2= 特殊技能

            //重新排序 游标  0 = 普通攻击    1 = 防御      2 = 技能
            if(sba.skillType == 0) // skillType代表是攻击
            {
                if(sba.attackType == 0) //这个代表游标为0普通攻击
                {
                    psaList[1] = psa; 
                }else if(sba.attackType == 1) //技能
                {
                    psaList[2] = psa;
                }
            }else if(sba.skillType == 1) //防御
            {
                psaList[0] = psa;
            }
        }

        return psaList.ToList<PlayerSkillAttribute>();
    }
    #endregion

    #region 转换玩家据点数据
    public static PlayerStrongholdAttribute ConvertToPlayerStrongholdAttribute(PlayerStrongHoldGrowUpAttribute go)
    {
        PlayerStrongholdAttribute pshgu = new PlayerStrongholdAttribute();
        if(go.PlayerData!=null)
        {
            pshgu.hostNickName = go.PlayerData.userName;
            pshgu.hostLevel = go.PlayerData.userLevel;
        }

        pshgu.hostIndex = go.hostIndex;
        pshgu.headImage = go.headImage;
        pshgu.autoGraph = go.autograph;
        pshgu.strongholdID = go.strongholdID;
        pshgu.statueID = go.statueID;
        pshgu.strongholdMessages = go.strongholdMessages;
        pshgu.hostType = go.hostType;
        pshgu.strongholdIndex = go.strongholdIndex;
        pshgu.strongholdNickName = go.strongholdNickName;
        pshgu.strongholdGloryValue = go.strongholdGloryValue;
        pshgu.medalLevel = go.playerStrongholdMedalLevel;
        pshgu.monsterCount = go.monsterCount;
        //pshgu.medalInfo = go.storngholdMedals
        //返回是真实的等级，不会+1；在 UI上显示的时候会+1
        int level = AndaDataManager.Instance.CaculPlayerStrongholdLevel(go.strongholdGloryValue, MonsterGameData.StrongHoldType.SelfStrongHold);
        pshgu.strongholdLevel = level;
        pshgu.protectRange = MonsterGameData.GetStrongBasedAttribute().playerStrongHoldProtectRange[level];
        pshgu.playerStrongholdRecoveryStrengthTime = MonsterGameData.GetStrongBasedAttribute().playerStrongHoldRecoveryStrengthTime[level].DoubleToFloat();
        pshgu.playerStrongholdExpblockCount = MonsterGameData.GetStrongBasedAttribute().playerStronghHoldExprienceBlockCount[level];
        pshgu.playerStrongholdCapacity = MonsterGameData.GetStrongBasedAttribute().playerStrongHoldCapacity[level];
        pshgu.storngholdFightype = MonsterGameData.GetStrongBasedAttribute().strongholdFightType[level];
        pshgu.strongholdLevelName = MonsterGameData.GetStrongBasedAttribute().playerStrongholdMedalLeveLName[level];
        //Debug.Log("PlayerStronghold" + go.strongholdPosition[0] + "Y:" +  go.strongholdPosition[1] );

        pshgu.strongholdPosition = /*new List<double>() {go.strongholdPosition[1],go.strongholdPosition[0]};//*/  go.strongholdPosition;
       
        pshgu.playerStrongholdRoomID = go.playerStrongholdRoomID;
        pshgu.fightMonsterListIndex = go.strongholdFightMonsterList;
        pshgu.plaeerStorngholdEXPID = MonsterGameData.GetStrongBasedAttribute().playerStrongholdExpID[level] + MonsterGameData.GetExpObjAttribute().objectID;
        pshgu.expBlockUpdateTime = go.expUpdateTime;
        pshgu.currentPollution = MonsterGameData.GetStrongBasedAttribute().playerStrongHoldFixPollution.DoubleToFloat() + AndaDataManager.Instance.GetMonsterPollutionAll(pshgu.strongholdIndex);
        pshgu.strongholdMaxValue = MonsterGameData.GetStrongBasedAttribute().playerStrongholdGrowUpExp[level];
        pshgu.strongholdPorID = go.strongholdID;
        pshgu.strongholdLocationName = go.strongholdLocationName;
        pshgu.currentMonsterCount = AndaDataManager.Instance.GetMonsterCountBelongThisStronghold(pshgu.strongholdIndex);
        pshgu.strongholdCreatTime = go.createTime;
        pshgu.currentExp = go.currentExp;
        pshgu.playerStrongholdExpblockMax = MonsterGameData.GetStrongBasedAttribute().playerStronghHoldExprienceBlockCount[level];
        if(go.fightMonsters!=null)
        {
           List<PlayerMonsterAttribute> monsterAttributes = new List<PlayerMonsterAttribute>();
           foreach(MonsterGrowUpAttribute mgua in go.fightMonsters)
           {
              PlayerMonsterAttribute playerMonster = ConvertToPlayerMonsterAttribute(mgua);
              monsterAttributes.Add(playerMonster);
           }
            pshgu.fightMonsters = monsterAttributes;
        }
        return pshgu;
    }
    #endregion

    #region 转换商家据点数据
    public static BusinessStrongholdAttribute ConvertToBusinessStrongholdData(BusinessStrongholdGrowUpAttribute value)
    {
        BusinessStrongholdAttribute convert = new BusinessStrongholdAttribute();
        
        convert.hostIndex = value.hostIndex;
        convert.headImage = value.headImage;
        convert.autoGraph = value.autograph;
        convert.businessData = value.BusinessData;
        convert.monsterCount = value.monsterCount;
        convert.hostType = value.hostType;
        convert.strongholdID = value.strongholdID;
        convert.strongholdIndex = value.strongholdIndex;
        convert.strongholdNickName = value.strongholdNickName;
        convert.strongholdGloryValue = value.strongholdGloryValue;
        int level = AndaDataManager.Instance.CaculPlayerStrongholdLevel(value.strongholdGloryValue, MonsterGameData.StrongHoldType.BusinessStronghold);
        convert.strongholdLevel = level;
        convert.strongholdLevelName = MonsterGameData.GetBusinessStrongholddBaseAttribute().businessStrongholdLevelName[level];
        convert.strongholdPosition = /*new List<double>(){ value.strongholdPosition[1] ,value.strongholdPosition[0]} ;//*/ value.strongholdPosition;
        convert.fightMonsterListIndex = value.strongholdFightMonsterList;
        convert.storngholdFightype = MonsterGameData.GetBusinessStrongholddBaseAttribute().strongholdFightType[level];
        convert.strongholdMaxValue = MonsterGameData.GetBusinessStrongholddBaseAttribute().businessStrongholdGrowupExp[level];
        convert.strongholdPorID = value.strongholdID;
        convert.strongholdLocationName = value.strongholdLocationName;

        /*List<PlayerMonsterAttribute> monsterAttributes = new List<PlayerMonsterAttribute>();
        foreach(MonsterGrowUpAttribute mgua in value.fightMonsters)
        {
            PlayerMonsterAttribute playerMonster = ConvertToPlayerMonsterAttribute(mgua);
            monsterAttributes.Add(playerMonster);
        }
        
        convert.fightMonsters = monsterAttributes;
        */
        return convert;
    }
    #endregion

    #region 转换玩家物品数据
    public static LD_Objs ConvertPlayerObjectAttributte(SD_Pag4U odb)
    {
       
        LD_Objs objAttribute = new LD_Objs();
        int idType = AndaDataManager.Instance.GetObjTypeID(odb.objectID);
        CD_ObjAttr cd_data = MonsterGameData.GetCD_ObjAttr(idType);
        objAttribute.objIndex = odb.objectIndex;
        objAttribute.objID = odb.objectID;
        objAttribute.objectType = idType;
        objAttribute.lessCount = odb.objectCount;
        objAttribute.giveValue = odb.objectValue;
        int smallID = odb.objectID - idType;
        objAttribute.objSmallID = smallID;
        objAttribute.objDescription = cd_data.objectDescription[smallID];
        objAttribute.objName = cd_data.objectName[smallID];
        return objAttribute;
        //cd_data.giveExpvalue = cd_data.values;
       /* playerExpAttribute.objID = odb.objectID;
        playerExpAttribute.objSmallID = smallID;
        playerExpAttribute.lessCount = odb.objectCount;
        playerExpAttribute.value = cd_data.values[smallsmallID];
        playerExpAttribute.objName = cd_data.objectName[smallsmallID];
        playerExpAttribute.objDescription = cd_data.objectDescription[smallsmallID];
        return playerExpAttribute;
*/
        /*int smallID = odb.objectID - (int)OTYPE.GetObjectsIDType(odb.objectID);
        OTYPE.ConsumableForIDType consumableIDType = OTYPE.GetConsumableforIDType(smallID);
        int smallsmallID = smallID -(int)consumableIDType;
        switch (consumableIDType)
        {
            case OTYPE.ConsumableForIDType.expBlock:
                return ConverExpAttribute(odb, smallID,smallsmallID);
            case OTYPE.ConsumableForIDType.strengthBlock:
                return ConvertStrenthAtt(odb, smallID,smallsmallID);
            case OTYPE.ConsumableForIDType.dimensionDoor:
                return ConvertDimensionDoor(odb, smallID,smallsmallID);
            case OTYPE.ConsumableForIDType.strongholdDrawing:
                return ConvertShDrawing(odb,smallID,smallsmallID);
            case OTYPE.ConsumableForIDType.bloodBlock:
                return ConvertBloodBlockAtt(odb,smallID,smallsmallID);
            case OTYPE.ConsumableForIDType.energyBlock:
                return ConvertEnergyBlockAtt(odb, smallID,smallsmallID);
            case OTYPE.ConsumableForIDType.currency:
                return ConvertCurrency(odb,smallID,smallsmallID);
            default:
                return null;
        }*/
    }
    
    private static LD_EXP ConverExpAttribute(SD_Pag4U odb, int smallID,int smallsmallID)
    {
        LD_EXP playerExpAttribute = new LD_EXP();
        CD_ObjAttr cd_data = MonsterGameData.GetExpObjAttribute() ;
        //cd_data.giveExpvalue = cd_data.values;
        playerExpAttribute.objID = odb.objectID;
        playerExpAttribute.objSmallID = smallID;
        playerExpAttribute.lessCount = odb.objectCount;
        playerExpAttribute.value = cd_data.values[smallsmallID];
        playerExpAttribute.objName = cd_data.objectName[smallsmallID];
        playerExpAttribute.objDescription = cd_data.objectDescription[smallsmallID];
        return playerExpAttribute;
    }

    private static LD_Strength ConvertStrenthAtt(SD_Pag4U odb, int smallID,int smallsmallID)
    {
        LD_Strength data = new LD_Strength();
        CD_ObjAttr cd_data = MonsterGameData.GetStrengthBlockAttr();
        //cd_data.values = cd_data.values;
        data.objID = odb.objectID;
        data.objSmallID = smallID;
        data.lessCount = odb.objectCount;
        data.value = cd_data.values[smallsmallID];
        data.objName = cd_data.objectName[smallsmallID];
        data.objDescription = cd_data.objectDescription[smallsmallID];
        return data;
    }

    private static LD_BloodBlock ConvertBloodBlockAtt(SD_Pag4U odb, int smallID,int smallsmallID)
    {
        LD_BloodBlock data = new LD_BloodBlock();
        CD_ObjAttr cd_data = MonsterGameData.GetBloodBlockAttr(); 
        //cd_data.giveBlockValue = cd_data.values;
        data.objID = odb.objectID;
        data.objSmallID = smallID;
        data.lessCount = odb.objectCount;
        data.value = cd_data.values[smallsmallID];
        data.objName = cd_data.objectName[smallsmallID];
        data.objDescription = cd_data.objectDescription[smallsmallID];
        return data;
    }

    private static LD_EnergyBlock ConvertEnergyBlockAtt(SD_Pag4U odb, int smallID,int smallsmallID)
    {
        LD_EnergyBlock data = new LD_EnergyBlock();
        CD_ObjAttr cd_data = MonsterGameData.GetEnergyBlockAttr();
        //cd_data.giveBlockValue = cd_data.values;
        data.objID = odb.objectID;
        data.objSmallID = smallID;
        data.lessCount = odb.objectCount;
        data.value = cd_data.values[smallsmallID];
        data.objName = cd_data.objectName[smallsmallID];
        data.objDescription = cd_data.objectDescription[smallsmallID];
        return data;
    }

    private static LD_DimensionDoor ConvertDimensionDoor(SD_Pag4U value, int smallID,int smallsmallID)
    {
        LD_DimensionDoor ld_dimensionDoor = new LD_DimensionDoor();
        CD_ObjAttr cd_dimensionDoor = MonsterGameData.GetDimensionDoorAttribute();
        //cd_dimensionDoor.giveDistance = cd_dimensionDoor.values;
        ld_dimensionDoor.objID = value.objectID;
        ld_dimensionDoor.objSmallID = smallID;
        ld_dimensionDoor.lessCount = value.objectCount;
        ld_dimensionDoor.value = cd_dimensionDoor.values[smallsmallID];
        ld_dimensionDoor.objName = cd_dimensionDoor.objectName[smallsmallID];
        ld_dimensionDoor.objDescription = cd_dimensionDoor.objectDescription[smallsmallID];
        return ld_dimensionDoor;
    }
    private static LD_ShDrawing ConvertShDrawing(SD_Pag4U value, int smallID,int smallsmallID)
    {
        LD_ShDrawing ld_ShDrawing = new LD_ShDrawing();
        CD_ObjAttr cd_shDrawing = MonsterGameData.GetShDrawingAttribute();
        //cd_shDrawing.giveLevel = cd_shDrawing.values;
        ld_ShDrawing.objID = value.objectID;
        ld_ShDrawing.objSmallID = smallID;
        ld_ShDrawing.lessCount = value.objectCount;
        ld_ShDrawing.value = cd_shDrawing.values[smallsmallID];
        ld_ShDrawing.objName = cd_shDrawing.objectName[smallsmallID];
        ld_ShDrawing.objDescription = cd_shDrawing.objectDescription[smallsmallID];
        return ld_ShDrawing;
    }
    private static LD_Objs ConvertCurrency(SD_Pag4U value, int smallID,int smallsmallID)
    {
        LD_Objs ld_Obj4U = new LD_Objs();
        CD_ObjAttr cD_ObjAttr = MonsterGameData.GetCurrencyAttribute();
        //cD_ObjAttr.exchangeValue = cD_ObjAttr.values;
        ld_Obj4U.objID = value.objectID;
        ld_Obj4U.objSmallID = smallID;
        ld_Obj4U.lessCount = value.objectCount;
        ld_Obj4U.objName = cD_ObjAttr.objectName[smallsmallID];
        ld_Obj4U.objDescription = cD_ObjAttr.objectDescription[smallsmallID];
        return ld_Obj4U;
    }

    #endregion

    #region 转换商品的数据结构
    public static LD_Commodity ConvertMallData(CD_Mall cd_mall)
    {
        LD_Commodity ld_Commodity = new LD_Commodity();
        CD_ObjAttr cdObjAttr = MonsterGameData.GetCD_ObjAttr(cd_mall.objectID);
        int smallID = cd_mall.objectID - cdObjAttr.objectID;
        ld_Commodity.c_id = cd_mall.objectID;
        ld_Commodity.sellingType = cd_mall.sellingType;
        ld_Commodity.sellingLimit = cd_mall.sellingLimit;
        ld_Commodity.payType = cd_mall.payType;
        ld_Commodity.price = cd_mall.price;
        ld_Commodity.tips = cd_mall.tips;
        ld_Commodity.des = cdObjAttr.objectDescription[smallID];
        ld_Commodity.commodityName = cdObjAttr.objectName[smallID];
        ld_Commodity.count = cd_mall.count;
        return ld_Commodity;
    }
    #endregion


    #region 将世界坐标转为屏幕坐标
    public static Vector2 ConvertWorldPositionToUIPosition(Camera targetCamera, Vector3 pose)
    {
        Vector2 pos;
       
        RectTransformUtility.ScreenPointToLocalPointInRectangle(AndaUIManager.Instance.getCanvasRect,ARMonsterSceneDataManager.Instance.mainCamera.WorldToScreenPoint(pose),ARMonsterSceneDataManager.Instance.UICamera,out pos);
         return pos;
    }
    #endregion

    #region 将物品转换为Reward格式

    public static AndaLocalRewardData CovertObjToAndaLocalRewardData(int id , int count)
    {
        AndaLocalRewardData andaLocalRewardData = new AndaLocalRewardData();
        andaLocalRewardData.objID =id;
        andaLocalRewardData.objCount = count;
        return andaLocalRewardData;

    }
    #endregion




    public static Texture2D ConvertToTexture2d(Texture2D value)
    {
        Texture2D newT2d = new Texture2D(value.height, value.height);
        newT2d.SetPixels(value.GetPixels());
        newT2d.Apply(true);
        newT2d.filterMode = FilterMode.Trilinear;
        return newT2d;
    }

    public static Sprite ConvertToSpriteWithTexture2d(Texture2D texture2)
    {
        return Sprite.Create(texture2, new Rect(0, 0, texture2.width, texture2.height),
                              new Vector2(0.5f, 0.5f));
    }

    /// <summary>
    /// 本地图片文件转Base64字符串
    /// </summary>
    /// <param name="bts">本地文件路径</param>
    /// <returns>Base64String</returns>
    public static string BytesToString(byte[] bts)
    {
        return System.Convert.ToBase64String(bts);
    }

    public static byte[] StringToBytes(string str)
    {
        return System.Text.Encoding.Default.GetBytes(str);
    }
}
