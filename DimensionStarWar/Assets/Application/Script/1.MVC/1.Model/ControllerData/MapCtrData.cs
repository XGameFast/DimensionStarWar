using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mapbox.Utils;
using Mapbox.Unity.Location;
using System.Linq;
public class MapCtrData : ControllerData {

    public enum mapDisplayType
    {
        minePlayerSH = 0,
        playerSH =1,
        exchangeSH =2,
        bussinessSH =3,
        bossSH =4 ,
        otherPlayerSH = 11,
        allPlayerSH = 12,
        mineExchangeSH = 20,
        otherExchangeSH =21,
        allExchangeSH =22,
        allBussinessSh = 30,
        allBossSH = 40
    }

    public BuildTmpTower tmpToweritem;

    //public AndaObjectBasic tmpToweritem;

    public bool getIsForSetTmpStronghold
    {
        get{return  isForSetTmpStronghold ;}
    }

    public JIRVISEditorboard_StrongholdholdInfo getJIRVISEditorboard_StrongholdholdInfo
    {
        get {return  jIRVISEditorboard_StrongholdholdInfo ;}
    }

    public int getCurSelectstrongholdIndex
    {
        get {return currentSelectSelfStrongholdIndex ; }
    }

    public int getRightStrongholdIndex
    {
        get {return rightStrongholdIndex ;}

    }

    public MapUIItem_icon_UserPor GetmapUIItem_Icon_UserPor
    {
        get {return currentLocationPointUIItem ;}
    }

    public List<MapUIItem_icon_lvBoard_Name> getMineStrongholdItem
    {
        get{return minePlayerStrongholdItems ;}
    }
   
    public List<MapUIItem_icon_lvBoard_Name> getOtherStrongholdItem
    {
        get {return otherPlayerStrongholdItems;}
    }
    public List<MapUIItem_icon_lvBoard_Name> getBussinesStronghldItem
    {
        get {return businessStrongholdItems ;}
    }

    public List<MapUIItem_icon_lvBoard_Name> getMineExchangeItem { get { return mineExchangeStrongholdItems; } }
    public List<MapUIItem_icon_lvBoard_Name> getOtherExchagneItem { get { return OtherExchangeStrongholdItems; } }

    public List<PlayerStrongholdAttribute> getSeflStrongholdAttribute
    {
        get  {return selfPlayerStrongholdAttributes ;}
    }

    public List<PlayerStrongholdAttribute> getOtherPlayerStrongholdAttribute
    {
        get {return otherPlayerStrongholdAttributes ;}
    }



    public List<BusinessStrongholdAttribute> getBussinessStrongholdAttribute 
    {
        get{return bussinessStrongholdAttributes ;}
    }

    public List<Exchange> getMineExchangeAttr {get{return mineExchagnesAttributes ;}}

    public List<Exchange> getOtherExchangeAttr{get {return otherExchangeAttributes ;}}

    public List<Vector3> getOtherExchangeWorldPose{get {return otherExchangeSHWorldPose;} }

    public List<Vector3> getMineExchangeWorldPose {get {return mineExchangeSHWorldPose ;}}


    public bool getBuildstorngholdState
    {
        get {return buildStrongholdstate ;}
    }

    public bool getCommissionEventContainsBuildstronghold
    {
        get {return JIRVIS.Instance.jIRVISData.getWaitexcuteEventlist.Contains(0);}
    }

    public Transform getMapcamera
    {
        get { return ARMonsterSceneDataManager.Instance.MapCamera.transform ; }
    }
    public bool getIsMap2D
    {
        get {return curMapIs2D ;}
    }

    public Vector3 GetCurrentLocationInMapPostion 
    {
        get {return curLocationInMapPostion ;}
    }
    public ExchangeMenu getExchangeMenu {get {return exchangeMenu ;}}

    public int GetCurChoossSHType {get{return currentChooseDiplaySHType ;}}

    public bool isOpenJirvisChildBar =false;
    public TowerBase mapCameraHitToweritem;

    public Camera GetCurCamera{get {return curCamera ;} }

    private int currentSelectSelfStrongholdIndex;
    private Camera curCamera;
    private MapMenu mapMenu;
    private MapController mapController;

    private List<PlayerStrongholdAttribute> otherPlayerStrongholdAttributes = new List<PlayerStrongholdAttribute>();
    private List<BusinessStrongholdAttribute> bussinessStrongholdAttributes = new List<BusinessStrongholdAttribute>();
    private List<PlayerStrongholdAttribute> selfPlayerStrongholdAttributes = new List<PlayerStrongholdAttribute>();
    private List<Exchange> mineExchagnesAttributes = new List<Exchange>();
    private List<Exchange> otherExchangeAttributes = new List<Exchange>();


    private List<MapUIItem_icon_lvBoard_Name> otherPlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
    private List<MapUIItem_icon_lvBoard_Name> minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
    private List<MapUIItem_icon_lvBoard_Name> businessStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
    private List<MapUIItem_icon_lvBoard_Name> mineExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
    private List<MapUIItem_icon_lvBoard_Name> OtherExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
    private List<AndaObjectBasic> mineExchagneStrongholdItem_obj = new List<AndaObjectBasic>();
    private List<AndaObjectBasic> otherExcangeStrongholdItem_obj =new List<AndaObjectBasic>();
    private List<AndaObjectBasic> bussinessStrongholdItems_obj =new List<AndaObjectBasic>();
    private List<Vector3> mineExchangeSHWorldPose = new List<Vector3>();
    private List<Vector3> otherExchangeSHWorldPose = new List<Vector3>();
    private MapUIItem_icon_UserPor currentLocationPointUIItem;
    private List<TowerBase> seflStrongholdItem;//玩家自己
    private JIRVISContent_ChanllengeGameStrongholdInfo jIRVISContent_ChanllengeGameStronghold;
    private int rightStrongholdIndex = -1;
    //这个用于确定是展示 玩家据点还是商家据点 0 = 玩家据点，1=商家据点
    private int currentShowItemType =-1;
    private int currentSelectstrongholdDrawID;
    private bool isForSetTmpStronghold = false;
    private bool curMapIs2D =false;
    private JIRVISEditorboard_StrongholdholdInfo jIRVISEditorboard_StrongholdholdInfo ;
    private Vector3 curLocationInMapPostion ;
    private ExchangeMenu exchangeMenu;


