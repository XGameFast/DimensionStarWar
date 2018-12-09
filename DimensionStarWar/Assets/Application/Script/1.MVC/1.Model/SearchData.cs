using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SearchData : ControllerData
{
    public DetecAttribute getCurDetectAttribute
    {
        get
        {
            return curDetectAttribute;
        }
    }

    public MonsterBasic getCurMonster {get {return searchMonsterItems[0] ;} }

    public int getDetecLevel {get {return curDetectAttribute.detectID - 42020 ;}}

    public List<SearchObject> getTmpPickupItems {get {return tmpPickupItmes ;}}
    public float getStartTime {get {return startTime ;}}
    public bool getIsScanning {get {return isScanning ;}}
    public bool catchSuccess =false;
    public  List<SearchObject> searchObjects;//服务器 给予的物品信息
    public SearchController searchController;
    public SearchMenu searchMenu;
    public bool isPickMonster=false;
    public int searchType;

    public SearchObjectItem searchObjectItem;
    private bool isScanning = false;
    private DetecAttribute curDetectAttribute;
    private float startTime ;
    private List<SearchObject> tmpPickupItmes;
    Dictionary<int , DetecAttribute> detectAttributes = new Dictionary<int, DetecAttribute>();
    public List<SearchObjectItem> searchObjectItems;
    private PlayerPowerShotBar playerPowerShotBar ;
    private List<MonsterBasic> searchMonsterItems;
    //初始化数据
    public  void InitValue()
    {
       
        if (m_Menu != null) { AndaDataManager.Instance.RecieveItem(m_Menu); m_Menu = null; searchMenu = null; }
        ClearSearchObj();
        ClearDetecAttribite();
        ClearTmpPickupItems();
        ClearSearchMonsterObj();
    }

    public void ClearSearchObj()
    {
        //这是探索物件，预知体
        if (searchObjectItems != null)
        {
            int count = searchObjectItems.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(searchObjectItems[i]);
            }
            searchObjectItems.Clear();
        }
        //这是数据 探索的数据
        if (searchObjects != null) searchObjects.Clear();
    }

    public void ClearSearchMonsterObj()
    {
        if(searchMonsterItems!=null)
        {
            int count = searchMonsterItems.Count;
            for(int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem( searchMonsterItems[i]);
            }
            searchMonsterItems.Clear();
        }

    }

    public void ClearDetecAttribite()
    {
        detectAttributes.Clear();
    }

    public void ClearTmpPickupItems()
    {
        if(tmpPickupItmes!=null)
        {
            tmpPickupItmes.Clear();
            Debug.Log("tmpPickupItmes" + tmpPickupItmes.Count);
        }

      
    }

    public void RemovePlayerPowerLink()
    {
        if(playerPowerShotBar!=null)
        {
            AndaDataManager.Instance.RecieveItem(playerPowerShotBar);
            playerPowerShotBar = null;
        }
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        searchMenu = m_Menu as SearchMenu;
        searchMenu.FadeIn();
        BuildDetectAttribute();
    }


    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        searchController = _baseController as SearchController;
    }

    public void BuildPlayerPowerLinkBar(int rate, System.Action<bool> result)
    {
        if(playerPowerShotBar==null)
        {
            playerPowerShotBar = AndaUIManager.Instance.PopingMenu2<PlayerPowerShotBar>(ONAME.PlayerPowerShotBar);
            playerPowerShotBar.SetInfo(rate , result , getCurMonster);
        }
    }

    public void BuildDetectAttribute()
    {

        detectAttributes.Add(42020 , new DetecAttribute { detectID = 42020 , scannDuration = 11, scannSpeed = 3f});

        detectAttributes.Add(42021, new DetecAttribute { detectID = 42021, scannDuration = 15, scannSpeed = 2.5f});

        detectAttributes.Add(42022, new DetecAttribute { detectID = 42022, scannDuration = 20, scannSpeed = 2f });
    }
   
    public DetecAttribute GetDetecAttribute(int id)
    {
        return detectAttributes[id];
    }

    public void SetCurrentDetecAttribute(int id)
    {
        curDetectAttribute = GetDetecAttribute(id);
    }

    public void SetScanning(bool _isScanning)
    {
        isScanning = _isScanning;
    }

    public void SetStartTime()
    {
        startTime = Time.time;
    }

    public void AddSearchItem(SearchObjectItem item)

    {
        if(searchObjectItems == null)searchObjectItems = new List<SearchObjectItem>();
        searchObjectItems.Add(item);
    }

    public void AddSearchMonsterItem(MonsterBasic monster)
    {
        if (searchMonsterItems == null) searchMonsterItems = new List<MonsterBasic>();
        searchMonsterItems.Add(monster);
    }

    public void AddtionTmpPickupItems(SearchObject  searchObject)
    {
        if(tmpPickupItmes == null) tmpPickupItmes =new List<SearchObject>();
        tmpPickupItmes.Add(searchObject);
    }
}

public class DetecAttribute
{
    public int detectID { get; set; }
    public float scannSpeed { get; set; }//扫描速度
    public float scannDuration { get; set; }//扫描持续时间

}