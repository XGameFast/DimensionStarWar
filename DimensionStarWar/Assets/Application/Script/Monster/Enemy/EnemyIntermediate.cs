using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyIntermediate : EnemyFightController {
    /*
     *  Dev :AndaChen 
     *  Date:2018.3.24
     *  
     *  敌人，中级
     *  需要功能：
     *  含有 
     *  1.觉察 玩家 逻辑
     *  2.锁定玩家逻辑 
     *  3.自主位移逻辑
     *  4.攻击逻辑
     *  
     *  
     *  逻辑：=》
     *  常规状态为 自主休闲状态，并开监听玩家
     *  战斗状态：觉察玩家后  锁定玩家（锁定时间基于IQ，）
     *  【1】锁定完成 : 判断是否正在播放攻击动画，如有，return，没有 执行攻击
     *  【2】锁定为完成：随机 （1）移动， （2）待机，{待机拥有 躲避检测}
     *  
     *  只有攻击事件触发后，才会刷新锁定时间
    
     */
    private Vector3 rollToTargetPoint;
    
    


    protected override void OnInitValue()
    {
        base.OnInitValue();
        Debug.Log("look player!!?!?");
       /* if (currentEnemy != null)
        {
            self.ControllerAwaysLookAtTraget(currentEnemy.head, 0.25f);
        }
        else
        {
            self.ControllerAwaysLookAtTraget(ARMonsterSceneDataManager.Instance.arCamera.transform, 0.25f);
        }*/
        if(currentEnemy == null)
        {
            CheckEnemey();
        }

        currentEnemy.MonsterUseSkillEvent+=ListenerPlayerMonsterUseSkill;

        ResetAmiValue();
    }
    protected override void OnUpdate()
    {
        base.OnUpdate();
        
        switch (currentFightState)
        {
            case EnemyFightState.alert:
               // Debug.Log("1002 思考");
                Alert();
                break;
            case EnemyFightState.ami:
               // Debug.Log("1002 瞄准");
                Ami();
                break;
            case EnemyFightState.attack:
              //  Debug.Log("1002 攻击");
                Attack();
                break;
            case EnemyFightState.doge:
               // Debug.Log("1002 跑");
                Doge();
                break;
            case EnemyFightState.roll:
                Roll();
                break;
            case EnemyFightState.listen:
                Listen();
                break;
        }
    }

    protected override void Alert()
    {
        base.Alert();
        if (currentEnemy != null)
        {
            lockLoadTime = Time.time;
            currentFightState = EnemyFightState.ami;
        }
        else
        {
            CheckEnemey();
        }
    }

    protected override void Ami()
    {
        base.Ami();

        if(allowThink)
        {
            if (Time.time - lockLoadTime > lockTimeLimit)
            {

                if(allowNormalAttack && allowBigAttack)
                {
                    int skillType = Random.Range(0, 10);
                    skillType = skillType <= 5 ? 1 : 2;
                    self.ControlChangeSkillFixSkill(skillType);
                    currentFightState = EnemyFightState.attack;
                    return;
                }

                if(allowNormalAttack)
                {

                    int skillType = 1;
                    self.ControlChangeSkillFixSkill(skillType);
                    currentFightState = EnemyFightState.attack;
                    return;
                }

                if (allowBigAttack)
                {

                    int skillType = 2;
                    self.ControlChangeSkillFixSkill(skillType);
                    currentFightState = EnemyFightState.attack;
                    return;
                }
                ResetAmiValue();
            }
        }else
        {
            if(allowNormalAttack && Time.time -  self.monsterDataValue.getNormalSkillCurrentCD > self.monsterDataValue.getNormalSkillCDLimit)
            {
                self.ControlChangeSkillFixSkill(1);
                currentFightState = EnemyFightState.attack;
                return;
            }

            if(allowDefnse && Time.time - self.monsterDataValue.getDefnseSkillCurrentCD > self.monsterDataValue.getDefenseSkillCDLimit)
            {
                self.ControlChangeSkillFixSkill(0);
                currentFightState = EnemyFightState.attack;
                return;
            }

            if (allowDefnse && Time.time - self.monsterDataValue.getSpecialSkillCurrentCD > self.monsterDataValue.getSpecialSkillCDLimit)
            {
                self.ControlChangeSkillFixSkill(2);
                currentFightState = EnemyFightState.attack;
                return;
            }

            ResetAmiValue();
        }
    }

    protected override void Attack()
    {
        base.Attack();
      
        if(self.isStartSkill){ Debug.Log("技能正在使用");return; } 
        if(!self.currentSkillIsCownDown){ Debug.Log("技能还在CD");return;}
        if(!self.SetState((int)OTYPE.MonsterActiveStateType.attack)){ Debug.Log("当前不可以使用技能");return; }
        self.ControllerToRotateBodyByPoint(currentEnemy.selfPostion, 0.35f);
        self.ControllerToAttak(currentEnemy.center.position ,true);
        ResetAmiValue();
        currentFightState = EnemyFightState.ami;
    }

    protected override void Doge()
    {
        base.Doge();
        currentFightState = EnemyFightState.roll;
    }

    protected override void Roll()
    {
        base.Roll();
        Vector3 enmeyForward = currentEnemy.transform.forward;
        Vector3 enmeyWithMineDir = self.selfPostion - currentEnemy.selfPostion;
        if (Vector3.Angle(enmeyForward, enmeyWithMineDir) < 10)
        {
            float dir = Vector3.Cross(enmeyForward, enmeyWithMineDir).y;
            lastDir = dir < 0 ? -1 : 1;
            float interval = Random.Range(0.25f, 0.5f) * ARMonsterSceneDataManager.Instance.getARWorldScale;
            rollToTargetPoint = self.selfPostion + lastDir * currentEnemy.transform.right * interval;
            if (self.CheckCanMove())
            {
                self.ControllerMoveToTargetPoint(self.selfPostion, rollToTargetPoint, self.monsterDataValue.moveSpeed);
                self.ControllerToRotateBodyByPoint(rollToTargetPoint, 0.35f);
                self.PlayAnimationState();
                currentFightState = EnemyFightState.listen;
            }
        }
        else
        {
            currentFightState = EnemyFightState.ami;
        }
    }

    protected override void Listen()
    {
        base.Listen();
        if (self.selfPostion == rollToTargetPoint)
        {
            self.ControllerToRotateBodyByPoint(currentEnemy.selfPostion);
            currentFightState = EnemyFightState.ami;
        }
    }


    private void ResetAmiValue()
    {
        lockLoadTime = Time.time;
        lockTimeLimit = Random.Range(3f, 4F);
    }
    
    private int lastDir = 1;
    
    public override void ListenerPlayerMonsterUseSkill(int skillType)
    {
        base.ListenerPlayerMonsterUseSkill(skillType);
        if(!allowMove)return ;
        if (currentFightState == EnemyFightState.ami && skillType ==(int)MonsterGameData.SkillType.attack)
        {
            int random = Random.Range(0,10);
            if(random<5)
            {  
                if(self.SkillIsCownDown(0)) 
                {
                    if(allowDefnse)
                    {
                        self.ControlChangeSkillFixSkill(0); //防御
                        currentFightState = EnemyFightState.attack;
                    }
                    else
                    {
                        currentFightState = EnemyFightState.doge;
                    }


                }else
                {
                    currentFightState = EnemyFightState.doge;
                }
            }else
            {
                currentFightState = EnemyFightState.doge;
            }
        }
    }
}
