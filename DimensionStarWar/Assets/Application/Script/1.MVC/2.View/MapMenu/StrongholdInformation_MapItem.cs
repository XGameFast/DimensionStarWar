using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class StrongholdInformation_MapItem : AndaObjectBasic {

    private PlayerStrongholdAttribute playerStronghold;
    private BusinessStrongholdAttribute businessStrongholdAttribute;
    private AndaObjectBasic tower;


    public float loadSpeed;
    public CanvasGroup canvasGroup;
    public Text nameLabel;
    public Slider levelBackGroundProgress;
    public Slider levelProgress;
    public Text levelStr;
    public Text levelNameStr;
    public Text expStrValue;
    public Text expblockCount;
    public Text withPlayerDistance;
    public Transform TowerPoint;

    //用于确认需要展示的内容，0 是玩家据点的信息，1= 商家据点的信息
    private int curInfoType;
    private System.Action<int>CallBackClickItem;

    public override void OnDispawn()
    {

        if(tower!=null)
        {
            AndaDataManager.Instance.RecieveItem(tower);
            tower = null;
        }

        base.OnDispawn();
    }

    public void SetPlayerStrongholdInfo(PlayerStrongholdAttribute _psa ,System.Action<int> callBacklstrongholdIndex)
    {
        CallBackClickItem = callBacklstrongholdIndex;
        playerStronghold = _psa;
        curInfoType= 0;
    }
    public void SetBussinessStrongholdInfo(BusinessStrongholdAttribute _bas,System.Action<int> callBackstrongholdIndex)
    {
        CallBackClickItem = callBackstrongholdIndex;
        businessStrongholdAttribute = _bas;
        curInfoType=1;
    }

    public void ShowInfo()
    {
        switch(curInfoType)
        {
            case 0:
                ShowPlayerStrongholdInfo();
                break;
            case 1:
                ShowBussinessStrongholdInfo();
                break;
        }
    }

    private void ShowPlayerStrongholdInfo()
    {
        
        StartCoroutine(ExcuteShowPlayerStrongholdInfo());
        SetTowerObj();
    }

    private IEnumerator ExcuteShowPlayerStrongholdInfo()
    {
        nameLabel.text= playerStronghold.strongholdNickName;
        levelStr.text = "Lv."+ (playerStronghold.strongholdLevel+1);
        levelNameStr.text = playerStronghold.strongholdLevelName;
        expblockCount.text =  playerStronghold.playerStrongholdExpblockCount.ToString();
        //withPlayerDistance.text = 
        int maxExp = playerStronghold.strongholdMaxValue;
        int curExp = playerStronghold.strongholdGloryValue;
        float expPer = (float)curExp/maxExp;
        float tmp = 0;
        while(tmp<1)
        {
            tmp+=Time.deltaTime*loadSpeed;
            float t = Mathf.Lerp(0,1,tmp);
            canvasGroup.alpha = t;
            levelBackGroundProgress.value = t;
            levelProgress.value = t * expPer;
           
            expStrValue.text = ((int)(t*curExp)) + "/" +maxExp;
            yield return null;
        }

        expStrValue.text = curExp+ "/" +maxExp;

        levelProgress.value = expPer;
    }


    private void ShowBussinessStrongholdInfo()
    {
        StartCoroutine(ExcuteShowBussinessStronghold());
        SetTowerObj();
    }

    private IEnumerator ExcuteShowBussinessStronghold()
    { 
        nameLabel.text= businessStrongholdAttribute.strongholdNickName;
        levelStr.text = "Lv."+ (businessStrongholdAttribute.strongholdLevel+1);
        levelNameStr.text = businessStrongholdAttribute.strongholdLevelName;
        // expblockCount.text =  //businessStrongholdAttribute.playerStrongholdExpblockCount.ToString();
        //withPlayerDistance.text = 
        int maxExp = businessStrongholdAttribute.strongholdMaxValue;
        int curExp = businessStrongholdAttribute.strongholdGloryValue;
        float expPer = (float)curExp/maxExp;
        float tmp = 0;
        while(tmp<1)
        {
            tmp+=Time.deltaTime*loadSpeed;
            float t = Mathf.Lerp(0,1,tmp);
            canvasGroup.alpha = t;
            levelBackGroundProgress.value = t;
            levelProgress.value = t * expPer;
            expStrValue.text = ((int)(t*curExp)) + "/" +maxExp;
            yield return null;
        }

        expStrValue.text = curExp+ "/" +maxExp;

        levelProgress.value = expPer;
    }

    private void SetTowerObj()
    {
        if(tower == null)
        {
            tower = AndaDataManager.Instance.InstantiateTower("30001");
            tower.gameObject.SetLayer(ONAME.LayerHoloUI);
            tower.SetTargetActiveOnce(false);
            tower.SetInto(TowerPoint);
            //tower.transform.position = towerPoint.transform.position;
            //这里稍微等一会执行，是先让grid位置先确定好
          
        } 
        Invoke("InvokPlayFadeIn",0.5f);
    }

    private void InvokPlayFadeIn()
    { 
        tower.SetTargetActiveOnce(true);
        tower.GetComponent<TowerBase>().SkingrowUp();
    }

    public void ClickItem()
    {
        switch(curInfoType)
        {
            case 0:
                ShowPlayerStrongholdInfo();
                break;
            case 1:
                ShowBussinessStrongholdInfo();
                break;
        }
    }

}
