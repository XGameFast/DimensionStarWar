using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyFightController : EnemyMonster {
   
    public enum EnemyFightState
    {
        none,
        alert,
        ami,
        attack,
        doge,
        roll,
        listen,
    }

    public enum DogeType
    {
        none,
        roll,
        jump
    }
    
   
    protected EnemyFightState currentFightState;
    protected DogeType currentDogeType;

    protected float lockLoadTime;
    protected float lockTimeLimit;

    protected MonsterBasic currentEnemy;

    protected override void OnInitValue()
    {
        base.OnInitValue();
        lockLoadTime = 0;
        lockTimeLimit = 0;
        currentState = EnemyState.fight;
        currentFightState = EnemyFightState.alert;
        currentDogeType = DogeType.none;
        CheckEnemey();
        ARMonsterSceneDataManager.Instance.currentEnemy = self;
    }

    protected void CheckEnemey()
    {
        currentEnemy = ARMonsterSceneDataManager.Instance.currentSceneMonster;

    }

    protected virtual void Alert()
    {

    }


    protected virtual void Ami()
    {

    }

    protected virtual void Attack()
    {

    }

    protected virtual void Doge()
    {

    }
    protected virtual void Roll()
    {

    }

    protected virtual void Listen()
    {

    }
    #region 监听玩家的动向  需要再 战斗控制器中 生成怪兽的时候进行注册
    //注意这个注册一定是在玩家的怪兽生成之后

    public virtual void ListenerPlayerMonsterUseSkill(int skillType)
    {

    }



    #endregion
}
