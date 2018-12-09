﻿using System.Collections;
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
                _editorBoardPoint = GameObject.Find("ApplicationUI/EditorboardPoint");
            }
            return _editorBoardPoint;
        }
    }

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
    public Text tipsLabel;
    public GridLayoutGroup btnGrid;
    public CanvasGroup canvasGroups;
    public ScrollRect btnScrollView;

    //tipsTYpe =0.是普通的文字提示， =1，告知提示（只有一个确认按钮） ，=2 有选择的提示（附带一个同意 和不同意 按钮），3 = 带编辑窗体的提示 ， 
    private OTYPE.TipsType currentTipsType = OTYPE.TipsType.none;

    private bool isRead = false;

    private bool isjump = false;

    private bool displayerOver = false;

    private bool isClose=false;

    private string tmpContent;

    private bool btnBarIsOpen;

    private Slider lastTipsSlider;

    private System.Action clickYES_callback;
    private System.Action clickNO_callback;


    //宠物按钮
    public GameObject monsterIconBtnItem;
    //虚拟空间按钮
    public GameObject dimensionroomBtnItem;

    public JIRVIS_FUNCBtn jirvis_funcBtn;

    private List<string> messageQue;
    public void DisplayTips(string content, int messageLevel , bool autoClose = true)
    {

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
        }
    }

   



    public void DiplayChooseTips(string tipsContent, OTYPE.TipsType tipsType, System.Action chooseYES,string yesBtnTitle, System.Action chooseNO ,string noBtnTitle , System.Action finishTips = null)
    {
        currentTipsType = tipsType;
        switch (tipsType)
        {
            case OTYPE.TipsType.chooseTips:
                tipsForCHoose_ComfirmButton.gameObject.SetTargetActiveOnce(false);
                tipsForChoose_YESButton.gameObject.SetTargetActiveOnce(true);
                tipsForChoose_NOButton.gameObject.SetTargetActiveOnce(true);
                tipsForChoose_YESBtnTitle.text = yesBtnTitle;
                tipsForChoose_NOBtnTitle.text = noBtnTitle;
                break;
            case OTYPE.TipsType.onlyOneChooseTips:
                tipsForChoose_YESButton.gameObject.SetTargetActiveOnce(false);
                tipsForChoose_NOButton.gameObject.SetTargetActiveOnce(false);
                tipsForCHoose_ComfirmButton.gameObject.SetTargetActiveOnce(true);
                tipsForCHoose_ComfirmTitle.text = yesBtnTitle;
                break;
        }
        clickYES_callback = chooseYES;
        clickNO_callback = chooseNO;
        StartCoroutine(Readchoosetips(tipsContent, 0.05f, finishTips));
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
        yield return new WaitForSeconds(3f);
        tipsLabel.text = "";
        mask.gameObject.SetTargetActiveOnce(false);
        tipsSlider.value = 0;
        isRead =false;
    }



    #endregion

    #region 有选择的提示
    public IEnumerator Readchoosetips(string content , float speed = 0.05f , System.Action finishTips = null)
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
        foreach(var go in _data)
        {
            
            JIRVIS_FUNCBtn _jirvisFunBtn =  AndaDataManager.Instance.InstantiateMenu<JIRVIS_FUNCBtn>(ONAME.JIRVISButtonItem_FunBtnItem);
            _jirvisFunBtn.gameObject.SetTargetActiveOnce(true);
            _jirvisFunBtn.transform.SetUIInto(btnGrid.transform);
            _jirvisFunBtn.SetInfo(go.btnName, go.btnIconKey, go.clickCallBack);
            JIRVIS.Instance.jIRVISData.AddItem(_jirvisFunBtn);
        }
        ReUIScrollViewPose();
        if(finishload_callback!=null)finishload_callback();
    }



    #endregion

    #region 补充添加功能按钮

    public void AddtionFuncButtons(List<JIRVISFuncBtnStruct> _data , System.Action finishAddtion_callback)
    {
        foreach(var go in _data)
        {
            JIRVIS_FUNCBtn _jirvisFunBtn =  AndaDataManager.Instance.InstantiateMenu<JIRVIS_FUNCBtn>(ONAME.JIRVISButtonItem_FunBtnItem);
            _jirvisFunBtn.gameObject.SetTargetActiveOnce(true);
            _jirvisFunBtn.transform.SetUIInto(btnGrid.transform);
            _jirvisFunBtn.SetInfo(go.btnName, go.btnIconKey, go.clickCallBack);
            JIRVIS.Instance.jIRVISData.AddItem(_jirvisFunBtn);
        }

        ReUIScrollViewPose();
        if(finishAddtion_callback!=null)finishAddtion_callback();
    }

    public void AddtionFunButton(JIRVISFuncBtnStruct data ,System.Action callback)
    {
        JIRVIS_FUNCBtn _jirvisFunBtn =  AndaDataManager.Instance.InstantiateMenu<JIRVIS_FUNCBtn>(ONAME.JIRVISButtonItem_FunBtnItem);
        _jirvisFunBtn.gameObject.SetTargetActiveOnce(true);
        _jirvisFunBtn.transform.SetUIInto(btnGrid.transform);
        _jirvisFunBtn.SetInfo(data.btnName, data.btnIconKey, data.clickCallBack);
        JIRVIS.Instance.jIRVISData.AddItem(_jirvisFunBtn);
        ReUIScrollViewPose();
        if(callback!=null)callback();
    }


    #endregion



    public void ChangeFuncBtn(string key,JIRVISFuncBtnStruct _btnStruct)
    {
        JIRVIS_FUNCBtn btnStruct = JIRVIS.Instance.jIRVISData.getItemList.FirstOrDefault(s=>s.transform.name == key) as JIRVIS_FUNCBtn;
        btnStruct.SetInfo(_btnStruct.btnName,_btnStruct.btnIconKey,_btnStruct.clickCallBack);
    }

    public void ChangeFuncbtns(List<string> keys,List<JIRVISFuncBtnStruct> _btnStrucks )
    {
        for (int i = 0; i < keys.Count; i++)
        {
            JIRVIS_FUNCBtn btnStruct = JIRVIS.Instance.jIRVISData.getItemList.FirstOrDefault(s=>s.transform.name == keys[i]) as JIRVIS_FUNCBtn;
            btnStruct.SetInfo(_btnStrucks[i].btnName,_btnStrucks[i].btnIconKey,_btnStrucks[i].clickCallBack);
        }
    }

    #region 构建怪兽按钮
    public void BuildMonsterListBtn(List<PlayerMonsterAttribute> list,System.Action<PlayerMonsterAttribute>click_callBack,System.Action finishload_callback)
    {
        //开始构建
        ExcuteBuildMonsterListBtn(list, click_callBack,finishload_callback);
        SetBtnBarState(true);
    }
    private void ExcuteBuildMonsterListBtn(List<PlayerMonsterAttribute> list, System.Action<PlayerMonsterAttribute> click_callBack, System.Action finishload_callback)
    {
        JIRVIS.Instance.jIRVISData.InitBtnList();

        foreach (var go in list)
        {
            MonsterIcon_levelboard_Item item= AndaDataManager.Instance.InstantiateMenu<MonsterIcon_levelboard_Item>(ONAME.JIRVISButtonItem_MonsterItem);
            item.transform.SetUIInto(btnGrid.transform);
            item.BuildItem(go, click_callBack);
            JIRVIS.Instance.jIRVISData.AddItem(item);
        }
        ReUIScrollViewPose();
        if(finishload_callback!=null)finishload_callback();

    }
    #endregion

    #region 构建虚拟空间的实例按钮
    public void BuildDimensionRoomListBtn(List<PlayerStrongholdAttribute> list, System.Action<int> click_callback)
    {
       
        //建立按钮
        ExcuteBuildDimensionRoomListBtn(list,click_callback);
        SetBtnBarState(true);
    }

    private void ExcuteBuildDimensionRoomListBtn(List<PlayerStrongholdAttribute> list, System.Action<int> click_callback)
    {
        JIRVIS.Instance.jIRVISData.InitBtnList();
        foreach (var go in list)
        {
            JIRVISBtnItem_Dimensionroom item = AndaDataManager.Instance.InstantiateMenu<JIRVISBtnItem_Dimensionroom>(ONAME.JIRVISButtonItem_DimensionRoomItem);
            item.transform.SetUIInto(btnGrid.transform);
            item.BuildItem(go, click_callback);
            JIRVIS.Instance.jIRVISData.AddItem(item);
        }
        ReUIScrollViewPose();

    }
    #endregion

    #region 构建消耗品列表





    public void BuildConsumableListBtn(List<LD_Objs> list, System.Action<int> click_callback)
    {
        //建立按钮
        ExcuteBuildComsumableListBtn(list,click_callback);
        SetBtnBarState(true);
    }

    public void ExcuteBuildComsumableListBtn(List<LD_Objs> list, System.Action<int> click_callback)
    {
        JIRVIS.Instance.jIRVISData.InitBtnList();
        foreach (var go in list)
        {
            JIRVISButton_ConsumableItem item = AndaDataManager.Instance.InstantiateMenu<JIRVISButton_ConsumableItem>(ONAME.JIRVISButtonItem_ConsumableItem);
            item.transform.SetUIInto(btnGrid.transform);
            item.SetInfo(go, click_callback);
            JIRVIS.Instance.jIRVISData.AddItem(item);
        }
    }


    #endregion


    public void RemoveCurrentBtnList()
    {
        
        SetBtnBarState(false);
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

    private IEnumerator OpenBtnBar()
    {
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
    }

    private void ReUIScrollViewPose()
    {
        //btnGrid.en=true;
        //
        btnScrollView.content.localPosition = Vector2.zero;
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
     
}
