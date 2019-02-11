using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerCouponDetail : UIBasic2 {


    public Animator animatorBar;

    public PlayerCoupon selectPlayerCoupon;

    public Image headImage;

    public Text businessName;
    public Text playerCouponName;
    public Text describe;
    public Text time;

    public RawImage QRCode;
    public Button confirmButton;

    public Text tips;

    public Transform content;

    public bool IsShow = false;


    public System.Action callbackClose;


    public void setInfo(PlayerCoupon _playerCoupon)
    {
        selectPlayerCoupon = _playerCoupon;

        businessName.text = selectPlayerCoupon.coupon.businessname;
        playerCouponName.text = selectPlayerCoupon.coupon.title;
        describe.text = selectPlayerCoupon.coupon.description;
        Debug.Log(selectPlayerCoupon.coupon.endtime);
        if (selectPlayerCoupon.coupon.endtime == 0)
            time.text = "有效期：永久有效";
        else
            time.text = "有效期：" + ConvertTool.UnixTimestampToDateTime(selectPlayerCoupon.coupon.endtime).ToShortDateString();
        //QRCode.texture = QRcodeDrawTool.ShowCode(LitJson.JsonMapper.ToJson(selectPlayerCoupon));
        var qr = new PlayerCouponQR();
        qr.CreateTime = ToolByGjp.GetTimestamp();
        qr.playerCouponIndex = selectPlayerCoupon.playerCouponIndex;
        qr.playerIndex = selectPlayerCoupon.playerIndex;
        var json = LitJson.JsonMapper.ToJson(qr);
        Debug.Log(ToolByGjp.AESEncryptor.Encrypt(json, "playerCoupon"));
        QRCode.texture = QRcodeDrawTool.ShowCode(ToolByGjp.AESEncryptor.Encrypt(json, "playerCoupon"));
        //QRCode.texture = QRcodeDrawTool.ShowCode("http://47.99.45.109:8081/api/PlayerCoupon/QRCheackByGet?QR=" + ToolByGjp.AESEncryptor.Encrypt(json, "playerCoupon"));
        tips.text = selectPlayerCoupon.coupon.tips;
        AndaDataManager.Instance.GetStrongholdImg(_playerCoupon.businessIndex,_playerCoupon.coupon.image , SetImage);
        Debug.Log(selectPlayerCoupon.status);
        ShowButtonText(selectPlayerCoupon.status);
    }


    public void ShowButtonText(int _index)
    {
        confirmButton.transform.GetChild(0).gameObject.SetActive(false);
        confirmButton.transform.GetChild(1).gameObject.SetActive(false);
        confirmButton.transform.GetChild(2).gameObject.SetActive(false);
        confirmButton.transform.GetChild(3).gameObject.SetActive(false);
        confirmButton.transform.GetChild(_index).gameObject.SetActive(true);
        if (_index == 0)
            confirmButton.enabled = true;
        else
            confirmButton.enabled = false;
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
 
    public void Confirm()
    {
        AndaDataManager.Instance.PlayerCouponUp(selectPlayerCoupon.playerCouponIndex, 1 , ConfirmBack);
    }
    public void ConfirmBack(bool res)
    {
        if (res)
        {
            Debug.Log("优惠卷提交成功");

            Close();
        }
        else {

            Debug.Log("优惠卷提交失败");
        }
    }
    public void Show()
    {
      //  FadeIn();
        gameObject.SetTargetActiveOnce(true);
        animatorBar.Play("FadeIn");
    }
    public void SetShow()
    {
        IsShow = true;
    }
    public void SetClose()
    {
        //gameObject.SetActive(false);
        //content.transform.position = new Vector3(content.transform.position.x, 0, content.transform.position.z);
    }
    public void Close()
    {
        IsShow = false;
        animatorBar.Play("FadeOut");
       // FadeOut(CallbackFinishFadeOut);

        Invoke("CallbackFinishFadeOut",2f);

    }
    /*public void Scroll(Vector2 v2)
    {
        if (IsShow)
        {
           
        }
    }*/
    private void CallbackFinishFadeOut()
    {
        if (callbackClose != null)
        {
            callbackClose();
        }
    }

    private void Update()
    {
        if(IsShow)
        {
            if(Input.GetMouseButtonUp(0))
            {
                if (content.transform.position.y <40)
                {
                    Close();
                }
            }
        }
    }
}
