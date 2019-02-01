using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
public class BuildDimensionMenu_MonsterInforBar : MonoBehaviour {

    public Button btn1;//恢复
    public Button btn2;//保卫
    public Button btn3;//寻宝
    public Button btn4;//召回
    public Button btn5;//空闲
    public Button btn6;//移除

    public Animator monsterInfoAnimator; 
    public Animator monsterStateGroup;
    public Animator propGroup;
    public Table_SelectItemToSearch Table_SelectItemToSearch;

    public Transform monsterBaseNamePoint;

    public Text monsterNickName;

    public Text levelText;
    public Slider monsterMaxPower;
    public Text monsterMaxPowerValue;
    public Image maxPowersliderImage;


    public Text normalAttackNickName;
    public Slider monsterNormalAttackSlider;
    public Text monsterNomralAttackValue;
    public Image monsterNormalAttackSliderImage;

    public Text defenseSkillNickName;
    public Slider monsterDefenseSkillSlider;
    public Text monsterDefenseSkillValue;
    public Image monsterDefenseSliderImage;

    public Text specialSkillNickName;
    public Slider monsterSpecialSkillSlider;
    public Text monsterSpecialSkillValue;
    public Image monsterSpecialSliderImage;

    public GameObject monsterSkillBtn;

    private PlayerMonsterAttribute pma;
    private GameObject monsterBaseNameObj;




    public bool isOpenSkillBar = false;
    public int childBarIndex = -1;

    public GameObject ExpPanel;
    public GameObject ObjectPanel;

    public Text Exp01;
    public Text Exp02;
    public Text Exp03;

   

    public GameObject object1;
    public GameObject object2;
    public GameObject object3;

    public GameObject selectList;
    public GameObject selectContent;
    public GameObject selectItem;

    public Text searchTimeText;
    public List<GameObject> selectData;

    public Button imageShowButton;
    public Image ShowImage;


    private bool isEndSearchByUser = false;//玩家是否主动吊起结束探索
    public void SetInfo(PlayerMonsterAttribute _playerMonsterAttribute )
    {
        Table_SelectItemToSearch.callbackStartSearch = StartSearchCallBack;
        childBarIndex = -1;
        pma = _playerMonsterAttribute;
        monsterNickName.text = pma.monsterNickName;
        levelText.text = "Lv" + (pma.monsterLevel + 1);
        StartCoroutine(ExcuteMonsterPower());
        if (pma.currentStateType == 2)
        {
            StartCoroutine(BuildMonsterSearchInfo());
        }else
        {
            StartCoroutine(ExcuteSkillSlider());
        }
      
     
        BuildMonsterBaseName();
       
    }
    public void ShowOrCloseImage()
    {
        if (ShowImage.gameObject.activeSelf)
            ShowImage.gameObject.SetTargetActiveOnce(false);
        else
            ShowImage.gameObject.SetTargetActiveOnce(true);
    }

   

    public void ChoiceExp(int _index) //传入 配置文件的Index
    {
        if (pma.mosterPower >= pma.monsterMaxPower)
        {
            JIRVIS.Instance.PlayTips("星宿意志力满！无法过度使用！");
            return;
        }

        var objectList = AndaDataManager.Instance.userData.GetRecoveryList();
        if (objectList == null)
        {
            JIRVIS.Instance.PlayTips("储存瓶数量不足");
            return;
        }
        var info = objectList.FirstOrDefault(o => o.id == (40000 + _index));
        if (info == null)
        {
            JIRVIS.Instance.PlayTips("储存瓶数量不足");
            return;
        }
        if (info.count > 0)
            info.count -= 1;
        else
        {
            JIRVIS.Instance.PlayTips("储存瓶数量不足");
            return;
        }
        AndaDataManager.Instance.CallServerUpRecovery(pma.monsterIndex,info.lD_Objs[0].objIndex,1, CallBack);
    }
    public void CallBack(bool success)
    {
        if (success)
        {
            PlayerMonsterAttribute _p = AndaDataManager.Instance.userData.userMonsterList.FirstOrDefault(s => s.monsterIndex == pma.monsterIndex);

            pma.mosterPower = _p.mosterPower;

            List<UserObjsBox> objectList = AndaDataManager.Instance.userData.GetRecoveryList();
            if (objectList == null)
                return;
            var item = objectList.FirstOrDefault(o => o.id == 40000);
            if (item != null)
                Exp01.text = item.count.ToString();
            item = objectList.FirstOrDefault(o => o.id == 40001);
            if (item != null)
                Exp02.text = item.count.ToString();
            item = objectList.FirstOrDefault(o => o.id == 40002);
            if (item != null)
                Exp03.text = item.count.ToString();

            StartCoroutine(ExcuteMonsterPower());
        }
    }



