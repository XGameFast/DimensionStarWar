using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using LitJson;
public class ExchangeMenu_BuyBar : UIBasic2 {

    public Image image;

    public Text itemName;

    public Text itemDescription;

    public Text itemDate;//有效期

    public Text coinCountLabelForOnly;
    public Text dimondCountLabelForOnly;

    public Text coinCountLabelForBoth;
    public Text dimondCountLabelForBoth;

    public InputField inputBuyCount;

    public GameObject onlyCoinBtn;

    public GameObject onlyDimondBtn;

    public GameObject bothBtn;

    //[0] oldData 【1】new Data from server
    public System.Action<ExchangeObject, ExchangeObject> ClickCallBackForExObj;//回调的参数为 物件的Index
    //[0] oldData 【1】new Data from server
    public System.Action<ExchangeBusinessCoupon, ExchangeBusinessCoupon> ClickCallBackForExBscoupon;
    public System.Action ClickCloseCallBack;

    private ExchangeObject exchangeObject;
    private ExchangeBusinessCoupon exchangeBusinessCoupon;

    private GameObject lastBtn;

   

    public void SetInfo(ref ExchangeObject _value)
    {
        exchangeObject = _value;
        //物品的详细详细
        CheckItemType();

        OpenBtn();//打开哪种支付按钮
    }

    public void SetInfo(ref ExchangeBusinessCoupon _value)
    {
        exchangeBusinessCoupon = _value;
        OpenBtn();//打开哪种支付按钮

        int shIndex = _value.businessIndex;//为这个 赋值，商家据点的index；
        string imagePath = _value.coupon.image;//为这这个 赋值 头像的 地址
        AndaDataManager.Instance.GetStrongholdImg(shIndex, imagePath, SetImage);

        int shijianchuo = 0; //赋值 时间戳，0= 永久，其他数值代表 时候要过期
        string iName = _value.coupon.title;//赋值物件名字
        string iDescription = _value.coupon.description; //赋值物件描述

        SetDate(shijianchuo);
        SetItemName(iName);
        SetDescription(iDescription);
    }


    #region 打开按钮

    private void OpenBtn()
    {
        if(lastBtn !=null)
        {
            lastBtn.gameObject.SetTargetActiveOnce(false);
        }

        List<int> payTypes = exchangeObject ==null? exchangeBusinessCoupon.buyType : exchangeObject.buyType;
        List<int> payPrice = exchangeObject == null ? exchangeBusinessCoupon.couponPrice : exchangeObject.objectPrice;
        if (payTypes.Count==1)
        {
            switch(payTypes[0])
            {
                case 0:
                    onlyCoinBtn.gameObject.SetTargetActiveOnce(true);
                    lastBtn = onlyCoinBtn.gameObject;
                    coinCountLabelForOnly.text = payPrice[0].ToString();
                    dimondCountLabelForOnly.text = "";
                    break;
                case 1:
                    onlyDimondBtn.gameObject.SetTargetActiveOnce(true);
                    lastBtn = onlyDimondBtn.gameObject;
                    coinCountLabelForOnly.text = "";
                    dimondCountLabelForOnly.text = payPrice[0].ToString();
                    break;
            }
        }else if(payTypes.Count == 2)
        {
            bothBtn.gameObject.gameObject.SetTargetActiveOnce(true);
            lastBtn = bothBtn.gameObject;
            coinCountLabelForBoth.text = payPrice[0].ToString();
            dimondCountLabelForBoth.text = payPrice[1].ToString();
        }
       
    }

    #endregion

    #region 关于设置数据

    private void CheckItemType()
    {
        int idType = AndaDataManager.Instance.GetObjectGroupID(exchangeObject.objectID);
        switch (idType)
        {
            case -1: //-1 代表这个不是游戏里的物件，一般指优惠券
               

                break;
            case 1000://出售的宠物

                int shijianchuo2 = 0; //赋值 时间戳，0= 永久，其他数值代表 时候要过期
                string iName2 = exchangeObject.objName;//赋值物件名字
                string iDescription2 = exchangeObject.objDescription; //赋值物件描述

                SetDate(shijianchuo2);
                SetItemName(iName2);
                SetDescription(iDescription2);
                SetImage(AndaDataManager.Instance.GetMonsterIconSprite(exchangeObject.objectID.ToString()));
                break;
            case 40000://出售的游戏内消耗品

                int shijianchuo3 = 0; //赋值 时间戳，0= 永久，其他数值代表 时候要过期
                string iName3 = exchangeObject.objName;//赋值物件名字
                string iDescription3 = exchangeObject.objDescription; //赋值物件描述

                SetDate(shijianchuo3);
                SetItemName(iName3);
                SetDescription(iDescription3);

                SetImage(AndaDataManager.Instance.GetConsumableSprite(exchangeObject.objectID.ToString()));
                break;

        }

    }

    private void SetDate(int _value)
    {
        //_value= 是时间戳。如果没有的就传0，代表 永久期限，一般指游戏内的消耗
        if (_value == 0)
        {
            itemDate.text = "永久";
        }
        else
        {
            //通过时间戳转换成时间
            string t = AndaGameExtension.GetDateString(_value);
            itemDate.text = t;
        }
    }


    private void SetDescription(string _value)
    {
        itemDescription.text = _value;

    }
    private void SetItemName(string _value)
    {
        itemName.text = _value;
    }

    private void SetImage(Sprite sprite)
    {
        image.sprite = sprite;
    }

    private void SetImage(int _index, Sprite sprite)
    {
        image.sprite = sprite;
    }
    #endregion


  

    #region 点击购买金币购买

    public void ClickCoinBuy()
    {
        if(exchangeObject!=null)
        {
            AndaDataManager.Instance.CallServerBuyObjectFromExchange(exchangeObject.exchangeObjectIndex, 0, PayResultForExchangeObj);
        }
        else
        {
            AndaDataManager.Instance.CallServerBuyExBSCouponFromExchange(exchangeBusinessCoupon.exchangeCouponIndex,0, PayResultForExbscoupon);
        }
    }

    #endregion

    #region 点击钻石购购买

    public void ClickDimonBuy()
    {
        if(exchangeObject != null)
        {
            AndaDataManager.Instance.CallServerBuyObjectFromExchange(exchangeObject.exchangeObjectIndex, 1, PayResultForExchangeObj);

        }else
        {
            AndaDataManager.Instance.CallServerBuyExBSCouponFromExchange(exchangeBusinessCoupon.exchangeCouponIndex, 1, PayResultForExbscoupon);
        }
    }

    #endregion

    private void PayResultForExchangeObj(ExchangeObject _exchangeObject)
    {
        if(_exchangeObject == null)
        {
            JIRVIS.Instance.PlayTips("请检查网络");
        }else
        {
            if(ClickCallBackForExObj != null)
            {
                ClickCallBackForExObj(exchangeObject , _exchangeObject);
                ClickClose();
            }
        }
    }

    private void PayResultForExbscoupon(ExchangeBusinessCoupon _businessCoupon)
    {
        if(_businessCoupon == null)
        {
            JIRVIS.Instance.PlayTips("请检查网络");
        }else
        {
            if(ClickCallBackForExBscoupon!=null)
            {
                ClickCallBackForExBscoupon(exchangeBusinessCoupon, _businessCoupon);
                ClickClose();
            }
        }
    }



    public void ClickClose()
    {
        if(ClickCloseCallBack!=null)
        {
            ClickCloseCallBack();
        }
        gameObject.SetActive(false);
    }
   
}
