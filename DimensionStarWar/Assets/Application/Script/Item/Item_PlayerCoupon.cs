using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Item_PlayerCoupon : AndaObjectBasic {

    public Image headImg;
    public Text nameText;
    public Text countText;
    public Text limitDateText;


    private PlayerCoupon curPlayerCoupon;
    public void SetInfo(PlayerCoupon playerCoupon)
    {
        curPlayerCoupon = playerCoupon;

        SetImg();
        SetName();
        SetCount();
        SetDateLimit();
    }

    private void SetImg()
    {
        if(curPlayerCoupon.coupon.userIndex == AndaDataManager.Instance.userData.userIndex)
        {
            AndaDataManager.Instance.GetStrongholdImg(curPlayerCoupon.coupon.userIndex,curPlayerCoupon.coupon.image,SetImg);
        }else
        {
            AndaDataManager.Instance.GetPlayerPorImg(SetImg);
        }
    }

    private void SetImg(int busIndex, Sprite _sp)
    {
        SetImg(_sp);
    }

    private void SetImg(Sprite _sp)
    {
        headImg.sprite = _sp;
    }

    private void SetName()
    {
        nameText.text = curPlayerCoupon.coupon.title;
    }

    private void SetCount()
    {
        countText.text = "x" + curPlayerCoupon.count;
    }

    private void SetDateLimit()
    {
        limitDateText.text = "有效期:" +  ToolByGjp.GetDisTime(curPlayerCoupon.coupon.endtime);
    }
}
