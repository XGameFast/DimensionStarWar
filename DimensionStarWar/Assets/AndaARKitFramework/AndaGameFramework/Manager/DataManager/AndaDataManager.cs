using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;
using System.Linq;
using GameRequest;
public class AndaDataManager {

    private static AndaDataManager _instance = null;
    public static AndaDataManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new AndaDataManager();
            }
            return _instance;
        }
    }
    public TimeManager timeManager;
    public ObjdataManager objdataManager;
    public AudiodataManager audiodataManager;
    public NetdataManager naetdataManager;
    public UserDataScirpt userData;
    public string currentGuid;
    private string curBattleApplyJson;
    public List<UserDataScirpt> otherPlayerList;
    public List<BusinessDataScript> businessPlayerList;
    public MallData mallData;

    #region ListerEvent 
    public System.Action<PlayerMonsterAttribute> CallBack_UpdatePlayerMonsterAttribute;
    #endregion

    public void RecieveItem(AndaObjectBasic obj)
    {
        if (obj == null) return;
        objdataManager.ReceiveItem(obj);
    }
    /// <summary>
    /// 比较的方便的获取一个徽章
    /// </summary>
    public TowerMonster1002 GetMedalItemEasy(int medalLevel, int statueID)
    {
        TowerMonster1002 medal = InstantiateTower<TowerMonster1002>("20000");
        Material medalBody = GetMedalMaterial("20000_" + medalLevel);
        if (statueID == -1 || statueID == 0)
        {
            Material medalTexture = GetMedalMaterial("210000");
            medal.SetMonsterMaterial(medalTexture, medalBody);
        } else
        {
            int sID = statueID<20000? 20000 + statueID : statueID;
            Material medalTexture = GetMedalMaterial(sID.ToString());
            medal.SetMonsterMaterial(medalTexture, medalBody);
        }

        return medal;
    }

    public AndaObjectBasic SimpleGetAsset(int id)
    {
        OTYPE.ObjectsIDType objectsIDType = OTYPE.GetObjectsIDType(id);
        return objdataManager.SimpleGetAsset(id.ToString(), objectsIDType);
    }
    public AndaObjectBasic InstantiateMonster(string name)
    {
        return objdataManager.InstantiateObj(name, OTYPE.ObjectsIDType.monster);
    }
    public T InstantiateMonster<T>(string name) where T : Object
    {
        var t = InstantiateMonster(name).GetComponent<T>();
        return t;
    }
    public void PreloadMonsterPrefab(List<int> ids)
    {
        objdataManager.Preload(ids);
    }

    public AndaObjectBasic InstantiateTower(string name)
    {
        return objdataManager.InstantiateObj(name, OTYPE.ObjectsIDType.stronghold);
    }

    public T InstantiateTower<T>(string name) where T : Object
    {
        var t = InstantiateTower(name).GetComponent<T>();
        return t;
    }

    /// <summary>
    /// 根据物件的ID，自动获取物件
    /// </summary>
    /// <returns>The item.</returns>
    /// <param name="itemID">Item identifier.</param>
    public AndaObjectBasic InstantantiateItem(int itemID)
    {
        OTYPE.ObjectsIDType objectsIDType = OTYPE.GetObjectsIDType(itemID);
        return objdataManager.InstantiateObj(itemID.ToString(), objectsIDType);
    }

    public AndaObjectBasic InstantiateOtherObj(string name)
    {
        return objdataManager.InstantiateObj(name, OTYPE.ObjectsIDType.other);
    }

    public T InstantiateOtherObj<T>(string name) where T : Object
    {
        var t = InstantiateOtherObj(name).GetComponent<T>();
        return t;
    }

    public AndaObjectBasic InstantaiteSkillObj(string name)
    {
        //Debug.Log("AndaDataManager :InstantaiteSkillObj" );
        return objdataManager.InstantiateObj(name, OTYPE.ObjectsIDType.skill);
    }

    public T InstantaiteSkillObj<T>(string name) where T : Object
    {
        var t = InstantaiteSkillObj(name).GetComponent<T>();
        return t;
    }



    public AndaObjectBasic InstantiateConsumablesObj(string name)
    {
        return objdataManager.InstantiateObj(name, OTYPE.ObjectsIDType.consumable);
    }
    public T InstantiateConsumablesObj<T>(string name) where T : Object
    {
        var t = InstantiateConsumablesObj(name).GetComponent<T>();
        return t;
    }
    public AndaObjectBasic InstantiateMenu(string name)
    {
        return objdataManager.InstantiateObj(name, OTYPE.ObjectsIDType.menu);
    }
    public T InstantiateMenu<T>(string name) where T : Object
    {
        var t = InstantiateMenu(name).GetComponent<T>();
        return t;
    }
    public void DestoryObj(AndaObjectBasic aob)
    {
        objdataManager.DestoryOneObj(aob);

    }
    public void DestorySameObj(AndaObjectBasic aob)
    {
        objdataManager.DestorySameObj(aob);
    }

    public void DestoryAllPool(OTYPE.ObjectsIDType objType)
    {
        objdataManager.DestoryAllPool(objType);
    }
    public AndaObjectBasic GetPlayerStrongholdObj()
    {
        return GetStrongHold(MonsterGameData.StrongHoldType.SelfStrongHold);
    }
    public AndaObjectBasic GetStrongHold(MonsterGameData.StrongHoldType strongholdData)
    {
        switch (strongholdData)
        {
            case MonsterGameData.StrongHoldType.SelfStrongHold:
                return InstantiateOtherObj(MonsterGameData.selfStorngHoldName);
            case MonsterGameData.StrongHoldType.OtherStrongHold:
                return InstantiateOtherObj(MonsterGameData.privateStrongHoldName);
            case MonsterGameData.StrongHoldType.BusinessStronghold:
                return InstantiateOtherObj(MonsterGameData.businessStrongholdName);
            default:
                return InstantiateOtherObj(MonsterGameData.selfStorngHoldName);
        }
    }

    public void PlayAudio(string name, AudiodataManager.AudioType audioType)
    {
        if (audiodataManager != null)
        {
            audiodataManager.PlaySounds(name, audioType);
        }
        else
        {
            Debug.Log("Anda :  audiodataManager is null!!! cant play sounds now!");
        }
    }


    public void PlayBackgroundAudio(bool isPlay)
    {
        audiodataManager.PlayBackgroundSounds(isPlay);
    }

    public AudioClip GetAudioClip(string name)
    {
        return audiodataManager.PlaySkillSounds(name);
    }
    public SkillAudio GetSkillAudioClip(string skillID)
    {
        return audiodataManager.GetSkillSounds(skillID);
    }
    public SkillAudio GetSkillDefenseAudioClip(string skillID)
    {
        return audiodataManager.GetDefenseSkillAudio(skillID);
    }

    public Sprite GetUISprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.menu);
    }

    public GameObject GetSpritePerfab(string itemname)
    {
        return objdataManager.GetSpriteItem(itemname, OTYPE.ObjectsIDType.menu);
    }

    public Sprite GetSkillSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.skill);
    }
    public Sprite GetMonsterIconSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.monster);
    }
    public Sprite GetConsumableSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.consumable);
    }
    public Sprite GetObjectSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.objects);
    }
    //状态图标
    public Sprite GetStateSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.state);
    }
    public Sprite GetStarSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.star);
    }
    public Sprite GetStrongholdPorSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.stronghold);
    }

    public Sprite GetStrongholdLevelBoardSprite(int strongholdLevel)
    {
        return objdataManager.GetStrongholdLeveLSprite(strongholdLevel);
    }
    public Sprite GetBussinessLevelBoardSprite(int shLevel)
    {
        return objdataManager.GetBussinessStrongholdLevelSprite(shLevel);
    }
    public Sprite GetSkillTypeBoardSprite(int skillType)
    {
        return objdataManager.GetSkillBoardSprite(skillType);
    }
    public Sprite GetMonsterLevelBoardSprite(int monsterLevel)
    {
        return objdataManager.GetMonsterLevevlBoardSprite(monsterLevel);
    }
    public Sprite GetStrongholdStutedSprite(int id)
    {
        return Resources.Load<Sprite>("Sprite/Stronghold/" + id);
    }

    public Texture2D[] GetMonsterTextures(string id)
    {
        return objdataManager.GetTextures(id, OTYPE.ObjectsIDType.monster);
    }

    public Sprite GetSprite(int id)
    {
        int idType = GetObjTypeID(id);
        switch(idType)
        {
            case 1000:
                return GetMonsterIconSprite(id.ToString());
            case 40000:
                return GetConsumableSprite(id.ToString());
        }
        
       /* OTYPE.ObjectsIDType objectsIDType = OTYPE.GetObjectsIDType(id);
        switch (objectsIDType)
        {
            case OTYPE.ObjectsIDType.consumable:
                return GetConsumableSprite(id.ToString());
            case OTYPE.ObjectsIDType.objects:
                return GetObjectSprite(id.ToString());
            case OTYPE.ObjectsIDType.magical:
            case OTYPE.ObjectsIDType.skill:
                return GetSkillSprite(id.ToString());
            case OTYPE.ObjectsIDType.monster:
                return GetMonsterIconSprite(id.ToString());
            case OTYPE.ObjectsIDType.state:
                return GetStateSprite(id.ToString());
            case OTYPE.ObjectsIDType.stronghold:
                return GetStrongholdPorSprite(id.ToString());
            default:
                return null;
        }*/
        return null;
    }

    /// <summary>
    /// 获取据点头像，一般用于商家的的据点
    /// </summary>
    /// <param name="shIndex">Sh index.</param>
    /// <param name="imgPath">Image path.</param>
    /// <param name="callback">Callback.</param>
    public void GetStrongholdImg(int shIndex, string imgPath, System.Action<int, Sprite> callback)
    {
        //PlayerPrefs.SetString("SH_Por" + shIndex ,"");
        string path = PlayerPrefs.GetString("SH_PorPath" + shIndex);
        if(path == "")
        {
            naetdataManager.StartCoroutine(naetdataManager.GetStrongholdImg(imgPath, shIndex, callback));

        }else
        {
            if(imgPath == path)
            {
                string s = PlayerPrefs.GetString("SH_Por" + shIndex);
                //相同 =》 直接从本地拿
                byte[] v = ConvertTool.StringToBytes(s);
                Texture2D texture = new Texture2D(128, 128);
                texture.LoadImage(v);
                texture = ConvertTool.ConvertToTexture2d(texture);
                Sprite sp = ConvertTool.ConvertToSpriteWithTexture2d(texture);
                callback(shIndex, sp);

            }
            else
            {
                // 不同 = >向服务器要数据
                naetdataManager.StartCoroutine(naetdataManager.GetStrongholdImg(imgPath, shIndex, callback));
            }
        }
    }

    public void GetOtherPlayerPorImg(int hostIndex,string path ,System.Action<Sprite> callback)
    {
        if (string.IsNullOrEmpty(path))
        {
            callback(GetUISprite("AnotherNoPerson"));
        }
        else
        {
            string s = PlayerPrefs.GetString("UserPorImg" + hostIndex);
            if (s == "")
            {
                naetdataManager.StartCoroutine(naetdataManager.GetUserPorImg(path, callback));
            }
            else
            {
                //与老的头像进行匹配，是否一致，不一致的话要进重新拉取
                string oldPath = PlayerPrefs.GetString("UserPorPath" + hostIndex);
                if (oldPath == path)
                {
                    byte[] v = ConvertTool.StringToBytes(s);
                    Texture2D texture = new Texture2D(128, 128);
                    texture.LoadImage(v);
                    texture = ConvertTool.ConvertToTexture2d(texture);
                    Sprite sp = ConvertTool.ConvertToSpriteWithTexture2d(texture);
                    callback(sp);
                }
                else
                {
                    naetdataManager.StartCoroutine(naetdataManager.GetUserPorImg(path, callback));
                }
            }
        }
    }

    public void GetPlayerPorImg(System.Action<Sprite> callback)
    {
        string path = userData.playerdata.headImg;
        if (string.IsNullOrEmpty(path))
        {
            callback(GetUISprite("NoPerson"));

        }else
        {
            string s = PlayerPrefs.GetString("UserPorImg" +userData.userIndex);
            if (s == "")
            {
                naetdataManager.StartCoroutine(naetdataManager.GetUserPorImg(path,callback));
            }
            else
            {
                //与老的头像进行匹配，是否一致，不一致的话要进重新拉取
                string oldPath = PlayerPrefs.GetString("UserPorPath" + userData.userIndex);
                if(oldPath == path)
                {
                    byte[] v = ConvertTool.StringToBytes(s);
                    Texture2D texture = new Texture2D(128, 128);
                    texture.LoadImage(v);
                    texture = ConvertTool.ConvertToTexture2d(texture);
                    Sprite sp = ConvertTool.ConvertToSpriteWithTexture2d(texture);
                    callback(sp);
                }else
                {
                    naetdataManager.StartCoroutine(naetdataManager.GetUserPorImg(path, callback));
                }
            }
        }
    }




    /// <summary>
    /// 获取奖励的图标
    /// </summary>
    public void GetBSHRewardImg(string img, System.Action<Sprite> callback)
    {
        string s = PlayerPrefs.GetString("RW_" + img);
        if (s == "")
        {
            naetdataManager.StartCoroutine(naetdataManager.GetBSHRewardImg(img, callback));
        }
        else
        {
            byte[] v = ConvertTool.StringToBytes(s);
            Texture2D texture = new Texture2D(128, 128);
            texture.LoadImage(v);
            texture = ConvertTool.ConvertToTexture2d(texture);
            Sprite sp = ConvertTool.ConvertToSpriteWithTexture2d(texture);
            callback(sp);
        }
    }



    public Sprite GetMedalLevelBoardSprite(string name)
    {
        return objdataManager.GetSprite(name, OTYPE.ObjectsIDType.other);
    }
    public Texture GetRoomTexture(string name)
    {
        return objdataManager.GetTexture(name, OTYPE.ObjectsIDType.room);
    }

    public Material GetMonsterMaterial(string name)
    {
        return GetMaterial(name, OTYPE.ObjectsIDType.monster);
    }

    public Material GetEffectMaterial(string name)
    {
        return objdataManager.GetEffectMat(name);
    }

    public Material GetMaterial(string name, OTYPE.ObjectsIDType objdataType)
    {
        return objdataManager.GetMaterial(name, objdataType);
    }
    public Material GetMedalMaterial(string name)
    {
        return objdataManager.GetMedalMat(name);
    }


    #region 计时器相关
    //添加打扫计时器
    public void AddCleanTimeData(int monsterIndex, int finishTime)
    {
        timeManager.AddCleanTime(monsterIndex, finishTime);
    }
    //添加探险记时器
    public void AddTreasureTimeData(int monsterIndex, int finishTime)
    {
        timeManager.AddTreasureTime(monsterIndex, finishTime);
    }
    //添加恢复体力计时器
    public void AddRecoveryStrengthTimeData(int monsterIndex, int finishTime)
    {
        timeManager.AddRecoveryTime(monsterIndex, finishTime);
    }
    #endregion

    #region 更新数据
    /// <summary>
    /// 
    /// </summary>
    /// <param name="pshgu"></param>
    public void UpdatePlayerStrongholdList(PlayerStrongHoldGrowUpAttribute pshgu)
    {
        userData.UpdateStrongholdList(pshgu);
        //本地再保存一遍
        SavePlayerStrongholdListToLocal();
    }
    /// <summary>
    /// 更新消耗品
    /// </summary>
    /// <param name="odb"></param>
    public void UpdateUserConsumableItemForADD(SD_Pag4U odb)
    {
        userData.AddConsuambleItem(odb);
    }
    //【减少物件，即使用了某个物件  使用的是物件的ID】。这个接口模式是使用一个的。并且是默认从后往前使用
    public void ReducePlayerConsumableList(int itemID , int itemCount = 1)
    {
        int typeID = GetObjTypeID(itemID);
        List<LD_Objs> lD_s = userData.userObjs[typeID].FirstOrDefault(s => s.id == itemID).lD_Objs;
        int _itemIndex = lD_s[lD_s.Count-1].objIndex;
        userData.ReduceConsumableItem(_itemIndex,itemID, itemCount);
    }

    public void UpdateMonsterStrengthValue(int monsterIndex, int playerIndex, int playerType, int value)
    {
        switch (playerType)
        {
            case (int)OTYPE.PlayerType.user:
                userData.UpdateMonsterStrength(monsterIndex, value);
                break;
            case (int)OTYPE.PlayerType.otherPlayer:
                otherPlayerList.FirstOrDefault(s => s.userIndex == playerIndex).UpdateMonsterStrength(monsterIndex, value);
                break;
            case (int)OTYPE.PlayerType.businessPlayer:
                businessPlayerList.FirstOrDefault(s => s.userIndex == playerIndex).UpdateMonsterStrength(monsterIndex, value);
                break;
        }
    }
    public void UpdateMonsterPowerValue(int monsterIndex, int value)
    {
        userData.UpdateMonsterPower(monsterIndex, value);
    }
    /// <summary>
    /// 战斗结束后，更新我方的宠物 技能 的相关数据
    /// </summary>
    public void UpdateMineDataOfChanllengeGame(FinishBattel _finishBattle)
    {
        userData.UpdateMineDataOfChanllengeGame(_finishBattle);
    }

    public void UpdateMonsterToStronghold(MonsterGrowUpAttribute monsterGrowUpAttribute)
    {
        userData.UpdateMonsterStronghold(monsterGrowUpAttribute);
    }

    #endregion

    #region 与服务器通信


    public void CallServerGetExchangeInfo(int exchangeIndex, System.Action<Exchange> callback)
    {
        naetdataManager.CallServerGetExchangeInfo(exchangeIndex,callback);
    }

    public  void CallServerUploadExBSCouponToExchagne(ExchangeBusinessCoupon businessCoupon ,System.Action<ExchangeBusinessCoupon> callback)
    {
        naetdataManager.CallServerUploadExBSCouponToExchange(businessCoupon,callback);
    }

    public void CallServerUploadExchangeObjectToExchange(ExchangeObject exchangeObject,System.Action<ExchangeObject> callback)
    {
        naetdataManager.CallServerUploadExchangeObjectToExchange(exchangeObject,callback);
    }


    public void CallServerBuyObjectFromExchange(int itemIndex, int payType, int payPrice, System.Action<ExchangeObject> callback)
    {
        naetdataManager.CallServerBuyItemFromExchange(itemIndex, payType, payPrice, callback);
    }
    /// <summary>
    /// 购买交易所中的 奖励券
    /// </summary>
    /// <param name="itemIndex">Item index.</param>
    /// <param name="payType">Pay type.</param>
    /// <param name="callback">Callback.</param>
    public void CallServerBuyExBSCouponFromExchange(int itemIndex, int payType, int payPrice, System.Action<ExchangeBusinessCoupon> callback)
    {
        naetdataManager.CallServerBuyExbsCouponFromExchange(itemIndex, payType, payPrice, callback);
    }

    public virtual void CallServerInsertExchangeStronghold(double x ,double y , string des, int rate,string exName,System.Action<Exchange> action)
    {
        naetdataManager.CallServerUploadExchangeStronghold(x,y, des ,exName, rate, action);
    }


    public void CallServerInsertMonsterToStronghold(int monsterIndex, int strongholdIndex,string nickName, System.Action<bool> callback)
    {
        if (nickName == "")
        {
            JIRVIS.Instance.PlayTips("宠物名称不为空");
            return;
        }
        naetdataManager.CallServerUploadSetMonsterToStronghold(monsterIndex, strongholdIndex, nickName, callback);
    }

    public void TestInsertStronghold(List<string> _data)
    {
        naetdataManager.UploadStrongholdTest(_data);
    }

    public void TestLoginOnce(System.Action<bool> callback, string name)
    {
        naetdataManager.TestLoginOnce(callback, name);
    }

    public void TestLogin(System.Action<bool> callBack, string name, string password)
    {
        naetdataManager.TestLogin(callBack, name, password);
    }
    public void PhoneLogin(System.Action<bool> callBack, string phone, string code)
    {
        naetdataManager.PhoneLogin(callBack, phone, code);
    }

    public void SendSmsCode(System.Action<bool> callBack, string phone)
    {
        naetdataManager.SendSmsCode(callBack, phone);
    }

    //获取精粹
    public void GetEXP(System.Action<SD_Pag> callBack, int StrongHoldIndex, int objectIndex,int createObjectID)
    {
        naetdataManager.GetEXP(callBack, StrongHoldIndex, objectIndex,createObjectID);
    }
    public void Login(System.Action<bool> callBack, string name, string password)
    {
        naetdataManager.Login(callBack, name, password);
    }

    public void GetTreasureHurnResult(System.Action<NetworkReturnData> callBack)
    {
        naetdataManager.GetTreasureHunResult(callBack);
    }

    public void CallServerGetMonsterData(int hostIndex,int monsterIndex,System.Action<PlayerMonsterAttribute> callback)
    {
        naetdataManager.GetEnemyData(monsterIndex,hostIndex,callback);
    }
    //获取据点的战斗怪兽
    public void CallServerGeBelongdStrongholdtMonsterListData(int strongholdIndex ,System.Action<List<PlayerMonsterAttribute>> callback)
    {
        naetdataManager.GetBelondThisstrongholdFightEnemgyData(strongholdIndex,callback);
    }
    //[测试获取据点怪兽的数据]
    public void TestCallServerGetBlondStrongholdMonsterListData(int strongholdIndex,System.Action<bool>callback)
    {
        naetdataManager.TestGetBelondThisstrongholdFightEnemgyData(strongholdIndex,callback);
    }
    public void CallServerGetCurrentLocaitonRangeOfOtherData(List<double> location ,System.Action<List<PlayerStrongholdAttribute>,List<BusinessStrongholdAttribute>,List<Exchange>> callback)
    {
        naetdataManager.GetCurrentLocationRangeOtherData(location,callback);
        return;

    }

    public void CallServerGetFightMonsterForOtherPlayer(int strongholdIndex, System.Action<List<PlayerMonsterAttribute>> callback)
    {
        //战斗的Type = 1 
        CallServerGetOtherplayerMonsterData(strongholdIndex,1,callback);
    }

    public void CallServerGetOtherplayerMonsterData(int strongholdIndex, int monsterType,System.Action<List<PlayerMonsterAttribute>> callback)
    {
        naetdataManager.CallServerGetMonsterList(strongholdIndex,monsterType,callback);
    }


    /// <summary>
    /// 向服务器申请战斗权限 , type 0 = pve, 1= pvp, 2= catch
    /// </summary>
    public void CallServerApplyMatch(string type,int targetHoldIndex,int mineHoldIndex ,System.Action<bool> callback)
    {
        BattelApply battelApply = new BattelApply();
        battelApply.enemyStrongHoldIndex = targetHoldIndex;
        //Debug.Log("targetHoldIndex" + targetHoldIndex);
        battelApply.myStrongHoldIndex = mineHoldIndex;
        //Debug.Log("mineHoldIndex" + mineHoldIndex);
        battelApply.unixTime = AndaGameExtension.GetCurrentUnixTime();
        curBattleApplyJson = JsonMapper.ToJson(battelApply);
        //Debug.Log("userData.token" + userData.token); 
        string aesTex =  AndaGameExtension.LockData(curBattleApplyJson,userData.token);
        naetdataManager.ApplyBattle(aesTex,type,userData.token,callback);
    }

    /// <summary>
    /// 向服务器申请战斗权限 , type 0 = pve, 1= pvp, 2= catch
    /// </summary>
    public void CallServerApplyMatchWithObject(int objectID, string type, int targetHoldIndex, int mineHoldIndex, System.Action<List<SearchObject>> callback)
    {
        BattelApply battelApply = new BattelApply();
        battelApply.enemyStrongHoldIndex = targetHoldIndex;
        //Debug.Log("targetHoldIndex" + targetHoldIndex);
        battelApply.myStrongHoldIndex = mineHoldIndex;
        //Debug.Log("mineHoldIndex" + mineHoldIndex);
        battelApply.unixTime = AndaGameExtension.GetCurrentUnixTime();
        curBattleApplyJson = JsonMapper.ToJson(battelApply);
        //Debug.Log("userData.token" + userData.token); 
        string aesTex = AndaGameExtension.LockData(curBattleApplyJson, userData.token);
        naetdataManager.ApplyBattleWithObject(objectID, aesTex, type, userData.token, callback);
    }

    //根据玩家当前定位所在的行政区，获取所有的的其他玩家 和商家 的据点
    public void CallServerGetAreaRangeOhterPlayerAndBusinessData(System.Action<bool> callBack, string administrativeArea)
    {
        naetdataManager.GetAreaRangeOhterPlayerAndBusinessData(callBack, administrativeArea);
    }
    //根据玩家当前所在据点的坐标，获取据点覆盖范围内的其他玩家和商家据点
    public void CallServerGetOtherPlayerAndBusinessStrongholdDataWihtCurrentUserStrongholdLocation(List<double> location,System.Action<List<PlayerStrongholdAttribute>,List<BusinessStrongholdAttribute>> callback)
    {
        naetdataManager.GetOtherPlayerAndBusinessStrongholdDataWithCurrentStorngholdlocation(location,callback);
    }


    //上传战斗数据
    public void UploadMonsterFightValue(List<MonsterUseSkillValue> monsterListValue, System.Action callbakc)
    {

    }

    public void CallServerSetStronghold()
    {
        
    }
    //向服务更新玩家据点
    public void CallServerSetPlayerStronghold(int strongholdID, string strongholdNickName, string locationName, double x, double y, int statueID, System.Action<PlayerStrongholdAttribute> callBack)
    {
        naetdataManager.UploadSetplayerstronghold(strongholdID,strongholdNickName,locationName,x,y,statueID,callBack);
    }


    public void CallServer_FinishClean(int monsterIndex)
    {
        //naetdataManager.CallServerCheckIsFinihedClean(monsterIndex);
    }

    public void CallServerUploadGameResult(int gameType, int _stuts, List<BattelResult> battelResults,System.Action<bool>callback)
    {
        string json = JsonMapper.ToJson(battelResults);
        var objetList = new List<SearchObject>();
        string objstr = JsonMapper.ToJson(objetList);
        string md5 = LockMD5(_stuts,gameType,json, objstr);
        BattelFinish battelFinish = new BattelFinish()
        {
            guid = currentGuid,
            type = gameType,
            status = _stuts,
            md5Text = md5,
            res = battelResults,
            token = userData.token,
        };
        #if UNITY_EDITOR
        Debug.Log("ChanllengeBattleFinish" + JsonMapper.ToJson(battelFinish));
        #endif
        naetdataManager.UploadGameResult(battelFinish,callback);
    }

    public void CallServerUploadProtectGameResult(int gameType, int _stuts, List<BattelResult> battelResults, System.Action<List<RewardData>> callback)
    {
        string json = JsonMapper.ToJson(battelResults);
        var objetList = new List<SearchObject>();
        string objstr = JsonMapper.ToJson(objetList);
        string md5 = LockMD5(_stuts, gameType, json, objstr);
        BattelFinish battelFinish = new BattelFinish()
        {
            guid = currentGuid,
            type = gameType,
            status = _stuts,
            md5Text = md5,
            res = battelResults,
            token = userData.token,
        };
#if UNITY_EDITOR
        Debug.Log("ProtectBattleFinish" + JsonMapper.ToJson(battelFinish));
#endif
        naetdataManager.UploadProtectGameResult(battelFinish, callback);
    }


    public void CallServerUploadGameWithObjectResult(int gameType, int _stuts, List<BattelResult> battelResults,List<SearchObject> searchObjects, System.Action<bool> callback)
    {
        string json = JsonMapper.ToJson(battelResults);
        string objjson = JsonMapper.ToJson(searchObjects);
        string md5 = LockMD5(_stuts, gameType, json, objjson);
        BattelFinish battelFinish = new BattelFinish()
        {
            guid = currentGuid,
            type = gameType,
            status = _stuts,
            md5Text = md5,
            res = battelResults,
            token = userData.token,
            searchObject = searchObjects
        };

        #if UNITY_EDITOR
        Debug.Log("BattleFinish" + JsonMapper.ToJson(battelFinish));
        #endif
        naetdataManager.UploadGameResult(battelFinish, callback);
    }





    public void CallServerUpRecovery(int monsterIndex, int objectIndex,int count, System.Action<bool> callback)
    {
        naetdataManager.UpRecovery(monsterIndex, objectIndex, count, callback);
    }

    public void CallUpStartSearch(int monsterIndex ,int recoveryObjectIndex, int searchIndex, int luckyObjectIndex, System.Action<bool> callback)
    {
        naetdataManager.UpStartSearch(monsterIndex, recoveryObjectIndex, searchIndex, luckyObjectIndex,  callback);
    }

    public void CallUpFinishSearch(int monsterIndex, System.Action<bool, string> callback)
    {
        naetdataManager.UpFinishSearch(monsterIndex, callback);
    }
    //[向服务器更新 据点的 雕像ID]

    public void CallServerUploadStrongholdStatusID(int strongholdIndex, int statusID, System.Action callback)
    {
        naetdataManager.UploadStrongholdStatueID(strongholdIndex,statusID,callback);
    }

    public void CallServerGetConfigBase(System.Action<ConfigBase> callback)
    {
        naetdataManager.GetBaseConfig(callback);
    }

    public void CallServerGetConfigFiles(List<ConfigFile> files , System.Action<List<LocalConfigFile>> callback)
    {
        naetdataManager.GetConfigFils(files,callback);
    }

    #region 第三方登录
    public void WeChatLogin(System.Action<bool> callBack, string code)
    {
        naetdataManager.WeChatLogin(code, callBack);
    }
    public void QQLogin(System.Action<bool> callBack, string code)
    {
        naetdataManager.QQLogin(code, callBack);
    }
    #endregion


    //商店操作
    public void MallBuy(System.Action<bool> callBack, int count, int type,int objectID)
    {
        naetdataManager.BuyObject( count, type, objectID,callBack);
    }

    public void MallDetail(System.Action<List<CD_MallDetail>> callBack)
    {
        naetdataManager.GetMallDetail(callBack);
    }
    #endregion

    public void MonsterStatusChanged(System.Action<bool> callBack, int index,int status)
    {
        naetdataManager.MonsterStatusChanged(callBack, index, status);
    }


    #region 获取玩家的相关数据

    public List<PlayerMonsterAttribute> GetUserFreesMonster()
    {
        return userData.GetFreeMonster();
    }

    #endregion

    #region 建立玩家数据
    public void SetUserData(PlayerData playData)
    {
        if (userData == null)
        {
            userData = new UserDataScirpt();
            userData.InitValue();
        }
        userData.SetData(playData);
    }

    public void SetUserToken(string _token)
    {
        userData.token = _token;
    }

    public void SetGameguid(string guid)
    {
        currentGuid = guid;
    }

    #endregion
    #region 建立商店数据
    public void SetMallData()
    {
        if (mallData == null)
        {
            mallData = new MallData();
            mallData.InitValue();
        }
        mallData.BuildData();
    }
    #endregion


    #region use prop

    public int UsePowerBlock(int _itemIndex)
    {
        return userData.UsePowerBlock(_itemIndex);
    }

    public int UseDetectProp(int _ID)

    {
        return userData.UseDetectProp(_ID);
    }
    #endregion


    /// <summary>
    /// 设置当前前定位周围其他玩家的数据包括商家数据
    /// </summary>
    /// <param name="playerDataList"></param>
    public void SetLocatioRangePlayerData(LocationRangeUserData playerDataList)
    {
        SetOtherPlayerData(playerDataList.otherPlayerData);
        SetBusinessPlayerData(playerDataList.businessData);
    }

    private void SetOtherPlayerData(List<PlayerData> playerDataList)
    {
        if (otherPlayerList == null) otherPlayerList = new List<UserDataScirpt>();
        foreach (var go in playerDataList)
        {
            UserDataScirpt uds = new UserDataScirpt();
            uds.InitValue();
            uds.SetData(go);
            otherPlayerList.Add(uds);
        }
    }
    private void SetBusinessPlayerData(List<BusinessData> businessDataList)
    {
        if (businessPlayerList == null) businessPlayerList = new List<BusinessDataScript>();
        foreach (var go in businessDataList)
        {
            BusinessDataScript bds = new BusinessDataScript();
            bds.InitValue();
            bds.SetData(go);
            businessPlayerList.Add(bds);
        }
    }

    public bool PlayerIsFishBird()
    {
        return userData.userMonsterList.Count == 0;
    }

    //通过游标查找monster的属性
    public PlayerMonsterAttribute GetUserPlayerMonsterAttributeWithItemIndex(int _itemIndex)
    {
        return userData.userMonsterList[_itemIndex];
    }

    public List<PlayerMonsterAttribute> GetUserPlayerMonstesrList()
    {
        return userData.userMonsterList;
    }

    public List<int> GetUserAllDiffrenceMonster()
    {
        return userData.GetUserAllDiffrenceMonster();
    }

    public List<int> GetUserDiffrenceConsuamble()
    {
        return userData.GetUserAllDiffrenceObjects();
    }

    public bool CheckUserHasThiComsumableItem(int itemID)
    {
        return userData.CheckUserGetThisObject(itemID);
    }

    /// <summary>
    /// 获取玩家意志力精粹的集合
    /// </summary>
    /// <returns>The user property power list.</returns>
    public List<LD_Objs> GetUserPropPowerBlockList()
    {
        return userData.GetUserProp_PowerList();
    }

    public LD_Objs GetExpblockByItemIndex(int _index)
    {
        return userData.GetExpblockByItemIndex(_index);
    }




    public PlayerMonsterAttribute GetPlayerMonsterAttribute(int monsterIndex, int playerIndex, int userType)
    {

        //userType = 0 自己  userType = 1 其他个人玩家 ， userType = 2 商家

        switch (userType)
        {
            case (int)OTYPE.PlayerType.user:
                return userData.GetMonsterAttribute(monsterIndex);
            case (int)OTYPE.PlayerType.otherPlayer:
                return otherPlayerList.FirstOrDefault(s => s.userIndex == playerIndex).GetMonsterAttribute(monsterIndex);
            case (int)OTYPE.PlayerType.businessPlayer:
                return businessPlayerList.FirstOrDefault(s => s.userIndex == playerIndex).GetMonsterAttribute(monsterIndex);
            default:
                return null;
        }
    }

    public PlayerMonsterAttribute GetPlayerMonsterFromBusinessData(int playerIndex, int monsterIndex)
    {
        return businessPlayerList.FirstOrDefault(s => s.userIndex == playerIndex).GetMonsterAttribute(monsterIndex);
    }

    public List<PlayerStrongholdAttribute> GetPlayerAllStrongholdAttribute()
    {
        return userData.GetAllPlayerStrongholdAttribute();
    }

    public bool PlayerHasStronghold()
    {
        return userData.userStrongholdList.Count > 0 ;
    }
   /// <summary>
   /// 通过jirvis 保存的据点的index。获取据点数据
   /// </summary>
   /// <returns>The stronghold atrr with JIRVISS ave indexs.</returns>
    public PlayerStrongholdAttribute GetStrongholdAtrrWithJIRVISSaveIndexs()
    {
        return (PlayerStrongholdAttribute)userData.userStrongholdList.FirstOrDefault(s=>s.strongholdIndex == JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex);
    }

    public List<StrongholdMessage> GetStrongholdMessages(int strongholdIndex)
    {
        return userData.GetStrtongholdMessage(strongholdIndex);
    }

    public PlayerStrongholdAttribute GetPlayerCurrentStrongholdData(int index)
    {
        return userData.GetPlayerCurrentStrongholdAtrribute(index);
    }
   
    /// <summary>
    /// 获取其他玩家的私人据点列表
    /// </summary>
    /// <returns></returns>
    public List<StrongholdBaseAttribution> GetOtherPlayerStrongholdAttribute()
    {
        List<StrongholdBaseAttribution> psdlist = new List<StrongholdBaseAttribution>();

        foreach (var go in otherPlayerList)
        {
            psdlist.AddRange(go.userStrongholdList);
        }
        return psdlist;
    }
    /// <summary>
    /// 获取商业据点列表
    /// </summary>
    /// <returns></returns>
    public List<StrongholdBaseAttribution> GetBusinessStrongholdAttribute()
    {
        List<StrongholdBaseAttribution> psdlist = new List<StrongholdBaseAttribution>();
        foreach (var go in businessPlayerList)
        {
            psdlist.AddRange(go.userStrongholdList);
        }
        return psdlist;
    }
    /// <summary>
    /// 通过玩家的 据点成长属性 获取 PlayerStrongholdAttribute 
    /// </summary>
    /// <param name="pshgua"></param>
    /// <returns></returns>
    public PlayerStrongholdAttribute GetPlayerStronghold(PlayerStrongHoldGrowUpAttribute pshgua)
    {
        return userData.GetPlayerStrongholdByGrowupData(pshgua);
    }

    /// <summary>
    /// 获取据点里的所有宠物的污染度综合
    /// </summary>
    /// <returns></returns>
    public float GetMonsterPollutionAll(int strongholdIndex)
    {
        return userData.GetMonsterPollutionAll(strongholdIndex);
    }
    /// <summary>
    /// 获取属于这个据点的宠物的数量
    /// </summary>
    /// <param name="strongholdIndex"></param>
    /// <returns></returns>
    public int GetMonsterCountBelongThisStronghold(int strongholdIndex)
    {
        return userData.GetMonstetCountBelongThisStronghold(strongholdIndex);
    }


    public List<PlayerMonsterAttribute> GetPlayerMonsterAttributeBelongThisStronghold(int strongholdIndex)
    {
        return userData.GetMonsterAttributeBelongThisStronghold(strongholdIndex);
    }
    /// <summary>
    /// 获取jirvis 记录的当前的占星庭的里的宠物 ，数据会==null的情况
    /// </summary>
    /// <returns>The player monster attr with JIRVISS tronghold index.</returns>
    public List<PlayerMonsterAttribute> GetPlayerMonsterAttrWithJIRVISStrongholdIndex()
    {
        int strongholdIndex = JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex;
        if(strongholdIndex == -1)return null;
        return userData.GetMonsterAttributeBelongThisStronghold(strongholdIndex);
    }

    public bool PlayerHasMonster()
    {
        return userData.userMonsterList.Count >0;
    }

    public List<PlayerMonsterAttribute> GetCleanStateMonsterBelongThisStronghold(int strongIndex)
    {
        return userData.GetCleanStateMonsterBelongthisStronghold(strongIndex);
    }

    public List<int> GetUserMonsterIDs(int strongholdIndex)
    {
        return userData.GetMonsterIDLIst(strongholdIndex);
    }

    public PlayerStrongholdAttribute GetPlayerDefaultStrongholdAttr()
    {
        return userData.defaultPlayerStrongholdAttribute;
    }

    public LD_Objs GetConsumableData(int objID)
    {
        return userData.localData_objs.FirstOrDefault(s => s.objID == objID);
    }
    public List<UserObjsBox> GetPlayerPackageConsumableList()
    {
        return userData.GetConsumableList();
    }
    
    //从本地储存中拿出玩家保存的上场怪兽列表
    public List<LocalSaveMonsterUseList> GetPlayerUseMonsterListFromLocalData()
    {
        string json = PlayerPrefs.GetString("LocalSaveMonsterUseList");
        List<LocalSaveMonsterUseList> list = JsonMapper.ToObject<List<LocalSaveMonsterUseList>>(json);
        return list;
    }

    public List<PlayerStrongHoldGrowUpAttribute> GetPlayerStrongholdListLocalData()
    {
        string json = PlayerPrefs.GetString("PlayerStrongholdListLocal");
        List<PlayerStrongHoldGrowUpAttribute> ls = JsonMapper.ToObject<List<PlayerStrongHoldGrowUpAttribute>>(json);
        return ls;
    }

    public void SavePlayerUseMonsterList(List<LocalSaveMonsterUseList> monsterList)
    {
        string json = JsonMapper.ToJson(monsterList);
        PlayerPrefs.SetString("LocalSaveMonsterUseList", json);
    }

    public void SavePlayerStrongholdListToLocal()
    {
        string localData = JsonMapper.ToJson(userData.userStrongholdList);
        PlayerPrefs.SetString("PlayerStrongholdListLocal", localData);
    }



    #region 计算相关

    public bool CheckPlayerHadThisMonster(int monsterID)
    {
        return userData.userMonsterList.FirstOrDefault(s => s.monsterID == monsterID) != null; 
    }
    public bool CheckIsPlayer(int playerIndex)
    {
        return userData.userIndex == playerIndex;
    }

    //计算技能成就值
    public int GetSkillAchievementValue(int skillAchivementValue , int skillID)
    {
        SkillBaseAttribute skillBaseAttribute = MonsterGameData.GetSkillBaseAttribute(skillID);
        int count = skillBaseAttribute.skillPower.Count;
        for(int i = 0 ;i < count; i++)
        {
            if(i == 0)
            {
                if(skillAchivementValue>=0 && skillAchivementValue < skillBaseAttribute.skillArchievementLimit[i])
                    return i;
            }else
            {
                if(skillAchivementValue >=skillBaseAttribute.skillArchievementLimit[i-1] && skillAchivementValue < skillBaseAttribute.skillArchievementLimit[i])
                    return i;
            }
          
        }
        return  0 ;
      
    }

    public int GetMonsterExpLimit(int exp , MonsterBaseConfig mbc)
    {
        int count = mbc.growUpEXPLimit.Count;
        for(int i = 0 ; i  < count; i++)
        {
            if(exp < mbc.growUpEXPLimit[i])
            {
                return mbc.growUpEXPLimit[i];
            }
        }

        return 100000;
    }

    public int GetMonsterLevelValue(int exp, MonsterBaseConfig mbc)
    {
        List<int> expList = mbc.growUpEXPLimit;
        for (int i = 0; i < expList.Count; i++)
        {
            if (i == 0)
            {
                if (exp >= 0 && exp <= expList[i])
                    return 0;
            }
            else
            {

                if (exp > expList[i - 1] && exp <= expList[i])
                    return i;
            }
        }
        return 0;
    }
    //这个value 有可能是 伤害值，有可能是使用次数
    public int CucalSkillArchievementValue(int _value,int skillType , bool isWin)
    {
        int cucaltiems = MonsterGameData.skillArchievementValue.cucalTimes[skillType];
        //Debug.Log("times" + cucaltiems );
        int M = MonsterGameData.GetSkillArchievementValue(isWin);

       //Debug.Log("M" + M );
        int value = 0;

        // 非指向性 = 0 ， 防御= 1 , 治疗=2，位移 = 3， 4 = 法术 5= 指向性
        switch(skillType)
        {
            case 0://非指向性技能攻击
                value = _value * cucaltiems;
                break; 
            case 1://
                value = _value * cucaltiems*M;
                break; 
            case 2://
                break;
            case 3:
                value = _value * cucaltiems*M;
                break;
            case 4:
                break;
            case 5:
                break;
        }
        return value;
    }
  
    //返回是真实的等级，不会+1；
    public int CaculPlayerStrongholdLevel(int exp ,MonsterGameData.StrongHoldType strongHoldType)
    {
        List<int> expList = new List<int>();
        switch (strongHoldType)
        {
            case MonsterGameData.StrongHoldType.SelfStrongHold:
                PlayerStrongholdConfigAttribute shba = MonsterGameData.GetStrongBasedAttribute();
                expList = shba.playerStrongholdGrowUpExp;
                break;
            case MonsterGameData.StrongHoldType.BusinessStronghold:
                BusinessStrongholdConfigAttribute bsba = MonsterGameData.GetBusinessStrongholddBaseAttribute();
                expList = bsba.businessStrongholdGrowupExp;
                break;
        }
       
        for (int i = 0; i < expList.Count; i++)
        {
            if (i == 0)
            {
                if (exp >= 0 && exp <= expList[i])
                    return 0;
            }
            else
            {

                if (exp > expList[i - 1] && exp <= expList[i])
                    return i;
            }
        }
        return 0;
    }

    public int GetMonsterRecoveryStrengthTime(int monsterIndex , int playerIndex)
    {
        return userData.GetMonsterRecoveryTime(monsterIndex);
    }

    public int ConverStrongholIDFromDraw(int drawID)
    {
        switch(drawID)
        {
            case 42010:
                return 30000;
            case 42011:
                return 30001;
            case 42012:
                return 30002;
            case 42013:
                return 30003;
            case 42014:
                return 30004;
            case 42015:
                return 30005;
            default:
                return 30000;
        }
    }
    public int ConvertStrongholdLevelFromDraw(int drawID)
    {
        switch(drawID)
        {
            case 42010:
                return 0;
            case 42011:
                return 1;
            case 42012:
                return 2;
            case 42013:
                return 3;
            case 42014:
                return 4;
            case 42015:
                return 5;
            default:
                return 0;
        }
    }

    public string GetMedalTypeName(int medalLevel)
    {
        switch(medalLevel)
        {
            case 0:
                return "萌新徽章";
            case 1:
                return "初级徽章";
            case 2:
                return "中级徽章";
            case 3:
                return "高级徽章";
            case 4:
                return "宗师徽章";
            case 5:
                return "至尊徽章";
            default:
                return "萌新徽章";
        }
    }

    #region 通过物件的ID 计算出物件所属分类

    public string GetIDTypeName(int objectID)
    {
        GameAssetIDType iDType = GetAssetIDType(objectID , MonsterGameData.gameAssetIDTypes);
        if(iDType == null)
        {
            return "";
        }else
        {
            return iDType.typeName;
        }
    }

    public int GetObjTypeID(int objectID)
    {
        GameAssetIDType iDType = GetAssetIDType(objectID , MonsterGameData.gameAssetIDTypes);
        if(iDType == null)
        {
            return -1;
        }else
        {
            return iDType.type;
        }
    }

    public int GetObjectGroupID(int id)
    {
        int count00 = MonsterGameData.gameAssetIDTypes.Count;
        for(int i = 0 ; i < count00; i++)
        {
            if(id >= MonsterGameData.gameAssetIDTypes[i].idRange[0] && id <= MonsterGameData.gameAssetIDTypes[i].idRange[1])
            {
                return MonsterGameData.gameAssetIDTypes[i].type;
            }
        }
        Debug.Log("理论上不会出现在这里的，一定是配置文件有问题");
        return -1;
    }

    private GameAssetIDType GetAssetIDType(int id , List<GameAssetIDType> gameAssetIDTypes)
    {
        int count00 = gameAssetIDTypes.Count;
        for(int i = 0 ; i < count00; i++)
        {
            GameAssetIDType gameAssetIDType = gameAssetIDTypes[i];

            if(id >= gameAssetIDType.idRange[0] && id <= gameAssetIDType.idRange[1])
            {
                if(gameAssetIDType.subdivides == null)
                {
                    return gameAssetIDType;
                }
                else if(gameAssetIDType.subdivides.Count==0)
                    return gameAssetIDType;
                else
                {
                    return GetAssetIDType(id , gameAssetIDType.subdivides);
                }
            }
        }
        Debug.Log("理论上不会出现在这里的，一定是配置文件有问题");
        return null;
       
    }

    #endregion

    #endregion


    #region 加密
    /// <summary>
    /// 这里的battleResultJosn = 是指战斗数据模型 转为json
    /// </summary>
    /// <param name="status">Status.</param>
    /// <param name="type">Type.</param>
    /// <param name="battleRestulJson">Battle restul json.</param>
    public string LockMD5(int status , int type , string battleRestulJson,string objectJson="")
    {
        return ServerEncryption.MD5Encryptor.GetMD5(currentGuid + type.ToString() + curBattleApplyJson + status.ToString()  +battleRestulJson+ objectJson);
    }

    #endregion
}
