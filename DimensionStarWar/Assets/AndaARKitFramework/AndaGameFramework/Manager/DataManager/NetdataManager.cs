using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RestSharp;

using LitJson;
using System.Linq;
using GameRequest;
public class NetdataManager : ManagerBase {


    public string networkAdress2 = "http://106.14.16.150:8085/api/";
    public string networkAdress3 = "http://106.14.16.150:8085/ConfigTxt/";
    public string networkAdress4 = "http://106.14.16.150:8085/";
    public string networkAdress = "http://www.x-game.xyz:9090/api/user/";
    private const string loginAPI = "login";
    private const string registerAPI = "register";
    public System.Action<NetworkReturnData> CallBackLogin;
    public Dictionary<string, NetworkReturnData> netdata_dic = new Dictionary<string, NetworkReturnData>();
    protected override void OnAwake()
    {
        base.OnAwake();
        AndaNetwordkManager.backupAPIPath = networkAdress;
        AndaDataManager.Instance.naetdataManager = this;
    }
    protected override void InitValue()
    {
        base.InitValue();
        CallBackLogin = null;
        netdata_dic = new Dictionary<string, NetworkReturnData>();
    }

    #region 从服务获取配置文件

    public void GetBaseConfig(System.Action<ConfigBase> callback)
    {
        StartCoroutine(ExcuteGetBaseConfig(callback));
    }

    private IEnumerator ExcuteGetBaseConfig(System.Action<ConfigBase> callback)
    {
        WWW configStr = new WWW(networkAdress3 + "ConfigBase.txt");
        yield return configStr;
        if(string.IsNullOrEmpty(configStr.error))
        {
            callback(JsonMapper.ToObject<ConfigBase>(configStr.text));
            //Debug.Log("configStr.text" + configStr.text);
        }else
        {
           // Debug.Log("configStr.text is null" + configStr.text);
        }
    }


    public void GetConfigFils(List<ConfigFile> files, System.Action<List<LocalConfigFile>> callback)
    {
        StartCoroutine(ExcuteGetConfigfiles(files , callback));   
    }

    private  IEnumerator ExcuteGetConfigfiles(List<ConfigFile> files ,System.Action<List<LocalConfigFile>> callback)
    {
        int count = files.Count;
        List<LocalConfigFile> localConfigs = new List<LocalConfigFile>();
        for(int i = 0 ; i < count; i++)
        {
            string _name = files[i].name;
            int version = files[i].lastWriteTime;
            WWW link = new WWW(networkAdress3 + _name);
            yield return link;
            if(string.IsNullOrEmpty(link.error))
            {
                localConfigs.Add(new LocalConfigFile
                {
                    name = _name,
                    lastWriteTime = version,
                    config = link.text
                });
            }
        }

        if(localConfigs.Count!=0)
        {
            callback(localConfigs);
        }
    }

    #endregion


