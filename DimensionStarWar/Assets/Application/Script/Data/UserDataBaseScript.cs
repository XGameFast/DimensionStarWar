using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using GameRequest;
public class UserDataBaseScript{
    public int userIndex;
    public string userName;
    public int userLevel;
    public int userType;
    public List<PlayerMonsterAttribute> userMonsterList;
    public List<StrongholdBaseAttribution> userStrongholdList;
    public List<Exchange> userExchangeSHList;
    public List<PlayerSkillAttribute> playerSkillAttributes;
    public UserBaseData userData;
    public Dictionary<int, List<UserObjsBox> > userObjs = new Dictionary<int, List<UserObjsBox>>();

    public virtual void InitValue()
    {
        userMonsterList = new List<PlayerMonsterAttribute>();
        userStrongholdList = new List<StrongholdBaseAttribution>();
        userData = new UserBaseData();
    }

    public virtual void SetData(UserBaseData userBaseData)
    {
        userData = userBaseData;
        userIndex = userData.userIndex;
        userName = userData.userName;
        userLevel = userData.userLevel;
        userType = userData.userType;
        SetPlayerMonsterAttribute(userData.monsterList);
       
    }
    public List<StrongholdMessage> GetStrtongholdMessage(int strongholdIndex)
    {
        var info = userStrongholdList.FirstOrDefault(o => o.strongholdIndex == strongholdIndex);

        return info.strongholdMessages;
    }


    public virtual void SetPlayerMonsterAttribute(List<MonsterGrowUpAttribute> list)
    {
        if (list == null)
            return;

        foreach (var go in list)
        {
            AddMonster(go);
        }
    }

    public virtual void AddMonster(MonsterGrowUpAttribute monsterGrowUpAttribute)
    {
        PlayerMonsterAttribute pma = ConvertTool.ConvertToPlayerMonsterAttribute(monsterGrowUpAttribute);
        pma.hostIndex = userIndex;
        pma.hostType = userType;
        userMonsterList.Add(pma);
    }

    /*public void AddMonsterToUserbox(PlayerMonsterAttribute pma)
    {
        if(userObjs.Keys.Contains(1000))
        {
            
        }else
        {
            userObjs.Add(1000, new List<UserObjsBox> { UserObjsBox })
        }
    }*/

    #region 更新数据
    
