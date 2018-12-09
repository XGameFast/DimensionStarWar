using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AstrologylobbyData : ControllerData
{


    public enum BtnType
    {
        none,
        func,
        monster,
    }

    #region 全局
    public int getCurSelectItemID
    {
        get {return curSelectMonsterID ;}
    }
    public int getCurSelectMonsterItemIndex
    {
        get { return curSelectMonsterItemIndex; }
    }
    public AstologyMenu getAstrologyMenu
    {
        get { return astologyMenu; }
    }

    public DimensionRoom getDimensionRoom
    {
        get { return dimensionRoom; }
    }

    public int getCurShowItemType
    {
        get { return currentShowItemType; }
    }

    public List<AndaObjectBasic> getGridItemList
    {
        get { return gridItemList; }
    }

    public PlayerStrongholdAttribute getCurPlayerstronghold
    {
        get { return currentPlayerStronghold; }
    }

    public int GetCurStrongholdMonsterCount
    {
        get {return playerMonsters.Count;}
    }

    public MonsterBasic getSingleItem{get {return singleItem ;}}
    public BtnType currentBtnType;

    #endregion

    #region 局部变量
    private List<AndaObjectBasic> gridItemList;//显示的物件的list，包括VV模式里的bars
    private MonsterBasic singleItem;
    private DimensionRoom dimensionRoom;
    private AstrologyController astrologyController;
    private AstologyMenu astologyMenu;
    private List<PlayerMonsterAttribute> playerMonsters;
    private PlayerStrongholdAttribute currentPlayerStronghold;
    private GameObject messageBar;
    private List<GameObject> messageList;
   

    private int curSelectMonsterItemIndex;
    private int curSelectMonsterID;



    //用于确定当是显示 0=宠物， 1= 其他玩家的据点 2 = 商家据点 3 = 其他玩家的宠物， 4= 商家据点的怪兽
    private int currentShowItemType;
    #endregion

    #region 临时变量

    #endregion


    public void ReciveItem()
    {
        gridItemList.RecieveListByAndaData();
    }
    public void RecieveSingleItem()
    {
        if (singleItem != null)
        {
            AndaDataManager.Instance.RecieveItem(singleItem);
            singleItem =null;
        }
    }

    private void ClearItem()
    {
        if (gridItemList == null) return;
        if (gridItemList.Count == 0) return;
        ReciveItem();
        gridItemList.Clear();
    }

    public void InitValue()
    {
        currentShowItemType = -1;
        curSelectMonsterItemIndex = -1;
         if (messageBar!=null&&messageBar.activeSelf)
        {
            messageBar.SetActive(false);
        }
    }

    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        astrologyController = baseController as AstrologyController;
        InitValue();
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        astologyMenu = m_Menu as AstologyMenu;
        astologyMenu.InitMenu(astrologyController);
    }

    public void BuildPlayerStrongholdData()
    {
        currentPlayerStronghold = AndaDataManager.Instance.GetPlayerCurrentStrongholdData(JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex);
    }

    public void BuildMonsterData()
    {
        playerMonsters = AndaDataManager.Instance.GetPlayerMonsterAttributeBelongThisStronghold(currentPlayerStronghold.strongholdIndex);
    }

    public void BuildDimensionRoom(System.Action callback_finish)
    {
        if (dimensionRoom == null)
        {
            dimensionRoom = AndaDataManager.Instance.InstantiateOtherObj<DimensionRoom>(ONAME.DimensionRoom);
            dimensionRoom.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        }
        dimensionRoom.StartBuildDimensionRoom(callback_finish);
    }




    public void AddItem(AndaObjectBasic item)
    {
        if (gridItemList == null) gridItemList = new List<AndaObjectBasic>();
        gridItemList.Add(item);
    }



    public void SetPreloadMonsterPrefab()
    {
        //List<int> list = AndaDataManager.Instance.GetUserMonsterIDs(JIRVIS.Instance.jIRVISData.getCurrentDimensionRoomIndex);
        //List<int> list =new List<int>{1000};
        //AndaDataManager.Instance.PreloadMonsterPrefab(list);
    }

    public void ShowStrongholdMessage(List<StrongholdMessage> list)
    {
        if (astologyMenu != null)
        {
            if (messageBar == null)
            {
                messageBar = astologyMenu.transform.Find("MessageBar").gameObject;
                var item = messageBar.transform.GetChild(0);
                if (messageList == null)
                    messageList = new List<GameObject>();
            }
            messageBar.SetActive(true);
            if (astologyMenu.gridStrongholdMessage.childCount > 0)
                return;
                messageList.Clear();
            foreach (var m in list)
            {
                var item = messageBar.transform.GetChild(0);
                var _item = item.gameObject.Clone();
                _item.transform.SetUIInto(astologyMenu.gridStrongholdMessage);
                _item.transform.GetChild(0).GetComponent<Text>().text = m.writeUserName;
                _item.transform.GetChild(1).GetComponent<Text>().text = m.message;
                messageList.Add(_item);
            }
        }
    }

    public void CloseStrongholdMessage()
    {
        messageBar.SetActive(false);
    }

    //ForVV
    public void BuildMonsterItemForVV()
    {
        if(singleItem!=null) RecieveSingleItem();
        singleItem = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(curSelectMonsterID.ToString());
        singleItem.gameObject.SetLayer(ONAME.LayerUI);
        singleItem.transform.SetInto(astologyMenu.monsterPoint);
        singleItem.GetComponent<MonsterBasic>().ControllerToPlayMoodForSayHello00();
    }

    //ForAR
    public void BuildMonsterItemForAR()
    {
        if(singleItem!=null) RecieveSingleItem();
        singleItem = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(curSelectMonsterID.ToString());
        singleItem.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        singleItem.gameObject.SetLayer(ONAME.LayerDeafualt);
       
    }

    public void NotifyToMenuOpenMonsterPowerBar()
    {
        getAstrologyMenu.UpdateMonsterPowerBar(singleItem.powerBarPoint,playerMonsters[curSelectMonsterItemIndex]);
    }

    //设置当前选择的宠物游标， 和  ID
    public void SetCurrentSelectMonsterItemIndex(int _index)
    {
        curSelectMonsterItemIndex = _index;

        curSelectMonsterID = playerMonsters[_index].monsterID;
    }

    public PlayerMonsterAttribute GetMonsterAttribute(int _index)
    {
        return playerMonsters[_index];
    }

    public int GetMonsterItemIndexByData(PlayerMonsterAttribute _data)
    {
        return playerMonsters.IndexOf(_data);
    }
}
