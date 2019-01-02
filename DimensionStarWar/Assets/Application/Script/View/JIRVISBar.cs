using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
public class JIRVISBar : UIBasic2 {
    public enum MessageLevel 
    {
        normal = 0,
        levelHigh = 1,
    }

    private GameObject _editorBoardPoint = null;
    public GameObject EditorboardPoint
    {
        get
        {
            if(_editorBoardPoint == null)
            {
                _editorBoardPoint = GameObject.Find("ApplicationUI/jirvis-top/EditorboardPoint");
            }
            return _editorBoardPoint;
        }
    }
    public GameObject tmpPoint1;
    public GameObject tmpPoint2;
    public GameObject scrollPoint;

    public GameObject scrollHoriCenterPoint;
    public GameObject scrollHoriLeftPoint;
    public GameObject scrollHoriRightPoint;



    public Transform videoPoint;
    public CanvasGroup tipsForChooseGroup;

    public GameObject tipsForChoose_YESButton;
    public GameObject tipsForChoose_NOButton;
    public GameObject tipsForCHoose_ComfirmButton;
    public Text tipsForChoose_TipsContent;
    public Text tipsForChoose_YESBtnTitle;
    public Text tipsForChoose_NOBtnTitle;
    public Text tipsForCHoose_ComfirmTitle;

    public CanvasGroup tipsForChoose_Contentgroup;

    public GameObject mask;

    public Slider tipsSlider;
    public Slider btnSlider;
    public Slider btnSliderHori;
    public Text tipsLabel;
    public GridLayoutGroup btnGrid;

    public GridLayoutGroup gridHori;

    public CanvasGroup canvasGroups;
    public CanvasGroup btnGroupHori;

    public ScrollRect btnScrollView;
    public ScrollRect btnScrollViewHori;

    private float btnFadeIntime = 0.15f;

    //tipsTYpe =0.是普通的文字提示， =1，告知提示（只有一个确认按钮） ，=2 有选择的提示（附带一个同意 和不同意 按钮），3 = 带编辑窗体的提示 ， 
    private OTYPE.TipsType currentTipsType = OTYPE.TipsType.none;

    private bool isRead = false;

    private bool isjump = false;

    private bool displayerOver = false;

    private bool isClose=false;

    private string tmpContent;

    private bool btnBarIsOpen;
    private bool btnBarIsOpenHori;

    private Slider lastTipsSlider;

    private System.Action clickYES_callback;
    private System.Action clickNO_callback;

    private Vector3 clickBtnPose;//刚刚点击的按钮，在什么位置

    private GameObject curClickBtn;
    private GameObject lastClickBtn;
    //宠物按钮
    public GameObject monsterIconBtnItem;
    //虚拟空间按钮
    public GameObject dimensionroomBtnItem;

    public JIRVIS_FUNCBtn jirvis_funcBtn;

    // 0 = 我的占星庭   1 = 商家    2 = 交易所     3 = boss据点 4 = 5宠物列表 6 = 自由宠物列表
    private int lastListType  =-1;  

    private List<string> messageQue;


    public void DisplaySingleTips(string content , float duration )
    {
        JIRVISTips_SingleTips jIRVISTips_SingleTips = AndaDataManager.Instance.InstantiateMenu<JIRVISTips_SingleTips>(ONAME.JIRVISTips_SingleTips);
        jIRVISTips_SingleTips.SetInto(AndaUIManager.Instance.jirvis_top);
        jIRVISTips_SingleTips.SetInfo(content, duration);
    }

    public void DisplayTips(string content, int messageLevel , bool autoClose = true)
    {

        JIRVISTips_SingleTips jIRVISTips_SingleTips = AndaDataManager.Instance.InstantiateMenu<JIRVISTips_SingleTips>(ONAME.JIRVISTips_SingleTips);
        jIRVISTips_SingleTips.SetInto(AndaUIManager.Instance.jirvis_top);
        jIRVISTips_SingleTips.SetInfo(content ,4f);
        /*
        tmpContent = content;

        if (!isRead)
        {
            StartCoroutine(JIRVISReadTips(autoClose));
            if(isLoaingTipsboard)
            {
                loadingTipboardProgress = 0;
            }else
            {
                loadingTipboardProgress = 0;
                StartCoroutine(DisplayTipsboard());
                isLoaingTipsboard = true;
            }
            isRead = true;
        }else
        {
            loadingTipboardProgress = 0;
            if(!isLoaingTipsboard)
            {
                loadingTipboardProgress = 0;
                StartCoroutine(DisplayTipsboard());
                isLoaingTipsboard = true;
            }
        }*/
    }

   



