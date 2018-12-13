using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mapbox.Utils;
using Mapbox.Unity.Location;
using System.Linq;
public class MapCtrData : ControllerData {

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


    public List<int> getOtherPlayerStrongholdIndex { get {return  otherPlayerStrongholdIndexList ; }}
    public List<int> getBussinessStrongholdIndex {get {return bussinessStrongholdIndexList ; }}
    public List<int> getMinePlayerStrongholdIndex {get {return minePlayerStrongholdIndexList;}}

    public bool isOpenJirvisChildBar =false;
    public TowerBase mapCameraHitToweritem;

    public Camera GetCurCamera{get {return curCamera ;} }

    private int currentSelectSelfStrongholdIndex;
    private Camera curCamera;
    private MapMenu mapMenu;
    private MapController mapController;

    private List<PlayerStrongholdAttribute> otherPlayerStrongholdAttributes;
    private List<BusinessStrongholdAttribute> bussinessStrongholdAttributes;
    private List<PlayerStrongholdAttribute> selfPlayerStrongholdAttributes;
    private List<int> minePlayerStrongholdIndexList;
    private List<int> otherPlayerStrongholdIndexList;
    private List<int> bussinessStrongholdIndexList;
    private List<MapUIItem_icon_lvBoard_Name> otherPlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
    private List<MapUIItem_icon_lvBoard_Name> minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
    private List<MapUIItem_icon_lvBoard_Name> businessStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
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


