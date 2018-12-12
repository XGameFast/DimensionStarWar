using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
public class BuildDimensionMenu_MonsterInforBar : MonoBehaviour {

    public GameObject btn1;
    public GameObject btn2;
    public GameObject btn3;
    public GameObject btn4;
    public GameObject btn5;

    public Transform monsterBaseNamePoint;

    public Text monsterNickName;

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


    public GameObject ExpPanel;
    public GameObject ObjectPanel;

    public Text Exp01;
    public Text Exp02;
    public Text Exp03;

    public Text MonsterSearch01;
    public Text MonsterSearch02;

    public GameObject object1;
    public GameObject object2;
    public GameObject object3;

    public GameObject selectList;
    public GameObject selectContent;
    public GameObject selectItem;

    public GameObject searchTimePanel;
    public List<GameObject> selectData;

    public Button imageShowButton;
    public Image ShowImage;
    public void SetInfo(PlayerMonsterAttribute _playerMonsterAttribute )
    {
        pma = _playerMonsterAttribute;
        if (pma.currentStateType == 2)
        {
            searchTimePanel.SetTargetActiveOnce(true);
            MonsterSearch01.gameObject.SetTargetActiveOnce(false);
            MonsterSearch02.gameObject.SetTargetActiveOnce(true);
        }
        else {
            searchTimePanel.SetTargetActiveOnce(false);
            MonsterSearch01.gameObject.SetTargetActiveOnce(true);
            MonsterSearch02.gameObject.SetTargetActiveOnce(false);
        }
        monsterNickName.text = pma.monsterNickName;

        StartCoroutine(ExcuteMonsterPower());
        if(isOpenSkillBar)
        {
            StartCoroutine(ExcuteSkillSlider());
        }

        BuildMonsterBaseName();
        showSomeButtom();
    }
    public void ShowOrCloseImage()
    {
        if (ShowImage.gameObject.activeSelf)
            ShowImage.gameObject.SetTargetActiveOnce(false);
        else
            ShowImage.gameObject.SetTargetActiveOnce(true);
    }
    public void showSomeButtom()
    {
        if (!isOpenSkillBar)
            return;
        if (pma.currentStateType != 1)
        {
            btn2.SetTargetActiveOnce(true);
            btn5.SetTargetActiveOnce(false);
        }
        else 
        {
            btn2.SetTargetActiveOnce(false);
            btn5.SetTargetActiveOnce(true);
        }
    }
    public void Update()
    {
        if (pma.currentStateType == 2)
        {
            var dis = pma.finishTreasureTime - ToolByGjp.GetTimestamp();
            if (dis >= 0)
                searchTimePanel.transform.GetChild(0).GetComponent<Text>().text = ToolByGjp.GetDisTime(dis);
        }
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


    public void StartSearch()
    {
        if (pma.currentStateType == 2)
        {
            searchTimePanel.SetTargetActiveOnce(true);
            JIRVIS.Instance.PlayTips("星宿已出发！");
            return;
        }
        if (pma.mosterPower <= 0)
        {
            searchTimePanel.SetTargetActiveOnce(false);
            JIRVIS.Instance.PlayTips("星宿体力不够！");
            return;
        }
        if (pma.currentStateType != 0)
        {
            JIRVIS.Instance.PlayTips("该星宿正忙！无法出去探索");
        }
        pma.currentStateType = 2;
        AndaDataManager.Instance.CallUpStartSearch(pma.monsterIndex,object1.GetComponent<ObjectSelect>().selectObjectIndex, object2.GetComponent<ObjectSelect>().selectObjectIndex, object3.GetComponent<ObjectSelect>().selectObjectIndex, StartSearchCallBack);
    }

    public void FinishSearche()
    {
        MonsterSearch02.gameObject.GetComponent<Button>().enabled = false;
        AndaDataManager.Instance.CallUpFinishSearch(pma.monsterIndex, FinishiSearchCallBack);
    }
    public void StartSearchCallBack(bool success)
    {
        if (success)
        {
            searchTimePanel.SetTargetActiveOnce(true);
            Debug.Log("星宿出去搜寻了！");
            MonsterSearch02.gameObject.SetTargetActiveOnce(true);
            MonsterSearch01.gameObject.SetTargetActiveOnce(false);
            selectList.SetTargetActiveOnce(false);
            ObjectPanel.SetTargetActiveOnce(false);
            object1.GetComponent<ObjectSelect>().InitValue();
            object2.GetComponent<ObjectSelect>().InitValue();
            object3.GetComponent<ObjectSelect>().InitValue();
        }
        else
        {
            searchTimePanel.SetTargetActiveOnce(false);
            pma.currentStateType = 0;
        }
          
    }
    public void FinishiSearchCallBack(bool success, string imageBase64)
    {
        if (success)
        {
            MonsterSearch01.gameObject.SetTargetActiveOnce(true);
            MonsterSearch02.gameObject.SetTargetActiveOnce(false);
            StartCoroutine(ExcuteMonsterPower());
            Debug.Log("星宿回来了！");
            pma.currentStateType = 0;
            searchTimePanel.SetTargetActiveOnce(false);
            if (imageBase64 != null)
            {
                imageShowButton.gameObject.SetTargetActiveOnce(true);
                ShowImage.sprite = ToolByGjp.Base64ToImg(imageBase64);
            }
        }
        else
        {
            searchTimePanel.SetTargetActiveOnce(true);
        }
        MonsterSearch02.gameObject.GetComponent<Button>().enabled = true;
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

        monsterSkillBtn.gameObject.SetTargetActiveOnce(true);
    }

    private void BuildMonsterBaseName()
    {
        if(monsterBaseNameObj != null) Destroy(monsterBaseNameObj);// AndaDataManager.Instance.RecieveItem(monsterBaseNameObj);
        monsterBaseNameObj = AndaDataManager.Instance.GetSpritePerfab("BaseName" + pma.monsterID);
        monsterBaseNameObj = Instantiate(monsterBaseNameObj);
        monsterBaseNameObj.transform.SetInto(monsterBaseNamePoint);
    }


    public void ClickOpneSkillInfo()
    {
        if(!isOpenSkillBar)
        {
            isOpenSkillBar = true;
            StartCoroutine(ExcuteSkillSlider());
        }
        else
        {
         
            isOpenSkillBar = false;
            monsterNormalAttackSlider.gameObject.SetTargetActiveOnce(false);
            monsterDefenseSkillSlider.gameObject.SetTargetActiveOnce(false);
            monsterSpecialSkillSlider.gameObject.SetTargetActiveOnce(false);
             
            btn1.gameObject.SetTargetActiveOnce(false);
            if(!JIRVIS.Instance.isARType)
            {
                btn2.gameObject.SetTargetActiveOnce(false);
                btn3.gameObject.SetTargetActiveOnce(false);
                btn4.gameObject.SetTargetActiveOnce(false);
                btn5.gameObject.SetTargetActiveOnce(false);
            }

        }
      
      
    }

    public void Defense()
    {
        if (pma.currentStateType != 0)
        {
            JIRVIS.Instance.PlayTips("该星宿不是空闲状态，无法守护据点！");
            return;
        }
        AndaDataManager.Instance.MonsterStatusChanged(CallDefenseBackFinish, pma.monsterIndex,1);
    }
    public void Normal()
    {
        if (pma.currentStateType != 1)
        {
            JIRVIS.Instance.PlayTips("该星宿不是守护状态，无法空闲！");
            return;
        }
        AndaDataManager.Instance.MonsterStatusChanged(CallNormalBackFinish, pma.monsterIndex, 0);
    }
    public void CallDefenseBackFinish(bool success)
    {
        if (success)
        {
            JIRVIS.Instance.PlayTips("已设置该星宿为守护状态");
            pma.currentStateType = 1;
            showSomeButtom();
        }
    }
    public void CallNormalBackFinish(bool success)
    {
        if (success)
        {
            JIRVIS.Instance.PlayTips("已设置该星宿为空闲状态");
            pma.currentStateType = 0;
            showSomeButtom();
        }
    }

    private IEnumerator ExcuteSkillSlider()
    {
        float t =  0;
        btn1.gameObject.SetTargetActiveOnce(true);
        if(!JIRVIS.Instance.isARType)
        {
            btn2.gameObject.SetTargetActiveOnce(true);
            btn3.gameObject.SetTargetActiveOnce(true);
            btn4.gameObject.SetTargetActiveOnce(true);
            showSomeButtom();
        }
       
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

        while(t < 1 && isOpenSkillBar)
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

    public void ShowSelectList(ObjectSelect objectSelect)
    {

        if (objectSelect.selectObjectID > 0)
        {
            objectSelect.InitValue();
            return;
        }
        selectList.SetTargetActiveOnce(true);

        List<UserObjsBox> objectList =new List<UserObjsBox> ();
        CD_ObjAttr cD_ObjAttr = new CD_ObjAttr();
        if (selectData != null)
        {
            foreach (var m in selectData)
            {
                Destroy(m);
            }
            selectData.Clear();
        }
        else {
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
            jIRVISEditonConsumableItemInformationBar.SetNameAndCount(cD_ObjAttr.objectName[i], objectID.ToString(), objectCount,false);
            jIRVISEditonConsumableItemInformationBar.SetInto(selectContent.transform.transform);
            jIRVISEditonConsumableItemInformationBar.gameObject.AddComponent<ObjectSelectItem>();
            jIRVISEditonConsumableItemInformationBar.gameObject.GetComponent<ObjectSelectItem>().SetInfo(objectID, objectIndex, objectCount, objectSelect);
            jIRVISEditonConsumableItemInformationBar.SetCallBack(jIRVISEditonConsumableItemInformationBar.gameObject.GetComponent<ObjectSelectItem>().OnClickBack);
            jIRVISEditonConsumableItemInformationBar.transform.localScale *= 0.3f;
            selectData.Add(jIRVISEditonConsumableItemInformationBar.gameObject);
        }
    }
}
