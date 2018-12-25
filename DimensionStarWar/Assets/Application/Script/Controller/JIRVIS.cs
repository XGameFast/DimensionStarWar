using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class JIRVIS {
    /*
     * Dev:AndaChen
     * Data:2018.2.6
     * 向 钢铁侠 智能助理 J.I.R.V.S致敬
     * JIRVIS用于各个模块间的快速操作，具有语音识别功能。在不同模块具有不同的操作逻辑。
     * 1.尽最大可能给玩家3步操作之内达到想做处理的事情
     * 2.可以点击操作也可以进行语音控制
     * 
     * 在登陆界面会根据可以验证玩家声纹进行快速登陆
     * 在占星庭可以命令进行物件选择 及 跳转模块
     * 在星图可以命令 设置 私人据点 ，以及玩家想要的逻辑筛选。
     * 在战斗模块，可以命令自动锁定敌方单位以及 其他逻辑上的筛选。比如锁定最近的单位，锁定最强的单位。战斗模块的操作逻辑会逐步迭代。
     * 
     * 在商场界面可以进行筛选想要的商品
     * 
     * 在图鉴界面 可以进行 物件对比 信息展示
     */

    private static JIRVIS _instance = null;
    public static JIRVIS Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = BuildJIRVIS();
            }
            return _instance;
        }
    }

    public JIRVISData jIRVISData;
    public ARMonsterMainController aRMonsterMainController;
    public bool isARType = false;

    public static JIRVIS BuildJIRVIS()
    {
        JIRVIS jIRVIS = new JIRVIS();
        jIRVIS.jIRVISData = new JIRVISData();
        jIRVIS.jIRVISData.BuildData();
        jIRVIS.jIRVISData.BuildMenu();
        return jIRVIS;
    }

    public void PlayTips(OTYPE.Tipscontent tipsType)
    {
        jIRVISData.getJIRVISBar.DisplayTips(MonsterGameData.GetTipsContent(tipsType),1);
    }

    public void PlayTips(string tipsContent , bool autoClose =true)
    {
        jIRVISData.getJIRVISBar.DisplayTips(tipsContent, 1 ,autoClose);
    }


    public void PlayTipsForchoose(OTYPE.Tipscontent tipscontent ,OTYPE.TipsType chooseType ,  string yesBtntitle, string noBtntitle ,System.Action chooseYES = null,System.Action chooseNo = null ,System.Action finishTips = null)
    {
        string content = MonsterGameData.GetTipsContent(tipscontent);
        if(jIRVISData.lastTipsContent != "" && jIRVISData.lastTipsContent == content)return;
        jIRVISData.lastTipsContent = content;
        jIRVISData.getJIRVISBar.DiplayChooseTips( content, chooseType, chooseYES,yesBtntitle,chooseNo,noBtntitle, finishTips);
    }
    public void PlayTipsForchoose(string content,OTYPE.TipsType chooseType ,  string yesBtntitle, string noBtntitle ,System.Action chooseYES = null,System.Action chooseNo = null, System.Action finishTips = null)
    {
        if(jIRVISData.lastTipsContent != "" && jIRVISData.lastTipsContent == content)return;
        jIRVISData.lastTipsContent = content;
        jIRVISData.getJIRVISBar.DiplayChooseTips(content, chooseType, chooseYES,yesBtntitle,chooseNo,noBtntitle, finishTips);
    }

    public void CloseTips()
    {
        jIRVISData.lastTipsContent = "";
        jIRVISData.getJIRVISBar.CloseTips();
    }

    public void BuildCurrentDimensionRoomMonsterBtn(System.Action<PlayerMonsterAttribute> callback,System.Action finish_callback=null)
    {
        List<PlayerMonsterAttribute> tmp = AndaDataManager.Instance.GetPlayerMonsterAttributeBelongThisStronghold(jIRVISData.getCurMineStrongholdIndex);
        jIRVISData.getJIRVISBar.BuildMonsterListBtn(tmp,callback,finish_callback);
    }

    public void BuildMineStrongholdListBtn(System.Action<int> callbcak)
    {
        List<PlayerStrongholdAttribute> tmp  = AndaDataManager.Instance.GetPlayerAllStrongholdAttribute();//((OTYPE.StrongholdType.playerPrivateSH));
        BuildDimensionRoomBtnList(tmp,callbcak);
    }

    public void BuildMonsterBtnList(List<PlayerMonsterAttribute> pmaList,System.Action<PlayerMonsterAttribute> click_callback ,System.Action finishload_callback=null , bool replace = true)
    {
        jIRVISData.getJIRVISBar.BuildMonsterListBtn(pmaList, click_callback,finishload_callback);
    }
    public void BuildDimensionRoomBtnList(List<PlayerStrongholdAttribute> list, System.Action<int> click_callback ,System.Action finish = null,bool replace = true)
    {
        jIRVISData.getJIRVISBar.BuildDimensionRoomListBtn(list, click_callback, finish, replace);
    }
   
    public void BuildConsumableBtnList(List<LD_Objs> lD_Objs ,System.Action<int>callback)
    {
        jIRVISData.getJIRVISBar.BuildConsumableListBtn(lD_Objs,callback);
    }

    //构建基础的功能按钮 
    public void BuildFunctionBtn(System.Action finishload_callback=null)
    {
        List<JIRVISFuncBtnStruct> btnlist = new List<JIRVISFuncBtnStruct>
        {
            new JIRVISFuncBtnStruct{ btnName = "星域",btnIconKey = ONAME.StarMapIcon,clickCallBack = aRMonsterMainController.EnterStarspace },
            new JIRVISFuncBtnStruct{ btnName = "探索",btnIconKey = ONAME.TrvalIcon,clickCallBack = aRMonsterMainController.EnterTravl },
            new JIRVISFuncBtnStruct{ btnName = "交易",btnIconKey = ONAME.MallIcon,clickCallBack = aRMonsterMainController.EnterMall },
            new JIRVISFuncBtnStruct{ btnName = "次元库",btnIconKey = ONAME.PackIcon,clickCallBack = aRMonsterMainController.EnterPackage },
            new JIRVISFuncBtnStruct{ btnName = "回退",btnIconKey = ONAME.BackStep,clickCallBack = aRMonsterMainController.EnterLaterCtr }
        };

        jIRVISData.getJIRVISBar.BuildFuncButton(btnlist,finishload_callback);
    }

    public void BuildFunctionBtn(List<JIRVISFuncBtnStruct> list,System.Action finishload_callback = null)
    {
        jIRVISData.getJIRVISBar.BuildFuncButton(list,finishload_callback);
    }

    public void AddFunctionBtns(List<JIRVISFuncBtnStruct> list, System.Action finishAddtion_callback = null)
    {
        jIRVISData.getJIRVISBar.AddtionFuncButtons(list,finishAddtion_callback);
    }

    public void AddFunctionBtn(JIRVISFuncBtnStruct jIRVISFuncBtnStruct ,System.Action finishAddtion_callback = null)
    {
        jIRVISData.getJIRVISBar.AddtionFunButton(jIRVISFuncBtnStruct,finishAddtion_callback);
    }



    public void ChangeFuncBtn(string targetKey,JIRVISFuncBtnStruct btnStruct)
    {
        jIRVISData.getJIRVISBar.ChangeFuncBtn(targetKey,btnStruct);
    }

    public void ChangeFuncBtns(List<string> targetKey,List<JIRVISFuncBtnStruct>  btnStructs)
    {
        jIRVISData.getJIRVISBar.ChangeFuncbtns(targetKey,btnStructs);
    }


    public void RemoveCurrentBtnList()
    {
        if(jIRVISData.getItemList.Count == 0)return;
      
        jIRVISData.InitBtnList();
        jIRVISData.getJIRVISBar.RemoveCurrentBtnList();
    }

    public void ClickDeafultBtn()
    {
        jIRVISData.getJIRVISBar.ClickDeafultBtn();
    }

    public void ClickFuncBtn(string key)
    {
        jIRVISData.getItemList.FirstOrDefault(s=>s.name == key).GetComponent<JIRVISButtonItemBase>().ClickItem();
    }

    public void SetCurrentDimensionroomIndex(int index)
    {
        jIRVISData.SetCurrentDimensionRoomIndex(index);
    }

    private void ChangeContrller()
    {
        
    }

   

    public void ChooseGameDisplayType(OTYPE.GameDisplayType typeKey)
    {
        jIRVISData.SetCurrentDisplayType(typeKey);
    }
    public void SetBarIndex(int index)
    {
        if(jIRVISData == null)return;
        if(jIRVISData.getJIRVISBar == null)return;
        jIRVISData.getJIRVISBar.transform.SetSiblingIndex(index);
    }

    public void SetWaittingexcuteEventForAddStronghold(int eventID = 0)
    {
        jIRVISData.SetWaitForExcuteEvent(eventID);
    }

    public void RemoveCommisionEventForAddStronghold(int eventID = 0)
    {
        jIRVISData.RemoveCommisionEvent(eventID);
    }

    public void CloseBtnBar()
    {
        jIRVISData.getJIRVISBar.SetBtnBarState(false);
    }
    public void OpenBtnBar()
    {
        jIRVISData.getJIRVISBar.SetBtnBarState(true);
    }

    public void OpenChangeStrongholdStatusBar(List<int> statueIDs, int strongholdLevel , System.Action callbackComfirm, System.Action callbackCancel,System.Action<int> callbackSelect)
    {
        jIRVISData.BuildChangeStrongholdStatueBar();
        jIRVISData.getJIRVISContent_ChangeStrongholdStatue.SetInfo(statueIDs,strongholdLevel, callbackSelect);
        PlayTipsForchoose(OTYPE.Tipscontent.changeStrongholdStatu , OTYPE.TipsType.chooseTips ,"确定", "取消" ,callbackComfirm,callbackCancel);
    }



    #region 打开AR演示提示视频
    public void OpenJIRVISARTipsEditorBar()
    {
        jIRVISData.OpenJIRVISARTipsEditorBar();
    }
    #endregion
    #region 关闭AR演示提示视频
    public void CloseJIRVISARTipsEditorBar()
    {
        jIRVISData.CloseJIRVISARTipsEditorBar();
    }
    #endregion

    #region 打开物品详情

    public void BuildEditorBarForItemInformation(int itemID)
    {
        jIRVISData.BuildItemInfomationBar();
        jIRVISData.getJiRVISContent_ItemInformation.SetInfo(itemID);
    }

    public void CloseEditorBarForItemInformation()
    {
        jIRVISData.RemoveItemInfomationBar();
    }

    #endregion

    #region 打开商家据点详情

    public void BuildBussinessStrongholdInfomationBar(BusinessStrongholdAttribute bsa)
    {
        jIRVISData.BuildBussinessStrongholdBar();
        jIRVISData.jIRVISContent_Bussiness.SetInfo(bsa);
    }

    #endregion

    #region 打开其他玩家的详情面板
    public void BuildOtherPlayerStrongholdInformation(PlayerStrongholdAttribute psa , PlayerMonsterAttribute pma)
    {
        jIRVISData.BuildChallengeGameStrongholdBar();
        jIRVISData.jIRVISContent_ChanllengeGameStronghold.SetInfo(pma , psa);
    }

    #endregion

    #region 打开星宿的名字 和 据点修改 面板
    public void BuildEditorBarForMonsterChangeNameOrBelongStorngholdIndex(PlayerMonsterAttribute playerMonsterAttribute , int strongholdIndex , System.Action callbackSure , System.Action callbackCancel)
    {
        jIRVISData.BuildMonsterChangeInformaitonBar();
        jIRVISData.getJIRVISContent_EditorMonsterInformation.SetInfo(playerMonsterAttribute , strongholdIndex ,callbackSure , callbackCancel);
    }

    public void CloseEditorBarForMonsterChangeNameOrBelongStorngholdIndex()
    {
        jIRVISData.RemoveMonsterChangeInformaitonBar();
    }


    #endregion

    #region 打开交易所编辑面板
    public void OpenExchangeEditorBar(System.Action<string ,string ,int > comfirm, System.Action cancel)
    {
        jIRVISData.BuildExchangeStrongholdEditorBar();
        jIRVISData.getjIRVISContent_ExchangeStrongholdEditorBar.SetInfo(comfirm,cancel);
    }
    #endregion

    #region 检查奖励
    public void CheckReward()
    {
        jIRVISData.CheckReward();
    }


    public void CheckNormalReward(System.Action callback = null)
    {
        jIRVISData.CheckNormalRewardList(callback);
    }

    public void CheckMonsterReward(System.Action callback = null)
    {
        jIRVISData.CheckMonsterRewardList(callback);
    }


    #endregion

    public void OpenAR()
    {
        
    }

   
}

public class JIRVISFuncBtnStruct
{
    public string btnName{get;set;}
    public string btnIconKey{get;set;}
    public System.Action clickCallBack{get;set;}
    public System.Action<int> clickCallBackForItemID{get;set;}
}


