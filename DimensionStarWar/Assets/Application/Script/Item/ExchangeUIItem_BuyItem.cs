using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class ExchangeUIItem_BuyItem : AndaObjectBasic {

    public Image image;

    public Text itemName;

    public Text itemDescription;

    public Text itemDate;//有效期

    private System.Action<int> ClickCallBack;//回调的参数为 物件的Index

    private ExchangeObject exchangeObject;
    private ExchangeBusinessCoupon exchangeBusinessCoupon;
    public Text itemCount;

    public GameObject coinBtn;
    public GameObject dimondBtn;

    public Text coinCountLabel;
    public Text dimondCountLabel;

    public override void OnDispawn()
    {
        exchangeObject = null;
        exchangeBusinessCoupon = null;
        image.sprite = null;
        itemName.text = "";
        itemDescription.text ="";
        itemDate.text = "";
        base.OnDispawn();
    }

    public void SetInfo(ExchangeObject _value,System.Action<int> callback)
    {
        //赋值点击回调函数
        ClickCallBack = callback;

        exchangeObject = _value;
        //物品的详细详细
        CheckItemType();

        if (_value.buyType.Count == 2)
        {
            coinBtn.SetActive(true);
            dimondBtn.SetActive(true);
            coinCountLabel.text = _value.objectPrice[0].ToString();
            dimondCountLabel.text = _value.objectPrice[1].ToString();
        }
        else
        {
            if (_value.buyType[0] == 0)
            {
                coinBtn.SetActive(true);
                dimondBtn.SetActive(false);
                coinCountLabel.text = _value.objectPrice[0].ToString();
                dimondCountLabel.text = "";
            }
            else
            {
                coinBtn.SetActive(false);
                dimondBtn.SetActive(true);
                coinCountLabel.text = "";
                dimondCountLabel.text = _value.objectPrice[0].ToString();
            }
        }
    }

    public void SetInfo(ExchangeBusinessCoupon _value,System.Action<int> callback)
    {
        //赋值点击回调函数
        ClickCallBack = callback;

        exchangeBusinessCoupon = _value;

        int shIndex = _value.businessIndex;//为这个 赋值，商家据点的index；
        string imagePath = _value.coupon.image;//为这这个 赋值 头像的 地址
        AndaDataManager.Instance.GetStrongholdImg(shIndex, imagePath, SetImage);

        int shijianchuo = 0; //赋值 时间戳，0= 永久，其他数值代表 时候要过期
        string iName = _value.coupon.title;//赋值物件名字
        string iDescription = _value.coupon.description; //赋值物件描述

        SetDate(shijianchuo);
        SetItemName(iName);
        SetDescription(iDescription);
        itemCount.text = "x" + _value.couponCount.ToString();

        if (_value.buyType.Count == 2)
        {
            coinBtn.SetActive(true);
            dimondBtn.SetActive(true);
            coinCountLabel.text = _value.couponPrice[0].ToString();
            dimondCountLabel.text = _value.couponPrice[1].ToString();
        }
        else
        {
            if (_value.buyType[0] == 0)
            {
                coinBtn.SetActive(true);
                dimondBtn.SetActive(false);
                coinCountLabel.text = _value.couponPrice[0].ToString();
                dimondCountLabel.text = "";
            }
            else
            {
                coinBtn.SetActive(false);
                dimondBtn.SetActive(true);
                coinCountLabel.text = "";
                dimondCountLabel.text = _value.couponPrice[0].ToString();
            }
        }
    }

    private void CheckItemType()
    {
        int idType = AndaDataManager.Instance.GetObjectGroupID(exchangeObject.objectID);
        switch(idType)
        {
            case -1: //-1 代表这个不是游戏里的物件，一般指优惠券

                break;
            case 1000://出售的宠物

                int shijianchuo2 = 0; //赋值 时间戳，0= 永久，其他数值代表 时候要过期
                string iName2 = "";//赋值物件名字
                string iDescription2 = ""; //赋值物件描述
                SetDate(shijianchuo2);
                SetItemName(iName2);
                SetDescription(iDescription2);
                SetImage(AndaDataManager.Instance.GetMonsterIconSprite(exchangeObject.objectID.ToString()));
                itemCount.text = "x" + exchangeObject.objectCount.ToString();
                break;
            case 40000://出售的游戏内消耗品

                int shijianchuo3 = 0; //赋值 时间戳，0= 永久，其他数值代表 时候要过期
                string iName3 = exchangeObject.objName;//赋值物件名字
                string iDescription3 = exchangeObject.objDescription;//"; //赋值物件描述
                SetDate(shijianchuo3);
                SetItemName(iName3);
                SetDescription(iDescription3);
                SetImage(AndaDataManager.Instance.GetConsumableSprite(exchangeObject.objectID.ToString()));
                itemCount.text = "x" + exchangeObject.objectCount.ToString();
                break;

        }
      
    }


    private void SetDate(int _value)
    {
        //_value= 是时间戳。如果没有的就传0，代表 永久期限，一般指游戏内的消耗
        if(_value == 0)
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
        itemDescription.text =_value;

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



    public void ClickItem()
    {
        if(ClickCallBack!=null)
        {
            if(exchangeObject != null)
            {
                ClickCallBack(exchangeObject.exchangeObjectIndex);
            }
            if(exchangeBusinessCoupon!=null)
            {
                ClickCallBack(exchangeBusinessCoupon.exchangeCouponIndex);
            }
        }


    }
}