    public virtual void UpdatePlayerMonsterList()
    {

    }
    public void UpdateMonsterStrength(int monsterIndex ,int value)
    {
       // GetMonsterAttribute(monsterIndex).monsterCurrentStrength = value;
    }
    public void UpdateMonsterPower(int monsterIndex, int value)
    {
         GetMonsterAttribute(monsterIndex).mosterPower = value;
    }
    public void UpdateMonsterFinishSearchTime(int monsterIndex, int value)
    {
        GetMonsterAttribute(monsterIndex).finishTreasureTime = value;
    }
    public void UpdateMonsterStronghold(MonsterGrowUpAttribute monsterGrowUpAttribute)
    {
        PlayerMonsterAttribute playerMonsterAttribute = ConvertTool.ConvertToPlayerMonsterAttribute(monsterGrowUpAttribute);
        int count = userMonsterList.Count;
        for(int i = 0; i < count; i++)
        {
            if(userMonsterList[i].monsterIndex ==  monsterGrowUpAttribute.monsterIndex)
            {
                userMonsterList[i].backgroundDes = playerMonsterAttribute.backgroundDes;
                userMonsterList[i].baseCleanTime = playerMonsterAttribute.baseCleanTime;
                userMonsterList[i].belongStrongholdIndex = playerMonsterAttribute.belongStrongholdIndex;
                userMonsterList[i].curCleanValue = playerMonsterAttribute.curCleanValue;
                userMonsterList[i].curMood = playerMonsterAttribute.curMood;
                userMonsterList[i].currentStateType = playerMonsterAttribute.currentStateType;
                userMonsterList[i].finishCleanShTime = playerMonsterAttribute.finishCleanShTime;
                userMonsterList[i].finishTreasureTime = playerMonsterAttribute.finishTreasureTime;
                userMonsterList[i].hostIndex = playerMonsterAttribute.hostIndex;
                userMonsterList[i].hostType = playerMonsterAttribute.hostType;
                userMonsterList[i].lucykValue = playerMonsterAttribute.lucykValue;
                userMonsterList[i].maxLucky = playerMonsterAttribute.maxLucky;
                userMonsterList[i].maxPollution = playerMonsterAttribute.maxPollution;
                userMonsterList[i].monsterID = playerMonsterAttribute.monsterID;
                userMonsterList[i].monsterIndex = playerMonsterAttribute.monsterIndex;
                userMonsterList[i].monsterLevel = playerMonsterAttribute.monsterLevel;
                userMonsterList[i].monsterMaxPower = playerMonsterAttribute.monsterMaxPower;
                userMonsterList[i].monsterMoveSpeed = playerMonsterAttribute.monsterMoveSpeed;
                userMonsterList[i].monsterName = playerMonsterAttribute.monsterName;
                userMonsterList[i].monsterNickName = playerMonsterAttribute.monsterNickName;
                userMonsterList[i].monsterRareType = playerMonsterAttribute.monsterRareType;
                userMonsterList[i].monsterRecoveryTime = playerMonsterAttribute.monsterRecoveryTime;
                userMonsterList[i].monsterSkillIDList = playerMonsterAttribute.monsterSkillIDList;
                userMonsterList[i].mosterPower = playerMonsterAttribute.mosterPower;
                userMonsterList[i].pollution = playerMonsterAttribute.pollution;
                //userMonsterList[i] = playerMonsterAttribute;
                return;
            }
        }
    }

    public void UpdateMineDataOfChanllengeGame(GameRequest.FinishBattel finishBattel)
    {
        int rewardType = finishBattel.type;
        switch(rewardType)
        {
            case 0://Pve商家据点BOSS战
                SetFightReward(finishBattel);
                break;
            case 1://战斗奖励PVP玩家据点挑战
                SetFightReward(finishBattel);
                break;
            case 2://搜索奖励
                SetSearchReward(finishBattel);
                break;
        }
    }

