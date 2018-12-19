using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JIRVISData {




    public OTYPE.GameDisplayType getCurDisplayType 
    {
        get {return currentDisplayType ;}
    }
    /// <summary>
    /// 当前 我要使用的据点
    /// </summary>
    /// <value>The index of the get current mine stronghold.</value>
    public int getCurMineStrongholdIndex
    {
        get {return currentMineStrongholdIndex;}
    }
    //当前要挑战的据点
    public StrongholdBaseAttribution getCurChallengeStrongholdAttr
    {
        get {return currentChallengeStronghold  ;}
    }
    //当前要保卫的据点
    public BusinessStrongholdAttribute getCurProtectStrongholdAttr
    {
        get {return currentProtectedStronghold; }
    }

    public List<AndaObjectBasic> getItemList
    {
        get {return itemlist;}
    }
    public List<int> getWaitexcuteEventlist
    {
        get 
        {
            return WaitForExcuteEvent;
        }
    }
    /// <summary>
    /// 是否跳过AR演示
    /// </summary>
    /// <value><c>true</c> if get setting data with ART ips skip; otherwise, <c>false</c>.</value>
    public bool GetSettingDataWithARTipsSkip {get {return PlayerPrefs.GetInt("ARScannerTips") == 1 ;} }

    public List<AndaLocalRewardData> getNormalRewardList {get {return normalRewardList ;}}

    public List<GameRequest.BattelObject> getRewardList{get { return rewardList ; }}

    public List<PlayerMonsterAttribute>getCurEnemys{ get {return currentEnemys ;}}

    public string lastTipsContent = "";

    public JIRVISBar getJIRVISBar {get {return jIRVISBar ;}}

    public JIRVISContent_ChangeStrongholdStatue getJIRVISContent_ChangeStrongholdStatue { get { return jIRVISContent_ChangeStrongholdStatue ;} }
   
    public JIRVISContent_ItemInformation getJiRVISContent_ItemInformation {get {return jIRVISContent_ItemInformation; }}

    public JIRVISContent_EditorMonsterInformation getJIRVISContent_EditorMonsterInformation { get {return jIRVISContent_EditorMonsterInformation ;}}

    public JIRVISContent_ExchangeStrongholdEditorBar getjIRVISContent_ExchangeStrongholdEditorBar { get {return jIRVISContent_ExchangeStrongholdEditorBar;} }

    public bool isSupportAR =false;
    //当前的游戏模式 1 = 挑战模式， 0= 保卫模式 
    public int currentPlayGameType;
    public int currentEnemyStrongholdIndex;
    private int currentMineStrongholdIndex = -1;
    private PlayerStrongholdAttribute currentChallengeStronghold;
    private BusinessStrongholdAttribute currentProtectedStronghold;
    private List<AndaObjectBasic> itemlist;
    private JIRVISBar jIRVISBar; 
    private OTYPE.GameDisplayType currentDisplayType = OTYPE.GameDisplayType.VV;

    private List<PlayerMonsterAttribute> currentEnemys ;

    private List<GameRequest.BattelObject> rewardList;

    private List<AndaLocalRewardData> normalRewardList; 

    private List<PlayerMonsterAttribute> monsterRewardList;//宠物奖励

    private GameRequest.Medal medalReward;

    private JIRVISContent_ChangeStrongholdStatue jIRVISContent_ChangeStrongholdStatue ;
    public JIRVISContent_ItemInformation jIRVISContent_ItemInformation;

    public JIRVISContent_EditorMonsterInformation jIRVISContent_EditorMonsterInformation;

    public JIRVISContent_StartVideo iRVISContent_StartVideo ;

    public JIRVISContent_BussinessStrongholdInfo jIRVISContent_Bussiness;

    public JIRVISContent_ChanllengeGameStrongholdInfo jIRVISContent_ChanllengeGameStronghold;

    public JIRVISContent_ExchangeStrongholdEditorBar jIRVISContent_ExchangeStrongholdEditorBar;

    public bool lastChanllengeGameIsWin =false;
    // 代办事项， 0 = 建立据点
    private List<int> WaitForExcuteEvent;

    public bool IsAutoEnterAstroloy = false;

    public int isAutoEnterTargetScene = -1;

    public PlayerMonsterAttribute curBossAttr;

    public void BuildData()
    {
        InitValue();
    }

    public void InitValue()
    {
        WaitForExcuteEvent =new List<int>();
        InitBtnList();
    }

    /// <summary>
    /// 清空按钮列表
    /// </summary>
    public void InitBtnList()
    {
        if(itemlist == null)
        {
            itemlist = new List<AndaObjectBasic>();
        }else
        {
            if(itemlist.Count == 0)return;
            //if(!)
            //Debug.Log(itemlist.Count);
            itemlist.RecieveListByAndaData();
            itemlist.Clear();
        }
    }
    public void AddItem(JIRVISButtonItemBase item)
    {
        itemlist.Add(item);
    }


    //设置当前次元空间的游标
    public void SetCurrentDimensionRoomIndex(int _curDimroomIndex)
    {
        currentMineStrongholdIndex = _curDimroomIndex;
    }

    public void SetCurrentAutoEnterAstroloy(int strongholdIndex)
    {
        SetCurrentDimensionRoomIndex(strongholdIndex);
        IsAutoEnterAstroloy =true;
    }

    public void SetCurrentChallenggeStronghold(PlayerStrongholdAttribute _playerStrongholdAttribute)
    {
        currentChallengeStronghold = _playerStrongholdAttribute;
        currentEnemyStrongholdIndex = _playerStrongholdAttribute.strongholdIndex;
        //挑战模式
        currentPlayGameType = 1;
    }
    public void SetCurrentProtectedStronghold(BusinessStrongholdAttribute businessStrongholdAttribute)
    {
        currentProtectedStronghold = businessStrongholdAttribute;
        currentEnemyStrongholdIndex = businessStrongholdAttribute.strongholdIndex;
      //  curBossAttr = ConvertTool.ConvertToPlayerMonsterAttribute(ConvertTool.ConvertMonsterIDToMonsterGrowupAttr(businessStrongholdAttribute.statueID)); 
        currentPlayGameType = 0;
    }

    public void SetNormalRewardList(List<AndaLocalRewardData> andaLocalRewardDatas)
    {
        if(normalRewardList == null) normalRewardList = new List<AndaLocalRewardData>();
        normalRewardList = andaLocalRewardDatas;
    }

    public void SetRewardsList(List<GameRequest.BattelObject> _battelObjects)
    {
        
        if(rewardList == null)rewardList = new List<GameRequest.BattelObject>();
        rewardList.AddRange(_battelObjects);
    }

    public void SetMedalReward(GameRequest.Medal medal)
    {
        medalReward = medal;
    }

    public void SetMonsterRewardList(PlayerMonsterAttribute playerMonsterAttributes )
    {
        if(monsterRewardList == null) monsterRewardList = new List<PlayerMonsterAttribute>();
        monsterRewardList.Add(playerMonsterAttributes);
    }

    public void BuildMenu()
    {
        if(jIRVISBar == null)
        {
            jIRVISBar = AndaUIManager.Instance.PopingMenu2<JIRVISBar>(ONAME.JirvisBarName);
        }
    }

    public void BuildChangeStrongholdStatueBar()
    {
        if(jIRVISContent_ChangeStrongholdStatue == null)
        {
            jIRVISContent_ChangeStrongholdStatue = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_ChangeStrongholdStatue>(ONAME.JIRVISContent_ChangeStrongholdStatue);
            jIRVISContent_ChangeStrongholdStatue.transform.SetUIInto(jIRVISBar.EditorboardPoint.transform);
            jIRVISContent_ChangeStrongholdStatue.FadeIn();
        }
    }

    public void BuildItemInfomationBar()
    {
        if(jIRVISContent_ItemInformation!=null)AndaDataManager.Instance.RecieveItem(jIRVISContent_ItemInformation);
        jIRVISContent_ItemInformation = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_ItemInformation>(ONAME.JIRVISContent_ItemInformation);
        jIRVISContent_ItemInformation.transform.SetUIInto(jIRVISBar.EditorboardPoint.transform);
        jIRVISContent_ItemInformation.FadeIn();
    }


    public void RemoveItemInfomationBar()
    {
        if(jIRVISContent_ItemInformation!=null)
        {
            AndaDataManager.Instance.RecieveItem(jIRVISContent_ItemInformation);
            jIRVISContent_ItemInformation= null;
        }
    }
    public void BuildMonsterChangeInformaitonBar()
    {
        if(jIRVISContent_EditorMonsterInformation!=null)AndaDataManager.Instance.RecieveItem(jIRVISContent_EditorMonsterInformation);
        jIRVISContent_EditorMonsterInformation = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_EditorMonsterInformation>(ONAME.JIRVISContent_EditorMonsterInformation);
        jIRVISContent_EditorMonsterInformation.transform.SetUIInto(jIRVISBar.EditorboardPoint.transform);
        jIRVISContent_EditorMonsterInformation.FadeIn();
    }

    public void BuildBussinessStrongholdBar()
    {
        if(jIRVISContent_Bussiness !=null)AndaDataManager.Instance.RecieveItem(jIRVISContent_Bussiness);
        jIRVISContent_Bussiness = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_BussinessStrongholdInfo>(ONAME.JIRVISContent_BussinessStrongholdInfo);
        jIRVISContent_Bussiness.transform.SetUIInto(jIRVISBar.EditorboardPoint.transform);
        jIRVISContent_Bussiness.FadeIn();
    }

    public void BuildChallengeGameStrongholdBar()
    {
        if (jIRVISContent_ChanllengeGameStronghold != null) AndaDataManager.Instance.RecieveItem(jIRVISContent_ChanllengeGameStronghold);
        jIRVISContent_ChanllengeGameStronghold = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_ChanllengeGameStrongholdInfo>(ONAME.JIRVISEditorBar_ChanllengeGameStrongholdInfo);
        jIRVISContent_ChanllengeGameStronghold.transform.SetUIInto(JIRVIS.Instance.jIRVISData.getJIRVISBar.EditorboardPoint.transform);
        jIRVISContent_ChanllengeGameStronghold.FadeIn();
    }


    public void BuildExchangeStrongholdEditorBar()
    {
        if(jIRVISContent_ExchangeStrongholdEditorBar == null)AndaDataManager.Instance.RecieveItem(jIRVISContent_ExchangeStrongholdEditorBar);
        jIRVISContent_ExchangeStrongholdEditorBar = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_ExchangeStrongholdEditorBar>(ONAME.jIRVISContent_ExchangeStrongholdEditorBar);
        jIRVISContent_ExchangeStrongholdEditorBar.transform.SetUIInto(JIRVIS.Instance.jIRVISData.getJIRVISBar.EditorboardPoint.transform);
        jIRVISContent_ExchangeStrongholdEditorBar.FadeIn();
    }

    public void RemoveExchangeStrongholdBar()
    {
        if (jIRVISContent_ExchangeStrongholdEditorBar != null)
        {
            AndaDataManager.Instance.RecieveItem(jIRVISContent_ExchangeStrongholdEditorBar);
            jIRVISContent_ExchangeStrongholdEditorBar = null;
        }
    }

    public void RemoveMonsterChangeInformaitonBar()
    {
        if(jIRVISContent_EditorMonsterInformation!=null)
        {
            AndaDataManager.Instance.RecieveItem(jIRVISContent_EditorMonsterInformation);
            jIRVISContent_EditorMonsterInformation= null;
        }
    }


    public void RemoveChangeStrongholdStatueBar()
    {
        if(jIRVISContent_ChangeStrongholdStatue!=null)
        {
            AndaDataManager.Instance.RecieveItem(jIRVISContent_ChangeStrongholdStatue);
            jIRVISContent_ChangeStrongholdStatue = null;
        }
    }

    public void SetCurrentDisplayType(OTYPE.GameDisplayType _type )
    {
        currentDisplayType = _type;
        JIRVIS.Instance.isARType = currentDisplayType == OTYPE.GameDisplayType.AR;    
    }

    public void SetEnemys(List<PlayerMonsterAttribute> enemys)
    {
        if(currentEnemys!=null)currentEnemys.Clear();
        currentEnemys = enemys;
    }

    public void SetWaitForExcuteEvent(int eventID)
    {
        if(WaitForExcuteEvent==null)WaitForExcuteEvent = new List<int>();
        // 如果代办事项里面没有这个事项，那么就可以添加，有就不能添加
        if(!WaitForExcuteEvent.Contains(eventID))
        {
            WaitForExcuteEvent.Add(eventID);
        }
    }




    public void RemoveCommisionEvent(int eventID)
    {
        if(WaitForExcuteEvent.Contains(eventID))
        {
            WaitForExcuteEvent.Remove(eventID);
        }
    }

    public void ClearRewardList()
    {
        if (rewardList != null)
            rewardList.Clear();
        if(medalReward!=null)
        {
            medalReward = null;
        }
    }

    public void ClearNormalRewardList()
    {
        if (normalRewardList != null)
            normalRewardList.Clear();

    }

    public void ClearMonsterRewardList()
    {
        monsterRewardList.Clear();
    }
  


    public void CheckReward()
    {
        if(rewardList!=null &&  medalReward!=null)
        {
            JIRVISContent_RewardBar jIRVISContent_RewardBar = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBar>(ONAME.JIRVISEditorBar_RewardBar);
            jIRVISContent_RewardBar.menuLayer = 1;
            jIRVISContent_RewardBar.transform.SetUIInto(getJIRVISBar.EditorboardPoint.transform);
            jIRVISContent_RewardBar.BuildChanllenGameWinWithMedalRewards( medalReward.medalLeave, medalReward.statueID, getRewardList);
            //jIRVISContent_RewardBar.BuildRewardList(jIRVISData.getRewardList);
            jIRVISContent_RewardBar.FadeIn();
        }else  if(rewardList!=null)
        {
            if(lastChanllengeGameIsWin)
            {

                JIRVISContent_RewardBar jIRVISContent_RewardBar = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBar>(ONAME.JIRVISEditorBar_RewardBar);
                jIRVISContent_RewardBar.menuLayer = 1;
                jIRVISContent_RewardBar.transform.SetUIInto(getJIRVISBar.EditorboardPoint.transform);
                jIRVISContent_RewardBar.BuildChanllenGameWinRewards(getRewardList);
                //jIRVISContent_RewardBar.BuildRewardList(jIRVISData.getRewardList);
                jIRVISContent_RewardBar.FadeIn();
            }
            else
            {

                JIRVISContent_RewardBar jIRVISContent_RewardBar = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBar>(ONAME.JIRVISEditorBar_RewardBar);
                jIRVISContent_RewardBar.menuLayer = 1;
                jIRVISContent_RewardBar.transform.SetUIInto(getJIRVISBar.EditorboardPoint.transform);
                jIRVISContent_RewardBar.BuildChanlleGameLoseReward(getRewardList);
                //jIRVISContent_RewardBar.BuildRewardList(jIRVISData.getRewardList);
                jIRVISContent_RewardBar.FadeIn();
            }
        }
    }

    public void CheckNormalRewardList(System.Action callback)
    {
        if(normalRewardList!=null || normalRewardList.Count!=0)
        {
            JIRVISContent_RewardBar jIRVISContent_RewardBar = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBar>(ONAME.JIRVISEditorBar_RewardBar);
            jIRVISContent_RewardBar.menuLayer = 1;
            jIRVISContent_RewardBar.transform.SetUIInto(getJIRVISBar.EditorboardPoint.transform);
            jIRVISContent_RewardBar.BuildNormalReward(normalRewardList, callback);
            jIRVISContent_RewardBar.FadeIn();
        }
    }

    public void CheckMonsterRewardList(System.Action callback)
    {
        if(monsterRewardList != null || monsterRewardList.Count !=0)
        {

            /*JIRVISContent_RewardBar jIRVISContent_RewardBar = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBar>(ONAME.JIRVISEditorBar_RewardBar);
            jIRVISContent_RewardBar.transform.SetUIInto(getJIRVISBar.EditorboardPoint.transform);
            jIRVISContent_RewardBar.BuildMonsterReward(monsterRewardList, callback);
            jIRVISContent_RewardBar.FadeIn();*/
        }
    }

    #region 执行 打开AR演示视频

    public void OpenJIRVISARTipsEditorBar()
    {
        if(iRVISContent_StartVideo!=null)AndaDataManager.Instance.RecieveItem(iRVISContent_StartVideo);
        iRVISContent_StartVideo = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_StartVideo>(ONAME.JIRVISContent_StartVideo);
        iRVISContent_StartVideo.SetInto(jIRVISBar.EditorboardPoint.transform);
        iRVISContent_StartVideo.FadeIn();
        iRVISContent_StartVideo.SetPlay();
    }

    #endregion

    #region 执行 关闭AR演示
    public void CloseJIRVISARTipsEditorBar()
    {
        if(iRVISContent_StartVideo != null)
        {
            AndaDataManager.Instance.RecieveItem(iRVISContent_StartVideo);
        }
    }

    #endregion
}
