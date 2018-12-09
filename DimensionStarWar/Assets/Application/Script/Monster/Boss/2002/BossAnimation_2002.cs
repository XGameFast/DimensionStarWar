using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossAnimation_2002 : BossAnimation {
    private Boss2002 boss2002 ;
    public override void BuildBossAnimation(BossBasic _bossBasic)
    {
        boss2002 = _bossBasic as Boss2002;
        base.BuildBossAnimation(boss2002);
    }

    public override void PlayAttact(int skillID)
    {
        if(curAnimationType!=0 && curAnimationType >= (int)BossAnimationType.attack)return;
        boss2002.animator.SetInteger("SkillID" , skillID);
        boss2002.animator.CrossFade("skill00",0.0f);
    }

    public override void PlayAttack(string animationName)
    {
        if(curAnimationType!=0 && curAnimationType >= (int)BossAnimationType.attack)return;
        boss2002.animator.CrossFade("skill01",0.0f);
    }

    public override void PlayMove(float _speed)
    {
        if(curAnimationType!=0 &&  curAnimationType >= (int)BossAnimationType.move)return;
        curAnimationType = (int)BossAnimationType.move;
        boss2002.animator.speed = _speed;
        boss2002.animator.CrossFade("move",0.1f);
    }

    public override void PlayerRotate(int dir)
    {
        if(curAnimationType!=0 && curAnimationType >= (int)BossAnimationType.leftRightRotate)return;
        curAnimationType = (int)BossAnimationType.leftRightRotate;
        if(dir<0)
        {
            boss2002.animator.CrossFade("leftrotate",0.0f);
        }else
        {
            boss2002.animator.CrossFade("rightrotate",0.0f);
        }
    }

    public override void PlayIdle()
    {
        boss2002.animator.speed = 1;
        curAnimationType = (int)BossAnimationType.idle;
        boss2002.animator.CrossFade("idle",0.2f);
    }

    public override void PlayRealeseMgical()
    {
        boss2002.animator.speed = 1;
        curAnimationType = (int)BossAnimationType.magical;
        boss2002.animator.CrossFade("magical",0.2f);
    }


}