    #region 从服务器获取玩家数据
    public void TestLoginOnce(System.Action<bool> callback,string name)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("acc", name);
        _wForm.AddField("pwd", "000000");
        string path = "http://106.14.16.150:8085/api/Login/login";
        //string path = "http://localhost:57789/api/Login/Login";
        StartCoroutine(SendLoginPost(path, _wForm, callback));
    }


    //[这个是真的 登录接口]
    public void TestLogin(System.Action<bool> callBack, string name, string password)
    {


        var _wForm = new WWWForm();
        _wForm.AddField("acc", name);
        _wForm.AddField("pwd", password);
        string path = "http://106.14.16.150:8085/api/Login/login";
        //string path = "http://localhost:57789/api/Login/Login";
        StartCoroutine(SendLoginPost(path, _wForm, callBack));
    }
    private IEnumerator SendLoginPost(string _url, WWWForm _wForm , System.Action<bool> callBack)
    {
        AndaUIManager.Instance.OpenWaitBoard("正在登录");
        WWW postData = new WWW(_url, _wForm);
        yield return postData;

        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            var data = JsonMapper.ToObject<PlayerLogin>(postData.text);
            Debug.Log(postData.text);
            if (data.code == "200")
            {
                AndaDataManager.Instance.SetUserData(data.PlayerData);
                AndaDataManager.Instance.SetUserToken(data.token);
            }
            callBack(data.code == "200");
        }
        AndaUIManager.Instance.CloseWaitBoard();
    }

    public void PhoneLogin(System.Action<bool> callBack, string phone, string code)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("phone", phone);
        _wForm.AddField("code", code);

        StartCoroutine(SendLoginPost("http://106.14.16.150:8085/api/Login/PhoneRegister", _wForm, callBack));
    }
    public void SendSmsCode(System.Action<bool> callBack, string phone)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("phone", phone);
        StartCoroutine(SendSmsCodePost("http://106.14.16.150:8085/api/Login/SendCodeSms", _wForm, callBack));
    }

    private IEnumerator SendSmsCodePost(string _url, WWWForm _wForm, System.Action<bool> callBack)
    {

        WWW postData = new WWW(_url, _wForm);
        yield return postData;

        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            var data = JsonMapper.ToObject<Result>(postData.text);
            callBack(data.code == "200");
        }
    }

    public void Login(System.Action<bool> callBack ,string name,string password)
    {
        //StartCoroutine(YieldReturnLoginRequest(callBack, name, password));
        //暂时先用这里，后续服务器做好再调用上面的
        AndaDataManager.Instance.SetUserData(MonsterGameData.playerdata);
        callBack(true);
    }


    #region 使用道具

    public void CallServerRecieveExpblock(string token , int StrongHoldIndex , int objectIndex , System.Action<bool> callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("StrongHoldIndex", StrongHoldIndex);
        _wForm.AddField("objectIndex", objectIndex);
        string path = networkAdress2 + "/StrongHold/GetExp";
        StartCoroutine(ExcuteRecieveExpblock(path,_wForm,callback));
    }

    private IEnumerator ExcuteRecieveExpblock(string _url, WWWForm _wForm ,System.Action<bool> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            SD_Pag sD_Pag = JsonMapper.ToObject<SD_Pag>(postData.text);
            if(sD_Pag.code == "200")
            {
                SD_Pag4U sD_Pag4 = sD_Pag.SD_Pag4U;
                AndaDataManager.Instance.ReducePlayerConsumableList(sD_Pag4.objectID);
                callback(true);
            }else
            {
                callback(false);
            }
        }
    }


    #endregion




    #region 获取区域内其他玩家的数据和商家数据
    public void GetAreaRangeOhterPlayerAndBusinessData(System.Action<bool> callBack, string administrativeArea)
    {

        LocationRangeUserData locationRangeUserData = new LocationRangeUserData
        {
            otherPlayerData = MonsterGameData.otherPlayerList,
            businessData = MonsterGameData.businessData
        };

        //从服务器上返回的时候，应当已经筛选好玩家周边的其他据据点信息
        AndaDataManager.Instance.SetLocatioRangePlayerData(locationRangeUserData);
        callBack(true);
    }

    #region 通过经纬度查询范围内的所有据点数据

    public void GetCurrentLocationRangeOtherData(List<double> location,System.Action<List<PlayerStrongholdAttribute>,List<BusinessStrongholdAttribute>> callback)
    {
        var _wForm = new WWWForm();

        _wForm.AddField("positionx", location[1].ToString());
        _wForm.AddField("positiony", location[0].ToString());
      
        StartCoroutine(GetCurrentLocationRangeOtherData("http://106.14.16.150:8085/api/Region/GetRegion", _wForm, callback));
    }

    private IEnumerator GetCurrentLocationRangeOtherData(string _url, WWWForm _wForm ,System.Action<List<PlayerStrongholdAttribute>,List<BusinessStrongholdAttribute>> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            
            var data = JsonMapper.ToObject<Region>(postData.text);

            List<PlayerStrongHoldGrowUpAttribute> tmpPlayerStronghold = data.resRegion.PlayerStrongHoldlist;


            List<BusinessStrongholdGrowUpAttribute> tmpBusinessStronghold = data.resRegion.BusinessStrongHoldlist;

            List<PlayerStrongholdAttribute> playerStrongholds = new List<PlayerStrongholdAttribute>();
            List<BusinessStrongholdAttribute> businessStrongholds = new List<BusinessStrongholdAttribute>();

            foreach(var go in tmpPlayerStronghold)
            {
                PlayerStrongholdAttribute psa = ConvertTool.ConvertToPlayerStrongholdAttribute(go);
                //Debug.Log("go.strongholdGloryValue" + go.strongholdGloryValue);
                int id = AndaDataManager.Instance.CaculPlayerStrongholdLevel(go.strongholdGloryValue,MonsterGameData.StrongHoldType.SelfStrongHold);
                psa.strongholdID = 30000 + id;
                playerStrongholds.Add(psa);
            }

            foreach(var go in tmpBusinessStronghold)
            {
                BusinessStrongholdAttribute bsa = ConvertTool.ConvertToBusinessStrongholdData(go);
                bsa.strongholdID = 30005;
                businessStrongholds.Add(bsa);
            }
            callback(playerStrongholds,businessStrongholds);
           
        }
    }

    #endregion


    #region [通过据点的Index 获取想要的宠物列表]

    public void CallServerGetMonsterList(int strongholdIndex , int type , System.Action<List<PlayerMonsterAttribute>> callback)
    {
        var _wForm = new WWWForm();

        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("StrongHoldIndex", strongholdIndex);
        _wForm.AddField("type", type);
        string path = networkAdress2 + "StrongHold/GetMonster";
        StartCoroutine(ExcuteGetMonsterList(path, _wForm, callback));
    }

    private IEnumerator ExcuteGetMonsterList(string _url, WWWForm _wForm,System.Action<List<PlayerMonsterAttribute>> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if(postData.error!=null)
        {
            JIRVIS.Instance.PlayTips(postData.error);
        }else
        {

            StrongHold strongHold = JsonMapper.ToObject<StrongHold>(postData.text);
            if(strongHold.code == "200")
            {

                Debug.Log(postData.text);
                int count = strongHold.MonsterList.Count;
                List<PlayerMonsterAttribute> monsterAttributes = new List<PlayerMonsterAttribute>();
                for(int i = 0 ; i < count; i++)
                {
                    if (strongHold.MonsterList[i] != null)
                    {
                        PlayerMonsterAttribute playerMonsterAttribute = ConvertTool.ConvertToPlayerMonsterAttribute(strongHold.MonsterList[i]);
                        monsterAttributes.Add(playerMonsterAttribute);
                    }
                }

                callback(monsterAttributes);

            }else
            {
                JIRVIS.Instance.PlayTips(strongHold.detail);
            }
        }
    }

    #endregion

    #region 获取商家据点的头像
    public IEnumerator GetStrongholdImg(string adress, System.Action<Sprite> callback)
    {
        AndaUIManager.Instance.OpenWaitBoard("请稍等");
        WWW wWW = new WWW(networkAdress4 + adress);
        yield return wWW;
        AndaUIManager.Instance.CloseWaitBoard();
        if (string.IsNullOrEmpty(wWW.text))
        {
            JIRVIS.Instance.PlayTips("有点错误");
        }
        else
        {

            byte[] btye = wWW.texture.EncodeToPNG();
            Texture2D texture2D = ConvertTool.ConvertToTexture2d(wWW.texture);
            Sprite sprite = ConvertTool.ConvertToSpriteWithTexture2d(texture2D);
            string t = ConvertTool.BytesToString(btye);
            PlayerPrefs.SetString("SH_" + adress, t);
            callback(sprite);
        }
    }

    public IEnumerator GetBussinessPorImage(string adress, int strongholdIndex ,System.Action<int,Sprite> callback)
    {
        AndaUIManager.Instance.OpenWaitBoard("请稍等");
        WWW wWW = new WWW(networkAdress4 + adress);
        yield return wWW;
        AndaUIManager.Instance.CloseWaitBoard();
        if (string.IsNullOrEmpty(wWW.text))
        {
            JIRVIS.Instance.PlayTips("有点错误");
        }else
        {

            byte[] btye = wWW.texture.EncodeToPNG();
            Texture2D texture2D = ConvertTool.ConvertToTexture2d(wWW.texture);
            Sprite sprite = ConvertTool.ConvertToSpriteWithTexture2d(texture2D);
            string t = ConvertTool.BytesToString(btye);
            PlayerPrefs.SetString("SH_"+ adress , t);
            callback(strongholdIndex,sprite);
        }
    }

    #endregion

    //[测试用 获取临近据点]
    public void GetOtherPlayerAndBusinessStrongholdDataWithCurrentStorngholdlocation(List<double>locaiton,System.Action<List<PlayerStrongholdAttribute>,List<BusinessStrongholdAttribute>> calback)
    {
        List<PlayerStrongHoldGrowUpAttribute> tmpPlayerStronghold = MonsterGameData.otherPlayerList[0].storngholdList;
        List<BusinessStrongholdGrowUpAttribute> tmpBusinessStronghold = MonsterGameData.businessData[0].strongholdList;
        List<PlayerStrongholdAttribute> playerStrongholdAttributes = new List<PlayerStrongholdAttribute>();
        List<BusinessStrongholdAttribute> businessStrongholdAttributes = new List<BusinessStrongholdAttribute>();
        foreach(var go in tmpPlayerStronghold)
        {
            PlayerStrongholdAttribute psa = ConvertTool.ConvertToPlayerStrongholdAttribute(go);
            playerStrongholdAttributes.Add(psa);
        }

        foreach(var go in tmpBusinessStronghold)
        {
            BusinessStrongholdAttribute bsa = ConvertTool.ConvertToBusinessStrongholdData(go);
            businessStrongholdAttributes.Add(bsa);
        }
        //从服务器上返回的时候，应当已经筛选当前据点覆盖范围内的据点信息
        //AndaDataManager.Instance.SetLocatioRangePlayerData(locationRangeUserData);
        calback(playerStrongholdAttributes,businessStrongholdAttributes);
    }

    public void GetEnemyData(int _index,int hostIndex , System.Action<PlayerMonsterAttribute> callback)
    {
        StartCoroutine(GetMonsterGrowupData(_index, hostIndex ,callback));
    }

    public IEnumerator GetMonsterGrowupData(int _index ,int hostIndex , System.Action<PlayerMonsterAttribute> callbcak)
    {
        yield return null;
        MonsterGrowUpAttribute monsterGrowUpAttribute = MonsterGameData.otherPlayerList.FirstOrDefault(s=>s.userIndex == hostIndex).monsterList.FirstOrDefault(s=>s.monsterIndex == _index);
        PlayerMonsterAttribute playerMonsterAttribute = ConvertTool.ConvertToPlayerMonsterAttribute(monsterGrowUpAttribute);
        callbcak(playerMonsterAttribute);
    }




    #region 获取属于这个据点的宠物数据
    //[测试]
    public void TestGetBelondThisstrongholdFightEnemgyData(int strongholdIndex,System.Action<bool> callback)
    {
        List<PlayerMonsterAttribute> playerMonsters = null;
        foreach(var go in MonsterGameData.otherPlayerList)
        {
            foreach(var jj in go.storngholdList)
            {
                if(jj.strongholdIndex == strongholdIndex)//找到了据点数据
                {
                   //遍历一下怪兽数据
                    foreach(var mm in jj.strongholdFightMonsterList)
                    {
                        if(playerMonsters == null) playerMonsters = new List<PlayerMonsterAttribute>();
                        MonsterGrowUpAttribute monsterGrowUpAttribute = go.monsterList.FirstOrDefault(s=>s.monsterIndex == mm);
                        PlayerMonsterAttribute playerMonster = ConvertTool.ConvertToPlayerMonsterAttribute(monsterGrowUpAttribute);
                        playerMonsters.Add(playerMonster);
                    }
                    JIRVIS.Instance.jIRVISData.SetEnemys(playerMonsters);
                    callback(true);
                    return;
                }
            }
        }
    }



    public void GetBelondThisstrongholdFightEnemgyData(int strongholdIndex,System.Action<List<PlayerMonsterAttribute>> callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("StrongHoldIndex", strongholdIndex);
        string path = networkAdress2 + "/StrongHold/GetMonster";
        StartCoroutine(ExcuteGetBelondThisStrongholdFightEnemyData(path,_wForm,callback));
    }
    private IEnumerator ExcuteGetBelondThisStrongholdFightEnemyData(string _url,WWWForm _wForm,System.Action<List<PlayerMonsterAttribute>>callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            
            StrongHold data = JsonMapper.ToObject<StrongHold>(postData.text);
            if(data.code !="200")
            {
                Debug.Log(data.detail);
                JIRVIS.Instance.PlayTips(data.detail);
                yield break;
            }
            List<PlayerMonsterAttribute> list = new List<PlayerMonsterAttribute>();
            foreach(var go in data.MonsterList)
            {
                PlayerMonsterAttribute playerMonsterAttribute = ConvertTool.ConvertToPlayerMonsterAttribute(go);
                list.Add(playerMonsterAttribute);
            }
            callback(list);
        }
    }

    #endregion 

    public void GetPrivateData(System.Action<bool> callBack ,string administrativeArea)
    {

    }

   

    #endregion


    private IEnumerator YieldReturnLoginRequest(System.Action<NetworkReturnData> callBack ,string account,string passwords)
    {
        string path = networkAdress + "Login";
        RestRequest req = new RestRequest(path);
        req.AddParameter("account" , account);
        req.AddParameter("passwords", passwords);
        RestTask<NetworkReturnData> task = new RestTask<NetworkReturnData>(req);
        yield return StartCoroutine(AndaNetwordkManager.Instance.Call<NetworkReturnData>(task));
        if (!task.interrupted)
        {
            callBack(task.response.Data);
        }
    }

    //申请战斗，获取地方战斗宠物的数据
    public void ApplyBattle(string data, string gameType,string token,System.Action<bool> callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("aseTex",data);
        _wForm.AddField("type", gameType);
        _wForm.AddField("token", token);

        Debug.Log("AppleMatch:aseTex =>>>" + data);
        Debug.Log("AppleMatch:type =>>>>>" + gameType);
        Debug.Log("AppleMatch:token =>>>>>>" + token);
        string path = networkAdress2 + "Battel/Apply";
        //string path = "http://localhost:57789/api/" + "Battel/Apply";
        StartCoroutine(ExcuteApplyBattle(path,_wForm,callback));
    }

    private IEnumerator ExcuteApplyBattle(string _url , WWWForm _wForm ,System.Action<bool> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
            callback(false);
        }
        else
        {

            ApplyBattel applyBattel = JsonMapper.ToObject<ApplyBattel>(postData.text);
            if(applyBattel.code =="200")
            {
                AndaDataManager.Instance.SetGameguid(applyBattel.guid);
                callback(true);
            }else
            {
                callback(false);
            }

           // int count = 0;
            /*if (applyBattel.enemyMonsters != null)
                count= applyBattel.enemyMonsters.Count;

            for (int i = 0; i < count; i++)
            {
                PlayerMonsterAttribute playerMonsterAttribute = ConvertTool.ConvertToPlayerMonsterAttribute(applyBattel.enemyMonsters[i]);
                playerMonsterAttributes.Add(playerMonsterAttribute);
            }*/
            //JIRVIS.Instance.jIRVISData.SetEnemys(playerMonsterAttributes);
           //callback(applyBattel.code =="200");
        }
    }



    public void ApplyBattleWithObject(int objectID, string data, string gameType, string token, System.Action<List<SearchObject>> callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("aseTex", data);
        _wForm.AddField("type", gameType);
        _wForm.AddField("token", token);
        _wForm.AddField("objectID", objectID);
        // Debug.Log("AppleMatch:aseTex =>>>" + data);
        //  Debug.Log("AppleMatch:type =>>>>>" + gameType);
        //   Debug.Log("AppleMatch:token =>>>>>>" + token);
        string path = networkAdress2 + "Battel/Apply";
        //string path = "http://localhost:57789/api/" + "Battel/Apply";
        StartCoroutine(ExcuteApplyBattleWithObject(path, _wForm, callback));
    }

    private IEnumerator ExcuteApplyBattleWithObject(string _url, WWWForm _wForm, System.Action<List<SearchObject>> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
            callback(null);
        }
        else
        {
            ApplyBattel applyBattel = JsonMapper.ToObject<ApplyBattel>(postData.text);
            AndaDataManager.Instance.SetGameguid(applyBattel.guid);
            Debug.Log(postData.text);
            List<PlayerMonsterAttribute> playerMonsterAttributes = new List<PlayerMonsterAttribute>();
            int count = 0;
            if (applyBattel.enemyMonsters != null)
                count = applyBattel.enemyMonsters.Count;

            for (int i = 0; i < count; i++)
            {
                PlayerMonsterAttribute playerMonsterAttribute = ConvertTool.ConvertToPlayerMonsterAttribute(applyBattel.enemyMonsters[i]);
                playerMonsterAttributes.Add(playerMonsterAttribute);
            }
            JIRVIS.Instance.jIRVISData.SetEnemys(playerMonsterAttributes);
            callback(applyBattel.searchObject);
        }
    }









    public void UploadGameResult(BattelFinish battelResult,System.Action<bool> callback)
    {
        var _wForm = new WWWForm();
        string json = JsonMapper.ToJson(battelResult);
        Debug.Log("FightLog:" + json );
        _wForm.AddField("token",json);
        string path = networkAdress2 + "Battel/Finish";
        //string path = "http://localhost:57789/api/" + "Battel/Finish";
        StartCoroutine(ExcuteUploadGameresutl(path,_wForm,callback));
    }

    private IEnumerator ExcuteUploadGameresutl(string _url, WWWForm _wForm ,System.Action<bool> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
            //callback(false);
        }else
        {
            Debug.Log("postData.text" + postData.text);
            string s = postData.text;
            FinishBattel finishBattel = JsonMapper.ToObject<FinishBattel>(postData.text);
            if(finishBattel.code == "200")
            {
               AndaDataManager.Instance.UpdateMineDataOfChanllengeGame(finishBattel);
              
            }
            callback(finishBattel.code == "200");
        }
       
    }

    public void UpStartSearch(int monsterIndex, int recoveryObjectIndex,int searchObjectIndex, int luckyObjectIndex, System.Action<bool> callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("MonsterIndex", monsterIndex);
        _wForm.AddField("luckyObjectIndex", luckyObjectIndex);
        _wForm.AddField("recoveryObjectIndex", recoveryObjectIndex);
        _wForm.AddField("searchObjectIndex", searchObjectIndex);
        string path = networkAdress2 + "Monster/StartTreasure";
        //string path = "http://localhost:57789/api/" + "Monster/StartTreasure";
        StartCoroutine(ExcuteUpStartSearchresutl(path, _wForm, callback));
    }

    private IEnumerator ExcuteUpStartSearchresutl(string _url, WWWForm _wForm, System.Action<bool> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
            //callback(false);
        }
        else
        {
            Debug.Log("postData.text" + postData.text);
            string s = postData.text;
            MonsterSearch res = JsonMapper.ToObject<MonsterSearch>(postData.text);
            if (res.code == "200")
            {
                foreach (var m in res.objectList)
                {
                    AndaDataManager.Instance.UpdateUserConsumableItemForADD(new SD_Pag4U()
                    {
                        hostIndex = res.monsterGrowUpAttribute.playerIndex,
                        objectCount = m.addCount,
                        objectID = m.objectId,
                        objectIndex = m.objectIndex,
                        objectValue = 0
                    });
                }
                //AndaDataManager.Instance.ReducePlayerConsumableList(res.SD_Pag4U.objectID);
                AndaDataManager.Instance.UpdateMonsterToStronghold(res.monsterGrowUpAttribute);
            }
            callback(res.code == "200");
        }
    }

    public void UpFinishSearch(int monsterIndex, System.Action<bool, string> callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("MonsterIndex", monsterIndex);
        string path = networkAdress2 + "Monster/FinishTreasure";
        //string path = "http://localhost:57789/api/" + "Monster/FinishTreasure";
        StartCoroutine(ExcuteUpFinishSearchresutl(path, _wForm, callback));
    }

    private IEnumerator ExcuteUpFinishSearchresutl(string _url, WWWForm _wForm, System.Action<bool, string> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
            //callback(false);
        }
        else
        {
            Debug.Log("postData.text" + postData.text);
            string s = postData.text;
            MonsterSearch res = JsonMapper.ToObject<MonsterSearch>(postData.text);
            if (res.code == "200")
            {
                //AndaDataManager.Instance.ReducePlayerConsumableList(res.SD_Pag4U.objectID);
                AndaDataManager.Instance.UpdateMonsterPowerValue(res.monsterGrowUpAttribute.monsterIndex, res.monsterGrowUpAttribute.monsterCurrentPower);

                var datalist = new List<AndaLocalRewardData>();
                foreach (var m in res.objectList)
                {
                    AndaDataManager.Instance.UpdateUserConsumableItemForADD(new SD_Pag4U()
                    {
                        hostIndex = res.monsterGrowUpAttribute.playerIndex,
                        objectCount = m.addCount,
                        objectID = m.objectId,
                        objectIndex = m.objectIndex,
                        objectValue = 0
                    });
                    datalist.Add(new AndaLocalRewardData()
                    {
                        objCount = m.addCount,
                        objID=m.objectId,
                    });
                }
                JIRVIS.Instance.jIRVISData.SetNormalRewardList(datalist);
                JIRVIS.Instance.CheckNormalReward();
                
            }
            callback(res.code == "200", res.ImageUrl);
        }
    }

    public void UpRecovery(int monsterIndex,int objectIndex,int count, System.Action<bool> callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("index", monsterIndex);
        _wForm.AddField("objectIndex", objectIndex);
        _wForm.AddField("count", count);
        string path = networkAdress2 + "SD_Pag/Consume";
        //string path = "http://localhost:57789/api/" + "SD_Pag/Consume";
        StartCoroutine(ExcuteUpRecoveryresutl(path, _wForm, callback));
    }

    private IEnumerator ExcuteUpRecoveryresutl(string _url, WWWForm _wForm, System.Action<bool> callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
            //callback(false);
        }
        else
        {
            Debug.Log("postData.text" + postData.text);
            string s = postData.text;
            SD_PagsConsume res = JsonMapper.ToObject<SD_PagsConsume>(postData.text);
            if (res.code == "200")
            {
                //AndaDataManager.Instance.ReducePlayerConsumableList(res.SD_Pag4U.objectID);
                AndaDataManager.Instance.UpdateMonsterPowerValue(res.monsterGrowUpAttribute.monsterIndex, res.monsterGrowUpAttribute.monsterCurrentPower);
            }
            callback(res.code == "200");
        }
    }
    #endregion

    #region 上传






    public void CallServerUploadSetMonsterToStronghold(int monsterIndex, int strongholdIndex,string nickName, System.Action<bool> callback)
    {
        WWWForm wWWForm = new WWWForm();
        wWWForm.AddField("token",AndaDataManager.Instance.userData.token);
        wWWForm.AddField("MonsterIndex" , monsterIndex);
        wWWForm.AddField("StrongHoldIndex" , strongholdIndex);
        wWWForm.AddField("NickName", nickName);
        string path = networkAdress2 + "StrongHold/InsertMonster";
        //string path = "http://localhost:57789/api/StrongHold/InsertMonster";
        StartCoroutine(ExcuteCallServerUploadSetMonstertoStronghold(path,wWWForm,callback , monsterIndex ,strongholdIndex));
    }

    private IEnumerator ExcuteCallServerUploadSetMonstertoStronghold(string _url, WWWForm wWWForm , System.Action<bool> callback,int monsterIndex, int strongholdIndex)
    {
        WWW postData = new WWW(_url, wWWForm);
        yield return postData;
        if(postData.error!=null)
        {
            callback(false);
        }else
        {
            Debug.Log(postData.text);
            ResultMonster result = JsonMapper.ToObject<ResultMonster>(postData.text);
            if(result.code == "200")
            {
                AndaDataManager.Instance.UpdateMonsterToStronghold(result.MonsterGrowUpAttribute);
                callback(true);
            }else
            {
                callback(false);
            }
        }
    }


    //[向服务器更新 据点的雕像ID ]
    public void UploadStrongholdStatueID(int strongholdIndex, int statueID, System.Action callback)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("StrongHoldIndex", strongholdIndex);
        _wForm.AddField("statueID", statueID);
        string path = networkAdress2 + "StrongHold/ChangeStatueID";
        StartCoroutine(ExcuteUploadStrongholdStatueID(path, _wForm, callback));
    }

    private IEnumerator ExcuteUploadStrongholdStatueID(string _url , WWWForm _wForm ,System.Action callback)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            Result result = JsonMapper.ToObject<Result>(postData.text);
            if(result.code == "200")
            {
                callback();
            }
        }
    }




    public void UploadSetplayerstronghold(int HoldId, string nickName, string locationName,double positionX, double positionY,int statuesdID ,System.Action<PlayerStrongholdAttribute> callback )
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("HoldId", HoldId);
        _wForm.AddField("NickName", nickName);
        _wForm.AddField("LocationName", locationName);
        //经纬度 顺序  这里跟服务上的相反
        _wForm.AddField("PositionX", positionY.ToString());
        _wForm.AddField("PositionY", positionX.ToString());


        _wForm.AddField("statueID", statuesdID);
        //--
        string path = networkAdress2 + "StrongHold/AddPlayerStronghold";
        StartCoroutine(ExcuteUploadPlayerstornghold(path, _wForm, callback));
    }

    private IEnumerator ExcuteUploadPlayerstornghold(string _url , WWWForm _wForm ,System.Action<PlayerStrongholdAttribute> callback )
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            PlayerStrongHoldInfo data= JsonMapper.ToObject<PlayerStrongHoldInfo>(postData.text);
            PlayerStrongholdAttribute playerStrongholdAttribute = ConvertTool.ConvertToPlayerStrongholdAttribute(data.PlayerStrongHold);
            AndaDataManager.Instance.userData.UpdateStrongholdList(playerStrongholdAttribute);
            callback(playerStrongholdAttribute);
        }
    }



    public void UploadStrongholdTest(List<string> content)
    {
        var _wForm = new WWWForm();
        string json = JsonMapper.ToJson(content);
        Debug.Log("json" + json);
        _wForm.AddField("DataList", json);
        string path = networkAdress2 + "StrongHold/ServerInsertStronghold";
        StartCoroutine(ExcuteUploadStrongholdTest(path, _wForm));
    }
    private IEnumerator ExcuteUploadStrongholdTest(string _url , WWWForm _wForm)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            Result s = JsonMapper.ToObject<Result>(postData.text);
            Debug.Log("UploadStrongholdTeset:" + postData.text);
        }
    }
    #endregion

    #region 从服务器获取宝藏消息
    public void GetTreasureHunResult(System.Action<NetworkReturnData> callBack)
    {
        StartCoroutine(YieldReturnGetTreasureHunResult(callBack));
    }
    public IEnumerator YieldReturnGetTreasureHunResult(System.Action<NetworkReturnData> callBack)
    {
        yield return null;
        callBack(null);
    }

    #region 在地图上放置私人据点

    public void CreatPlayerStronghold(int playerIndex,string holdName, double x, double y, System.Action<PlayerStrongHoldGrowUpAttribute> callback)
    {

        PlayerStrongHoldGrowUpAttribute ps = new PlayerStrongHoldGrowUpAttribute
        {
            strongholdIndex = (int)System.DateTime.Now.Ticks,
            hostIndex = playerIndex,
            strongholdNickName = holdName,
            strongholdGloryValue = 0,
            strongholdPosition = new List<double> { x, y },
            playerStrongholdMedalLevel = 0,
            playerStrongholdRoomID = 0,
        };
        string json = JsonMapper.ToJson(ps);

        NetworkReturnData nrd = new NetworkReturnData
        {
            success = true,
            content = json
        };

        if (nrd.success)
        {
            PlayerStrongHoldGrowUpAttribute pshug = JsonMapper.ToObject<PlayerStrongHoldGrowUpAttribute>(nrd.content);
            //更新本地数据
            AndaDataManager.Instance.UpdatePlayerStrongholdList(pshug);
            //回调是为了更新界面
            callback(pshug);
            

        }
    }


    #endregion



    #endregion

    #region 商店

    public void GetMallDetail(System.Action<List<CD_MallDetail>> callBack)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
       
        StartCoroutine(GetMallDetailResult(networkAdress2+"Mall/GetMallList", _wForm, callBack));
    }
    public IEnumerator GetMallDetailResult(string _url, WWWForm _wForm, System.Action<List<CD_MallDetail>> callBack)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            Debug.Log(postData.text);
            var data = JsonMapper.ToObject<MallDetailRes>(postData.text);

            if (data.code == "200")
            {
                callBack(data.MallList);
            }
            //Debug.Log(postData.text);
        }
    }
    public void MonsterStatusChanged(System.Action<bool> callBack,int index,int status)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("index", index);
        _wForm.AddField("status", status);
        StartCoroutine(MonsterDefenseResult(networkAdress2 + "Monster/ChangeStatus", _wForm, callBack));
        //StartCoroutine(MonsterDefenseResult("http://localhost:57789/api/" + "Monster/ChangeStatus", _wForm, callBack));
    }
    public IEnumerator MonsterDefenseResult(string _url, WWWForm _wForm, System.Action<bool> callBack)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            Debug.Log(postData.text);
            var data = JsonMapper.ToObject<Result>(postData.text);

            if (data.code == "200")
            {
            
            }
            callBack(data.code == "200");
            //Debug.Log(postData.text);
        }
    }
    public void BuyObject(int count,int type ,int objectID, System.Action<bool> callBack)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("count", count);
        _wForm.AddField("type", type);
        _wForm.AddField("objectID", objectID);
        StartCoroutine(BuyObjectResult(networkAdress2+"Mall/MallBuy", _wForm, callBack));
        //StartCoroutine(BuyObjectResult("http://localhost:57789/api/" + "Mall/MallBuy", _wForm, callBack));
    }

    private IEnumerator BuyObjectResult(string _url, WWWForm _wForm, System.Action<bool> callBack)
    {
        WWW postData = new WWW(_url, _wForm);
        yield return postData;
        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            Debug.Log(postData.text);
            var data = JsonMapper.ToObject<MallSingle>(postData.text);

            if (data.code == "200")
            {
                AndaDataManager.Instance.UpdateUserConsumableItemForADD(data.item);
                var info = new AndaLocalRewardData() {
                     objCount=data.item.objectCount,
                     objID=data.item.objectID,
                };
                JIRVIS.Instance.jIRVISData.SetNormalRewardList(new List<AndaLocalRewardData>() {
                    info,
                });
                JIRVIS.Instance.CheckNormalReward();
                callBack(data.code == "200");
            }
            //Debug.Log(postData.text);
        }
    }
    #endregion

    #region 微信第三方登录

    public void WeChatLogin(string Code, System.Action<bool> callBack)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("acc", Code);
        StartCoroutine(SendLoginPost(networkAdress2 + "WeChatLogin", _wForm, callBack));
    }
    public void QQLogin(string Code, System.Action<bool> callBack)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("acc", Code);
        StartCoroutine(SendLoginPost(networkAdress2 + "QQLogin", _wForm, callBack));
    }
    #endregion


    #region 获取据点精粹

    public void GetEXP(System.Action<SD_Pag> callBack, int StrongHoldIndex, int objectIndex,int createObjectID)
    {
        var _wForm = new WWWForm();
        _wForm.AddField("token", AndaDataManager.Instance.userData.token);
        _wForm.AddField("StrongHoldIndex", StrongHoldIndex);
        _wForm.AddField("objectIndex", objectIndex);
        _wForm.AddField("createObjectID", createObjectID);
        string path = networkAdress2 + "StrongHold/GetEXP";
        //string path = "http://localhost:57789/api/" + "StrongHold/GetEXP";
        StartCoroutine(SendGetEXPPost(path, _wForm, callBack));
    }
    private IEnumerator SendGetEXPPost(string _url, WWWForm _wForm, System.Action<SD_Pag> callBack)
    {

        WWW postData = new WWW(_url, _wForm);
        yield return postData;

        if (postData.error != null)
        {
            Debug.Log(postData.error);
        }
        else
        {
            var data = JsonMapper.ToObject<SD_Pag>(postData.text);
            callBack(data);
        }
    }
    #endregion
}