    public void DiplayChooseTips(string tipsContent, OTYPE.TipsType tipsType, System.Action chooseYES,string yesBtnTitle, System.Action chooseNO ,string noBtnTitle , System.Action finishTips = null)
    {

        JIRVISTips_ChooseTIps iRVISTips_ChooseTIps = AndaDataManager.Instance.InstantiateMenu< JIRVISTips_ChooseTIps >(ONAME.JIRVISTips_ChooseTIps);
        iRVISTips_ChooseTIps.SetInto(AndaUIManager.Instance.jirvis_top);
        iRVISTips_ChooseTIps.SetInfo(tipsContent, tipsType, yesBtnTitle, noBtnTitle);
        iRVISTips_ChooseTIps.clickComfirmCallBack = chooseYES;
        iRVISTips_ChooseTIps.clickCancelCallBack = chooseNO;
       // StartCoroutine(Readchoosetips(tipsContent, 0.05f, finishTips));
        /*if(currentTipsType <= OTYPE.TipsType.chooseTips)
        {
          
        }else
        {
            //如果正在执行的消息层级较高，那么先把这条消息缓存一下，进入排队列表
        }*/
    }


    public void CloseTips()
    {
        switch(currentTipsType)
        {
            case OTYPE.TipsType.chooseTips:
            case OTYPE.TipsType.onlyOneChooseTips:
                //StartCoroutine(CloseTipsforchooseBoard());
                tipsForChooseGroup.alpha = 0;
                tipsForChooseGroup.blocksRaycasts = false;
                mask.gameObject.SetTargetActiveOnce(false);
                break;
            case OTYPE.TipsType.normalTips:
                StartCoroutine(CloseTipsBoard(tipsSlider));
                break;
        }
      // currentTipsType = OTYPE.TipsType.none;
    }

    #region 纯文本读取信息

    private IEnumerator JIRVISReadTips(bool autoclose)
    {
        string tmp = tmpContent;

        int i = 0;
        int length = tmp.Length;
        var firstIndex = 0;
        var secondIndex = 0;
        while (i < length)
        {
            if(tmp != tmpContent)//新消息进入
            {
                tmp = tmpContent;
                length = tmp.Length;
                i = 0; //重新开始读
            }

            if (tmp[i] == '<' && tmp[i + 1] == 'c')
            {
                while (tmp[i + firstIndex] != '>')
                {
                    firstIndex++;
                }
            }
            if (tmp[i] == '<' && tmp[i + 1] == '/')
            {
                secondIndex = i;
            }
            if (firstIndex > 0)
            {
                for (int j = 0; j < firstIndex; j++)
                {
                    tipsLabel.text += tmp[i];
                    i += 1;
                }
                firstIndex = -1;
            }
            if (firstIndex == -1)
            {
                if (secondIndex == 0)
                    tipsLabel.text = tipsLabel.text.Substring(0, i) + tmp[i] + "</color>";
                else
                {
                    firstIndex = 0;
                    i += 8;
                    tipsLabel.text += tmp[i];
                }
            }
            else
            {
                tipsLabel.text += tmp[i];
            }
            i += 1;

            yield return new WaitForSeconds(0.02f);
        }
       
        tipsLabel.text = tmpContent;
        yield return new WaitForSeconds(5f);
        tipsLabel.text = "";
        mask.gameObject.SetTargetActiveOnce(false);
        tipsSlider.value = 0;
        isRead =false;
    }



    #endregion

