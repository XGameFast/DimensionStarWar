using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISTips_ChooseTIps : AndaObjectBasic {

    public Text tips;
    public GameObject btnGroup;
    public GameObject confirmBtn;
    public GameObject cancelBtn;
    public GameObject onlyConfirmBtn;
    public System.Action clickComfirmCallBack;
    public System.Action clickCancelCallBack;
    public Text comfirmBtnText;
    public Text canceBtnText;
    public Text onlyConfirmBtnText;


    public override void OnDispawn()
    {
        tips.text = "";
        btnGroup.gameObject.SetTargetActiveOnce(false);
        confirmBtn.gameObject.SetTargetActiveOnce(false);
        cancelBtn.gameObject.SetTargetActiveOnce(false);
        onlyConfirmBtn.gameObject.SetTargetActiveOnce(false);
        base.OnDispawn();
    }
    public void SetInfo(string tipsContent, OTYPE.TipsType tipsType, string yesBtnTitle, string noBtnTitle)
    {
        tips.gameObject.SetTargetActiveOnce(false);
        btnGroup.gameObject.SetTargetActiveOnce(false);
        confirmBtn.gameObject.SetTargetActiveOnce((int)tipsType == 2);
        cancelBtn.gameObject.SetTargetActiveOnce((int)tipsType == 2);
        onlyConfirmBtn.gameObject.SetTargetActiveOnce((int)tipsType == 1);

        comfirmBtnText.text = yesBtnTitle;
        canceBtnText.text = noBtnTitle;
        onlyConfirmBtnText.text = yesBtnTitle;

        tips.text = tipsContent;
        Invoke("InvokeSetInfo" ,0.25f);
    }

    private void InvokeSetInfo()
    {
        tips.gameObject.SetTargetActiveOnce(true);
        btnGroup.gameObject.SetTargetActiveOnce(true);
    }

    public void ClickComfirmBtn()
    {
        clickComfirmCallBack();
    }

    public void ClickCancelBtn()
    {
        clickCancelCallBack();
    }
}
