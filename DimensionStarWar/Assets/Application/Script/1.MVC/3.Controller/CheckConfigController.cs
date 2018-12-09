﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckConfigController : BaseController {
    public GameObject logo;
    public CheckConfigData checkConfigData ;

    public bool isLoadLocalConfigData = false;
    #region 执行
    public override void StartController()
    {
        base.StartController();

        if(isLoadLocalConfigData)
        {
            BuildData();
            checkConfigData.BuildMenu(ONAME.CheckConfigMenu);
            checkConfigData.getm_Menu.FadeIn();
            InvokExcuteChangeController();
            return;
        }




        if(TestManager.Instance.isClearConfig)
        {
            string json = PlayerPrefs.GetString(ONAME.BaseConfigFileName);
            if(!string.IsNullOrEmpty(json))
            {
                ConfigBase configBase = LitJson.JsonMapper.ToObject<ConfigBase>(json);
                configBase.lastWriteTime = -1;
                json = LitJson.JsonMapper.ToJson(configBase);
                PlayerPrefs.SetString(ONAME.BaseConfigFileName,json);
            }
        }

        InvokeDownload();
       // Invoke("DiplayLogo", 1f);
        //ARMonsterSceneDataManager.Instance.aRWorld.OpenAstrologyBackground();

    }

    private void DiplayLogo()
    {
        //logo.gameObject.SetTargetActiveOnce(true);
        Invoke("InvokeDownload", 2f);

    }

    private void InvokeDownload()
    {
        BuildData();
        checkConfigData.BuildMenu(ONAME.CheckConfigMenu);
        //checkConfigData.getm_Menu.FadeIn();
        //向服务器索要基数据
        Invoke("InvokeCallServerGetConfigBase", 1.5f);
    }


    private void InvokeCallServerGetConfigBase()
    {
        CallServerGetConfigBase();
    }

    public override void EndController()
    {
        base.EndController();
        ARMonsterSceneDataManager.Instance.aRWorld.CloseAtrologyBackground();
        checkConfigData.InitVlaue();
    }

    private void BuildData()
    {
        if(checkConfigData == null)
        {
            checkConfigData = new CheckConfigData();
        }
        checkConfigData.BuildData(this);
    }

    private void CallServerGetConfigBase()
    {
        AndaDataManager.Instance.CallServerGetConfigBase(CallBackGetConfigBase);
    }

    private void CallServerGetConfig(List<ConfigFile> configFiles )
    {
        AndaDataManager.Instance.CallServerGetConfigFiles(configFiles,CallBackGetConfigFiles);
    }

    //[解析 并 写入]
    private void AnalysisConfig(List<LocalConfigFile> configFiles)
    {
        Debug.Log("JIRVIS Check: 正在解析数据" );
        checkConfigData.UpdateConfigFilesVersionData(configFiles);
        InvokExcuteChangeController();
    }

    private void InvokExcuteChangeController()
    {
        //checkConfigData.getCheckConfigMenu.PlayBlackhole();
        Invoke("End" , 4f);
    }

    private void End()
    {
        JIRVIS.Instance.PlayTips("构建完成",true);
        checkConfigData.getCheckConfigMenu.progress = 100;
        Invoke("TrueEnd", 1f);
    }
    private void TrueEnd()
    {
        callbackFinishController(ONAME.LOGINCONTROLLER);
    }

    #endregion

    #region 逻辑

   

    //[对比配置，是否需要更新文件]
    private void CheckBaseConfig(ConfigBase _fromServerConfigBase)
    {
        ConfigBase _fromLocalConfigBase = checkConfigData.getLocalConfigBase;
        if(_fromLocalConfigBase == null || _fromLocalConfigBase.lastWriteTime == -1)// ==-1是测试用
        {
            JIRVIS.Instance.PlayTips("哦，又来了一位新朋友，请稍等片刻，正在为您构建次元通道",true); 
        }else
        {
            JIRVIS.Instance.PlayTips(OTYPE.Tipscontent.oldPlayer); 
        }

        List<ConfigFile> needUpdateFiles = new List<ConfigFile>();
        if(_fromLocalConfigBase == null )
        {
            Debug.Log("JIRVIS Check: 本地无版本信息，需要全部拉取" );
            //[这里临时赋值，但不会保存数据，在配置文件成功保存后，会更新configbase]
            checkConfigData.SetLocalConfigBase();
            checkConfigData.getLocalConfigBase.lastWriteTime = _fromServerConfigBase.lastWriteTime;
            checkConfigData.getLocalConfigBase.version = _fromServerConfigBase.version;

            needUpdateFiles = _fromServerConfigBase.files;
            //[向服务器所要配置文件]
            CallServerGetConfig(needUpdateFiles);

        }else
        {
            //[如果版本相同，那么就不用更新了]
            if(_fromLocalConfigBase.lastWriteTime == _fromServerConfigBase.lastWriteTime)
            {
                InvokExcuteChangeController();
                Debug.Log("JIRVIS Check:  版本相同 无需更新" );
                return;
            }
            else
            {  
               


                if(_fromLocalConfigBase.lastWriteTime == -1)
                {
                    needUpdateFiles = _fromServerConfigBase.files;
                    //[清除]
                    checkConfigData.getLocalConfigBase.files.Clear();
                }else
                {
                    //[检查那几个文件需要更新]
                    int serverConfigFileCount = _fromServerConfigBase.files.Count;
                    //[先判断本地配置文件的数量是否与服务器的相同]
                    if(_fromLocalConfigBase.files.Count == serverConfigFileCount)
                    {
                        for(int i = 0 ; i < serverConfigFileCount ;i++)
                        {
                            //[遍历，把版本不一样的添加进需要修改的列表里]
                            if(_fromServerConfigBase.files[i].lastWriteTime != _fromLocalConfigBase.files[i].lastWriteTime)
                            {
                                needUpdateFiles.Add(_fromServerConfigBase.files[i]);
                                Debug.Log("JIRVIS Check:" + _fromServerConfigBase.files[i].name + "版本不同 需要更新");
                            }else
                            {
                                Debug.Log("JIRVIS Check:" + _fromServerConfigBase.files[i].name + "版本相同 无需更新");
                            }
                        }
                    }else
                    {
                        //[如果配置文件的数量对不上，那么就从服务器上拉取所有的文件]
                        needUpdateFiles = _fromServerConfigBase.files;
                        //[清除]
                        checkConfigData.getLocalConfigBase.files.Clear();
                    }
                }
              
                //[这里临时赋值，但不会保存数据，在配置文件成功保存后，会更新configbase]
                checkConfigData.getLocalConfigBase.lastWriteTime = _fromServerConfigBase.lastWriteTime;
                checkConfigData.getLocalConfigBase.version = _fromServerConfigBase.version;
               

                CallServerGetConfig(needUpdateFiles);
            }
        }
      
    }



    #endregion

    #region 回调

    private void CallBackGetConfigBase(ConfigBase _fromServerConfigBase)
    {
        //[交给逻辑去判断 哪些需要更新的配置文件]
        CheckBaseConfig(_fromServerConfigBase);
    }

    private void CallBackGetConfigFiles(List<LocalConfigFile> configFiles)
    {
        AnalysisConfig(configFiles);


    }

    #endregion
}
