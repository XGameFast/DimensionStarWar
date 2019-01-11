using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerCouponDetail : UIBasic {

    public PlayerCoupon selectPlayerCoupon;

    public Image headImage;

    public Text businessName;
    public Text playerCouponName;
    public Text describe;
    public Text time;

    public RawImage QRCode;
    public Button confirmButton;

    public Text tips;

    public void setInfo(PlayerCoupon _playerCoupon)
    {
        selectPlayerCoupon = _playerCoupon;

        businessName.text = selectPlayerCoupon.coupon.businessname;
        playerCouponName.text = selectPlayerCoupon.coupon.title;
        describe.text = selectPlayerCoupon.coupon.description;
        time.text = ConvertTool.UnixTimestampToDateTime(selectPlayerCoupon.coupon.endtime).ToShortDateString();
        QRCode.texture = QRcodeDrawTool.ShowCode(LitJson.JsonMapper.ToJson(selectPlayerCoupon));
        tips.text = selectPlayerCoupon.coupon.tips;
        AndaDataManager.Instance.GetStrongholdImg(_playerCoupon.businessIndex,_playerCoupon.coupon.image , SetImage);
    }

    public void SetImage(int _index, Sprite _sp)
    {
        headImage.sprite = _sp;
    }

    public void Open(PlayerCoupon _playerCoupon)
    {
        setInfo(_playerCoupon);
        Show();
    }

    public void Show()
    {
        PlayeAniFadeIn();
        gameObject.SetTargetActiveOnce(true);
    }
    public void Close()
    {
        PlayAniFadeOut();
        gameObject.SetTargetActiveOnce(false);
    }
}