    #region 有选择的提示
    public IEnumerator Readchoosetips(string content , float speed = 0.02f , System.Action finishTips = null)
    {
       
        //yield return new WaitForSeconds(0.5F);
        tipsForChoose_Contentgroup.alpha = 0;
        StartCoroutine(OpenTipsforchooseBoard());
        //isRead = true;
        int i = 0;
        tipsForChoose_TipsContent.text = "";
        int length = content.Length;
        var firstIndex = 0;
        var secondIndex = 0;
        while (i<length)
        {
            //tipsForChoose_TipsContent.text += content[i].ToString();
            //i++;
           
            if (content[i] == '<' && content[i + 1] == 'c')
            {
                while (content[i + firstIndex] != '>')
                {
                    firstIndex++;
                }
            }
            if (content[i] == '<' && content[i + 1] == '/')
            {
                secondIndex = i;
            }
            if (firstIndex > 0)
            {
                for (int j = 0; j < firstIndex; j++)
                {
                    tipsForChoose_TipsContent.text += content[i];
                    i += 1;
                }
                firstIndex = -1;
            }
            if (firstIndex == -1)
            {
                if (secondIndex == 0)
                    tipsForChoose_TipsContent.text = tipsForChoose_TipsContent.text.Substring(0, i) + content[i] + "</color>";
                else
                {
                    firstIndex = 0;
                    i += 8;
                    tipsForChoose_TipsContent.text += content[i];
                }
            }
            else
            {
                tipsForChoose_TipsContent.text += content[i];
            }
            i += 1;
            yield return new WaitForSeconds(speed);
        }
        //--
        while(tipsForChoose_Contentgroup.alpha<1)
        {
            tipsForChoose_Contentgroup.alpha+=Time.deltaTime*4;
           
             yield return null;
        }
        tipsForChooseGroup.blocksRaycasts = true;
        if (finishTips != null) 
        {
             finishTips();
        }
    }
    #endregion

    private void OpenTipsboard()
    {
        if(!isLoaingTipsboard)
        {
            StartCoroutine(DisplayTipsboard());
            isLoaingTipsboard = true;
        }else
        {
            loadingTipboardProgress = 0;
        }

    }
    private bool isLoaingTipsboard =false;
    private float loadingTipboardProgress ;
    private IEnumerator DisplayTipsboard()
    {
        while(loadingTipboardProgress < 1)
        {
            loadingTipboardProgress+= Time.deltaTime*2;
            tipsSlider.value = loadingTipboardProgress;
            yield return null;
        }
        isLoaingTipsboard = false;
        Debug.Log("loadingTipboardProgress is over");
    }

    private IEnumerator DiplayTipBoard(Slider _slider)
    {
        mask.gameObject.SetTargetActiveOnce(true);
        //CheckLastSlider(_slider);
        _slider.value = 0;
        while (_slider.value < 1)
        {
            _slider.value += Time.deltaTime * 2f;
            yield return null;
        }
    }
    private IEnumerator CloseTipsBoard(Slider _slider)
    {
        //CheckLastSlider(_slider);
        tipsLabel.text = "";
        mask.gameObject.SetTargetActiveOnce(false);
        while (_slider.value > 0 )
        {
            _slider.value -= Time.deltaTime * 2f;
            yield return null;
        }
       
    }


    private IEnumerator OpenTipsforchooseBoard()
    {
        mask.gameObject.SetActive(true);

        while(tipsForChooseGroup.alpha<1)
        {
            tipsForChooseGroup.alpha+=Time.deltaTime*2f;
            yield return null;
        }
        tipsForChoose_Contentgroup.blocksRaycasts = true;
    }

    private IEnumerator CloseTipsforchooseBoard()
    {
        while(tipsForChooseGroup.alpha > 0)
        {
            tipsForChooseGroup.alpha-=Time.deltaTime*2f;
            yield return null;
        }
        tipsForChoose_Contentgroup.alpha = 0;
        tipsForChoose_Contentgroup.blocksRaycasts = false;
        mask.gameObject.SetActive(false);
    }


    private void CheckLastSlider(Slider _slider)
    {
        if(lastTipsSlider!=null && lastTipsSlider!=_slider) 
        {
            lastTipsSlider.value = 0;
            lastTipsSlider = _slider;
        }
    }


    public void ClickYESButton()
    {
        
        //StartCoroutine(CloseTipsforchooseBoard());
        if(clickYES_callback!=null){  clickYES_callback();}
    }

    public void CLickNOButton()
    {
        //tipsForChoose_Contentgroup.alpha = 0;
        //StartCoroutine(CloseTipsforchooseBoard());
        if(clickNO_callback!=null){ clickNO_callback();}
    }

    #region 构建功能按钮

    public void BuildFuncButton(List<JIRVISFuncBtnStruct> _data,System.Action finishload_callback )
    {

        JIRVIS.Instance.jIRVISData.InitBtnList();
        SetBtnBarState(true);
        StartCoroutine(ExcuteBuildFunBtn(_data, finishload_callback));

    }

