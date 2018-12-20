using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JIRVISButtonItemBase : AndaObjectBasic {

    private AndaObjectBasic btnFadeInReward;

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
        SetFadeInEffect();
    }

    public virtual void SetFadeInEffect()
    {
        btnFadeInReward = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>(ONAME.RewardFadeInEffect);
        btnFadeInReward.transform.GetChild(0).gameObject.SetActive(true);
        btnFadeInReward.SetInto(transform);
    }

    public virtual void ClickItem()
    {
        
    }
}
