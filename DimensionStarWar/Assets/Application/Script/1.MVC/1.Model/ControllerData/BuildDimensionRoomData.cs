using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class BuildDimensionRoomData :ControllerData {

    private BuildDimensionRoomController dimensionRoomController;
    //获取宠物数据 ，临时保存的， 用于放置崭新庭里的
    public PlayerMonsterAttribute getTmpMonsterAttributeForSetStronghold
    {
        get
        {
            return tmpSetMonsterAttribute;
        }
    }
    public int getCurSelectMonsterItemIndex
    {
        get {return curSelectMonsterItemIndex ;}
    }

    public DimensionSpace getDimensionSpace
    {
        get {return dimensionSpace ;}
    }

    public BuildDimensionMenu_RoomInfoBar getCurInfoBar 
    {
        get {return getDimensionMenu.infoItems[curSelectItemIndex]; }
    }
    public TowerMonster1002 getTmpMedal
    {
        get {return tmpMedalForAR ;}
    }
    public int getCurSelectItemIndex
    {
        get {return curSelectItemIndex ; }
    }
    public int getLastSelectItemIndex
    {
        get {return lastSelectItemIndex ;}
    }
    public int getCurSelectStrongholdID
    {
        get {return playerStrongholdAttributeList[curSelectItemIndex].strongholdID ;}
    }
    public List<PlayerStrongholdAttribute> getPlayerSHAData
    {
        get { return playerStrongholdAttributeList;  }
    }

    public List<PlayerMonsterAttribute> getPlayerMonsters 
    {
        get {return playerMonsters;}
    }
    public PlayerStrongholdAttribute getCurStrongholdAtrrobute
    {
        get {return getPlayerSHAData[curSelectItemIndex];}
    }
   

    public bool getIsSelectDimensionRoomItem
    {
        get { return isSelectItem; }
    }
    public AndaObjectBasic getDimensionroomBox
    {
        get { return dimensionRoomBox; }
    }
    public AndaArcTargetBaisc getAndaArcTargetBaisc
    {
        get { return andaArcTargetBaisc; }
    }

    public AndaObjectBasic getGroundPlane
    {
        get { return groundItem; }
    }
    public BuildDimensionRoomMenu getDimensionMenu
    {
        get {return buildDimensionRoomMenu ;}
    }
    public int tmpStrongholdIndex;

    private List<PlayerStrongholdAttribute> playerStrongholdAttributeList;
    public PlayerMonsterAttribute getCurMonsterAttribute
    {
        get {
            if (playerMonsters == null || playerMonsters.Count == 0)
                return null;
            else if (curSelectMonsterItemIndex >= playerMonsters.Count)
                return playerMonsters[0];
            else
                return playerMonsters[curSelectMonsterItemIndex];
        }
    }
   
    private AndaArcTargetBaisc andaArcTargetBaisc;
    private bool isSelectItem = false;
    private AndaTool_FingerEvent andaTool_FingerEvent;
    private AndaObjectBasic dimensionRoomBox;
    private BuildDimensionRoomMenu buildDimensionRoomMenu;
    private AndaObjectBasic groundItem;
    private AndaObjectBasic currentTowerObj;
    /// <summary>
    /// 这个 Index 是指 列表的 游标
    /// </summary>
    private int curSelectItemIndex;
    private int lastSelectItemIndex = -1;
    public int vvModelLastSelectItemIndex = -1;
    public bool isInAstrolog =false;//是否在占星庭
    private int curSelectMonsterItemIndex = 0;
    private DimensionRoomItemForAR currentDRItemAR;
    private TowerMonster1002 tmpMedalForAR;
    private DimensionSpace dimensionSpace;
    private MonsterBasic curMonster;
    private List<PlayerMonsterAttribute> playerMonsters = null;
    private MonsterSkillBoard monsterSkillBoard;
    private PlayerMonsterAttribute tmpSetMonsterAttribute;//将空闲的宠物放入占星庭，用于零时保存数据

    public MonsterShowCenter monsterShowCenter;

    public void RecieveItemForVV()
    {
        buildDimensionRoomMenu.ClearItem();
        RecieveMonsterItem();
    }
    public void RecieveItemForAR()
    {
        if(currentDRItemAR!=null)
        {
            AndaDataManager.Instance.RecieveItem(currentDRItemAR);
            currentDRItemAR = null;
        }
        RecieveTmpMedal();

        RecieveMonsterItem();
    }

    public void RecieveTmpMedal()
    {
        if(tmpMedalForAR!=null)
        {
            AndaDataManager.Instance.RecieveItem(tmpMedalForAR);
            tmpMedalForAR = null;
        }
    }

    public void RecieveDimensionSpace()
    {
        if(dimensionSpace!=null)
        {
            AndaDataManager.Instance.RecieveItem(dimensionSpace);
            dimensionSpace = null;
        }

        if(monsterShowCenter!=null)
        {
            AndaDataManager.Instance.RecieveItem(monsterShowCenter);
        }
    }

    public void RecieveMonsterItem()
    {
        if(curMonster!=null)
        {
            AndaDataManager.Instance.RecieveItem(curMonster);
            curMonster = null;
        }
    }

    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        dimensionRoomController = baseController as BuildDimensionRoomController;

    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        buildDimensionRoomMenu = m_Menu as BuildDimensionRoomMenu;
        buildDimensionRoomMenu.GetComponent<RectTransform>().sizeDelta = new Vector2(Screen.width, Screen.height);
        buildDimensionRoomMenu.FadeIn();
    }

    public override void RemoveMenu()
    {
        base.RemoveMenu();
        buildDimensionRoomMenu = null;
    }

    public void InitValue()
    {
        CloseMonsterSkillBoard();
        RemoveMenu();
        InitPlayerStrongholdList();
        InitMonsterList();
        InitArcTargetBasic();
        RemoveFingerEvent();
        DestroyDimensionRoomBox();
        RemoveDimensionGround();
        curSelectItemIndex = 0;//据点itemindex
        curSelectMonsterItemIndex = 0; //monsterItemIndex
       
        lastSelectItemIndex = -1;
        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.AR)
        {
            RecieveItemForAR();
        }

        //dimensionRoomController = null;
    }

    private void InitPlayerStrongholdList()
    {
        if (playerStrongholdAttributeList == null)
            playerStrongholdAttributeList = new List<PlayerStrongholdAttribute>();
        else
            playerStrongholdAttributeList.Clear();
    }
    private void InitMonsterList()
    {
        if(playerMonsters!=null)
        {
            playerMonsters.Clear();
        }
    }
    private void InitArcTargetBasic()
    {
        if (andaArcTargetBaisc != null)
        {
            andaArcTargetBaisc.DestroyByAndaDataManager();
        }
    }

    private void RemoveFingerEvent()
    {
        if (andaTool_FingerEvent != null)
        {
            if (dimensionRoomController != null)
            {

              dimensionRoomController.gameObject.RemoveComponemont<AndaTool_FingerEvent>();
                andaTool_FingerEvent = null;
            }
        }
    }


    private void RemoveDimensionGround()
    {
        if (groundItem != null)
        {
            groundItem.DestroyByAndaDataManager();
        }
    }

    public void DestroyDimensionRoomBox()
    {
        if (dimensionRoomBox != null)
        {
            dimensionRoomBox.DestroyByAndaDataManager();
        }
    }
     

    //-----Build



    public void BuildPlayerStrongholdAttributeData()
    {
        playerStrongholdAttributeList = AndaDataManager.Instance.GetPlayerAllStrongholdAttribute();
    }

    public void BuildArcLine()
    {
        InitArcTargetBasic();
        andaArcTargetBaisc = AndaDataManager.Instance.InstantiateOtherObj<AndaArcTargetBaisc>(ONAME.ArcLine);
        andaArcTargetBaisc.SetInto(ARMonsterSceneDataManager.Instance.mainCamera.transform);
        andaArcTargetBaisc.SetLine();
    }

    public void BuildFingerEvent(System.Action callback ,int dragType)
    {
        if (andaTool_FingerEvent == null)
        {
            andaTool_FingerEvent = dimensionRoomController.gameObject.AddComponent<AndaTool_FingerEvent>();
            andaTool_FingerEvent.SetListenererticalDragEvent(dragType,callback);
        }
    }

    public void BuildRoomObjItem()
    {
        if (dimensionRoomBox == null)
        {
            dimensionRoomBox = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>(ONAME.DimensionRoomBox);
            dimensionRoomBox.SetInto(ARMonsterSceneDataManager.Instance.frontCameraPoint);
        }
    }

    public void BuildGround()
    {
        if (groundItem == null)
        {
            groundItem = AndaDataManager.Instance.InstantiateOtherObj(ONAME.DimensionGround);
        }

        //设置 虚拟地面的位置
        groundItem.transform.position = ARMonsterSceneDataManager.Instance.GetCameraPostionWithARWorldY();
    }

    public void BuildDimension_RoomInfoBarForVV(System.Action callback ,System.Action callbackAddStronghold,System.Action<int,int>finishDragCallback)
    {

        buildDimensionRoomMenu.BuildInfoBar(playerStrongholdAttributeList ,callback,callbackAddStronghold,finishDragCallback );
     
    }

    public  void BuildMonsterList()
    {
        playerMonsters = AndaDataManager.Instance.GetPlayerMonsterAttributeBelongThisStronghold(getCurStrongholdAtrrobute.strongholdIndex);
    }

    public void BuildTmpMedal()
    {
        if(tmpMedalForAR!=null) AndaDataManager.Instance.RecieveItem(tmpMedalForAR);
        int medallevel = playerStrongholdAttributeList[curSelectItemIndex].medalLevel;
        int medalStutsId = playerStrongholdAttributeList[curSelectItemIndex].statueID;
        tmpMedalForAR = AndaDataManager.Instance.GetMedalItemEasy(medallevel , medalStutsId);
        tmpMedalForAR.SetAlpha(0.3f);
        tmpMedalForAR.gameObject.SetLayer(ONAME.LayerUI);
    }

    public void BuildDimensionRoomItemForAR()
    {
        if(currentDRItemAR!=null)AndaDataManager.Instance.RecieveItem(currentDRItemAR);
        currentDRItemAR = AndaDataManager.Instance.InstantiateOtherObj<DimensionRoomItemForAR>(ONAME.DimensionRoomItemForAR);
        currentDRItemAR.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        currentDRItemAR.transform.localPosition += new Vector3(0, 0 - 10f);
        currentDRItemAR.SetInfo(playerStrongholdAttributeList[curSelectItemIndex]);
        currentDRItemAR.transform.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(currentDRItemAR.selfPostion);
        currentDRItemAR.SetVitrulScale();
        currentDRItemAR.gameObject.SetLayer(ONAME.LayerDeafualt);
        currentDRItemAR.FadeIn();
    }

    public void BuildDimensionRoomSpace()
    {
        if(dimensionSpace == null)
        {
            dimensionSpace = AndaDataManager.Instance.InstantiateOtherObj<DimensionSpace>(ONAME.DimensionSpace);
            dimensionSpace.SetInto(ARMonsterSceneDataManager.Instance.gameWorld.transform);

        }

        if(monsterShowCenter == null)
        {
            monsterShowCenter = AndaDataManager.Instance.InstantiateOtherObj<MonsterShowCenter>(ONAME.MonsterShowCenter);
            monsterShowCenter.SetInto(null);
            monsterShowCenter.SetARGround(false);
            monsterShowCenter.PlayCameraMove(2);//2号几位
            monsterShowCenter.CameraDepth((int)ARMonsterSceneDataManager.Instance.UICamera.depth -1);
        }
    }



    public void BuildMonsterFadeInEffect()
    {
    
        AndaObjectBasic fadeInEffect = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>(ONAME.MonsterFadeInEffectName);
        if(JIRVIS.Instance.isARType)
        {
            fadeInEffect.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        }else
        {
            fadeInEffect.SetInto(dimensionSpace.transform);
        }
       
    }

    public void BuildMonsterSkillBoard()
    {
        if(monsterSkillBoard!=null)AndaDataManager.Instance.RecieveItem(monsterSkillBoard);
        monsterSkillBoard = AndaDataManager.Instance.InstantiateMenu<MonsterSkillBoard>(ONAME.MonsterSkillBoard);
       // monsterSkillBoard.BuildMonsterSkillBoardWithTest(getCurMonsterAttribute.monsterSkillIDList,curMonster.ControllerToChangeSkill,curMonster.ControllerToAttak);
       // monsterSkillBoard.ActiveBoard(true);
    }

    public void CloseMonsterSkillBoard()
    {
        if(monsterSkillBoard!=null)
        {
            monsterSkillBoard.ActiveBoard(false);
            AndaDataManager.Instance.RecieveItem(monsterSkillBoard);
        }
    }


    public void InvockBuildMonsterItem()
    {

        if(getCurMonsterAttribute == null)return;

        if (JIRVIS.Instance.isARType) //AR模式不走 center show
        {
            if(curMonster!=null)AndaDataManager.Instance.RecieveItem(curMonster);
            curMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(getCurMonsterAttribute.monsterID.ToString());
            curMonster.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
            curMonster.SetVitrulScale();
            curMonster.transform.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(curMonster.selfPostion);
        }else
        {

            if (monsterShowCenter == null)
            {
                monsterShowCenter = AndaDataManager.Instance.InstantiateOtherObj<MonsterShowCenter>(ONAME.MonsterShowCenter);
                monsterShowCenter.SetInto(null);

            }

            monsterShowCenter.SetMonster(getCurMonsterAttribute.monsterID.ToString());

        }

    }


    public void SetCurSelectMonsterItemIndex(int _itemIndex)
    {
        curSelectMonsterItemIndex = _itemIndex;
    }

    public void SetCurSelectRoomItemIndex(int _index)
    {
        curSelectItemIndex =_index;
        Debug.Log("curSelectItemIndex" + curSelectItemIndex);
        if(!JIRVIS.Instance.isARType) //JIRVIS.Instance.isARType 等同于  currentDisplayType == OTYPE.GameDisplayType.AR;
        {
            int count = getDimensionMenu.infoItems.Count;
            for(int i = 0 ; i < count; i ++)
            {
                getDimensionMenu.infoItems[i].UpdateCurItemIsSelf(curSelectItemIndex);
            }
        }
        if(getDimensionMenu.infoItems.Count > 1  && curSelectItemIndex != getDimensionMenu.infoItems.Count-1 )
        {
            tmpStrongholdIndex = playerStrongholdAttributeList[curSelectItemIndex].strongholdIndex;
            JIRVIS.Instance.SetCurrentDimensionroomIndex(tmpStrongholdIndex);
        }
    }


    public void ShowCurrentItemOnlyReposition()
    {
        buildDimensionRoomMenu.ShowCurrentItem(curSelectItemIndex);
    }
    public void ShowCurrentItemOnlyInfo()
    {
        buildDimensionRoomMenu.ShowCurrentItemInfo(curSelectItemIndex);
    }

    public void JumpToNextItem(int _index)
    {
        buildDimensionRoomMenu.CloseBoard(curSelectItemIndex , 0);
        SetCurSelectRoomItemIndex(_index);
        ShowCurrentItem();
    }
    
    public void ShowCurrentItem()
    {
        buildDimensionRoomMenu.ShowCurrentItemInfo(curSelectItemIndex);
    }

    public int GetSelectItemIndexInlist(int _strongholdIndex)
    {
        return getPlayerSHAData.IndexOf(getPlayerSHAData.FirstOrDefault(s=>s.strongholdIndex == _strongholdIndex));
    }

    public void SetMonsterAtrributeToThisStronghold(PlayerMonsterAttribute playerMonsterAttribute)
    {
        tmpSetMonsterAttribute = playerMonsterAttribute;
    }

    public string GetBackgroundStr()
    {
        //"受到了<color=#00FF01FF>999</color>的伤害\n";
        return "请就近选择合适的位置,建立<color=#00FF01FF>占星庭</color>。占星庭是读星者的个据点，用于存放和使用各种次元物品";
    }
}
