using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using LitJson;
public class ExchangeMenu_SellBar : UIBasic2 {

    public  Image img;
    public Text itemName;
    public Text itemDescription;
    public Text date;
   
    public InputField sellCount;
    public Toggle supportCoin;
    public Toggle supportDimond;

    public InputField coinPrice;
    public InputField dimondPrite;


    public GameObject CoinPayBar;
    public GameObject DimondPayBar;

    private ExchangeObject exchangeObject;
    private ExchangeBusinessCoupon businessCoupon;
    // 【0】 老的 data ， [1] 服务器给的data
    public System.Action<ExchangeObject, ExchangeObject> CallBackUploadSellingItem;
    // 【0】 老的 data ， [1] 服务器给的data
    public System.Action<ExchangeBusinessCoupon, ExchangeBusinessCoupon> CallBackUploadSellingItemForExchangeBussinessCoupon;
   
    public System.Action ClickCloseBar;
    private List<int> payPrice;
    private List<int> payType;
    private int lastItemIndex;

    private int lessCount;
    public void SetInfo(ref ExchangeObject _exchangeObject)
    {
        exchangeObject = _exchangeObject;
        if(lastItemIndex != exchangeObject.objectID)
        {
            supportCoin.isOn = false;
            supportDimond.isOn = false;
            coinPrice.text = "0";
            dimondPrite.text = "0";
        }
        lastItemIndex = exchangeObject.objectID;
        Chectype();
    }

    public void SetInfo(ref ExchangeBusinessCoupon _businessCoupon)
    {
        businessCoupon = _businessCoupon;
        if (lastItemIndex != businessCoupon.coupon.businesscouponIndex)
        {
            supportCoin.isOn = false;
            supportDimond.isOn = false;
            coinPrice.text = "0";
            dimondPrite.text = "0";
        }
        lastItemIndex = businessCoupon.coupon.businesscouponIndex;
        AndaDataManager.Instance.GetStrongholdImg(businessCoupon.businessIndex,businessCoupon.coupon.image,SetImg);
        SetName(businessCoupon.coupon.title);
        SetDescription(businessCoupon.coupon.description);
    }





    private void Chectype()
    {
        int groupID =AndaDataManager.Instance.GetObjectGroupID(exchangeObject.objectID);
        switch(groupID)
        {
            case -1:

                break;
            case 1000:
                SetImg(AndaDataManager.Instance.GetMonsterIconSprite(exchangeObject.objectID.ToString()));
                SetName(exchangeObject.objName);
                SetDescription(exchangeObject.objDescription);
                break;
            case 40000:
                SetImg(AndaDataManager.Instance.GetConsumableSprite(exchangeObject.objectID.ToString()));
                SetName(exchangeObject.objName);
                SetDescription(exchangeObject.objDescription);
                break;
        }
    }

    private void SetImg(int t ,Sprite _sp)
    {
        img.sprite = _sp;
    }

    private void SetImg(Sprite _sp)
    {
        img.sprite =_sp;
    }

    private void SetName(string _name)
    {
        itemName.text  = _name;
    }

    private void SetDescription( string _des)
    {
        itemDescription.text =_des;
    }

    public void ChangeToggleSupportCoin()
    {
        CoinPayBar.gameObject.SetTargetActiveOnce(supportCoin.isOn);
    }

    public void ChangeToggleSupportDimond()
    {
        DimondPayBar.gameObject.SetTargetActiveOnce(supportDimond.isOn);
    }


    public void ClickUploadSellingItem()
    {
        if(!supportCoin.isOn && !supportDimond.isOn)
        {
            JIRVIS.Instance.PlayTips("必须支持其中一种支付手段"); 
            return;
        }

        if(supportCoin.isOn)
        {
            int count  =  int.Parse(coinPrice.text);
            if(count <= 0) 
            {
                JIRVIS.Instance.PlayTips("金币填入数量必须大于0");
                return;
            }
            if(payType == null) payType = new List<int>();
            if (payPrice == null) payPrice = new List<int>();
            payType.Add(0);
            payPrice.Add(count);
        }
        if (supportDimond.isOn)
        {
            int count = int.Parse(dimondPrite.text);
            if (count <= 0)
            {
                JIRVIS.Instance.PlayTips("钻石填入数量必须大于0");
                return;
            }
            if (payType == null) payType = new List<int>();
            if (payPrice == null) payPrice = new List<int>();
            payType.Add(1);
            payPrice.Add(count);
        }
        int _sc = int.Parse(sellCount.text);
        if(exchangeObject != null)
        {
            if (_sc <= 0 || _sc > exchangeObject.objectCount)
            {
                JIRVIS.Instance.PlayTips("出售数量必须大于0并且小于" + (exchangeObject.objectCount+1) + "个");
                return;
            }

            exchangeObject.objectPrice = payPrice;
            exchangeObject.buyType = payType;
            lessCount = exchangeObject.objectCount - _sc;
            exchangeObject.objectCount = _sc;
           
            AndaDataManager.Instance.CallServerUploadExchangeObjectToExchange(exchangeObject, UploadResult);
        }

        if(businessCoupon!=null)
        {
            if (_sc <= 0 || _sc > businessCoupon.couponCount)
            {
                JIRVIS.Instance.PlayTips("出售数量必须大于0并且小于" + (businessCoupon.couponCount+1) + "个");
                return;
            }

            businessCoupon.couponPrice = payPrice;
            businessCoupon.buyType = payType;
            lessCount = businessCoupon.couponCount - _sc;
            businessCoupon.couponCount = _sc;
            AndaDataManager.Instance.CallServerUploadExBSCouponToExchagne(businessCoupon, UploadResultForBSCoupon);
        }
    }

    private void UploadResult(ExchangeObject value)
    {
        if(value == null)
        {
            JIRVIS.Instance.PlayTips("请检查网络");
        }else
        {
            if (CallBackUploadSellingItem != null)
            {
                exchangeObject.objectCount = lessCount;
                CallBackUploadSellingItem(exchangeObject, value);
            }

            gameObject.SetTargetActiveOnce(false);
        }

    }


    private void UploadResultForBSCoupon(ExchangeBusinessCoupon _value)
    {
        if (_value == null)
        {
            JIRVIS.Instance.PlayTips("请检查网络");
        }
        else
        {
            if (CallBackUploadSellingItemForExchangeBussinessCoupon != null)
            {
                businessCoupon.couponCount = lessCount;
                CallBackUploadSellingItemForExchangeBussinessCoupon(businessCoupon,_value);
            }

            ClickCancelUpload();
        }
    }

    public void ClickCancelUpload()
    {
        gameObject.SetTargetActiveOnce(false);
        if (ClickCloseBar!=null)
        {
            ClickCloseBar();
        }
    }
     
     
}