    private IEnumerator ExcuteBuildFunBtn(List<JIRVISFuncBtnStruct> _data, System.Action finishload_callback)
    {
        int count = _data.Count;
        for(int i = 0; i < count; i++)
        {
            JIRVIS_FUNCBtn _jirvisFunBtn = AndaDataManager.Instance.InstantiateMenu<JIRVIS_FUNCBtn>(ONAME.JIRVISButtonItem_FunBtnItem);
            _jirvisFunBtn.SetType(_data[i].btnType);
            _jirvisFunBtn.gameObject.SetTargetActiveOnce(true);
            _jirvisFunBtn.transform.SetUIInto(btnGrid.transform);
            _jirvisFunBtn.SetInfo(_data[i].btnName, _data[i].btnIconKey, _data[i].clickCallBack);
            JIRVIS.Instance.jIRVISData.AddItem(_jirvisFunBtn);
            _jirvisFunBtn.clickBackoutBtnPose = ClickBtnOutBtnPose;
            _jirvisFunBtn.SetFadeInEffect(0);
            yield return null;
        }
        ReUIScrollViewPose();
        if (finishload_callback != null) finishload_callback();
    }

    #endregion

    #region 补充添加功能按钮

    public void AddtionFuncButtons(List<JIRVISFuncBtnStruct> _data , System.Action finishAddtion_callback)
    {
        foreach(var go in _data)
        {
            JIRVIS_FUNCBtn _jirvisFunBtn =  AndaDataManager.Instance.InstantiateMenu<JIRVIS_FUNCBtn>(ONAME.JIRVISButtonItem_FunBtnItem);
            _jirvisFunBtn.SetType(go.btnType);
            _jirvisFunBtn.gameObject.SetTargetActiveOnce(true);
            _jirvisFunBtn.transform.SetUIInto(btnGrid.transform);
            _jirvisFunBtn.SetInfo(go.btnName, go.btnIconKey, go.clickCallBack);
            JIRVIS.Instance.jIRVISData.AddItem(_jirvisFunBtn);
            _jirvisFunBtn.clickBackoutBtnPose = ClickBtnOutBtnPose;
            _jirvisFunBtn.SetFadeInEffect(0);
        }

        ReUIScrollViewPose();
        if(finishAddtion_callback!=null)finishAddtion_callback();
    }

    public void AddtionFunButton(JIRVISFuncBtnStruct data ,System.Action callback)
    {
        JIRVIS_FUNCBtn _jirvisFunBtn =  AndaDataManager.Instance.InstantiateMenu<JIRVIS_FUNCBtn>(ONAME.JIRVISButtonItem_FunBtnItem);
        _jirvisFunBtn.SetType(data.btnType);
        _jirvisFunBtn.gameObject.SetTargetActiveOnce(true);
        _jirvisFunBtn.transform.SetUIInto(btnGrid.transform);
        _jirvisFunBtn.SetInfo(data.btnName, data.btnIconKey, data.clickCallBack);
        JIRVIS.Instance.jIRVISData.AddItem(_jirvisFunBtn);
        _jirvisFunBtn.SetFadeInEffect(0);
        ReUIScrollViewPose();
        _jirvisFunBtn.clickBackoutBtnPose = ClickBtnOutBtnPose;
        if (callback!=null)callback();
    }


    #endregion



    public void ChangeFuncBtn(string key,JIRVISFuncBtnStruct _btnStruct)
    {
        JIRVIS_FUNCBtn btnStruct = JIRVIS.Instance.jIRVISData.getItemList.FirstOrDefault(s=>s.transform.name == key) as JIRVIS_FUNCBtn;
        btnStruct.SetType(_btnStruct.btnType);
        btnStruct.SetInfo(_btnStruct.btnName,_btnStruct.btnIconKey,_btnStruct.clickCallBack);
        btnStruct.clickBackoutBtnPose = ClickBtnOutBtnPose;
        SetBtnEffectPosition(btnStruct.transform.position);
        btnStruct.SetFadeInEffect(0);
    }

    public void ChangeFuncbtns(List<string> keys,List<JIRVISFuncBtnStruct> _btnStrucks )
    {
        for (int i = 0; i < keys.Count; i++)
        {
            JIRVIS_FUNCBtn btnStruct = JIRVIS.Instance.jIRVISData.getItemList.FirstOrDefault(s=>s.transform.name == keys[i]) as JIRVIS_FUNCBtn;
            btnStruct.SetType(_btnStrucks[i].btnType);
            btnStruct.SetInfo(_btnStrucks[i].btnName,_btnStrucks[i].btnIconKey,_btnStrucks[i].clickCallBack);
            btnStruct.clickBackoutBtnPose = ClickBtnOutBtnPose;
            btnStruct.SetFadeInEffect(0);
        }
    }

