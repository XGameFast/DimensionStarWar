using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class BossBasic : AndaObjectBasic {

    #region 变量
    public Animator animator;
    public BossData bossData;
    public float safeDistance;
    public float farDistance;
    public float nearDistance;
    public float moveSpeed;
    public float elGun_interval;
    public float elGun_lifeTime;

    public System.Action<int,int> BossHasBeenAttack;
    public System.Action<int,bool> BossHadDeath;

    //[部件]
    public Transform headFwdPint;
    public Transform head;
    public Transform body;

    #endregion

    #region 动作调用接口
    public virtual void ReadySkill()
    {
        if(bossData.getBossSkillLogic!=null)
        {
           
        }
    }
    public virtual void TriggerSkill()
    {
        if(bossData.getBossSkillLogic!=null)
        {
            bossData.getBossSkillLogic.TriggerSkill();
        } 
    }

    public void EndSkill()
    {
        ControlIdle();
    }

    #endregion

    #region 初始化
    public virtual void  SetInfo(PlayerMonsterAttribute _playerMonsterAttribute)
    {
        
    }

    #endregion

    #region 构建数据

    protected virtual void BuildData(PlayerMonsterAttribute _playerMonsterAttribute)
    {
        
    }

    #endregion


    #region 传递控制


    public virtual void ControlAttack()
    {
        
    }

    public void ControlRotate(Quaternion quaternion)
    {
        if(bossData.getBossActive!=null)
        {
            bossData.getBossAnimtion.PlayerRotate(0);//动画
            bossData.getBossActive.PlayRotate(quaternion);
        }
    }

    public void ControlKeepHeadForward(Vector3 _fwd)
    {
        if(bossData.getBossActive!=null)
        {
            bossData.getBossActive.HeadLookAtDir(_fwd);
        }
    }

    public void ControlRotateHead(Quaternion quaternion)
    {
        if(bossData.getBossActive!=null)
        {
            bossData.getBossActive.PlayRotateHead(quaternion);
        }
    }

    public void ControlMoveForward(Vector3 _targetPoint , float speed = 1)
    {
        if(bossData.getBossActive!=null)
        {
            bossData.getBossAnimtion.PlayMove(speed);//动画
            bossData.getBossActive.PlayGone(_targetPoint,speed);
        } 
    }

    public void ControlDead()
    {
        bossData.SetBossActive(false);
        bossData.getBossAnimtion.PlayDead();
        if(BossHadDeath!=null)
        {
            BossHadDeath(bossData.getCurrentPower, false);
        }
    }

    public void ControlIdle()
    {
        if(bossData.getBossActive!=null)
        {
            bossData.SetEndOfAttack(true);
            bossData.SetEndOfRealseMagicalState(true);
            bossData.getBossAnimtion.PlayIdle();//动画
        }
    }

    public virtual void HasBeenAttack(int hitValue)
    {
        if(!bossData.getBossIsActive)return;
        int lessPower = bossData.UpdateBlood(hitValue);
        if (lessPower == -1) return;
        if(lessPower <=0 )
        {
            ControlDead();
        }
        else
        {
            //-- st
        }

        if (BossHasBeenAttack != null)
        {
            BossHasBeenAttack(lessPower,bossData.getMaxPower);
        }
    }
    #endregion


    public void Update()
    {
        OnUpdate();
    }

    protected virtual void OnUpdate()
    {
        
    }
}
