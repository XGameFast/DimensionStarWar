using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShowCenterMonsterBasic : AndaObjectBasic {

    public Animator animator;

    public virtual void PlayHelloAnimation()
    {

    }

    public virtual void PlayRequestAnimation()
    {

    }

    public virtual void FadeIn()
    {
        AndaObjectBasic fadeInEffect = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("FadeInEffect");
        fadeInEffect.SetInto(transform);
        fadeInEffect.gameObject.SetLayer(gameObject.layer);
        fadeInEffect.ResetDestory(4f);
    }

}