    private IEnumerator ExcuteChangesFunBtn(List<string> keys, List<JIRVISFuncBtnStruct> _btnStrucks)
    {
        int count = keys.Count;
        for (int i = 0; i < count; i++)
        {
            JIRVIS_FUNCBtn btnStruct = JIRVIS.Instance.jIRVISData.getItemList.FirstOrDefault(s => s.transform.name == keys[i]) as JIRVIS_FUNCBtn;
            btnStruct.SetType(_btnStrucks[i].btnType);
            btnStruct.SetInfo(_btnStrucks[i].btnName, _btnStrucks[i].btnIconKey, _btnStrucks[i].clickCallBack);
            SetBtnEffectPosition(btnStruct.transform.position);
            btnStruct.clickBackoutBtnPose = ClickBtnOutBtnPose;
            btnStruct.SetFadeInEffect(0);
            yield return null;
        }
    }

    private void AutoCloseHoriBar()
    {
        if(!btnBarIsOpenHori)return;
        SetBtnBarStateHori(false);
        JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();
        lastClickBtn = null ;
        lastListType = -1;
    }

    #region 构建怪兽按钮
    public void BuildMonsterListBtn(int monsterType , List<PlayerMonsterAttribute> list,System.Action<PlayerMonsterAttribute>click_callBack,System.Action finishload_callback,  bool replace)
    {
        if (!btnBarIsOpenHori && lastListType == monsterType)//玩家列表需要再次打开
        {
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            SetBtnBarStateHori(true);
            return;
        }

        if (btnBarIsOpenHori && lastListType == monsterType) //本列表需要关闭
        {
            SetBtnBarStateHori(false);
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
            return;
        }

        if (btnBarIsOpenHori && lastListType != monsterType) //其他按钮已经打开过列表了 ,要把上一次的按钮归位，并且清理列表
        {
            if (lastClickBtn != curClickBtn)
            {
                lastClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
                lastClickBtn = curClickBtn;
            }

            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;

            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();

            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            //建立按钮
            StartCoroutine(ExcuteBuildMonsterListBtn(list, click_callBack, finishload_callback, replace));
            lastListType = monsterType;
        }

        if (!btnBarIsOpenHori && lastListType != monsterType) //与上面的切变在于他不需要重新开一次底板
        {
            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            lastClickBtn = curClickBtn;
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            StartCoroutine(ExcuteBuildMonsterListBtn(list, click_callBack, finishload_callback, replace));
            lastListType = monsterType;
            SetBtnBarStateHori(true);
        }
    }
    private IEnumerator ExcuteBuildMonsterListBtn(List<PlayerMonsterAttribute> list, System.Action<PlayerMonsterAttribute> click_callBack, System.Action finishload_callback , bool replace)
    {
        if(replace)
        {
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();
        }


        foreach (var go in list)
        {
            MonsterIcon_levelboard_Item item= AndaDataManager.Instance.InstantiateMenu<MonsterIcon_levelboard_Item>(ONAME.JIRVISButtonItem_MonsterItem);
          //  item.clickBackoutBtnPose = ClickBtnOutBtnPose;
            item.transform.SetUIInto(gridHori.transform);
            item.BuildItem(go, click_callBack);
            JIRVIS.Instance.jIRVISData.AddItemForHori(item);
            item.SetFadeInEffect(0);
            yield return null;
        }
        ReUIScrollViewPoseHori();
        if(finishload_callback!=null)finishload_callback();
    }
    #endregion

    #region 构建虚拟空间的实例按钮
    public void BuildDimensionRoomListBtn(List<PlayerStrongholdAttribute> list, System.Action<int> click_callback,System.Action finish ,bool replace )
    {
        if (!btnBarIsOpenHori && lastListType == 0)//玩家列表需要再次打开
        {
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            SetBtnBarStateHori(true);
            return;
        }

        if (btnBarIsOpenHori && lastListType == 0) //本列表需要关闭
        {
            SetBtnBarStateHori(false);
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
            return;
        }

        if (btnBarIsOpenHori && lastListType != 0) //其他按钮已经打开过列表了 ,要把上一次的按钮归位，并且清理列表
        {
            if (lastClickBtn != curClickBtn)
            {
                lastClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
                lastClickBtn = curClickBtn;
            }

            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;

            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();

            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            //建立按钮
            StartCoroutine(ExcuteBuildDimensionRoomListBtn(list, click_callback, finish, replace));
            lastListType = 0;
        }

        if (!btnBarIsOpenHori && lastListType != 0) //与上面的切变在于他不需要重新开一次底板
        {
            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            lastClickBtn = curClickBtn;
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            StartCoroutine(ExcuteBuildDimensionRoomListBtn(list, click_callback, finish, replace));
            lastListType = 0;
            SetBtnBarStateHori(true);
        }
    }

