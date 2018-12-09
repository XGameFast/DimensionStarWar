﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class TestToolDownloadConfig : MonoBehaviour {
    
   /* #if UNITY_EDITOR
    [SerializeField][("技能名称")]
    #endif
*/


    [HideInInspector][SerializeField] bool _isAutoExcute ;
    public bool isAutoExcute {get { return _isAutoExcute ; } set {_isAutoExcute = value; } }

    [HideInInspector][SerializeField] bool _isNeedGetUserData ;
    public bool isNeedGetUserData {get { return _isNeedGetUserData ; } set {_isNeedGetUserData = value; } }

    [HideInInspector][SerializeField] bool _MonsterConfigDownload ;
    public bool MonsterConfigDownload {get { return _MonsterConfigDownload ; } set {_MonsterConfigDownload = value; } }

    [HideInInspector][SerializeField] bool _SkillConfigDownload ;
    public bool SkillConfigDownload {get { return _SkillConfigDownload ; } set {_SkillConfigDownload = value; } }

    [HideInInspector][SerializeField] bool _BussinesStrongholdConfigFileNameDownload;
    public bool BussinesStrongholdConfigFileNameDownload {get { return _BussinesStrongholdConfigFileNameDownload ; } set {_BussinesStrongholdConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _ChanllengeGameConfigFileNameDownload;
    public bool ChanllengeGameConfigFileNameDownload {get { return _ChanllengeGameConfigFileNameDownload ; } set {_ChanllengeGameConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _MallConfigFileNameDownload;
    public bool MallConfigFileNameDownload {get { return _MallConfigFileNameDownload ; } set {_MallConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _MedalConfigFileNameDownload;
    public bool MedalConfigFileNameDownload {get { return _MedalConfigFileNameDownload ; } set {_MedalConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _NameConfigFileNameDownload;
    public bool NameConfigFileNameDownload {get { return _NameConfigFileNameDownload ; } set {_NameConfigFileNameDownload = value; } }
   
    [HideInInspector][SerializeField] bool _ObjectsConfigFileNameDownload;
    public bool ObjectsConfigFileNameDownload {get { return _ObjectsConfigFileNameDownload ; } set {_ObjectsConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _ProtectGameConfigFileNameDownload;
    public bool ProtectGameConfigFileNameDownload {get { return _ProtectGameConfigFileNameDownload ; } set {_ProtectGameConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _StrongholdConfigFileNameDownload;
    public bool StrongholdConfigFileNameDownload {get { return _StrongholdConfigFileNameDownload ; } set {_StrongholdConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _StarConfigFileNameDownload;
    public bool StarConfigFileNameDownload {get { return _StarConfigFileNameDownload ; } set {_StarConfigFileNameDownload = value; } }

    [HideInInspector][SerializeField] bool _SkillArchievementValueFileNameDownload;
    public bool SkillArchievementValueFileNameDownload {get { return _SkillArchievementValueFileNameDownload ; } set {_SkillArchievementValueFileNameDownload = value; } }


    string networkAdress3 = "http://106.14.16.150:8085/ConfigTxt/";

    public void Awake()
    {
        if(isAutoExcute)
        {
            ClickExcuteDownLoad();
        }
    }

    //点击执行瞎子
    public void ClickExcuteDownLoad()
    {
        CheckNeedDownloadConfig();
    }


    private void CheckNeedGerUserData()
    {
        if(isNeedGetUserData)
        {
            AndaDataManager.Instance.TestLogin(CallBackUserData,"12345678901","000000");
           
        }else
        {
            if(string.IsNullOrEmpty(PlayerPrefs.GetString("TestToolUserData")))
            {
                AndaDataManager.Instance.TestLogin(CallBackUserData, "12345678901", "000000");
            }else
            {
                PlayerData playerData = LitJson.JsonMapper.ToObject<PlayerData>(PlayerPrefs.GetString("TestToolUserData"));
                AndaDataManager.Instance.SetUserData(playerData);
            }
        }
    }




    private void CheckNeedDownloadConfig()
    {
        StartCoroutine(ExcuteDownloadConfig());
    }

    private IEnumerator ExcuteDownloadConfig()
    {
        //宠物配置文件
        if(MonsterConfigDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.MonsterConfigFileName));
        }
        //技能配置文件
        if(SkillConfigDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.SkillConfigFileName));
        }

        if(BussinesStrongholdConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.BussinesStrongholdConfigFileName));
        }

        if(ChanllengeGameConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.ChanllengeGameConfigFileName));
        }

        if(MallConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.MallConfigFileName));
        }
        if(MedalConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.MedalConfigFileName));
        }

        if(NameConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.NameConfigFileName));
        }

        if(ObjectsConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.ObjectsConfigFileName));
        }
        if(ProtectGameConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.ProtectGameConfigFileName));
        }
        if(StrongholdConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.StrongholdConfigFileName));
        }
        if(StarConfigFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.StarConfigFileName));
        }
        if(SkillArchievementValueFileNameDownload)
        {
            yield return StartCoroutine(StartUpdateFile(ONAME.SkillArchievementValueFileName));
        }
       

        Debug.Log("需要的配置文件已经下载完毕");

        CheckNeedGerUserData();
    }


    private IEnumerator StartUpdateFile(string fileName)
    {
        WWW cfgPath = new WWW(networkAdress3 + fileName);
        yield return cfgPath;
        if(string.IsNullOrEmpty(cfgPath.error))
        {
            PlayerPrefs.SetString(fileName,cfgPath.text);
        }
    }


   #region Callback
    private void CallBackUserData(bool callbac)
    {
        Debug.Log("已经获取玩家数据了");

        string json = LitJson.JsonMapper.ToJson(AndaDataManager.Instance.userData.playerdata);
        PlayerPrefs.SetString("TestToolUserData" , json);

    }
    #endregion
}
