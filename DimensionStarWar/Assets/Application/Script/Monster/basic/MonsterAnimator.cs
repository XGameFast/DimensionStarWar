using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterAnimator  {

    public Animator animator
    {
        get
        {
            return self.animator;
        }
    }
   
    [HideInInspector]

    public string getCurClipName{get {return curAnimationName; }}
    private string curAnimationName;
    private string currentClipName;
    //const
    public const string MOVE = "move";
    public const string FADEIN = "fadeIn";
    public const string FADEOUT = "fadeOut";
    public const string IDLE = "idle";
    public const string FIGHT = "fight";
    public const string COMBINATION = "skill";
    public const string HIT = "hit";
    public const string BIGHIT = "bighit";
    public const string DEATH = "death";
    public const string DISPLAYMAGIC = "displayMagic";
    public const string DEFENSE = "defense";
    public const string HAPPY = "happy";
    public const string FIGHTIDLE = "fightIdle";

    public MonsterBasic self;

    public enum AttackAniamtionType
    {
        normal = 0 ,
        cobination =1,
        displayMagi =2,
        defense =3,
        skill=4,

    }

    public void DownloadMessage(MonsterBasic mb)
    {
        self = mb;
        InitValue();
    }
    public void InitValue()
    {
        currentClipName = "";
    }



    public void PlayAnimation(int state)
    {
        PlayerFightStateAnimation(state);
    }
    #region 播放战斗状态下动画片段
    private void PlayerFightStateAnimation(int stateID)
    {
        switch (stateID)
        {
             case (int)OTYPE.MonsterActiveStateType.dead:
                PlayDeath();
                break;
            case (int)OTYPE.MonsterActiveStateType.hit:
                PlayHit();
                break;
            case (int)OTYPE.MonsterActiveStateType.attack:
                PlayAttackAnimation();
                break;
            case (int)OTYPE.MonsterActiveStateType.move:
                PlayMove();
                break;
            case (int)OTYPE.MonsterActiveStateType.idle:
                PlayIdle();
                break;
            case (int)OTYPE.MonsterActiveStateType.mood:
                PlayMood();
                break;
            case (int)OTYPE.MonsterActiveStateType.none:
                PlayIdle();
                break;
        }
    }
    #endregion


    public void PlayMood()
    {
        switch (self.currentMoodType)
        {
            case OTYPE.MonsterMoodStateType.none:
                break;
            case OTYPE.MonsterMoodStateType.happy:
                animator.CrossFade(HAPPY, 0.15f);
                break;
            case OTYPE.MonsterMoodStateType.excited:
                break;
            case OTYPE.MonsterMoodStateType.sad:
                break;
        }
    }

    public void PlayDeath()
    {
        animator.speed =1;
        animator.CrossFade(DEATH, 0.15f);
        currentClipName = DEATH;
    }
    public void PlayIdle()
    {
        animator.speed =1;
        switch (self.currentPlayType)
        {
            case OTYPE.MonsterStateType.fight:
              currentClipName = FIGHTIDLE;
                break;
            case OTYPE.MonsterStateType.treasure:
            case OTYPE.MonsterStateType.leisure:
                currentClipName = IDLE;
                break;
        }
        animator.CrossFade(currentClipName, 0f);
    }
    public void PlayMove()
    {
        if (currentClipName == MOVE) return;
        animator.CrossFade(MOVE, 0.05f);
        currentClipName = MOVE;
    }
    /// <summary>
    /// 普通攻击
    /// </summary>
    public void PlayAttackAnimation()
    {
        float speed = self.monsterDataValue.getCurrentSkillAnimationSpeed;
        Debug.Log("AttackSpeed" + speed);
        switch (self.currentSkillAttackType)
        {
            case (int)AttackAniamtionType.normal:
              
                animator.speed = speed;
                int random = Random.Range(0, self.attackAnimationCount);
                string key = FIGHT + "0" +random;
                animator.CrossFade(key, 0f);
                curAnimationName = key;
                break;
            case (int)AttackAniamtionType.cobination://技能
               
                animator.speed = speed;
                animator.CrossFade(COMBINATION, 0f);
                curAnimationName = COMBINATION;
                break;
            case (int)AttackAniamtionType.displayMagi:
                animator.CrossFade(DISPLAYMAGIC, 0f);
                break;
            case (int)AttackAniamtionType.defense:
                animator.CrossFade(DEFENSE, 0f);
                break;
        }
        currentClipName = FIGHT;
    }
    /// <summary>
    /// 组合技能
    /// </summary>
    public void PlayCombinationSkill01()
    {
       
        currentClipName = COMBINATION;
    }
    public void PlayHit()
    {
        if (self.isBigHit)
        {
            PlayBigHit();
        }
        else
        {
            animator.speed =1;
            int r = Random.Range(0, self.hitAniamtionCount);
            //Debug.Log("hitIndex:" + (HIT + "0" + r));
            animator.CrossFade(HIT + "0" + r, 0f);
            currentClipName = HIT;
        }
    }
    public void PlayBigHit()
    {
        animator.speed =1;
        animator.CrossFade(BIGHIT , 0f);
        currentClipName = BIGHIT;
    }
    public void PlayFadeIn()
    {
        if (animator != null)
        {
            animator.CrossFade(FADEIN, 0.0f);
            Debug.Log("AnimationFadeIn");
        }
    }

    public void PlayClean()
    {

    }

    public void PlayeTreasure()
    {

    }

    //构建战斗状态的帧事件
    private void BuildAnimationEvent()
    {
        
    }
}