    public void ShowExp()
    {
        try
        {
            if (!ExpPanel.activeSelf)
            {
                ExpPanel.SetTargetActiveOnce(true);
                List<UserObjsBox> objectList = AndaDataManager.Instance.userData.GetRecoveryList();
                if (objectList == null)
                    return;
                var item = objectList.FirstOrDefault(o => o.id == 40000);
                if (item != null)
                    Exp01.text = item.count.ToString();
                item = objectList.FirstOrDefault(o => o.id == 40001);
                if (item != null)
                    Exp02.text = item.count.ToString();
                item = objectList.FirstOrDefault(o => o.id == 40002);
                if (item != null)
                    Exp03.text = item.count.ToString();
            }
            else
            {
                ExpPanel.SetTargetActiveOnce(false);
            }
        }
        catch (Exception ex)
        {
            Debug.Log(ex.Message);
        }
    }

    private IEnumerator ExcuteMonsterPower()
    {
        float t = 0;
        int maxPower = pma.monsterMaxPower;
        Color color = AndaGameExtension.GetLevelColor(pma.monsterLevel);
        while(t <= 1)
        {
            t += Time.deltaTime;
            float per = Mathf.Lerp(0, pma.mosterPower,t) / pma.monsterMaxPower;
            monsterMaxPower.value = per;
            monsterMaxPowerValue.text =(int)Mathf.Lerp(0, pma.mosterPower, t) + "/" + maxPower; 
            yield return null;
        }

    }

    private void BuildMonsterBaseName()
    {
        if(monsterBaseNameObj != null) Destroy(monsterBaseNameObj);// AndaDataManager.Instance.RecieveItem(monsterBaseNameObj);
        monsterBaseNameObj = AndaDataManager.Instance.GetSpritePerfab("BaseName" + pma.monsterID);
        monsterBaseNameObj = Instantiate(monsterBaseNameObj);
        monsterBaseNameObj.transform.SetInto(monsterBaseNamePoint);
    }

    #region 打开子面板 宠物状态 ， 道具绑定
    public void ClickOpenChildBar(int _index)
    {
        if(childBarIndex == _index)
        {
            switch(childBarIndex)
            {
                case 0:
                    monsterStateGroup.gameObject.SetTargetActiveOnce(false);
                    JIRVIS.Instance.SetBtnBarLock(false);
                    break;
                case 1:
                    propGroup.gameObject.SetTargetActiveOnce(false);
                    break;
            }

            childBarIndex = -1;

        }else
        {
            switch (_index)
            {
                case 0:
                    if(propGroup != null) propGroup.gameObject.SetTargetActiveOnce(false);
                    SetMonsterStateBtn();
                    monsterStateGroup.gameObject.SetTargetActiveOnce(true);
                    monsterStateGroup.Play("FadeIn");
                    JIRVIS.Instance.CloseBtnBar();
                    JIRVIS.Instance.SetBtnBarLock(true);
                    break;
                case 1:
                    monsterStateGroup.gameObject.SetTargetActiveOnce(false);
                    propGroup.gameObject.SetTargetActiveOnce(true);
                    propGroup.Play("FadeIn");
                    break;
            }
            childBarIndex = _index;
        }
    }
    #endregion

    #region 保卫

    public void Defense()
    {
        if (pma.currentStateType != 0)
        {
            JIRVIS.Instance.PlayTips("该星宿不是空闲状态，无法守护据点！");
            return;
        }
        AndaDataManager.Instance.MonsterStatusChanged(CallDefenseBackFinish, pma.monsterIndex,1);
    }
    #endregion 

