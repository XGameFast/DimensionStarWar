using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class ItemInfo_PlayerCoupon : MonoBehaviour , IPointerClickHandler
{


    public PlayerCouponView playerCouponView;

    public PlayerCoupon playerCoupon;

    public void SetInfo(PlayerCouponView _playerCouponView, GameObject _contentPanel, PlayerCoupon _playerCoupon)
    {
        playerCoupon = _playerCoupon;
        playerCouponView = _playerCouponView;
        playerCouponView.ContentPanel = _contentPanel;
        transform.GetChild(0).GetComponent<Text>().text = playerCoupon.coupon.title;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        AndaPlayerCouponManager.Instance.selectPlayerCoupon = playerCoupon;

        playerCouponView.ContentPanel.SetActive(true);

        if (playerCoupon.status == 1)
        {
            playerCouponView.ButtonCheack.SetActive(true);
            playerCouponView.ButtonFail.SetActive(true);
        }
        else {
            playerCouponView.ButtonCheack.SetActive(false);
            playerCouponView.ButtonFail.SetActive(false);
        }

        playerCouponView.TitleText.text = playerCoupon.coupon.title;
        playerCouponView.ContentText.text = playerCoupon.coupon.description;
        playerCouponView.dateText.text = ConvertTool.UnixTimestampToDateTime(playerCoupon.createTime).ToShortDateString();
    }

   
}
