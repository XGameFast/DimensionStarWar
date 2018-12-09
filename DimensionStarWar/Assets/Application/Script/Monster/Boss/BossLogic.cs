using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossLogic {

    public enum BossActiveState
    {
        find = 0,
        finding = 1,
        attack = 2,
        think = 3,
        move = 4,
        moving =5,
        magicl =6,//释放一些技能之前的前置动画 状态。比如聚能的时候动画，
    }

    public virtual void BuildBossLogic(BossBasic _bossBasic)
    {
        
    }

    public virtual void FindPlayer()
    {
              
    }

    public virtual void Moveing()
    {
        
    }

    public virtual void AttackPlayer()
    {
        
    }

    public virtual void Think()
    {
        
    }

    public virtual void Defense()
    {
        
    }

    public virtual void RealeseMagical()
    {
        
    }

    public void OnUpdate()
    {
        Logic();
    }

    protected virtual void Logic()
    {
        
    }

}