    #region 空闲
    public void Normal()
    {
        if (pma.currentStateType != 1)
        {
            JIRVIS.Instance.PlayTips("该星宿不是守护状态，无法空闲！");
            return;
        }
        AndaDataManager.Instance.MonsterStatusChanged(CallNormalBackFinish, pma.monsterIndex, 0);
    }

    #endregion

    #region 保卫的回调
    public void CallDefenseBackFinish(bool success)
    {
        if (success)
        {
            JIRVIS.Instance.PlayTips("已设置该星宿为守护状态");
            pma.currentStateType = 1;
            SetMonsterStateBtn();
        }
    }
    #endregion


    #region 设置空闲的回调
    public void CallNormalBackFinish(bool success)
    {
        if (success)
        {
            JIRVIS.Instance.PlayTips("已设置该星宿为空闲状态");
            pma.currentStateType = 0;
            SetMonsterStateBtn();
        }
    }
    #endregion

    #region 探索

    private int currentSelectType = 0;

    public void OpenTable()
    {
        if (pma.currentStateType == 2)
        {
            JIRVIS.Instance.PlayTips("星宿已出发！");
            return;
        }
       
        if (pma.currentStateType != 0)
        {
            JIRVIS.Instance.PlayTips("该星宿正忙！无法出去探索");
        }

        Table_SelectItemToSearch.SetMonsterIndex(pma);

        Table_SelectItemToSearch.gameObject.SetTargetActiveOnce(true);

        Table_SelectItemToSearch.SetInfo();
    }

    /// <summary>
    /// 选择要携带的种类
    /// </summary>
    public void SelectType(int type)
    {

    }

    private void CheckType()
    {
        switch(currentSelectType)
        {
            case 0: // 血瓶
                break;
            case 1: //
                break;
            case 2: //
                break;
        }
    }


    public void ShowSelectList(ObjectSelect objectSelect)
    {

        if (objectSelect.selectObjectID > 0)
        {
            objectSelect.InitValue();
            return;
        }
        selectList.SetTargetActiveOnce(true);

        List<UserObjsBox> objectList = new List<UserObjsBox>();
        CD_ObjAttr cD_ObjAttr = new CD_ObjAttr();
        if (selectData != null)
        {
            foreach (var m in selectData)
            {
                Destroy(m);
            }
            selectData.Clear();
        }
        else
        {
            selectData = new List<GameObject>();
        }
        switch (objectSelect.typeID)
        {
            case 40000:
                objectList = AndaDataManager.Instance.userData.GetRecoveryList();
                cD_ObjAttr = MonsterGameData.GetCD_ObjAttrs(40000);
                break;
            case 42060:
                objectList = AndaDataManager.Instance.userData.GetMonsterSearchList();
                cD_ObjAttr = MonsterGameData.GetCD_ObjAttrs(42060);
                break;
            case 44000:
                objectList = AndaDataManager.Instance.userData.GetLuckyObjectList();
                cD_ObjAttr = MonsterGameData.GetCD_ObjAttrs(44000);
                break;
            default:
                break;
        }

        for (int i = 0; i < cD_ObjAttr.objectName.Count; i++)
        {
            var objectIndex = 0;
            var objectCount = 0;
            var objectID = cD_ObjAttr.objectID + i;
            if (objectList != null && objectList.Count > 0)
            {
                var info = objectList.FirstOrDefault(o => o.id == objectID);

                if (info != null && info.lD_Objs.Count > 0)
                {
                    objectIndex = info.lD_Objs[0].objIndex;
                    objectCount = info.count;
                }
            }

            JIRVISEditonConsumableItemInformationBar jIRVISEditonConsumableItemInformationBar = AndaDataManager.Instance.InstantiateMenu<JIRVISEditonConsumableItemInformationBar>(ONAME.ConsumableBoardCircleBoard);
            int objectType = AndaDataManager.Instance.GetObjTypeID(objectID);
            jIRVISEditonConsumableItemInformationBar.SetNameAndCount(cD_ObjAttr.objectName[i], objectID.ToString(), objectCount, false);
            jIRVISEditonConsumableItemInformationBar.SetInto(selectContent.transform.transform);
            ObjectSelectItem osi = jIRVISEditonConsumableItemInformationBar.gameObject.AddComponent<ObjectSelectItem>();
            osi.SetInfo(objectID, objectIndex, objectCount, objectSelect);
            jIRVISEditonConsumableItemInformationBar.SetCallBack(osi.OnClickBack);
            jIRVISEditonConsumableItemInformationBar.transform.localScale *= 0.3f;
            selectData.Add(jIRVISEditonConsumableItemInformationBar.gameObject);
        }
    }

