using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISContent_ExchangeStrongholdEditorBar : UIBasic2 {

    public Image imgPor;

    public InputField inputName;

    public InputField inputNote;

    public Slider payRate;


    private System.Action<string, string, int> CallBackComfirm;
    private System.Action CallBackCancel;

    public  void SetInfo(System.Action<string ,string ,int> comfirm,System.Action cancel)
    {
        CallBackComfirm = comfirm;
        CallBackCancel = cancel;
        JIRVIS.Instance.PlayTipsForchoose("您是否要将交易所建立在此处?", OTYPE.TipsType.chooseTips , "是" ,"不想" , ClickComfirm, ClickCancel);
        AndaDataManager.Instance.GetPlayerPorImg(BuildIMGPor);
    }

    private void BuildIMGPor(Sprite _sp)
    {
        imgPor.sprite = _sp;
    }

    public void ClickComfirm()
    {
        if(CallBackComfirm != null)
        {
            int t = (int)(payRate.value * 100);
            CallBackComfirm(inputName.text,inputNote.text, t);
        }
        JIRVIS.Instance.CloseTips();
        JIRVIS.Instance.jIRVISData.RemoveExchangeStrongholdBar();
    }

    public void ClickCancel()
    {
        if(CallBackCancel != null)
        {
            CallBackCancel();
        }
        JIRVIS.Instance.CloseTips();
        JIRVIS.Instance.jIRVISData.RemoveExchangeStrongholdBar();
    }




}