    /// <summary>
    /// FEN配搜寻的奖励
    /// </summary>
    /// <param name="finishBattel">Finish battel.</param>
    public void SetSearchReward(GameRequest.FinishBattel finishBattel)
    {
        int count = finishBattel.objectList.Count;
        List<AndaLocalRewardData> rewardDatas = new List<AndaLocalRewardData>();
        for (int i = 0; i < count; i++)
        {
            int idType = AndaDataManager.Instance.GetObjectGroupID(finishBattel.objectList[i].objectId);
            if (idType == 1000)//宠物
            {
                MonsterGrowUpAttribute monsterGrowUpAttribute = BuildMonsterGrowUpAttribute(finishBattel.objectList[i].objectId, finishBattel.objectList[i].objectIndex);
                UpdateMonsterList(monsterGrowUpAttribute);
                PlayerMonsterAttribute playerMonsterAttribute = ConvertTool.ConvertToPlayerMonsterAttribute(monsterGrowUpAttribute);

                JIRVIS.Instance.jIRVISData.SetMonsterRewardList(playerMonsterAttribute);

                AndaLocalRewardData  andaLocalRewardData = new AndaLocalRewardData
                {
                    objID = playerMonsterAttribute.monsterID,
                    objCount = 1,
                };
                rewardDatas.Add(andaLocalRewardData);
            }
            else if (idType == 40000)//物品
            {
                AndaLocalRewardData andaLocalRewardData = new AndaLocalRewardData
                {
                    objID =finishBattel.objectList[i].objectId,
                    objCount = finishBattel.objectList[i].addCount,
                };
                rewardDatas.Add(andaLocalRewardData);
                UpdateConsumableList(finishBattel.objectList[i].objectId, finishBattel.objectList[i].addCount, finishBattel.objectList[i].objectIndex);
            }
        }

        JIRVIS.Instance.jIRVISData.SetNormalRewardList(rewardDatas);

    }
    /// <summary>
    /// 分配战斗的奖励
    /// </summary>
    /// <param name="finishBattel">Finish battel.</param>
    public void SetFightReward(FinishBattel finishBattel)
    {

        //更新宠物技能
        UpdataMonsterSkillAttr(finishBattel.monsterList);

        int rewardsCount = finishBattel.objectList.Count;

        if(finishBattel.couponList!=null && finishBattel.couponList.Count!=0)
        {
            List<RewardData> rwdData = new List<RewardData>();
            int count = finishBattel.couponList.Count;
            for(int i = 0 ; i <  count; i++)
            {
                rwdData.Add(ConvertTool.ConverterBattleCouponToRewardData(finishBattel.couponList[i]));
                AndaDataManager.Instance.userData.AddPlayerCoupon(ConvertTool.ConverterBattleCouponToPlayerCoupon(finishBattel.couponList[i]));
            }
            //检查一下有没有普通的奖励
            if(finishBattel.objectList!=null && finishBattel.objectList.Count!=0)
            {
                count = finishBattel.objectList.Count;
                for(int i = 0; i < count; i++)
                {
                    rwdData.Add(ConvertTool.ConverterBattleObjectToRewardData(finishBattel.objectList[i]));
                    int idGroup = AndaDataManager.Instance.GetObjectGroupID(finishBattel.objectList[i].objectId);
                    switch(idGroup)
                    {
                        case 1000:

                            break;
                        case 40000:
                            AndaDataManager.Instance.userData.AddConsuambleItem(ConvertTool.ConverterBattleObjectToSD_Pag4U(finishBattel.objectList[i]));
                            break;
                    }
                }
               
            }



        }else
        {
            //设置奖励挑战据点的奖励
            JIRVIS.Instance.jIRVISData.SetRewardsList(finishBattel.objectList);
            for (int i = 0; i < rewardsCount; i++)
            {
                int idType = AndaDataManager.Instance.GetObjectGroupID(finishBattel.objectList[i].objectId);
                if (idType == 1000)
                {
                    MonsterGrowUpAttribute monsterGrowUpAttribute = BuildMonsterGrowUpAttribute(finishBattel.objectList[i].objectId, finishBattel.objectList[i].objectIndex);
                    UpdateMonsterList(monsterGrowUpAttribute);
                }
                else if (idType == 40000)
                {
                    UpdateConsumableList(finishBattel.objectList[i].objectId, finishBattel.objectList[i].addCount, finishBattel.objectList[i].objectIndex);
                }
            }
            if (finishBattel.medalInfo != null)
            {
                JIRVIS.Instance.jIRVISData.SetMedalReward(finishBattel.medalInfo);
            }
            else JIRVIS.Instance.jIRVISData.SetMedalReward(null);
        }
    }
    /// <summary>
    /// 更新宠物技能
    /// </summary>
    /// <param name="_value">Value.</param>
    private void UpdataMonsterSkillAttr(List<BattelMonster> _value)
    {
        int monsterCount = _value.Count;
        for (int i = 0; i < monsterCount; i++)
        {
            BattelMonster battelMonster = _value[i];
            PlayerMonsterAttribute playerMonsterAttribute = userMonsterList.FirstOrDefault(s => s.monsterIndex == battelMonster.monsterIndex);
            playerMonsterAttribute.mosterPower = battelMonster.monsterCurrentPower;
            playerMonsterAttribute.monsterMaxPower = battelMonster.monsterMaxPower;
            playerMonsterAttribute.curMood = battelMonster.currentMoodValue;
            int skillCount = 0;
            if (battelMonster.skillList != null)
                skillCount = battelMonster.skillList.Count;
            for (int j = 0; j < skillCount; j++)
            {
                GameRequest.BattelSkill battelSkill = battelMonster.skillList[j];
                PlayerSkillAttribute playerSkillAttribute = playerMonsterAttribute.monsterSkillIDList.FirstOrDefault(s => s.skillIndex == battelSkill.skillIndex);
                playerSkillAttribute.skillAchievement = battelSkill.skillAChievementValue;
            }
        }
    }