    public void FinishSearche()
    {
        isEndSearchByUser = true;//主动结束探索 ,
    }



    public void StartSearchCallBack()
    {
        isEndSearchByUser = false;
        ClickOpenChildBar(0);//这里管关闭
        pma.currentStateType = 2;
        StartCoroutine(BuildMonsterSearchInfo());
    }
    /// <summary>
    /// 结束探索的回调
    /// </summary>
    /// <param name="success">If set to <c>true</c> success.</param>
    /// <param name="imageBase64">Image base64.</param>
    public void FinishiSearchCallBack(bool success, string imageBase64)
    {
        if (success)
        {
            //ClickOpenChildBar(0);//结束探索成功后，关闭面板，并且发出提示，星宿回归，并且带回了一些礼物，
            pma.currentStateType = 0;
            StartCoroutine(ExcuteMonsterPower());
            StartCoroutine(ExcuteSkillSlider());
            /*if (imageBase64 != null)
            {
                imageShowButton.gameObject.SetTargetActiveOnce(true);
                ShowImage.sprite = ToolByGjp.Base64ToImg(imageBase64);
            }*/

#if UNITY_EDITOR
            Debug.Log("星宿回来了！");
#endif

        }
        else
        {
            JIRVIS.Instance.PlayTips("请检查网络，稍后再次点击回归试试看");
        }
    }
    #endregion


    private IEnumerator BuildMonsterSearchInfo()
    {
        monsterInfoAnimator.Play("SearchFadeIn");
        var dis = pma.finishTreasureTime - ToolByGjp.GetTimestamp();
        while (pma.currentStateType == 2 && gameObject.activeSelf && dis >= 0 && !isEndSearchByUser)
        {
            dis = pma.finishTreasureTime - ToolByGjp.GetTimestamp();
            searchTimeText.text = ToolByGjp.GetDisTime(dis);
            yield return null;
        }
       
        AndaDataManager.Instance.CallUpFinishSearch(pma.monsterIndex, FinishiSearchCallBack);
      }


    private IEnumerator ExcuteSkillSlider()
    {
        monsterInfoAnimator.Play("FadeIn");
        yield return new WaitForSeconds(1f);

        float t =  0;

        monsterNormalAttackSlider.gameObject.SetTargetActiveOnce(true);
        monsterDefenseSkillSlider.gameObject.SetTargetActiveOnce(true);
        monsterSpecialSkillSlider.gameObject.SetTargetActiveOnce(true);

        PlayerSkillAttribute skill00 =  pma.monsterSkillIDList[1];
        PlayerSkillAttribute skill01 = pma.monsterSkillIDList[0];
        PlayerSkillAttribute skill02 = pma.monsterSkillIDList[2];


        normalAttackNickName.text = skill00.skillNickName;
        defenseSkillNickName.text = skill01.skillNickName;
        specialSkillNickName.text = skill02.skillNickName;
            
        int p1 = skill00.skillAchievement;
        int p1Level = AndaDataManager.Instance.GetSkillAchievementValue(p1,skill00.skillID);
        int p1Max =  pma.monsterSkillIDList[0].baseSkillAttribute.skillArchievementLimit[p1Level];

        int p2 = skill01.skillAchievement;
        int p2Level = AndaDataManager.Instance.GetSkillAchievementValue(p2,skill01.skillID);
        int p2Max = pma.monsterSkillIDList[1].baseSkillAttribute.skillArchievementLimit[p2Level];


        int p3 = skill02.skillAchievement;
        int p3Level = AndaDataManager.Instance.GetSkillAchievementValue(p3,skill02.skillID);
        int p3Max = pma.monsterSkillIDList[2].baseSkillAttribute.skillArchievementLimit[p3Level];

        Color p1Color = AndaGameExtension.GetLevelColor(p1Level);
        Color p2Color = AndaGameExtension.GetLevelColor(p2Level);
        Color p3Color = AndaGameExtension.GetLevelColor(p3Level);

        while(t < 1 )
        {
            t += Time.deltaTime;

            float per1 = p1 * t ;
            float per2 = p2 * t ;
            float per3 = p3 * t ;
            p1Color.a = t * 2f;
            p2Color.a = t * 2f;
            p3Color.a = t * 2f;

            monsterNormalAttackSliderImage.color = p1Color;
            monsterDefenseSliderImage.color = p2Color;
            monsterSpecialSliderImage.color = p3Color;

            monsterNormalAttackSlider.value = per1 / p1Max;
            monsterDefenseSkillSlider.value = per2 / p2Max;
            monsterSpecialSkillSlider.value = per3 / p3Max;

            monsterNomralAttackValue.text = (int)per1 + "/" + p1Max;
            monsterDefenseSkillValue.text = (int)per2 + "/" + p2Max;
            monsterSpecialSkillValue.text =  (int)per3 + "/" + p3Max;

            yield return null;
        }
    }



