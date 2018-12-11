using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISContent_BussinessStrongholdInfo : UIBasic2
{


    public CanvasGroup shGroup;
    public CanvasGroup monsterGroup;
    public CanvasGroup rewardGroup;

    public Animator BSHPorItemAnimation;

    public Text playerName;

    public Text info;

    public Text strongholdNickName;
    public Image strongholdImg;
    public Image strongholdLevelImg;
    public Text playerDescription;
    public Text monsterNickName;

    public Image monsterLevelImage;
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
    public Text rewardRate;
    public GameObject checkActiveBtn;
    private BusinessStrongholdAttribute businessStrongholdAttribute;
    private BusinessActivity currentSelectBusinessActity;

    public GameObject haveRewardItem;
    public GameObject NoRewardItem;

    public System.Action<bool> callBackPlayerChoose;


    public Dropdown dropdown;

    public override void OnDispawn()
    {
        shGroup.alpha =0;
        monsterGroup.alpha =0;
        rewardGroup.alpha =0;
        info.text = "";
        strongholdNickName.text ="";
        playerDescription.text ="";
        strongholdImg.gameObject.SetActive(false);

        monsterNickName.text = "";
        monsterPower.value = 0;
        monsterPowerValue.text ="";

        normalAttackNickName.text ="";
        monsterNormalAttackSlider.value =0;
        monsterNomralAttackValue.text = "";

        specialSkillNickName.text ="";
        monsterSpecialSkillValue.text ="";
        monsterSpecialSkillSlider.value =0;

        defenseSkillNickName.text ="";
        monsterDefenseSkillValue.text ="";
        monsterDefenseSkillSlider.value = 0;//.text =
        monsterSprite.gameObject.SetActive(false);// = null;
        monsterLevelImage.gameObject.SetActive(false);// = null;

        rewardImage.gameObject.SetActive(false);
        rewardName.text ="";
        rewardDescription.text ="";
        rewardRate.text = "";

        haveRewardItem.gameObject.SetActive(false);
        haveRewardItem.gameObject.SetActive(true);

        currentSelectBusinessActity = null;
        dropdown.ClearOptions();
        base.OnDispawn();
    }

    public void SetInfo(BusinessStrongholdAttribute _businessStrongholdAttribute)
    {
        businessStrongholdAttribute = _businessStrongholdAttribute;
        StartCoroutine(ExcuteFadeInItem());
        PlayTips();
    }

    private IEnumerator ExcuteFadeInItem()
    {
        yield return new WaitForSeconds(1f);
        float t = 0;
        int itemGropIndex =0;
        while(itemGropIndex<3)
        {
            t+= Time.deltaTime*3f;
            t = Mathf.Clamp01(t);
            if(itemGropIndex == 0)
            {
                shGroup.alpha = t;
                if (t >= 1)
                {
                    SetStrongholdInfo();
                    BuildActivity();
                    yield return new WaitForSeconds(0.25f);
                    t = 0;
                    itemGropIndex += 1;
                }
            }
            else if (itemGropIndex == 1)
            {
                monsterGroup.alpha = t;
                if (t >= 1)
                {
                    BuildMonsterInfomation();
                    yield return new WaitForSeconds(0.5f);
                    t = 0;
                    itemGropIndex += 1;
                }
            }
            else if (itemGropIndex == 2)
            {
                rewardGroup.alpha = t;
                if (t >= 1)
                {
                    BuildRewardInfo();
                    itemGropIndex += 1;
                }
            }
            yield return null;
        }
    }



    private void SetStrongholdInfo()
    {
        strongholdImg.gameObject.SetActive(true);
        int t = Random.Range(134,320);
        info.text = "当前有" + AndaGameExtension.ChangeTextColorToYellow(t.ToString()) + "位读星者正在前往保护据点";
        playerName.text = businessStrongholdAttribute.hostNickName;
        strongholdNickName.text = businessStrongholdAttribute.strongholdNickName;
        AndaDataManager.Instance.GetStrongholdImg(businessStrongholdAttribute.strongholdIndex,businessStrongholdAttribute.headImage, UpdateSHPor);
        playerDescription.text = businessStrongholdAttribute.autoGraph;
        BSHPorItemAnimation.Play("BSHPorItemFadeIn");
    }

    private void UpdateSHPor(int _index,Sprite sp)
    {
         strongholdImg.sprite = sp;
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


    /// <summary>
    /// 设置宠物信息
    /// </summary>
    public void BuildMonsterInfomation()
    {
        MonsterBaseConfig mbc = MonsterGameData.GetMonsterBaseConfig(businessStrongholdAttribute.statueID);
        List<int>skilID = mbc.monsterBaseSkillList;
        SkillBaseAttribute nk = MonsterGameData.GetSkillBaseAttribute(skilID[0]);
        SkillBaseAttribute sk= MonsterGameData.GetSkillBaseAttribute(skilID[2]);
        SkillBaseAttribute dk = MonsterGameData.GetSkillBaseAttribute(skilID[1]);
        monsterSprite.gameObject.SetActive(true);
        monsterSprite.sprite = AndaDataManager.Instance.GetMonsterIconSprite(mbc.monsterID.ToString());
        monsterLevelImage.sprite = AndaDataManager.Instance.GetMonsterLevelBoardSprite(4);
        monsterNickName.text = mbc.monsterName;
         
        normalAttackNickName.text = nk.skillName;
        defenseSkillNickName.text = dk.skillName;
        specialSkillNickName.text = sk.skillName;

        StartCoroutine(ExcuteSetMonsterInfo(mbc,nk, sk,dk));


    }

    private IEnumerator ExcuteSetMonsterInfo(MonsterBaseConfig mc ,SkillBaseAttribute nk, SkillBaseAttribute sk, SkillBaseAttribute dk)
    {
        float t = 0;
        while(t < 1)
        {
            t += Time.deltaTime;
            t = Mathf.Clamp01(t);

            monsterPower.value = t;
            monsterPowerValue.text = GetValueStr(mc.monsterBaseBlood,t);

            monsterNormalAttackSlider.value = t;
            monsterDefenseSkillSlider.value =t;
            monsterDefenseSkillSlider.value = t;

            monsterNomralAttackValue.text = GetValueStr(nk.skillPower[0],t);
            monsterDefenseSkillValue.text = GetValueStr(dk.skillPower[0],t);
            monsterSpecialSkillValue.text = GetValueStr(sk.skillPower[0],t);

            yield return null;
        }
    }
  
    private string GetValueStr(int v, float t)
    {
        return ((int)(v*t)).ToString();
    }


    public void BuildRewardInfo()
    {
        if(businessStrongholdAttribute.businessData.businessCoupons == null)
        {
            haveRewardItem.gameObject.SetActive(false);
            NoRewardItem.gameObject.SetActive(true);
            return;
        }

        haveRewardItem.gameObject.SetActive(true);
        NoRewardItem.gameObject.SetActive(false);

        BusinessCoupon businessCoupon = businessStrongholdAttribute.businessData.businessCoupons[0];
        AndaDataManager.Instance.GetBSHRewardImg(businessCoupon.image,(Result =>
        {
            rewardImage.gameObject.SetTargetActiveOnce(true);
            rewardImage.sprite = Result;
        }));
        rewardName.text = businessCoupon.title;
        rewardDescription.text = businessCoupon.description;
        rewardRate.text = "概率" + businessCoupon.rewardDropRate+"%";
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