    public virtual void UpdateConsumableList(int objectID, int objectCount,int objectIndex)
    {
        
    }

    public MonsterGrowUpAttribute BuildMonsterGrowUpAttribute(int monsterID, int monsterIndex)
    {
        MonsterBaseConfig monsterBaseConfig = MonsterGameData.GetMonsterBaseConfig(monsterID);
        MonsterGrowUpAttribute monsterGrowUpAttribute = new MonsterGrowUpAttribute()
        {
            playerIndex = userIndex,
            monsterIndex = monsterIndex,
            monsterID = monsterID,
            strongholdIndex = 0,
            monsterNickName = "",
            monsterMaxPower = monsterBaseConfig.growUpEXPLimit[0],
            monsterCurrentPower = monsterBaseConfig.growUpEXPLimit[0],
            monsterRecoveryStrengthFullTime = AndaGameExtension.GetCurrentUnixTime(),
            belongStrongholdIndex = 0,
            currentStateType = 0,

        };
        return monsterGrowUpAttribute;
    }

    public virtual void UpdateMonsterList (MonsterGrowUpAttribute monsterGrowUpAttribute)
    {
         AddMonster(monsterGrowUpAttribute);
    }

    #endregion

    #region 获取数据

    public List<PlayerMonsterAttribute> GetFreeMonster()
    {
        List<PlayerMonsterAttribute> freeMonsters = new List<PlayerMonsterAttribute>();
        int count = userMonsterList.Count;
        for(int i = 0 ; i < count; i++)
        {
            if(userMonsterList[i].belongStrongholdIndex == 0)
            {
                freeMonsters.Add(userMonsterList[i]);
            }
        }

        return freeMonsters;
    }

    public PlayerMonsterAttribute GetFreeMonster(int monsterId)
    {
        return GetFreeMonster().FirstOrDefault(s=>s.monsterID == monsterId);
    }

    public PlayerMonsterAttribute GetMonsterAttribute(int monsterIndex)
    {
        return userMonsterList.FirstOrDefault(s => s.monsterIndex == monsterIndex);
    }

    public List<PlayerStrongholdAttribute> GetAllPlayerStrongholdAttribute()
    {
        List<PlayerStrongholdAttribute> list = new List<PlayerStrongholdAttribute>();
        foreach (var go in userStrongholdList)
        {
            list.Add(go as PlayerStrongholdAttribute);
        }
        return list;
    }
    
    public int GetStrenth(int monsterIndex)
    {
        return 0;
       // return GetMonsterAttribute(monsterIndex).monsterCurrentStrength;
    }

    public virtual int GetMonsterRecoveryTime(int monsterIndex)
    {
        return GetMonsterAttribute(monsterIndex).monsterRecoveryTime;
    }

    public PlayerStrongholdAttribute GetPlayerCurrentStrongholdAtrribute(int index)
    {
        return userStrongholdList.FirstOrDefault(s=>s.strongholdIndex == index) as PlayerStrongholdAttribute;
    }

    //获取宠物所有不同种类的星宿
    public List<int> GetUserAllDiffrenceMonster()
    {
        List<int> ids = new List<int>();
        int count = userMonsterList.Count;
        for(int i = 0 ; i < count;  i++)
        {
            int id = userMonsterList[i].monsterID;
            if(!ids.Contains(id))
            {
                ids.Add(id);
            }
        }

        return ids;
    }

    #endregion
}
