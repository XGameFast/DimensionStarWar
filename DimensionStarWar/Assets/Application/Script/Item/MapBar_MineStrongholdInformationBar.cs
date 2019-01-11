using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class MapBar_MineStrongholdInformationBar : UIBasic2 {

    public Animator curAnimator;
    public Slider sh_levelSlider;
    public Text shLevelExpValue_text;
    public Text ShLevel_text;
    public Text sh_nickName;
    public Image sh_Image;
    public Text sh_locationValue;

    public Image sh_Por;
    public Image sh_Level_Board;

    public Slider sh_powerExpSlider;
    public Text sh_powerExp_Count_Text;

    public Slider sh_captionSlider;


    public Text sh_capitionValue_Text;
   

    public Slider sh_recoverySlider;

    public Text sh_reconveryText;


    private PlayerStrongholdAttribute psa;

    private System.Action clickComfrim;
    private System.Action clickCancel;

    public override void OnDispawn()
    {
        //---
        sh_levelSlider.value =0;
        shLevelExpValue_text.text ="";
        ShLevel_text.text = "";
        sh_nickName.text = "";
        sh_Image.sprite = null;
        sh_locationValue.text = "";
        sh_Por.sprite =null;
        sh_Level_Board.sprite = null;
        sh_powerExpSlider.value = 0;
        sh_powerExp_Count_Text.text = null;
        sh_captionSlider.value = 0;
        sh_capitionValue_Text.text = ""; 
        sh_recoverySlider.value = 0;
        sh_reconveryText.text = "";

        base.OnDispawn();
    }


    public void SetInfo(PlayerStrongholdAttribute _psa , System.Action _clickComfirm, System.Action _clickCancel)
    {
        clickComfrim = _clickComfirm;
        clickCancel = _clickCancel;


        JIRVIS.Instance.PlayTipsForchoose("立即进入占星庭", OTYPE.TipsType.chooseTips, "进入", "路过", ClickComfrimBtn, ClickCancel);
        curAnimator.Play("FadeIn");
        psa = _psa;
        StartCoroutine(ExcuteSetInfo());
    }

    private IEnumerator ExcuteSetInfo()
    {
        yield return new WaitForSeconds(1f);
        float t = 0;
        int shMaxExp = psa.strongholdMaxValue;
        float expPer =(float)psa.strongholdGloryValue / shMaxExp;
        ShLevel_text.text = psa.strongholdLevel.ToString();
        sh_nickName.text = psa.strongholdNickName;
        sh_locationValue.text = psa.strongholdLocationName;
        AndaDataManager.Instance.GetPlayerPorImg(SetImage);
        float expBlockPer = (float)psa.playerStrongholdExpblockCount / psa.playerStrongholdExpblockMax;

        //float t = MonsterGameData.GetStrongBasedAttribute().playerStrongHoldRecoveryStrengthTime

        //float recovery = psa.playerStrongholdRecoveryStrengthTime / 

        int maxCaption = MonsterGameData.GetStrongBasedAttribute().playerStrongHoldCapacity[psa.strongholdLevel];
        float captionPer =(float)psa.playerStrongholdCapacity/ maxCaption;

        while (t <  1 )
        {
            t += Time.deltaTime;
            t = Mathf.Clamp01(t);


            sh_levelSlider.value = expPer * t;
            shLevelExpValue_text.text = psa.strongholdGloryValue * t + "/" + shMaxExp;

            sh_powerExpSlider.value = expBlockPer * t;
            sh_powerExp_Count_Text.text = psa.playerStrongholdExpblockCount * t + "/" + psa.playerStrongholdExpblockMax;

            sh_captionSlider.value = maxCaption * t;

            sh_capitionValue_Text.text = psa.playerStrongholdExpblockCount * t + "/" + psa.playerStrongholdExpblockMax;

            yield return null;
        }
    }
    private void SetImage(Sprite _sp)
    {
        sh_Image.sprite = _sp;
    }


    private void ClickComfrimBtn()
    {
        clickComfrim();
        AndaDataManager.Instance.RecieveItem(this);
        JIRVIS.Instance.CloseTips();
    }

    private void ClickCancel()
    {
        clickCancel();
        AndaDataManager.Instance.RecieveItem(this);
        JIRVIS.Instance.CloseTips();
    }


}
