using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISEditorboard_StrongholdholdInfo : UIBasic2 {

    public GameObject medalItemPrefab;

    public InputField medalName ;

    public Text localtionText;

    public Text strongholdLevelText;

    public Transform medalPoint;

    private TowerMonster1002 towerMonster1002;

    private int medalLevel;

    public int selectStuteID;

    private int creatTime;

    private bool isInputNameState =false;

    private bool isBackground =false;

    public void SetInfo(string _locationText , int _medalLevel,int stuteID,int _creatTime)
    {
        creatTime = _creatTime;
        medalLevel = _medalLevel;
        localtionText.text = _locationText;

        if(stuteID!=-1)
        {
            SelectMedalItem(stuteID);
        }else
        {
            SelectMedalItem(1003);
        }

    }

    public void SetInputMedalName()
    {
        if(!isInputNameState)
        {
            ClickTurnMedal();
            isInputNameState =true;
        }

        towerMonster1002.SetMedalName(medalName.text);
        //strongholdLevelText.text = medalName.text + "萌新据点";
    }

    private void BuildMeadlItem()
    {
        if(towerMonster1002 !=null)AndaDataManager.Instance.RecieveItem(towerMonster1002);
        towerMonster1002 = AndaDataManager.Instance.GetMedalItemEasy(medalLevel,selectStuteID);
        towerMonster1002.SetMedalInfo(medalLevel,creatTime);
        towerMonster1002.SetInto(medalPoint);
        towerMonster1002.gameObject.SetLayer(ONAME.LayerUI);
        towerMonster1002.SetAlpha(1);
        towerMonster1002.MedalFadeIn();
    }

    public void SelectMedalItem(int stuteID)
    {
        isInputNameState =false;
        selectStuteID = 20000+stuteID;
        //selectStuteID = stuteID;
        BuildMeadlItem();
    }

    public void ClickTurnMedal()
    {
        if(towerMonster1002!=null)
        {
            towerMonster1002.TurnMedal();
        }
    }


}
