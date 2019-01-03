using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ExchangeUIItem_TmpSet : AndaObjectBasic {
    private System.Action clickComfrim;
    private System.Action clickCancel;
    public GameObject item;
    public Image imgPor;
    public Animator animator;
    public void SetInfo(System.Action comfirm,System.Action cancel)
    {
        clickComfrim = comfirm;

        clickCancel= cancel;

        SetImange();
    }

    public void SetImange()
    {
        AndaDataManager.Instance.GetPlayerPorImg(SetImage);
    }

    private void SetImage(Sprite _sp)
    {
        imgPor.sprite= _sp;
    }

    public void ClickComfirmItem()
    {
        if(clickComfrim!=null)
        {
            clickComfrim();
        }
    }

    public void ClickCancelItem()
    {
        if(clickCancel!=null)
        {
            clickCancel();
        }
    }

    public void PlayUp()
    {
        animator.Play("Up");
        item.gameObject.SetActive(true);
    }

    public void PlayDown()
    {
        animator.Play("FadeIn");
        item.gameObject.SetActive(false);
    }
}