    private IEnumerator ExcuteBuildDimensionRoomListBtn(List<PlayerStrongholdAttribute> list, System.Action<int> click_callback, System.Action finish , bool replace)
    {
        if(replace)
        {
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();
        }

        foreach (var go in list)
        {
            JIRVISBtnItem_Dimensionroom item = AndaDataManager.Instance.InstantiateMenu<JIRVISBtnItem_Dimensionroom>(ONAME.JIRVISButtonItem_DimensionRoomItem);
            //item.clickBackoutBtnPose = ClickBtnOutBtnPose;
            item.SetFadeInEffect(2);
            item.transform.SetUIInto(gridHori.transform);
            item.BuildItem(go, click_callback);
            JIRVIS.Instance.jIRVISData.AddItemForHori(item);
            item.transform.localScale = Vector3.one * 0.7f;
            yield return null;
        }
        if(finish!=null)
        {
            finish();
        }
        ReUIScrollViewPoseHori();
    }

    #endregion

    #region 构建商家据点按钮

    public void BuildBussinessStrongholdListBtn(List<BusinessStrongholdAttribute> list, System.Action<int> click_callback, System.Action finish, bool replace)
    {
        //四种情况

        if (!btnBarIsOpenHori && lastListType == 1)//商家列表需要再次打开
        {
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            SetBtnBarStateHori(true);
            return;
        }

        if (btnBarIsOpenHori && lastListType == 1) //本列表需要关闭
        {
            SetBtnBarStateHori(false);
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
            return;
        }

        if(btnBarIsOpenHori && lastListType!=1) //其他按钮已经打开过列表了 ,要把上一次的按钮归位，并且清理列表
        {
            if(lastClickBtn != curClickBtn)
            {
                lastClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
                lastClickBtn = curClickBtn;
            }

            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;

            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
           
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            //建立按钮
            StartCoroutine(ExcuteBuildBussinessStrongholdListBtn(list, click_callback, finish, replace));
            lastListType = 1;
        }

        if(!btnBarIsOpenHori && lastListType!=1)
        {

            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            lastClickBtn = curClickBtn;

            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            StartCoroutine(ExcuteBuildBussinessStrongholdListBtn(list, click_callback, finish, replace));
            lastListType = 1;
            SetBtnBarStateHori(true);
        }
    }

    private IEnumerator ExcuteBuildBussinessStrongholdListBtn(List<BusinessStrongholdAttribute> list, System.Action<int> click_callback, System.Action finish, bool replace)
    {
        if (replace)
        {
            JIRVIS.Instance.jIRVISData.InitBtnList();
        }

        ItemScrollStruct itemScrollStruct = new ItemScrollStruct();
        itemScrollStruct.center = scrollHoriCenterPoint.transform.position;
        itemScrollStruct.distance = Vector3.Distance(scrollHoriLeftPoint.transform.position, scrollHoriRightPoint.transform.position);

        foreach (var go in list)
        {
            JIRVISBtnItem_Dimensionroom item = AndaDataManager.Instance.InstantiateMenu<JIRVISBtnItem_Dimensionroom>(ONAME.JIRVISButtonItem_DimensionRoomItem);
            //item.clickBackoutBtnPose = ClickBtnOutBtnPose;
            item.SetFadeInEffect(0);
            item.transform.SetUIInto(gridHori.transform);
            item.BuildItem(go, itemScrollStruct, click_callback);
            JIRVIS.Instance.jIRVISData.AddItemForHori(item);
            item.transform.localScale = Vector3.one * 0.7f;
            yield return null;
        }

        if (finish != null)
        {
            finish();
        }
        ReUIScrollViewPoseHori();

    }
    #endregion

    #region 构建交易所按钮

