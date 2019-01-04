using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JIRVISButtonItemBase : AndaObjectBasic {

    private AndaObjectBasic btnFadeInReward;
    public System.Action<Vector3,GameObject , int > clickBackoutBtnPose;
    private int btnType ;
    public override void OnDispawn()
    {
        if(btnFadeInReward!=null)
        {
            btnFadeInReward.transform.GetChild(0).gameObject.SetActive(false);
            AndaDataManager.Instance.RecieveItem(btnFadeInReward);
        }
        base.OnDispawn();
    }
    public override void OnSpawn()
    {
       
        base.OnSpawn();
       // SetFadeInEffect();
    }


    public virtual void SetType(int type)
    {
        btnType = type;
    }

    public virtual void SetFadeInEffect(int type)
    {
        switch(type)
        {
            case 0:
                btnFadeInReward = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>(ONAME.JIRVISBtnFadeInEffect);
                break;
            case 1:
                btnFadeInReward = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>(ONAME.JIRVISBtnFadeInEffect_01);
                break;
            case 2:
                btnFadeInReward = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>(ONAME.JIRVISBtnFadeInEffect_02);
                break;
        }
       
        btnFadeInReward.transform.GetChild(0).gameObject.SetActive(true);
        btnFadeInReward.SetInto(transform);
        //btnFadeInReward.transform.position = transform.position;
    }

    public virtual void ClickItem()
    {
        if(clickBackoutBtnPose!=null)
        {
            clickBackoutBtnPose(transform.position, gameObject,btnType);
        }
    }
}
