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
    private BusinessStrongholdAttribute businessStrongholdAttribute;

    public System.Action<bool> callBackPlayerChoose;

    public void SetInfo(BusinessStrongholdAttribute _businessStrongholdAttribute)
    {
        businessStrongholdAttribute = _businessStrongholdAttribute;
        SetStrongholdInfo();
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
    }

    public void ClickCancel()
    {
        if (callBackPlayerChoose != null)
        {
            callBackPlayerChoose(false);
        }
        JIRVIS.Instance.CloseTips();
    }
}
