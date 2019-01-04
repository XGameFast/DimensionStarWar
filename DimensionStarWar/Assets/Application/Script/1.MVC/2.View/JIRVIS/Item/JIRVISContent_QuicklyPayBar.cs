using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.UI;
public class JIRVISContent_QuicklyPayBar : UIBasic2
{
    public Image image;

    public Text itemName;

    public Text itemDescription;

    public Text coinCountLabelForOnly;
    public Text dimondCountLabelForOnly;

    public Text coinCountLabelForBoth;
    public Text dimondCountLabelForBoth;

    public GameObject onlyCoinBtn;

    public GameObject onlyDimondBtn;

    public GameObject bothBtn;

    private System.Action<int> clickCallBack;

    public void SetInfo(Sprite _sp , string _name, string itemDescription, List<int> payPrice, System.Action<int> callback)
    {
        clickCallBack = callback;
        SetImage(_sp);
        SetItemName(_name);
        SetItemDescrpition(itemDescription);
        SetPayBtn(payPrice);
    }

    public void SetInfo(string imagePath, int shIndex, string _name, string itemDes , List<int> payPrice , System.Action<int> callback)
    {
        clickCallBack = callback;
        AndaDataManager.Instance.GetStrongholdImg(shIndex,imagePath, SetImage);
        SetItemName(_name);
        SetItemDescrpition(itemDes);
        SetPayBtn(payPrice);
    }

    private void SetImage(int shIndex,Sprite _sp)
    {
        SetImage(_sp);
    }

    private void SetImage(Sprite _sp)
    {
        image.sprite = _sp;
    }

    private void SetItemName(string _na)
    {
        itemName.text = _na;
    }

    private void SetItemDescrpition(string  _des)
    {
        itemDescription.text = _des;
    }

    private void SetPayBtn(List<int> pay)
    {
        if(pay[0]!=-1 && pay[1]!=- 1)//2种支付
        {
            bothBtn.gameObject.SetTargetActiveOnce(true);
            coinCountLabelForBoth.text = pay[0].ToString();
            dimondCountLabelForBoth.text = pay[1].ToString();
            return;
        }
        if(pay[0]!=-1 && pay[1] == -1) //金币支付
        {
            coinCountLabelForOnly.text = pay[0].ToString();
            return;
        }

        if(pay[0] == -1 && pay[1] != -1) //钻石支付
        {
            dimondCountLabelForOnly.text = pay[1].ToString();
            return;
        }

    }

    public void ClickPayWithCoin()
    {
        if(clickCallBack!=null)
        {
            clickCallBack(0);
        }
    }

    public void ClickPayWithDimond()
    {
        if (clickCallBack != null)
        {
            clickCallBack(1);
        }
    }
}