    //附近的查看的据点的种类，
    // 0 = 列表总表 ，1 =玩家据点 ，2 = 交易所 ，3 = 商家据点 4 = boss 据点
    //10 = 我的玩家据点， 11= 其他人的玩家据点， 12= 所有玩家据点。
    //  20， =  我的交易所据点，21 = 其他玩家的交易所据点  22 = 所有玩家的交易所
    // 30 = 所有商家据点
    // 40 = 所有boss 据点
    private int currentChooseDiplaySHType ;

    //用于判断是否可以建立据点 
    private bool buildStrongholdstate = false;
    public PlayerStrongholdAttribute curMineStrongholdAttr;
    public bool isCheckReward;
    public int shDisplayType = 4;
    public ExchangeUIItem_TmpSet tmpExchangeItem;
    public bool setMapType = true;//true = vv  false = ar
    private float mapItemObjScale =180f;

    public int targetSHAttributeIndex;//要跳转 目标SH index;
     
     

    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        mapController = baseController as MapController;
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        mapMenu = m_Menu as MapMenu;
        mapMenu.FadeIn();
    }
    public void InitData()
    {


        isCheckReward =false;
        isOpenJirvisChildBar = false;
        isWait=false;
        currentShowItemType = -1;


        RemoveMenu();

        RemoveAllMineStronghold();
        if(selfPlayerStrongholdAttributes!=null)selfPlayerStrongholdAttributes.Clear();
       
        RemoveAllOtherPlayerStronghold();

        if(otherPlayerStrongholdAttributes!=null) otherPlayerStrongholdAttributes.Clear();
      

        RemoveAllBussinessStronghold();
        if(bussinessStrongholdAttributes!=null)bussinessStrongholdAttributes.Clear();
       
        RemoveAllMineExchangeSH();
        if(mineExchagnesAttributes!=null)mineExchagnesAttributes.Clear();
        if(mineExchangeSHWorldPose!=null)mineExchangeSHWorldPose.Clear();

        RemoveAllOtherExchagneSH();
        if(otherExchangeAttributes!=null)otherExchangeAttributes.Clear();
        if(otherExchangeSHWorldPose!=null)otherExchangeSHWorldPose.Clear();

        RemoveJIRVISEditorbarForStrongholdInfo();

        RemoveCurrentLocationPointItem();

        RemoveExchangeTmpItem();
    }


    public void RemoveMapItem()
    {
       
        RemoveAllMineStronghold();
        selfPlayerStrongholdAttributes.Clear();

        RemoveAllOtherPlayerStronghold();
        otherPlayerStrongholdAttributes.Clear();

        RemoveAllBussinessStronghold();
        bussinessStrongholdAttributes.Clear();



        RemoveAllMineExchangeSH();
        mineExchagnesAttributes.Clear();
        mineExchangeSHWorldPose.Clear();

        RemoveAllOtherExchagneSH();
        otherExchangeAttributes.Clear();
        otherExchangeSHWorldPose.Clear();

       
    }


    public void RemoveExchangeTmpItem()
    {
        if(tmpExchangeItem!=null)
        {
            AndaDataManager.Instance.RecieveItem(tmpExchangeItem);
            tmpExchangeItem = null;
        }
    }

    public override void RemoveMenu()
    {
        base.RemoveMenu();
        mapMenu = null;
    }

    public void RemoveCurrentLocationPointItem()
    {
        if(currentLocationPointUIItem !=null)
        {
            AndaDataManager.Instance.RecieveItem(currentLocationPointUIItem);
        }
    }

    public void RemoveAllMineStronghold()
    {
        if(minePlayerStrongholdItems!=null)
        {
            int count = minePlayerStrongholdItems.Count;
            for(int i = 0 ; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(minePlayerStrongholdItems[i]);
            }
            minePlayerStrongholdItems.Clear();
        }
      
    }

    public void RemoveAllOtherPlayerStronghold()
    {
        if(otherPlayerStrongholdItems!=null)
        {
            int othPlayerCount = otherPlayerStrongholdItems.Count;
            for(int i = 0; i < othPlayerCount; i++)
            {
                AndaDataManager.Instance.RecieveItem(otherPlayerStrongholdItems[i]);
            }
            otherPlayerStrongholdItems.Clear();
        }
     
    }

    public void RemoveAllOtherExchagneSH()
    {
        if(OtherExchangeStrongholdItems!=null)
        {
            int count = OtherExchangeStrongholdItems.Count;
            for(int i = 0 ; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(OtherExchangeStrongholdItems[i]);
            }
            OtherExchangeStrongholdItems.Clear();
        }
        if(otherExcangeStrongholdItem_obj!=null)
        {
            int count = otherExcangeStrongholdItem_obj.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(otherExcangeStrongholdItem_obj[i]);
            }
            otherExcangeStrongholdItem_obj.Clear();
        }
    }

    public void RemoveAllMineExchangeSH()
    {
        if (mineExchangeStrongholdItems != null)
        {
            int count = mineExchangeStrongholdItems.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(mineExchangeStrongholdItems[i]);
            }
            mineExchangeStrongholdItems.Clear();

        }

        if (mineExchagneStrongholdItem_obj != null)
        {
            int count = mineExchagneStrongholdItem_obj.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(mineExchagneStrongholdItem_obj[i]);
            }
            mineExchagneStrongholdItem_obj.Clear();
        }
    }

    public void RemoveAllBussinessStronghold()
    {
        if(businessStrongholdItems!=null)
        {
            int otherBussinessrCount = businessStrongholdItems.Count;
            for(int i = 0; i < otherBussinessrCount; i++)
            {
                AndaDataManager.Instance.RecieveItem(businessStrongholdItems[i]);
            }
            businessStrongholdItems.Clear();
        }

    }


    public void RecieveTmptowerItem()
    {
        if(tmpToweritem!=null)
        {
            AndaDataManager.Instance.RecieveItem(tmpToweritem);
            tmpToweritem= null;
        }
    }

  

    public void RemoveJIRVISEditorbarForStrongholdInfo()
    {
        if(jIRVISEditorboard_StrongholdholdInfo!=null)
        {
            AndaDataManager.Instance.RecieveItem(jIRVISEditorboard_StrongholdholdInfo);
            jIRVISEditorboard_StrongholdholdInfo =null;
        }
    }

    public void RemoveExchangeMenu()
    {
        if(exchangeMenu!=null)
        {
            AndaDataManager.Instance.RecieveItem(exchangeMenu);
            exchangeMenu =null;
        }
    }

    public void BuildExchangeInfoMenu()
    {
        if(exchangeMenu!=null)AndaDataManager.Instance.RecieveItem(exchangeMenu);
        exchangeMenu = AndaDataManager.Instance.InstantiateMenu<ExchangeMenu>(ONAME.ExchangeMenu);
        exchangeMenu.SetInto(getm_Menu.transform);
        exchangeMenu.FadeIn();
        exchangeMenu.CallBackClose = mapController.CloseExchangeStrongholdInfomation;
    }



    public void GetOtherStrongholdListwithCurrentplayerLocation(System.Action<List<PlayerStrongholdAttribute>,List<BusinessStrongholdAttribute>,List<Exchange>> callback,List<double>location)
    {
        AndaDataManager.Instance.CallServerGetCurrentLocaitonRangeOfOtherData(location,callback);
    }




    public void BuildCurrentLocationPoint()
    { 
        if(currentLocationPointUIItem!=null) AndaDataManager.Instance.RecieveItem(currentLocationPointUIItem);
        currentLocationPointUIItem = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_UserPor>(ONAME.MapUIItemShboard_LocationPoint);
        currentLocationPointUIItem.SetInto(mapMenu.itemBox);
        currentLocationPointUIItem.SetInfo(GetCurrentLocationInMapPostion,mapController);
       // PlayerMonsterAttribute _pma =AndaDataManager.Instance.GetUserPlayerMonstesrList()[0];
      //  MonsterBasic monsterBasic = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(_pma.monsterID.ToString());

        //Vector3 rP = GetCurrentLocationInMapPostion;
       // Vector2 vector2 = GetCurCamera.WorldToScreenPoint(rP);
       // Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
        //data.GetmapUIItem_Icon_UserPor.UpdatePose(p);
       // monsterBasic.transform.position = GetCurrentLocationInMapPostion;
    }

    /// <summary>
    /// 设置地图上据点的数据,从服务器来
    /// </summary>
    /// <param name="psalist">Psalist.</param>
    /// <param name="bsalist">Bsalist.</param>
    public void SetLocaitonRangeUserData(List<PlayerStrongholdAttribute> psalist, List<BusinessStrongholdAttribute> bsalist ,List<Exchange> _exchangesItem )
    {
        //[为数据赋值一下 在游戏中的世界为位置]
        int count = psalist.Count;

        if(selfPlayerStrongholdAttributes!=null)selfPlayerStrongholdAttributes.Clear();
        if(otherPlayerStrongholdAttributes!=null)otherPlayerStrongholdAttributes.Clear();


        for(int i = 0; i < count;i ++)
        {
            PlayerStrongholdAttribute playerStrongholdAttribute = psalist[i];
            Vector2d vector2D = new Vector2d(playerStrongholdAttribute.strongholdPosition[0],playerStrongholdAttribute.strongholdPosition[1]);
            playerStrongholdAttribute.strongholdInMapPosition = AndaMap.Instance.ConvertGeopointToGameworldpoint(vector2D);
           
            if(playerStrongholdAttribute.hostIndex == AndaDataManager.Instance.userData.userIndex)
            {
                if(selfPlayerStrongholdAttributes == null) selfPlayerStrongholdAttributes = new List<PlayerStrongholdAttribute>();
                selfPlayerStrongholdAttributes.Add(playerStrongholdAttribute);
            }else
            {
               
                if(otherPlayerStrongholdAttributes == null)  otherPlayerStrongholdAttributes =new List<PlayerStrongholdAttribute>();
                otherPlayerStrongholdAttributes.Add(playerStrongholdAttribute);
            }
        }
        //判断是否需要交换玩家粘性的排位顺序
        if (currentChooseDiplaySHType == 1) ExchangePoseWithPlayerAtt();
      
        if(mineExchagnesAttributes!=null)mineExchagnesAttributes.Clear();
        mineExchangeSHWorldPose.Clear();
        if(otherExchangeAttributes!=null)otherExchangeAttributes.Clear();
        otherExchangeSHWorldPose.Clear();

        if(_exchangesItem!=null)
        {
            count = _exchangesItem.Count;
            for (int i = 0; i < count; i++)
            {
                Vector2d vector2D = new Vector2d(_exchangesItem[i].exchangePositionx, _exchangesItem[i].exchangePositiony);
                Vector3 v3d = AndaMap.Instance.ConvertGeopointToGameworldpoint(vector2D);

                if (_exchangesItem[i].userIndex == AndaDataManager.Instance.userData.userIndex)
                { 
                    if (mineExchagnesAttributes == null) mineExchagnesAttributes = new List<Exchange>();
                    mineExchangeSHWorldPose.Add(v3d);
                    mineExchagnesAttributes.Add(_exchangesItem[i]);
                }
                else
                {

                    if (otherExchangeAttributes == null) otherExchangeAttributes = new List<Exchange>();
                    otherExchangeSHWorldPose.Add(v3d);
                    otherExchangeAttributes.Add(_exchangesItem[i]);
                }
            }

        }
        //判断是否需要交换玩家交易所的排位顺序
        if (currentChooseDiplaySHType == 2 )
        {
            ExchangePoseWitExchangeAttr();
        }

        if (bussinessStrongholdAttributes!=null) bussinessStrongholdAttributes.Clear();
        bussinessStrongholdAttributes = bsalist;
        count = bussinessStrongholdAttributes.Count;
        for(int i = 0; i < count;i ++)
        {
            Vector2d vector2D = new Vector2d(bussinessStrongholdAttributes[i].strongholdPosition[0],bussinessStrongholdAttributes[i].strongholdPosition[1]);
            bussinessStrongholdAttributes[i].strongholdInMapPosition = AndaMap.Instance.ConvertGeopointToGameworldpoint(vector2D);
        }

        if(currentChooseDiplaySHType == 3)
        {
            ExchangePoseWitBussinessAttr();
        }



        Vector2d locationV2d  = AndaLocaltion.Instance.currentLocation.LatitudeLongitude;
        curLocationInMapPostion = AndaMap.Instance.ConvertGeopointToGameworldpoint(locationV2d);
    }

    #region 构建地图物件

    public IEnumerator BuildMineSHUI(int type)
    {
        int count = 0;
        MapUIItem_icon_lvBoard_Name _item = null;
        PlayerStrongholdAttribute p = null;
        switch (type)
        {
            case 0:
                RemoveAllMineStronghold();
                p = selfPlayerStrongholdAttributes[0];
                _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
                _item.transform.SetInto(mapMenu.itemBox);
                _item.SetInfo(p);
                _item.SetController(mapController);
                _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                if (minePlayerStrongholdItems == null) minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                minePlayerStrongholdItems.Add(_item);
                _item.GetComponent<Animator>().Play("FadeIn");
                _item.transform.localScale = Vector3.one*1.5f;
                yield return new WaitForSeconds(0.5f);
                break;
            case 1:
                count = selfPlayerStrongholdAttributes.Count;
                for (int i = 1; i < count; i++)
                {
                    p = selfPlayerStrongholdAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                    if (minePlayerStrongholdItems == null) minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    minePlayerStrongholdItems.Add(_item);
                    yield return new WaitForSeconds(0.1f);
                }
                break;
            case 2:
                RemoveAllMineStronghold();
                count = selfPlayerStrongholdAttributes.Count;
                for (int i = 0; i < count; i++)
                {
                    p = selfPlayerStrongholdAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                    if (minePlayerStrongholdItems == null) minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    minePlayerStrongholdItems.Add(_item);
                    yield return new WaitForSeconds(0.1f);
                }
                break;
        }
    }

    public IEnumerator BuildAnotherPlayerSHUI(int type)
    {
        int count = 0;
        MapUIItem_icon_lvBoard_Name _item = null;
        PlayerStrongholdAttribute p = null;
        switch (type)
        {
            case 0:
                RemoveAllOtherPlayerStronghold();
                p = otherPlayerStrongholdAttributes[0];
                _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
                _item.transform.SetInto(mapMenu.itemBox);
                _item.SetInfo(p);
                _item.SetController(mapController);
                _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                if (otherPlayerStrongholdItems == null) otherPlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                otherPlayerStrongholdItems.Add(_item);
                _item.GetComponent<Animator>().Play("FadeIn");
                _item.transform.localScale = Vector3.one * 1.5f;
                yield return new WaitForSeconds(0.5f);
                break;
            case 1:
                count = otherPlayerStrongholdAttributes.Count;
                for (int i = 1; i < count; i++)
                {
                    p = otherPlayerStrongholdAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                    if (otherPlayerStrongholdItems == null) otherPlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    otherPlayerStrongholdItems.Add(_item);
                    _item.GetComponent<Animator>().Play("FadeIn");
                    yield return new WaitForSeconds(0.1f);
                }
                break;
            case 2:
                RemoveAllOtherPlayerStronghold();
                count = otherPlayerStrongholdAttributes.Count;
                for (int i = 0; i < count; i++)
                {

                    p = otherPlayerStrongholdAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                    if (otherPlayerStrongholdItems == null) otherPlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    otherPlayerStrongholdItems.Add(_item);
                    _item.GetComponent<Animator>().Play("FadeIn");
                    yield return new WaitForSeconds(0.1f);
                }
                break;
        }
    }

    public IEnumerator BuildMineExchangeSHUI(int type)
    {
        int count = 0;
        Exchange p = null;
        MapUIItem_icon_lvBoard_Name _item = null;
        AndaObjectBasic minObj = null;
        switch (type)
        {
            case 0:
                RemoveAllMineExchangeSH();
                p = mineExchagnesAttributes[0];
                _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_exchangeSH);
                _item.transform.SetInto(mapMenu.itemBox);
                _item.SetInfo(p,mineExchangeSHWorldPose[0]);
                _item.SetController(mapController);
                _item.RegisterClickCallBack(mapController.OpenExchangeStrongholdInformation);
                if (mineExchangeStrongholdItems == null) mineExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                mineExchangeStrongholdItems.Add(_item);
                minObj = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("MapItem_ExchagneObj");
                minObj.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                minObj.transform.position = mineExchangeSHWorldPose[0];
                minObj.transform.localScale = Vector3.one * mapItemObjScale;
                mineExchagneStrongholdItem_obj.Add(minObj);
                minObj.transform.localScale *= 1.2f;
                minObj.GetComponent<Animator>().Play("FadeIn");
                yield return new WaitForSeconds(0.5f);
                break;
            case 1:
                count = mineExchagnesAttributes.Count;
                for (int i = 1; i < count; i++)
                {
                    p = mineExchagnesAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_exchangeSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p,mineExchangeSHWorldPose[i]);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.OpenExchangeStrongholdInformation);
                    if (mineExchangeStrongholdItems == null) mineExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    mineExchangeStrongholdItems.Add(_item);
                    minObj = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("MapItem_ExchagneObj");
                    minObj.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                    minObj.transform.position = mineExchangeSHWorldPose[i];
                    minObj.transform.localScale = Vector3.one * mapItemObjScale;
                    mineExchagneStrongholdItem_obj.Add(minObj);
                    minObj.GetComponent<Animator>().Play("FadeIn");
                    yield return new WaitForSeconds(0.1f);
                }
                break;
            case 2:

                RemoveAllMineExchangeSH();
                count = mineExchagnesAttributes.Count;
                for (int i = 0; i < count; i++)
                {
                    p = mineExchagnesAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_exchangeSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p, mineExchangeSHWorldPose[i]);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.OpenExchangeStrongholdInformation);
                    if (mineExchangeStrongholdItems == null) mineExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    mineExchangeStrongholdItems.Add(_item);
                    minObj = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("MapItem_ExchagneObj");
                    minObj.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                    minObj.transform.position = mineExchangeSHWorldPose[i];
                    minObj.transform.localScale = Vector3.one * mapItemObjScale;
                    mineExchagneStrongholdItem_obj.Add(minObj);
                    minObj.GetComponent<Animator>().Play("FadeIn");
                    yield return new WaitForSeconds(0.1f);
                }
                break;
        }
    }

    public IEnumerator BuildOtherExchangeUI(int type)
    {
        int count = 0;
        Exchange p = null;
        MapUIItem_icon_lvBoard_Name _item = null;
        AndaObjectBasic otheObj = null;
        switch (type)
        {
            case 0:
                RemoveAllOtherExchagneSH();
                p = otherExchangeAttributes[0];
                _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_exchangeSH);
                _item.transform.SetInto(mapMenu.itemBox);
                _item.SetInfo(p, otherExchangeSHWorldPose[0]);
                _item.SetController(mapController);
                _item.RegisterClickCallBack(mapController.OpenExchangeStrongholdInformation);
                if (OtherExchangeStrongholdItems == null) OtherExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                OtherExchangeStrongholdItems.Add(_item);
                otheObj = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("MapItem_ExchagneObj");
                otheObj.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                otheObj.transform.position = otherExchangeSHWorldPose[0];
                otheObj.transform.localScale = Vector3.one * mapItemObjScale;
                otherExcangeStrongholdItem_obj.Add(otheObj);
                otheObj.transform.localScale *= 1.2f;
                otheObj.GetComponent<Animator>().Play("FadeIn");
                yield return new WaitForSeconds(0.5f);
                break;
            case 1:
                count = otherExchangeAttributes.Count;
                for (int i = 1; i < count; i++)
                {
                    p = otherExchangeAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_exchangeSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p, otherExchangeSHWorldPose[i]);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.OpenExchangeStrongholdInformation);
                    if (OtherExchangeStrongholdItems == null) OtherExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    OtherExchangeStrongholdItems.Add(_item);
                    otheObj = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("MapItem_ExchagneObj");
                    otheObj.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                    otheObj.transform.position = otherExchangeSHWorldPose[i];
                    otheObj.transform.localScale = Vector3.one * mapItemObjScale;
                    otherExcangeStrongholdItem_obj.Add(otheObj);
                    otheObj.GetComponent<Animator>().Play("FadeIn");
                    yield return new WaitForSeconds(0.1f);
                }
                break;
            case 2:
                RemoveAllOtherExchagneSH();
                count = otherExchangeAttributes.Count;
                for (int i = 0; i < count; i++)
                {
                    p = otherExchangeAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_exchangeSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    _item.SetInfo(p, otherExchangeSHWorldPose[i]);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.OpenExchangeStrongholdInformation);
                    if (OtherExchangeStrongholdItems == null) OtherExchangeStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    OtherExchangeStrongholdItems.Add(_item);
                    otheObj = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("MapItem_ExchagneObj");
                    otheObj.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                    otheObj.transform.position = otherExchangeSHWorldPose[i];
                    otheObj.transform.localScale = Vector3.one * mapItemObjScale;
                    otherExcangeStrongholdItem_obj.Add(otheObj);
                    otheObj.GetComponent<Animator>().Play("FadeIn");
                    yield return new WaitForSeconds(0.1f);
                }
                break;
        }
    }

    public IEnumerator BuildAllRangeBussinessStrongholdItems(int type)
    {
        int count = 0;
        BusinessStrongholdAttribute p = null;
        MapUIItem_icon_lvBoard_Name _item;
        AndaObjectBasic andaObjectBasic;
        Sprite imgPor = null;
        Sprite levelBoard = null;
        switch (type)
        {
            case 0:
                RemoveAllBussinessStronghold();
                p = bussinessStrongholdAttributes[0];
                _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_BussinesssSH);
                _item.transform.SetInto(mapMenu.itemBox);
                imgPor = AndaDataManager.Instance.GetStrongholdPorSprite(p.statueID.ToString());
                levelBoard = AndaDataManager.Instance.objdataManager.GetBussinessStrongholdLevelSprite(p.strongholdLevel);
                _item.SetInfo(p);
                _item.SetController(mapController);
                _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                if (businessStrongholdItems == null) businessStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                businessStrongholdItems.Add(_item);
                andaObjectBasic = AndaDataManager.Instance.InstantiateTower<AndaObjectBasic>((20001 + p.strongholdLevel).ToString());
                andaObjectBasic.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                andaObjectBasic.transform.position = bussinessStrongholdAttributes[0].strongholdInMapPosition;
                andaObjectBasic.transform.localScale = Vector3.one * mapItemObjScale;
                bussinessStrongholdItems_obj.Add(andaObjectBasic);
                andaObjectBasic.transform.localScale *= 1.5f;

                yield return new WaitForSeconds(0.5f);
                break;
            case 1:
                count = bussinessStrongholdAttributes.Count;
                for (int i = 1; i < count; i++)
                {
                    p = bussinessStrongholdAttributes[i];
                    _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_BussinesssSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                    imgPor = AndaDataManager.Instance.GetStrongholdPorSprite(p.statueID.ToString());
                    levelBoard = AndaDataManager.Instance.objdataManager.GetBussinessStrongholdLevelSprite(p.strongholdLevel);
                    _item.SetInfo(p);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                    if (businessStrongholdItems == null) businessStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    businessStrongholdItems.Add(_item);
                    andaObjectBasic = AndaDataManager.Instance.InstantiateTower<AndaObjectBasic>((20001 + p.strongholdLevel).ToString());
                    andaObjectBasic.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                    andaObjectBasic.transform.position = bussinessStrongholdAttributes[i].strongholdInMapPosition;
                    andaObjectBasic.transform.localScale = Vector3.one * mapItemObjScale;
                    bussinessStrongholdItems_obj.Add(andaObjectBasic);
                    yield return new WaitForSeconds(0.1f);
                }
                mapController.StartCoroutine(CheckBussinessSHPortol());
                break;
            case 2:
                RemoveAllBussinessStronghold();
                count = bussinessStrongholdAttributes.Count;
                for (int i = 0; i < count; i++)
                {
                     p = bussinessStrongholdAttributes[i];
                     _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_BussinesssSH);
                    _item.transform.SetInto(mapMenu.itemBox);
                     imgPor = AndaDataManager.Instance.GetStrongholdPorSprite(p.statueID.ToString());
                     levelBoard = AndaDataManager.Instance.objdataManager.GetBussinessStrongholdLevelSprite(p.strongholdLevel);
                    _item.SetInfo(p);
                    _item.SetController(mapController);
                    _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
                    if (businessStrongholdItems == null) businessStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
                    businessStrongholdItems.Add(_item);
                    andaObjectBasic = AndaDataManager.Instance.InstantiateTower<AndaObjectBasic>((20001 + p.strongholdLevel).ToString());
                    andaObjectBasic.SetInto(AndaMap.Instance.andaMapController.abstractMap.transform);
                    andaObjectBasic.transform.position = bussinessStrongholdAttributes[i].strongholdInMapPosition;
                    andaObjectBasic.transform.localScale = Vector3.one * mapItemObjScale;
                    bussinessStrongholdItems_obj.Add(andaObjectBasic);
                    yield return new WaitForSeconds(0.1f);
                }
                mapController.StartCoroutine(CheckBussinessSHPortol());
                break;
        }
    }

    #endregion

    #region 交换位置
    //交换占星庭的顺序
    private void ExchangePoseWithPlayerAtt()
    {
        int psaCount = selfPlayerStrongholdAttributes.Count;
        bool isReset = false;
        for (int i = 0; i < psaCount; i++)
        {
            if (selfPlayerStrongholdAttributes[i].strongholdIndex == targetSHAttributeIndex)
            {
                if (i == 0)
                {
                    isReset = true;
                    break;
                }
                PlayerStrongholdAttribute _psa = selfPlayerStrongholdAttributes[i];
                selfPlayerStrongholdAttributes[i] = selfPlayerStrongholdAttributes[0];
                selfPlayerStrongholdAttributes[0] = _psa;
                isReset = true;
                break;
            }
        }
        if (!isReset)
        {
            psaCount = otherPlayerStrongholdAttributes.Count;
            for (int i = 0; i < psaCount; i++)
            {
                if (otherPlayerStrongholdAttributes[i].strongholdIndex == targetSHAttributeIndex)
                {
                    if (i == 0)
                    {
                        isReset = true;
                        break;
                    }

                    PlayerStrongholdAttribute _psa = otherPlayerStrongholdAttributes[i];
                    otherPlayerStrongholdAttributes[i] = otherPlayerStrongholdAttributes[0];
                    otherPlayerStrongholdAttributes[0] = _psa;
                    isReset = true;
                    break;
                }
            }
        }
    }

    //交换交易所的顺序
    private void ExchangePoseWitExchangeAttr()
    {
        int psaCount = mineExchagnesAttributes.Count;
        bool isReset = false;
        for (int i = 0; i < psaCount; i++)
        {
            if (mineExchagnesAttributes[i].exchangeIndex == targetSHAttributeIndex)
            {
                if (i == 0)
                {
                    isReset = true;
                    break;
                }
                Exchange _psa = mineExchagnesAttributes[i];
                Vector3 _v = mineExchangeSHWorldPose[i];
                mineExchagnesAttributes[i] = mineExchagnesAttributes[0];
                mineExchagnesAttributes[0] = _psa;
                mineExchangeSHWorldPose[i] = mineExchangeSHWorldPose[0];
                mineExchangeSHWorldPose[0] = _v;
                isReset = true;
                break;
            }
        }
        if (!isReset)
        {
            psaCount = otherExchangeAttributes.Count;
            for (int i = 0; i < psaCount; i++)
            {
                if (otherExchangeAttributes[i].exchangeIndex == targetSHAttributeIndex)
                {
                    if (i == 0)
                    {
                        isReset = true;
                        break;
                    }

                    Exchange _psa = otherExchangeAttributes[i];
                    Vector3 _v = otherExchangeSHWorldPose[i];
                    otherExchangeAttributes[i] = otherExchangeAttributes[0];
                    otherExchangeAttributes[0] = _psa;
                    otherExchangeSHWorldPose[i] = otherExchangeSHWorldPose[0];
                    otherExchangeSHWorldPose[0] = _v;
                    isReset = true;
                    break;
                }
            }
        }
    }

    //交换商家据点的顺序
    private void ExchangePoseWitBussinessAttr()
    {
        int psaCount = bussinessStrongholdAttributes.Count;
       // bool isReset = false;
        for (int i = 0; i < psaCount; i++)
        {
            if (bussinessStrongholdAttributes[i].strongholdIndex == targetSHAttributeIndex)
            {
                if (i == 0)
                {
                  //  isReset = true;
                    break;
                }
                BusinessStrongholdAttribute _psa = bussinessStrongholdAttributes[i];
                bussinessStrongholdAttributes[i] = bussinessStrongholdAttributes[0];
                bussinessStrongholdAttributes[0] = _psa;
               // isReset = true;
                break;
            }
        
    }
    
    }
    #endregion


   




    private IEnumerator CheckBussinessSHPortol()
    {
        int count = bussinessStrongholdAttributes.Count;
        for(int i = 0 ; i < count; i++)
        {
            BusinessStrongholdAttribute b = bussinessStrongholdAttributes[i];
            AndaDataManager.Instance.GetStrongholdImg(b.strongholdIndex, b.headImage, UpdateBussinessStrongholdHeadImange);
            yield return null;
        }
    }

    private void UpdateBussinessStrongholdHeadImange(int _index, Sprite _sprite)
    {
        businessStrongholdItems.FirstOrDefault(s=>s.dataIndex == _index).UpdatePorImage(_sprite);
        Debug.Log(_index);
    }


   
    /*public void BuildStrongholdDrawData()
    {
        strongholdDraws = new List<LD_Objs>();

        CD_ShDrawings cD_ShDrawings = MonsterGameData.GetShDrawingAttribute();
        int count = cD_ShDrawings.objectName.Count;// 通过名字的数量，获取配置文件的数量
        List<LD_Objs> playerStrongholdDraw = AndaDataManager.Instance.GetPlayerConsumableForStrongholdDraw();
        for (int i = 0; i < count; i++)
        {
            int id = cD_ShDrawings.objectID + i;
            LD_Objs tmpLDObjs = playerStrongholdDraw.FirstOrDefault(s=>s.objID == id);
            if(tmpLDObjs!=null)
            {
                strongholdDraws.Add(tmpLDObjs);
            }else
            {
                tmpLDObjs =new LD_Objs
                {
                    objID = id,
                    objSmallID = i,
                    objName = cD_ShDrawings.objectName[i],
                    lessCount = 0,
                };
                strongholdDraws.Add(tmpLDObjs);
            }
        }
    }*/

    //建造一个据点，等级为1
    public void BuildTmptower()
    {
        if(tmpToweritem!=null)AndaDataManager.Instance.RecieveItem(tmpToweritem);
        //构建玩家据点
        tmpToweritem = AndaDataManager.Instance.InstantiateTower<BuildTmpTower>(ONAME.BuildTowerItem);
        tmpToweritem.SetInto(AndaMap.Instance.andaMapController.Root);
        tmpToweritem.gameObject.SetLayer(ONAME.LayerDeafualt);

    }

    public void BuildTmpExchange()
    {
        if(tmpExchangeItem!=null) AndaDataManager.Instance.RecieveItem(tmpExchangeItem);
        tmpExchangeItem = AndaDataManager.Instance.InstantiateMenu<ExchangeUIItem_TmpSet>(ONAME.MapUIItemShboard_Exchange_Tmp);
        tmpExchangeItem.SetInto(getm_Menu.transform);
        tmpExchangeItem.SetInfo(mapController.ComfirmSetExchangeHere, mapController.CancelSetExchangeHere);

    }


    public void BuildStrongholdEditorBar(string locationContent)
    {
        if(jIRVISEditorboard_StrongholdholdInfo == null)
        {
            jIRVISEditorboard_StrongholdholdInfo = AndaDataManager.Instance.InstantiateMenu<JIRVISEditorboard_StrongholdholdInfo>(ONAME.JIRVISEditorBar_StrongholdInfo);
            jIRVISEditorboard_StrongholdholdInfo.transform.SetInto(JIRVIS.Instance.jIRVISData.getJIRVISBar.EditorboardPoint.transform);
        }
        jIRVISEditorboard_StrongholdholdInfo.SetTargetActiveOnce(true);
        jIRVISEditorboard_StrongholdholdInfo.SetInfo(locationContent,0,-1,AndaGameExtension.GetCurrentUnixTime());
        jIRVISEditorboard_StrongholdholdInfo.FadeIn();
    }

    public void BuildExchangeSHForAddtion(Exchange _exchange)
    {
        if(mineExchagnesAttributes == null) mineExchagnesAttributes = new List<Exchange>();
        mineExchagnesAttributes.Add(_exchange);
        Vector2d vector2D = new Vector2d(_exchange.exchangePositionx, _exchange.exchangePositiony);
        Vector3 v3d = AndaMap.Instance.ConvertGeopointToGameworldpoint(vector2D);
        mineExchangeSHWorldPose.Add(v3d);
        MapUIItem_icon_lvBoard_Name _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_exchangeSH);
        _item.transform.SetInto(mapMenu.itemBox);
        _item.SetInfo(_exchange,Vector3.zero);
        if(minePlayerStrongholdItems == null) minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
        mineExchangeStrongholdItems.Add(_item);

    }

    public void BuildStrongholdForAddition(PlayerStrongholdAttribute _pma)
    {
        if(selfPlayerStrongholdAttributes == null)selfPlayerStrongholdAttributes = new List<PlayerStrongholdAttribute>();
        selfPlayerStrongholdAttributes.Add(_pma);
        _pma.strongholdInMapPosition = tmpToweritem.transform.position;
        PlayerStrongholdAttribute p = selfPlayerStrongholdAttributes.FirstOrDefault(s=>s.strongholdIndex == _pma.strongholdIndex);
        MapUIItem_icon_lvBoard_Name _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
        _item.transform.SetInto(mapMenu.itemBox);
        _item.SetInfo(p);
        if (minePlayerStrongholdItems == null) minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
        minePlayerStrongholdItems.Add(_item);
    }

   
    public void BuildJIRVISEditor_ChanllengeGameStorngholdInfomationBar(PlayerStrongholdAttribute playerStrongholdAttribute , PlayerMonsterAttribute playerMonster)
    {
      
    }

    public void RemoveJIRVISEditor_ChanllengeGameStorngholdInfomationBar()
    {
        if(jIRVISContent_ChanllengeGameStronghold == null)return;
        AndaDataManager.Instance.RecieveItem(jIRVISContent_ChanllengeGameStronghold);
        jIRVISContent_ChanllengeGameStronghold = null;
    }

    public void BuildMinePlayerStrongholdInfomation(PlayerStrongholdAttribute _psa)
    {
        MapBar_MineStrongholdInformationBar mapBar_MineStrongholdInformationBar = 
            AndaDataManager.Instance.InstantiateMenu<MapBar_MineStrongholdInformationBar>(ONAME.MapBar_MineStrongholdInformationBar);
        mapBar_MineStrongholdInformationBar.SetInto(AndaUIManager.Instance.jirvis_top);
        mapBar_MineStrongholdInformationBar.SetInfo(_psa);
    }
    public void BuildOtherPlayerStrongholdInformation(PlayerStrongholdAttribute _psa ,PlayerMonsterAttribute _pma, System.Action<bool> PlayerComfirmGame, System.Action callbackClose)
    {
        JIRVISContent_ChanllengeGameStrongholdInfo other = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_ChanllengeGameStrongholdInfo>(ONAME.JIRVISEditorBar_ChanllengeGameStrongholdInfo);
        other.transform.SetUIInto(JIRVIS.Instance.jIRVISData.getJIRVISBar.EditorboardPoint.transform);
        other.SetInfo(_pma, _psa);
        other.CallBackResult = PlayerComfirmGame;
        other.callbackClose = callbackClose;
    }

    public void SelectStrongholdDrawItem(int ID)
    {
        /*int shID = AndaDataManager.Instance.ConverStrongholIDFromDraw(ID);
        RecieveTmptowerItem();
        tmpToweritem = AndaDataManager.Instance.InstantiateTower(shID.ToString()) as TowerBase;
        StrongholdBaseAttribution strongholdBaseAttribution = new StrongholdBaseAttribution
        {
            strongholdID = 30000
        };
        tmpToweritem.SetInfo(strongholdBaseAttribution);
        tmpToweritem.gameObject.SetLayer(ONAME.LayerDeafualt);
        tmpToweritem.SetInto(AndaMap.Instance.andaMapController.Root);
        tmpToweritem.SetScalePercent(4f);
        int baseIndex= OTYPE.GetSmallSmallID(shID);
        tmpToweritem.SkinStone();*/
      
    }

    public void SetRightPlayerStrongholdIndex(int _playerStrongholdIndex)
    {
        rightStrongholdIndex = _playerStrongholdIndex;
    }

    public void SetCurrentPlayerstrongholdIndex(int _strongholdIndex)
    {
        currentSelectSelfStrongholdIndex =_strongholdIndex;
    }

    public void SetBuildStrongholdState(bool _state)
    {
        buildStrongholdstate = _state;
    }

    public void SetOpenchildBar(bool state)
    {
        isOpenJirvisChildBar = state;
    }


    public void SetWaitForSetTmpStronghold(bool isSet)
    {
        isForSetTmpStronghold = isSet;
    }
    /// <summary>
    /// 设置相机视角。3D/2D
    /// </summary>
    /// <param name="isMap2D">If set to <c>true</c> is map2 d.</param>
    public void SetMapViewAnlge(bool isMap2D)
    {
        curMapIs2D = isMap2D;
    }

    public void SetCurCamera()
    {
        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.AR)
        {
            curCamera = ARMonsterSceneDataManager.Instance.mainCamera;
        }else
        {
            curCamera = ARMonsterSceneDataManager.Instance.MapCamera;
        }
        
    }
    /// <summary>
    /// 当前选择显示据点标签
    /// </summary>
    /// <param name="type">Type.</param>
    public void SetCurChooseDisplaySHType(int type)
    {
        currentChooseDiplaySHType = type;
    }



    public void RamdonBuildPoint()
    {
        /*int count = 30;
        float x = Random.Range(-30,30);
        float z = Random.Range(-30,30);
*/
    }

    public Vector3 ExchangeWolrdPose(Exchange exchange)
    {
        if(exchange.userIndex == AndaDataManager.Instance.userData.userIndex)
        {
            int count = mineExchagnesAttributes.Count;
            for(int i = 0; i < count; i++)
            {
                if(mineExchagnesAttributes[i].exchangeIndex == exchange.exchangeIndex)
                {
                    return mineExchangeSHWorldPose[i];
                }
            }
           
        }else
        {
            int count = otherExchangeAttributes.Count;
            for (int i = 0; i < count; i++)
            {
                if (otherExchangeAttributes[i].exchangeIndex == exchange.exchangeIndex)
                {
                    return otherExchangeSHWorldPose[i];
                }
            }
        }

        return Vector3.zero;
    }

}

public class SelectSHData
{
    public int selectSHIndex{get;set;}
    public int type {get;set;}
}