    #region 设置宠物的状态按钮
    private void SetMonsterStateBtn()
    {
        if(JIRVIS.Instance.isARType)
        {

        }else //VV模式
        {
            switch(pma.currentStateType)
            {
                case 0: //空闲状态
                  
                    btn1.SetBtnActive(true);
                    btn2.gameObject.SetTargetActiveOnce(true);//保卫按钮
                    btn2.SetBtnActive(true);
                    btn5.gameObject.SetTargetActiveOnce(false);//空闲按钮
                    btn3.gameObject.SetTargetActiveOnce(true);//寻宝按钮
                    btn3.SetBtnActive(true);
                    btn4.gameObject.SetTargetActiveOnce(false);//召回按钮
                    btn6.gameObject.SetTargetActiveOnce(true);//移除按钮
                    btn6.SetBtnActive(true);
                    break;
                case 1: //保卫张泰
                  
                    btn1.SetBtnActive(true);
                    btn2.gameObject.SetTargetActiveOnce(false);//保卫按钮
                    btn5.gameObject.SetTargetActiveOnce(true);//空闲按钮
                    btn5.SetBtnActive(true);

                    btn3.gameObject.SetTargetActiveOnce(true);//寻宝按钮
                    btn3.SetBtnActive(false); //保卫状态不能寻宝

                    btn4.gameObject.SetTargetActiveOnce(false);//召回按钮
                    btn6.gameObject.SetTargetActiveOnce(true);//移除按钮
                    btn6.SetBtnActive(false);//保卫状态不能移除
                    break;
                case 2: //探索去了
                   
                    btn1.SetBtnActive(false);//寻宝状态不能补充体力
                    btn2.gameObject.SetTargetActiveOnce(true);//保卫按钮
                    btn2.SetBtnActive(false);//正在寻宝，不能设置为保卫状态
                    btn5.gameObject.SetTargetActiveOnce(false);//空闲按钮
                    btn3.gameObject.SetTargetActiveOnce(false);//寻宝按钮
                    btn4.gameObject.SetTargetActiveOnce(true);//召回按钮
                    btn4.SetBtnActive(true);
                    btn6.gameObject.SetTargetActiveOnce(true);//移除按钮
                    btn6.SetBtnActive(false);//寻宝状态不能移除
                   
                    break;
                case 3:
                    break;
            }
        }
    }
    #endregion

    private void SetFuncitonBarState()
    {
        if(pma.currentStateType == 2)
        {

        }else
        {

        }
    }

    List<string> missTips = new List<string>()
    {
        "我已经感应到您的想念，正在飞奔回来的路上",
        "原来您这么想我，我正在路上！",
        "我鞋子跑丢了，我正在回来路上",
        "刚才打不车，我用传送门可以吗？？？？我正在来的路上！不要激动",
        "天青色等烟雨，刚才隔壁老王亢宿它—……",
    };
    private int tipsIndex =0;
    public void ClickMissStarBaby()
    {
        string content = missTips[tipsIndex];
        tipsIndex = tipsIndex >= missTips.Count - 1 ? 0 : tipsIndex + 1;
        JIRVIS.Instance.PlaySingleTips(pma.monsterNickName + ":"+ content);
    }

 
}