    public void BuildExchangeListBtn(List<Exchange> list, System.Action<int> click_callback, System.Action finish, bool replace)
    {
        if (!btnBarIsOpenHori && lastListType == 2)//交易所列表需要再次打开
        {
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            SetBtnBarStateHori(true);
            return;
        }

        if (btnBarIsOpenHori && lastListType == 2) //本列表需要关闭
        {
            SetBtnBarStateHori(false);
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
            return;
        }

        if (btnBarIsOpenHori && lastListType != 2) //其他按钮已经打开过列表了 ,要把上一次的按钮归位，并且清理列表
        {
            if (lastClickBtn != curClickBtn)
            {
                lastClickBtn.GetComponentInChildren<TweenRotation>().PlayReverse();
                lastClickBtn = curClickBtn;
            }

            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            //建立按钮
            StartCoroutine(ExcuteBuildExchangeListBtn(list, click_callback, finish, replace));
            lastListType = 2;
        }

        if (!btnBarIsOpenHori && lastListType != 2)
        {
            curClickBtn.GetComponentInChildren<TweenRotation>().PlayForward();
            lastClickBtn = curClickBtn;
            Vector3 t = btnScrollViewHori.transform.position;
            t.y = curClickBtn.transform.position.y;
            btnScrollViewHori.transform.position = t;
            JIRVIS.Instance.jIRVISData.InitBtnListForHoriz();//清理
            StartCoroutine(ExcuteBuildExchangeListBtn(list, click_callback, finish, replace));
            lastListType = 2;
            SetBtnBarStateHori(true);
        }
    }

    private IEnumerator ExcuteBuildExchangeListBtn(List<Exchange> list, System.Action<int> click_callback, System.Action finish, bool replace)
    {
        if (replace)
        {
            JIRVIS.Instance.jIRVISData.InitBtnList();
        }

        ItemScrollStruct itemScrollStruct = new ItemScrollStruct();
        itemScrollStruct.center = scrollHoriCenterPoint.transform.position;
        itemScrollStruct.distance = Vector3.Distance(scrollHoriLeftPoint.transform.position, scrollHoriRightPoint.transform.position);

        foreach (var go in list)
        {
            JIRVISBtnItem_Dimensionroom item = AndaDataManager.Instance.InstantiateMenu<JIRVISBtnItem_Dimensionroom>(ONAME.JIRVISButtonItem_DimensionRoomItem);
            //item.clickBackoutBtnPose = ClickBtnOutBtnPose;
            item.transform.SetUIInto(gridHori.transform);
            item.BuildItem(go, itemScrollStruct, click_callback);
            JIRVIS.Instance.jIRVISData.AddItemForHori(item);
            item.transform.localScale = Vector3.one * 0.7f;
            item.SetFadeInEffect(1);
            yield return null;
        }
        if (finish != null)
        {
            finish();
        }
        ReUIScrollViewPoseHori();

    }

    #endregion


    #region 构建消耗品列表





    public void BuildConsumableListBtn(List<LD_Objs> list, System.Action<int> click_callback)
    {
        //建立按钮
        StartCoroutine(ExcuteBuildComsumableListBtn(list,click_callback));
        SetBtnBarState(true);
    }

    public IEnumerator ExcuteBuildComsumableListBtn(List<LD_Objs> list, System.Action<int> click_callback)
    {
        JIRVIS.Instance.jIRVISData.InitBtnList();
        foreach (var go in list)
        {
            JIRVISButton_ConsumableItem item = AndaDataManager.Instance.InstantiateMenu<JIRVISButton_ConsumableItem>(ONAME.JIRVISButtonItem_ConsumableItem);
            item.transform.SetUIInto(btnGrid.transform);
            item.SetInfo(go, click_callback);
            JIRVIS.Instance.jIRVISData.AddItem(item);
            ReUIScrollViewPose();
            SetBtnEffectPosition(item.transform.position);
            yield return new WaitForSeconds(btnFadeIntime);
        }
    }

    #endregion

    private void SetBtnEffectPosition(Vector3 pose)
    {
       /* AndaObjectBasic aob = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>(ONAME.RewardFadeInEffect);
        aob.SetInto(AndaUIManager.Instance.jirvisRoot);
        aob.transform.position = pose;*/
    }

    public void RemoveCurrentBtnList()
    {
        
        SetBtnBarState(false);
       
    }
    public void RemoveCurrentBtnListHoriz()
    {
        AutoCloseHoriBar();
    }

    public void CallFuntionBtnboard()
    {
        
    }