    //用于判断是否可以建立据点 
    private bool buildStrongholdstate = false;
    public PlayerStrongholdAttribute curMineStrongholdAttr;
    public bool isCheckReward;
    public int shDisplayType = 4;
    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        mapController = baseController as MapController;
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        mapMenu = m_Menu as MapMenu;
    }
    public void InitData()
    {


        isCheckReward =false;
        isOpenJirvisChildBar = false;
        isWait=false;
        currentShowItemType = -1;


      

        RemoveAllMineStronghold();
        if(selfPlayerStrongholdAttributes!=null)selfPlayerStrongholdAttributes.Clear();
        if(minePlayerStrongholdIndexList!=null)minePlayerStrongholdIndexList.Clear();
        RemoveAllOtherPlayerStronghold();

        if(otherPlayerStrongholdAttributes!=null) otherPlayerStrongholdAttributes.Clear();
        if(otherPlayerStrongholdIndexList!=null)otherPlayerStrongholdIndexList.Clear();

        RemoveAllBussinessStronghold();
        if(bussinessStrongholdAttributes!=null)bussinessStrongholdAttributes.Clear();
        if(bussinessStrongholdIndexList!=null)bussinessStrongholdIndexList.Clear();
       
        RemoveJIRVISEditorbarForStrongholdInfo();
        RemoveJIRVISEditor_ChanllengeGameStorngholdInfomationBar();

        RemoveCurrentLocationPointItem();
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

    public void GetOtherStrongholdListwithCurrentplayerLocation(System.Action<List<PlayerStrongholdAttribute>,List<BusinessStrongholdAttribute>> callback,List<double>location)
    {
        AndaDataManager.Instance.CallServerGetCurrentLocaitonRangeOfOtherData(location,callback);
    }

    public void BuildCurrentLocationPoint()
    { 
        if(currentLocationPointUIItem!=null) AndaDataManager.Instance.RecieveItem(currentLocationPointUIItem);
        currentLocationPointUIItem = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_UserPor>(ONAME.MapUIItemShboard_LocationPoint);
        currentLocationPointUIItem.SetInto(mapMenu.itemBox);
    }

    /// <summary>
    /// 设置地图上据点的数据,从服务器来
    /// </summary>
    /// <param name="psalist">Psalist.</param>
    /// <param name="bsalist">Bsalist.</param>
    public void SetLocaitonRangeUserData(List<PlayerStrongholdAttribute> psalist, List<BusinessStrongholdAttribute> bsalist )
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

        if(bussinessStrongholdAttributes!=null) bussinessStrongholdAttributes.Clear();
         
        bussinessStrongholdAttributes = bsalist;
        count = bussinessStrongholdAttributes.Count;
        for(int i = 0; i < count;i ++)
        {
            Vector2d vector2D = new Vector2d(bussinessStrongholdAttributes[i].strongholdPosition[0],bussinessStrongholdAttributes[i].strongholdPosition[1]);
            bussinessStrongholdAttributes[i].strongholdInMapPosition = AndaMap.Instance.ConvertGeopointToGameworldpoint(vector2D);
        }

        Vector2d locationV2d  = AndaLocaltion.Instance.currentLocation.LatitudeLongitude;
        curLocationInMapPostion = AndaMap.Instance.ConvertGeopointToGameworldpoint(locationV2d);
    }

  

    public void InsertOtherPlayerStrongholdIndex(int _index)
    {
        if(otherPlayerStrongholdIndexList == null) otherPlayerStrongholdIndexList = new List<int>();
        otherPlayerStrongholdIndexList.Add(_index);
    }

    public void InsertBussinessStrongholdIndex(int _index)
    {
        if(bussinessStrongholdIndexList == null) bussinessStrongholdIndexList = new List<int>();
        bussinessStrongholdIndexList.Add(_index);
    }


    public void BuildMineSHUI()
    {
        RemoveAllMineStronghold();
        int count = selfPlayerStrongholdAttributes.Count;
        for(int i = 0 ; i < count; i ++ )
        {
            PlayerStrongholdAttribute p = selfPlayerStrongholdAttributes[i];
            MapUIItem_icon_lvBoard_Name _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
            _item.transform.SetInto(mapMenu.itemBox);
            _item.SetInfo(p);
            _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
            if (minePlayerStrongholdItems == null) minePlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
            minePlayerStrongholdItems.Add(_item);
        }
    }

    public void BuildAnotherPlayerSHUI()
    {
        RemoveAllOtherPlayerStronghold();
        int count = otherPlayerStrongholdAttributes.Count;
        for (int i = 0; i < count; i++)
        {
            PlayerStrongholdAttribute p = otherPlayerStrongholdAttributes[i];
            MapUIItem_icon_lvBoard_Name _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_PlayerSH);
            _item.transform.SetInto(mapMenu.itemBox);
            _item.SetInfo(p);
            _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
            if (otherPlayerStrongholdItems == null) otherPlayerStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
            otherPlayerStrongholdItems.Add(_item);
        }
    }


    public void BuildAllRangeBussinessStrongholdItems()
    {
        RemoveAllBussinessStronghold();
        int count = bussinessStrongholdAttributes.Count;
        for(int i = 0 ; i < count; i++)
        {
            BusinessStrongholdAttribute p = bussinessStrongholdAttributes[i];
            MapUIItem_icon_lvBoard_Name _item = AndaDataManager.Instance.InstantiateMenu<MapUIItem_icon_lvBoard_Name>(ONAME.MapUIItemShboard_BussinesssSH);
            _item.transform.SetInto(mapMenu.itemBox);
            Sprite imgPor = AndaDataManager.Instance.GetStrongholdPorSprite(p.statueID.ToString());
            Sprite levelBoard = AndaDataManager.Instance.objdataManager.GetBussinessStrongholdLevelSprite(p.strongholdLevel);
            _item.SetInfo(p);
            _item.RegisterClickCallBack(mapController.ClickSelectMapItem);
            if (businessStrongholdItems == null) businessStrongholdItems = new List<MapUIItem_icon_lvBoard_Name>();
            businessStrongholdItems.Add(_item);
        }
        mapController.StartCoroutine(CheckBussinessSHPortol());
    }

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
        if(jIRVISContent_ChanllengeGameStronghold == null)jIRVISContent_ChanllengeGameStronghold = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_ChanllengeGameStrongholdInfo>(ONAME.JIRVISEditorBar_ChanllengeGameStrongholdInfo);
        jIRVISContent_ChanllengeGameStronghold.transform.SetUIInto(JIRVIS.Instance.jIRVISData.getJIRVISBar.EditorboardPoint.transform);
        jIRVISContent_ChanllengeGameStronghold.SetInfo(playerMonster,playerStrongholdAttribute);
        jIRVISContent_ChanllengeGameStronghold.FadeIn();
    }

    public void RemoveJIRVISEditor_ChanllengeGameStorngholdInfomationBar()
    {
        if(jIRVISContent_ChanllengeGameStronghold == null)return;
        AndaDataManager.Instance.RecieveItem(jIRVISContent_ChanllengeGameStronghold);
        jIRVISContent_ChanllengeGameStronghold = null;
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



    public void RamdonBuildPoint()
    {
        /*int count = 30;
        float x = Random.Range(-30,30);
        float z = Random.Range(-30,30);
*/
    }

}
