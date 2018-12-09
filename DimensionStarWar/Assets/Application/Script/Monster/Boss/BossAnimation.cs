using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossAnimation {
    public enum BossAnimationType
    {
        none =-1 ,
        idle = 0,
        leftRightRotate = 1,
        move = 2,
        magical = 3,
        attack=4,
        death = 10,

    }
    private BossBasic bossBasic;
    protected int curAnimationType = -1;

    public virtual void BuildBossAnimation(BossBasic _bossBasic)
    {
        bossBasic =_bossBasic;
    }

    public virtual void PlayAttact(int skillID)
    {
      
    }
    public virtual void PlayAttack(string animationName)
    {
        
    }


    public virtual void PlayMove(float _speed )
    {
        
    }

    public virtual void PlayerRotate(int dir)
    {
        
    }

    public virtual void PlayIdle()
    {
       
    }

    public virtual void PlayRealeseMgical()
    {
        
    }
}