    public void SetBtnBarState(bool isOpen)
    {
        //Debug.Log("state"+ isOpen);
        if(isOpen)
        {
            if(!btnBarIsOpen)
            {
                btnBarIsOpen = true;
                StartCoroutine(OpenBtnBar());
              //  Debug.Log("open");
            }
        }else
        {
            if(btnBarIsOpen)
            {
                btnBarIsOpen = false;
                StartCoroutine(CloseBtnBar());
             //   Debug.Log("close");
            }
        }
    }

    public void SetBtnBarStateHori(bool isOpen)
    {
        if(isOpen)
        {
            if(!btnBarIsOpenHori)
            {
                btnBarIsOpenHori = true;
                StartCoroutine(OpenBtnBarHori());
            }
        }else
        {
            if(btnBarIsOpenHori)
            {
                btnBarIsOpenHori =false;
                StartCoroutine(CloseBtnBarHori());
            }
        }
    }



    private IEnumerator OpenBtnBar()
    {
        btnScrollView.gameObject.SetTargetActiveOnce(true);
        float tmp = 0 ;
        while (tmp<1 && btnBarIsOpen)
        {
            tmp+=Time.deltaTime;
            btnSlider.value = Mathf.Lerp(0,1, tmp*2f);
            canvasGroups.alpha = Mathf.Lerp(0,1,tmp);
            yield return null;
        }
        canvasGroups.blocksRaycasts = true;
        //btnGrid.gameObject.SetTargetActiveOnce(true);
        //ReUIScrollViewPose();
    }

    private IEnumerator OpenBtnBarHori()
    {
        btnScrollViewHori.gameObject.SetTargetActiveOnce(true);
        float tmp = 0;
        while (tmp < 1 && btnBarIsOpenHori)
        {
            tmp += Time.deltaTime;
            btnSliderHori.value = Mathf.Lerp(0, 1, tmp * 4f);
            btnGroupHori.alpha = Mathf.Lerp(0, 1, tmp);
            yield return null;
        }
        btnGroupHori.blocksRaycasts = true;
    }



    private IEnumerator CloseBtnBar()
    {
        float tmp = 0;
        while (tmp <1 && !btnBarIsOpen)
        {
            //Debug.Log("excuteclose");
            tmp+=Time.deltaTime;
            float t = Mathf.Lerp(1,0,tmp*2f);
            btnSlider.value = t;
            canvasGroups.alpha = t;
            yield return null;
        }
        canvasGroups.blocksRaycasts = false;
        btnScrollView.gameObject.SetTargetActiveOnce(false);
    }
    private IEnumerator CloseBtnBarHori()
    {
        float tmp = 0;

        while (tmp < 1 && !btnBarIsOpenHori)
        {
            //Debug.Log("excuteclose");
            tmp += Time.deltaTime;
            float t = Mathf.Lerp(1, 0, tmp * 4f);
            btnSliderHori.value = t;
            btnGroupHori.alpha = t;
            yield return null;
        }
        btnGroupHori.blocksRaycasts = false;
        btnScrollViewHori.gameObject.SetTargetActiveOnce(false);
    }

    private void ReUIScrollViewPose()
    {
        //btnGrid.en=true;
        //
        btnScrollView.content.localPosition = Vector2.zero;
    }

    private void ReUIScrollViewPoseHori()
    {
       // btnScrollViewHori.content.localPosition = Vector2.zero;
    }


    public void ClickDeafultBtn()
    {
        JIRVISButtonItemBase jIRVISButton = JIRVIS.Instance.jIRVISData.getItemList[0] as JIRVISButtonItemBase;
        jIRVISButton.ClickItem();
    }

    public void ClickMask()
    {
        if(currentTipsType == 0)
        {
            if(!displayerOver) isjump = true;
            else
            {
                isClose= true;
                CloseTips();
            }
        }
    }

    public void ClickJirvis()
    {
        if(JIRVIS.Instance.jIRVISData.getItemList.Count == 0)
        {
            // 呼叫贾维斯
        }else
        { 
            bool state = btnBarIsOpen?false:true;
            SetBtnBarState(state);
        }
    }
     

    private void ClickBtnOutBtnPose(Vector3 pose , GameObject _item , int btnType)
    {
        if(btnType == 0)
        {
            AutoCloseHoriBar();
        }else
        {
            curClickBtn = _item;
            clickBtnPose = pose;
        }

        /*if (btnType == -1)
        {
            AutoCloseHoriBar();

        }else
        {
            curClickBtn = _item;
            clickBtnPose = pose;
        }*/
    }
}
