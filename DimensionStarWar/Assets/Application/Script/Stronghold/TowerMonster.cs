using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TowerMonster : AndaObjectBasic {

    public Transform getTopPose { get {return topPose;}}
    public Transform topPose;
    public Renderer medalTexture;
    public Renderer medalbody;
    public Animator animator;

    private bool isBackhind =false;
    public virtual void SetInfo()
    {
        
    }

    public virtual void SetMonsterMaterial( Material materialTexture  ,Material medalBody)
    {
      
    }

    public virtual void SetSkinGrowupValue(float value)
    {
        
    }

    public virtual void SetSkinCenterInfo(Vector4 vector4 , float height)
    {
        
    }

    public virtual void SetAlpha(float alpha)
    {
        
    }

    public Transform GetTopPose(int level) //更具等级返回最高点的位置
    {
        return topPose;
    }

    public virtual void MedalFadeIn()
    {
        animator.Play("FadeIn");
    }

    public virtual void TurnMedal()
    {
        if(!isBackhind)
        {
            animator.Play("Background");
            isBackhind = false;
        }else
        {
            animator.Play("Foward");
            isBackhind = true;
        }
    }
   
}
