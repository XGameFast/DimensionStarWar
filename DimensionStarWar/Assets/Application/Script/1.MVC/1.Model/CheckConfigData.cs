using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;
using System.Linq;
public class CheckConfigData : ControllerData {
    public ConfigBase getLocalConfigBase {get {return localConfigBase ;}}
    public CheckConfigMenu getCheckConfigMenu {get {return checkConfigMenu ;}}
    private CheckConfigController checkConfigController ;
    private CheckConfigMenu checkConfigMenu;
    private ConfigBase localConfigBase;
    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        checkConfigController = baseController as CheckConfigController;

       

        BuildLocalConfigBase();
    }

    public void InitVlaue()
    {
        if(m_Menu!=null)
        {
            AndaDataManager.Instance.RecieveItem(m_Menu);
            m_Menu =null;
        }
        localConfigBase = null;

    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        checkConfigMenu = m_Menu as CheckConfigMenu;
        checkConfigMenu.InitMenu(checkConfigController);
    }

    public void BuildLocalConfigBase()
    {
        string json = PlayerPrefs.GetString(ONAME.BaseConfigFileName);
        if(!string.IsNullOrEmpty(json))
        {
            localConfigBase = JsonMapper.ToObject<ConfigBase>(json);
        }
    }
    public void SetLocalConfigBase()
    {
        localConfigBase = new ConfigBase();
    }


    //[更新配置文件的版本信息]
    public void UpdateConfigFilesVersionData(List<LocalConfigFile > localConfigFiles)
    {
        int count = localConfigFiles.Count;
        if(localConfigBase.files == null) //重置配置文件
        {
            localConfigBase.files = new List<ConfigFile>();
            for(int i = 0 ; i  < count; i++)
            {
                localConfigBase.files.Add(new ConfigFile { name = localConfigFiles[i].name , lastWriteTime = localConfigFiles[i].lastWriteTime});
                PlayerPrefs.SetString(localConfigFiles[i].name , localConfigFiles[i].config);
            }


        }else
        {
            for(int i = 0 ; i  < count; i++)
            {
                ConfigFile configFile = localConfigBase.files.FirstOrDefault(s=>s.name == localConfigFiles[i].name);
                if(configFile == null) // 本地没有这个配置文件，那么添加
                {
                    localConfigBase.files.Add(new ConfigFile { name = localConfigFiles[i].name , lastWriteTime = localConfigFiles[i].lastWriteTime});
                }else //有的话就更新
                {
                    configFile.lastWriteTime = localConfigFiles[i].lastWriteTime;
                }
           
                //[写入配置文件]
                PlayerPrefs.SetString(localConfigFiles[i].name , localConfigFiles[i].config);
            }

        }

        //[保存configbase]
        string json = JsonMapper.ToJson(localConfigBase);
        PlayerPrefs.SetString(ONAME.BaseConfigFileName , json);
    }


}


public class ConfigBase
{
    public string version {get;set;} //0.8.7 .
    public int lastWriteTime { get; set; }
    public List<ConfigFile> files { get; set; }
}

public class ConfigFile
{
    public string name { get; set; }
    public int lastWriteTime { get; set; }
}

public class LocalConfigFile
{
    public string name {get;set;}
    public int lastWriteTime{get;set;}
    public string config{get;set;}
}
