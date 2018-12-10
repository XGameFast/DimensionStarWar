using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISContent_BussinessStrongholdInfo : UIBasic2
{
    public Text playerName;

    public Text strongholdNickName;
    public Image strongholdImg;
    public Image strongholdLevelImg;
    public Text playerDescription;

    public Image monsterSprite;
    public Slider monsterPower;
    public Text monsterPowerValue;

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

    public Text currentProtectPeople;

    public Image rewardImage;
    public Text rewardName;
    public Text rewardDescription;
    public GameObject checkActiveBtn;
    private BusinessStrongholdAttribute businessStrongholdAttribute;
    private BusinessActivity currentSelectBusinessActity;

    public System.Action<bool> callBackPlayerChoose;


    public Dropdown dropdown;

    public override void OnDispawn()
    {
        currentSelectBusinessActity =null;
        dropdown.ClearOptions();
        base.OnDispawn();
    }

    public void SetInfo(BusinessStrongholdAttribute _businessStrongholdAttribute)
    {
        businessStrongholdAttribute = _businessStrongholdAttribute;
        SetStrongholdInfo();
        BuildActivity();
        PlayTips();
    }

    private void SetStrongholdInfo()
    {
        playerName.text = businessStrongholdAttribute.hostNickName;
        strongholdNickName.text = businessStrongholdAttribute.strongholdNickName;
        AndaDataManager.Instance.GetStrongholdImg(businessStrongholdAttribute.headImage,(result=>
        {
            if(result!=null)
            {
                strongholdImg.sprite = result;
            }
        }));
        playerDescription.text = businessStrongholdAttribute.autoGraph;
    }

    private void BuildActivity()
    {
      

        List<BusinessActivity> businessActivities = businessStrongholdAttribute.businessData.ActiveData;

        if(businessActivities.Count <=0)
        {
            dropdown.enabled =false;
            dropdown.gameObject.SetActive(false);
            checkActiveBtn.gameObject.SetActive(false);
            return ;
        }
        dropdown.enabled=true;
        dropdown.gameObject.SetActive(true);
        checkActiveBtn.gameObject.SetActive(true);
        List<Dropdown.OptionData> optionDataList =new List<Dropdown.OptionData>();
        int count = businessActivities.Count;
        for(int i = 0 ; i < count; i++)
        {
            Dropdown.OptionData optionData = new Dropdown.OptionData
            {
                text = businessActivities[i].activeDescription
            };
            optionDataList.Add(optionData);
        }
        dropdown.AddOptions(optionDataList);

        SelectDropdownItem();
    }

    /// <summary>
    /// 选择的据点活动信息
    /// </summary>
    public void SelectDropdownItem()
    {
        currentSelectBusinessActity = businessStrongholdAttribute.businessData.ActiveData[dropdown.value];
    }



    public void BuildMonsterInfomation()
    {

    }
  




    public void PlayTips()
    {
        JIRVIS.Instance.PlayTipsForchoose("商家正在遭遇攻击，亟需保卫，是否立刻前往", OTYPE.TipsType.chooseTips , "前往" ,"不了", ClickComfirm,ClickCancel);
    }

    public void ClickComfirm()
    {
        if(callBackPlayerChoose!=null)
        {
            callBackPlayerChoose(true);
        }
        JIRVIS.Instance.CloseTips();
        AndaDataManager.Instance.RecieveItem(this);
    }

    public void ClickCancel()
    {
        if (callBackPlayerChoose != null)
        {
            callBackPlayerChoose(false);
        }
        JIRVIS.Instance.CloseTips();
        AndaDataManager.Instance.RecieveItem(this);
    }

    public void ClickActiveInformation()
    {
        if(currentSelectBusinessActity == null)
        {
            JIRVIS.Instance.PlayTips("当前商家没有进行活动");
            return;
        }

        WebManager.Instance.OpenWeb(currentSelectBusinessActity.activeURL);
    }
}
