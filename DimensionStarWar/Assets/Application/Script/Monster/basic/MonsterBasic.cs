using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterBasic : AndaObjectBasic
{
    [HideInInspector]
    public bool bati = false; // 不播放受击动画
    [HideInInspector]
    public bool onlyBigAttack = false;
    [HideInInspector]
    public bool onlyDefense = false;
    [HideInInspector]
    public bool onlyNormalAttack = false;
    [HideInInspector]
    public bool standOnly = false;



    public MonsterPowerBar monsterPowerBar;
    [HideInInspector]
    public Material skinStoneMaterias;
    //-------AnimationEvent

    #region 接收动画事件，在角色动画片段上插入事件帧，调用相对应的函数
    public void AnimationMagicSkill()
    {
        if (monsterDataValue == null) return;
        if (MonsterUseSkillEvent != null)
        {
            MonsterUseSkillEvent(currentSkillType);
        }
    }

    //开始播放技能动作
    public virtual void StartSkill(int index)
    {
        if (monsterDataValue == null) return;
        monsterFight.AnimatorStartSkill(GetPoint(index));
    }
    //开始组合技能动作
    public void StartCombinationSkill(string info)
    {
        if (monsterDataValue == null) return;
        string[] infos = info.Split(',');
        int info1 = int.Parse(infos[0]);
        int info2 = int.Parse(infos[1]);
        monsterFight.AnimatorStartCombinationSkill(GetPoint(info1), info2);
    }
    //达到技能触发帧数
    public void UsingSkill()
    {
        if (monsterDataValue == null) return;
        monsterFight.AnimatorUsingSkill();
        if (UsingSkillEvent != null)
        {
            UsingSkillEvent();
        }
    }
    //动作尾摆结束
    public void EndSkillAni()
    {
        if (monsterDataValue == null) return;
        monsterDataValue.UpdateIsStartSkill(false);
        if (OverAttackEvent != null)
        {
            OverAttackEvent();
        }
    }
    //动作完全退出
    public void OutAttack()
    {
        if (monsterDataValue == null) return;
        //monsterDataValue.UpdateIsStartSkill(false);
        //Debug.Log("isStartSkill" + isStartSkill);
        //monsterFight.AnimatorOutSkill();
        ControllerToIdle();

    }
    //播放受击动画时 会播放这里
    public void HitStopSkill()
    {
        if (monsterDataValue == null) return;
        monsterDataValue.UpdateIsStartSkill(false);
        monsterFight.AnimatorStopSkill();
    }
    public void HitAnimationOut()
    {
        ControllerToIdle();
    }

    public void IdlState()
    {
        if (monsterState == null) return;
        SetState((int)OTYPE.MonsterActiveStateType.none);
    }

    public virtual void EndOfMonsterMoodAnimation()
    {
        if (monsterMood != null)
        {
            monsterMood.SetMoodState(false);
        }
    }

    #endregion;
    public Transform head;
    public Transform body;
    public Transform allBody;
    public Transform top;
    public Transform center;
    public Transform centerForward;
    public Transform bot;
    public Transform leftHand;
    public Transform rightHand;
    public Transform leftLeg;
    public Transform rightLeg;
    public Transform powerBarPoint;
    public Transform headChildPoint;
    public Transform powerLinkPoint;
    public int hitAniamtionCount;
    public int attackAnimationCount;
    public int hudongAnimationCount;
    public int helloAnimationCount;
    public float fadeInDuration;



    public Renderer[] bodyRender;
    public MonsterFadeInEffect monsterFadeInEffect;

    public float withHeadDistance;//用于判断意志力bAR与头部的据点
    #region 监听事件
    /// <summary>
    /// 1.当前血量2最大血量3是否死亡4是否是玩家
    /// </summary>
    public System.Action<int, int> MonsterHaeBeenHit;//受伤
    /// <summary>
    /// 1.当前能量2最大能量3是否是玩家
    /// </summary>
    public System.Action<int, int> MonsetCosumeEnergy;//消耗能量
    public System.Action<float, bool, string> MonsterUseSkill;//使用技能
    //int = 当前宠物的index， bool = 是否为玩家
    public System.Action<int, bool> MonsterDeadEvent;//死亡
    public System.Action<List<PlayerSkillAttribute>> MonsetBuiledSkill;//构建技能
    public System.Action<int, float, float> MonsterChangeSkill;//切换技能
    public System.Action<int, int, bool> MonsterUseSkillHitOther;//传的是技能的ID， TYPE 和是否击中
    public System.Action<int> MonsterUseSkillEvent;//纯粹告知监听者，穿的是技能的type
    public System.Action<int, int> MonsterCosumeStrength;
    public System.Action OverAttackEvent;//结束释放技能的动画事件
    public System.Action UsingSkillEvent;//发射了技能的事件
    public System.Action<int, int> UsingPropPowerblockEvent; // int = itemIndex， int = lessCount
    public System.Action<int> UsedSkillAttackedTarget;//告诉监听者，这次击中造成的伤害
    public System.Action MonsterOnDispawnEvent;
    #endregion;
    public enum PointType
    {
        none = 0,
        head = 1,
        body = 2,
        allBody = 3,
        top = 4,
        center = 5,
        bot = 6,
        leftHand = 7,
        rightHan = 8,
        leftLeg = 9,
        rightLeg = 10,
    }

    [HideInInspector]
    public bool isPlayer = false;
    public int playerIndex;


    public Animator animator;
    #region 自定义数据名
    public int monsterIndex;
    public MonsterController playerMonster;
    public EnemyMonster enmeyMonster;
    public MonsterAnimator monsterAnimator;
    public MonsterFight monsterFight;
    public MonsterState monsterState;
    public MonsterActiveBaisc monsterActiveBasic;
    public MonsterDataValue monsterDataValue;
    public MonsterInfo monsterInfo;//显示怪兽的数据
    public MonsterMood monsterMood;//
    [HideInInspector]
    public bool isBigHit = false;
    #endregion

    #region 快速获取数据

    #region 获取类别

    public bool isFightType
    {
        get { return monsterDataValue.currentPlayType == OTYPE.MonsterStateType.fight; }
    }
    public OTYPE.MonsterStateType currentPlayType
    {
        get { return monsterDataValue.currentPlayType; }
    }

    #endregion

    public string currentMonsterPowerStr
    {
        get { return monsterDataValue.powerPerString; }
    }
    public int currentMonsterBlood
    {
        get { return monsterDataValue.monsterCurrentPower; }
    }
    public int currentMonsterMaxPower
    {
        get { return monsterDataValue.monsterMaxPower; }
    }

    public bool currentMonsterwasDead
    {
        get { return monsterDataValue.monsterCurrentPower <= 0; }
    }
    /// <summary>
    /// 技能Item的游标，不是数据里的游标
    /// </summary>
    /// <value>The index of the get current skill.</value>
    public int getCurrentSkillIndex
    {
        get { return monsterDataValue.currentSkillIndex; }
    }
    public float currentSkillCDLoadTime
    {
        get { return monsterDataValue.currentSkillCDLoadTime; }
    }

    public float currentSkillCDLimit
    {
        get { return monsterDataValue.currentSkillCDLimit; }
    }
    public int currentSkillConsumeEnergy
    {
        get { return monsterDataValue.currentSkillCosumeEnergy; }
    }

    public int currentSkillType
    {
        get { return monsterDataValue.currentSkillType; }
    }
    public int currentSkillAttackType
    {
        get { return monsterDataValue.currentSkillAttackType; }
    }
    public bool CanChangeSkill
    {
        get { return true; }
    }
    public bool isStartSkill
    {
        get { return monsterDataValue.isStartSkill; }
    }

    public bool currentSkillIsCombination
    {
        get { return monsterDataValue.CurrentSkillIsConbination; }
    }

    public List<MonsterUseSkillValue> monsterUseSkillValueList
    {
        get { return monsterDataValue.monsterUseSkillValueList; }
    }

    public bool currentSkillIsCownDown
    {
        get { return monsterDataValue.currentSkillIsCownDown; }
    }

    //传入列表里的游标， 是否已经冷却完毕 
    public bool SkillIsCownDown(int skillListIndex)
    {
        return monsterDataValue.skillIsCownDown(skillListIndex);
    }


    #region 获取状态
    public int currentMonsterState
    {
        get { return monsterDataValue.currentMonsterType; }
    }


    public bool isHit
    {
        get { return monsterDataValue.isHit; }
    }
    public bool isAttack
    {
        get { return monsterDataValue.isAttack; }
    }

    public bool isMove
    {
        get { return monsterDataValue.isMove; }
    }

    public bool isIdle
    {
        get { return monsterDataValue.isIdle; }
    }

    public bool isDead
    {
        get { return monsterDataValue.isDead; }
    }
    public bool isLeisure
    {
        get { return monsterDataValue.isLeisure; }
    }

    #endregion

    #region 获取心情

    public OTYPE.MonsterMoodStateType currentMoodType
    {
        get { return monsterDataValue.currentMonsterMoodType; }
    }
    public bool isHappy
    {
        get { return monsterDataValue.isHappy; }
    }

    public bool isExcited
    {
        get { return monsterDataValue.isExcited; }
    }

    public bool isSad
    {
        get { return monsterDataValue.isSad; }
    }

    #endregion




    #endregion

    #region 初始化

    protected override void FindPoint()
    {
        //base.FindPoint();
        topPoint = head;
        centerPoint = center;
        botPoint = bot;
        leftPoint = leftHand;
        rightPoint = rightHand;
        if (topPoint != null && botPoint != null)
            topHeight = Vector3.Distance(top.transform.position, bot.transform.position);
    }

    public override void OnSpawn()
    {
        if (MonsterOnDispawnEvent != null)
        {
            MonsterOnDispawnEvent = null;
        }

        base.OnSpawn();
        animator.enabled = true;
        if (monsterMood == null)
        {
            monsterMood = new MonsterMood();
            monsterMood.BuildData(this);
        }
        GetComponent<BoxCollider>().enabled = true;
        SetRongjie(0);
        SetAlpha(1);
        MonsterFadeIn();

    }

    //数据清零
    public override void OnDispawn()
    {

        if (MonsterOnDispawnEvent != null)
        {
            MonsterOnDispawnEvent();
        }

        animator.enabled = false;
        if (monsterPowerBar != null) AndaDataManager.Instance.RecieveItem(monsterPowerBar);
        monsterPowerBar = null;

        if (monsterInfo != null)
        {
            monsterInfo.Dispawn();
        }
        if (monsterDataValue != null) monsterDataValue = null;
        if (monsterAnimator != null) monsterAnimator = null;
        if (monsterFight != null) monsterFight = null;
        if (monsterState != null) monsterState = null;
        if (monsterActiveBasic != null) monsterActiveBasic = null;
        if (playerMonster != null) playerMonster = null;
        if (enmeyMonster != null) enmeyMonster = null;
        if (monsterMood != null) monsterMood = null;
        base.OnDispawn();
    }
    //初始化数据
    public override void InitValue()
    {
        base.InitValue();
        monsterIndex = 0;
        isPlayer = false;
        monsterDataValue = null;
    }

    #endregion
    //控制器最先调用这里

    public void ReFadein()
    {
        //ControllerConsumeStrength();
        monsterDataValue.UpdateIsStartSkill(false);
        monsterAnimator.PlayFadeIn();

    }

    public void SetControllerState(bool isActive)
    {
        if (isActive)
        {
            GetComponent<Collider>().enabled = true;
            if (isPlayer) playerMonster.StartEngine();
            else enmeyMonster.StartEngine();
        }
        else
        {
            GetComponent<Collider>().enabled = false;
            if (isPlayer) playerMonster.EndEngine();
            else enmeyMonster.EndEngine();
        }

        if(MonsterHaeBeenHit!=null)
        {
            MonsterHaeBeenHit(monsterDataValue.monsterCurrentPower,monsterDataValue.monsterMaxPower);
        }
    }
    /// <summary>
    /// 预先构建怪兽的组件。用于玩家没有此怪兽的玩家数据的时候。也能调用怪兽。并且访问向对应的组件
    /// </summary>
    /// <param name="monsterID"></param>
    public void PreloadBuildComponement()
    {
        BuildComponement();
    }
    public void DownloadMonsterValue(PlayerMonsterAttribute pma, OTYPE.MonsterStateType _playtype)
    {
        playerIndex = pma.hostIndex;

        //isPlayer = AndaDataManager.Instance.CheckIsPlayer(playerIndex);

        monsterIndex = pma.monsterIndex;

        BuildComponement();

        BuildMonsterValue(pma);

        BuildMonsterLogicScript(_playtype);

        //SkinNormal();
    }
    //构建玩家怪兽数据
    public void BuildMonsterValue(PlayerMonsterAttribute pma)
    {
        if (monsterDataValue == null)
        {
            monsterDataValue = new MonsterDataValue();
            monsterDataValue.InitValue();
        }

        monsterDataValue.BuildData(pma);
        //构建完成后，先调用一遍，让监听者可以初始化一下数据
        if (MonsetBuiledSkill != null)
        {
            MonsetBuiledSkill(monsterDataValue.playerSkillAttributeList);
        }

        if (MonsterChangeSkill != null)
        {
            MonsterChangeSkill(getCurrentSkillIndex, currentSkillCDLoadTime, currentSkillCDLimit);
        }
    }
    //构建小怪兽逻辑脚本
    public void BuildMonsterLogicScript(OTYPE.MonsterStateType playType)
    {
        monsterDataValue.SetPlayType(playType);

        transform.gameObject.layer = isPlayer ? LayerMask.NameToLayer("Player") : LayerMask.NameToLayer("Monster");

        switch (playType)
        {
            case OTYPE.MonsterStateType.fight:
                BuildFightMonster(isPlayer);
                break;
            case OTYPE.MonsterStateType.treasure:
                BuildTreasureMonster();
                break;
            case OTYPE.MonsterStateType.leisure:
                BuildLeisureMonster();
                break;
        }
    }

    private void BuildTreasureMonster()
    {
        if (playerMonster == null)
        {
            playerMonster = new TreasureMonster();
        }
        playerMonster.DownloadMessage(this);
    }
    private void BuildFightMonster(bool isPlayer)
    {
        if (isPlayer)
        {
            if (playerMonster == null)
            {
                playerMonster = new FightPlayerMonster();
            }

            playerMonster.DownloadMessage(this);
        }
        else
        {
            if (enmeyMonster == null)
            {
                enmeyMonster = new EnemyIntermediate();
            }
            enmeyMonster.DownloadMessage(this);
        }
    }


    private void BuildLeisureMonster()
    {
        if (isPlayer)
        {
            if (playerMonster == null)
            {
                playerMonster = new LeisureMonster();
            }
            playerMonster.DownloadMessage(this);
        }
    }
    //构建组件
    private void BuildComponement()
    {
        if (monsterFight == null) monsterFight = new MonsterFight();

        if (monsterAnimator == null) monsterAnimator = new MonsterAnimator();

        if (monsterActiveBasic == null) monsterActiveBasic = new MonsterActiveBaisc();


        //纯粹存放状态种类用
        if (monsterState == null) monsterState = new MonsterState();
        //显示宠物的数据用
        if (monsterInfo == null) monsterInfo = new MonsterInfo();

        monsterInfo.DownloadMessage(this);
        monsterFight.DownloadMessage(this);
        monsterAnimator.DownloadMessage(this);
        monsterActiveBasic.DownloadMessage(this);
    }



    //关闭控制器权限
    public void ControllerStopEngine()
    {
        if (isPlayer) playerMonster.EndEngine();
        else enmeyMonster.EndEngine();
    }

    public void ControllerHasbeenHit(int hitPower)
    {

    }

    #region 状态控制
    /// <summary>
    /// 受击
    /// </summary>
    /// <param name="hitPower"></param>
    public void ControllerHasbeenHit(MonsterBasic fromTarget, int hitPower)
    {

        if (monsterDataValue == null) return;
        int value = monsterDataValue.UpdatePower(-hitPower);
        if (value == -1) return;
        else if (value == 0)
        {
            ResetPlaySkill();
            ControllerToDeath();
        }
        else
        {
            //普通攻击会被打断
            if (!currentSkillIsCombination)
            {

                if (SetState((int)OTYPE.MonsterActiveStateType.hit))
                {
                    ResetPlaySkill();
                    isBigHit = hitPower > 200 ? true : false;
                    if(bati)
                    {
                        HitAnimationOut();

                    }else
                    {
                        PlayAnimationState();
                    }
                }
            }
            else
            {
                //大招有50%的概率被打断
                int t = Random.Range(0, 10);
                if (t >= 5)
                {
                    if (SetState((int)OTYPE.MonsterActiveStateType.hit))
                    {
                        ResetPlaySkill();
                        isBigHit = hitPower > 200 ? true : false;
                        if (bati)
                        {
                            HitAnimationOut();

                        }
                        else
                        {
                            PlayAnimationState();
                        }
                    }
                }
            }

            //向关心受击事件的脚本发送消息
        }
        SendMessageCareHitEvent();
    }

    private int skillStep = 0;
    /// <summary>
    /// 攻击事件
    /// </summary>
    /// <param name="targetPoint">Target point.</param>
    /// <param name="needLookAtTargetPoint">If set to <c>true</c> need look at target point.</param>
    public virtual void ControllerToAttak(Vector3 targetPoint, bool needLookAtTargetPoint = false)
    {

        //先博动画，根据动画片段。生成特效在指定的位置，
        PlayAnimationState();

        if (isStartSkill)
        {
            ResetPlaySkill();//释放技能的时候，如果普通攻击还没有触发，那么是可以打断的，并且释放技，这个逻辑在PlayerMonster中计
        }
        //设置攻击点,
        ControllerSetAttackPoint(targetPoint);
        //生成特效的位置，
        monsterFight.AnimatorStartSkill(GetSkillSetPoint());
        //开始攻击
        PlaySkillStep00();
        //更新CD时间
        monsterDataValue.UpdateCurrentSkillCDLoadTime();
        //回答关心攻击事件的人
        if (MonsterUseSkillEvent != null)
        {
            MonsterUseSkillEvent(currentSkillType);
        }
    }

    //技能被打断
    private void ResetPlaySkill()
    {
        skillStep = 0;
        monsterDataValue.UpdateIsStartSkill(false);
    }


    private void ExcuteUseSkill()
    {

        if (isStartSkill)
        {
            if (Time.time - intervelTime > intervalLimit)
            {
                switch (skillStep)
                {
                    case 1:
                        PlaySkillStep01();
                        break;
                    case 2:
                        PlaySkillStep02();
                        Debug.Log("Steal Step 02");
                        break;
                    case 3:
                        Debug.Log("Steal Step 03");
                        PlaySkillStep03();
                        break;
                }
            }
        }
    }

    private void PlaySkillStep00() //技能开始
    {
        monsterFight.PlaySkillStep00();
        intervalLimit = monsterDataValue.getCurrentSkillAnimationInterval[0];
        intervelTime = Time.time;
        skillStep++;
        monsterDataValue.UpdateIsStartSkill(true);
    }
    private void PlaySkillStep01()//技能触发
    {
        monsterDataValue.UpdateSkillUsingState(true);
        monsterFight.PlaySkillStep01();
        intervalLimit = monsterDataValue.getCurrentSkillAnimationInterval[1];
        intervelTime = Time.time;
        skillStep++;
    }
    private void PlaySkillStep02()//技能结束
    {
        monsterDataValue.UpdateSkillUsingState(false);
        intervalLimit = monsterDataValue.getCurrentSkillAnimationInterval[2];
        intervelTime = Time.time;
        skillStep++;
    }

    private void PlaySkillStep03()//技能动画退出
    {

        ControllerToIdle();
        ResetPlaySkill();
    }



    //消耗能量
    public void ControllerConsumeEnergy(int value)
    {
        /* monsterDataValue.UpdateEnergy(-value);
        if (MonsetCosumeEnergy != null)
        {
            MonsetCosumeEnergy(currentMonsterEnergy, currentMonsterBaseEnergy);
            
        }*/
    }

    public void ControllerConsumeStrength()
    {
        /*monsterDataValue.UpdateStrength(-40);

        if (MonsterCosumeStrength != null)
        {
            MonsterCosumeStrength(currentMonsterStrength, monsterBaseStrenth);
        }*/
    }

    public void ControllerSetAttackPoint(Vector3 point)
    {
        monsterFight.SetAttackPoint(point);
    }

    public void ControllerUsePowerBlock(int _index)
    {
        int power = monsterDataValue.UpdatePropPowerBlock(_index);
        Debug.Log("power use" + power);
        if (power != -1)
        {
            Debug.Log("power used success !" + power);
            monsterDataValue.UpdatePower(power);
            if (UsingPropPowerblockEvent != null)
            {
                UsingPropPowerblockEvent(_index, monsterDataValue.prop_PowerBlock[_index].lessCount);
            }
        }

    }


    //增加能量
    public void ControllerAddEnergy(int value)
    {
        /* if (MonsetCosumeEnergy != null)
        {
            monsterDataValue.UpdateEnergy(value);
            MonsetCosumeEnergy(currentMonsterEnergy, currentMonsterBaseEnergy);
        }*/
    }
    //普通攻击击中敌人会调用这里，要求增加能量
    public void ControllerHitEnemy()
    {
        //ControllerAddEnergy(5);
    }

    //切换技能
    public void ControllerToChangeSkill(int value)
    {
        var tmp = monsterDataValue.currentSkillIndex + value;
        if (tmp < 0 || tmp >= monsterDataValue.playerSkillAtrributeCount) return;
        monsterDataValue.ChangeCurrentSkill(tmp);
        if (MonsterChangeSkill != null)
        {
            MonsterChangeSkill(getCurrentSkillIndex, currentSkillCDLoadTime, currentSkillCDLimit);
        }
    }

    //强切换到想要的技能
    public void ControlChangeSkillFixSkill(int index)
    {
        monsterDataValue.ChangeCurrentSkill(index);
        if (MonsterChangeSkill != null)
        {
            MonsterChangeSkill(getCurrentSkillIndex, currentSkillCDLoadTime, currentSkillCDLimit);
        }
    }

    //看向点

    //死亡
    public void ControllerToDeath()
    {
        if(isDead)return;
        if (SetState((int)OTYPE.MonsterActiveStateType.dead))
        {
            PlayAnimationState();
            ControllerStopEngine();
            if (MonsterDeadEvent != null)
            {
                MonsterDeadEvent(monsterIndex, isPlayer);
            }
        }
    }

    //待机
    public virtual void ControllerToIdle()
    {
        if (monsterState == null) return;
        if (SetState(-1))
        {
            ResetPlaySkill();
            PlayAnimationState();
        }
    }

    public void ControlToHappy()
    {
        PlayAnimationState();
    }

    public bool CheckCanMove()
    {
        return SetState((int)OTYPE.MonsterActiveStateType.move);
    }
    //设置心情状态 并播放动画
    public void ControllPlayerMood(OTYPE.MonsterMoodStateType moodType)
    {
        //先判断能不进入到心情状态，可以的话 再设置心情的种类
        if (SetState((int)OTYPE.MonsterActiveStateType.mood))
        {
            monsterDataValue.SetMoodType(moodType);
            PlayAnimationState();
        }
    }


    //活动结束
    public void EndOFActive()
    {
        if (SetState(-1))
        {
            PlayAnimationState();
        }
    }

    /// <summary>
    /// 设置战斗状态
    /// </summary>
    /// <param name="stateType"></param>
    /// <returns></returns>
    public bool SetState(int stateType)
    {
        bool result = monsterDataValue.SetMonsterState(stateType);
        return result;
    }

    public void SetStateIcon(int stateType)
    {
        //monsterState.ChangeStateIcon(stateType);
    }

    public virtual void PlayAnimationState()
    {
        //Debug.Log("currentState" + currentMonsterState);
        monsterAnimator.PlayAnimation(currentMonsterState);
    }



    //***控制 观察目标，然后向目标移动
    #region 先观察目标，然后向目标移动
    public void ObservationTarget(Vector3 point)
    {
        monsterActiveBasic.ControllerLookAtTargetPoint(point);
    }
    #endregion

    public void ControllerMoveToTargetPoint(Vector3 startPoint, Vector3 endPont, float moveSpeed)
    {
        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.ControllerLerpMoveBySpeed(startPoint, endPont, moveSpeed);
        }
    }
    public void ControllerFollowTarget(AndaObjectBasic target)
    {
        monsterActiveBasic.ControllerLerMoveByTran(target);
    }
    public void ControllerMoveToTargetPoint(Vector3 endPoint, System.Action callback)
    {
        animator.Play("move");
        monsterActiveBasic.ControllerLerpMoveBySpeed(selfPostion, endPoint, 0.8f, callback);
    }

    //只需一个目标点。就能旋转，效果与下面的。ControlloerRotateBodyToTargetDir 一样
    public void ControllerToRotateBodyByPoint(Vector3 point, float speed = 0.1f)
    {
        Vector3 p = new Vector3(point.x, selfPosY, point.z);
        Quaternion bodyRotate = Quaternion.LookRotation(p - selfPostion);
        ControlloerRotateBodyToTargetDir(selfRotation, bodyRotate, speed);
    }
    public void ControllerToRotateHeadByPoint(Vector3 point, float speed = 0.15f)
    {
        Quaternion headRotate = Quaternion.LookRotation(point - head.position);
        ControllerRotateHeadToTargetDir(head.rotation, headRotate, speed);
    }

    public void ControlloerRotateBodyToTargetDir(Quaternion startDir, Quaternion endDir, float rotateSpeed)
    {
        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.ControllerLearRotateBody(startDir, endDir, rotateSpeed);
        }
    }

    public void ControllerRotateHeadToTargetDir(Quaternion startDir, Quaternion endDir, float rotateSpeed, bool bodyFollowHead = false)
    {
        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.ControllerLerpRotateHead(startDir, endDir, rotateSpeed, bodyFollowHead);
        }
    }

    public void ControllerAwaysLookAtTraget(Transform target, float rotateSpeed)
    {
        monsterActiveBasic.ControllerAwaysLookAtTraget(target, rotateSpeed);
    }




    public void ControllerEndMove()
    {
        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.StopMove();
        }
    }

    public void ControllerEndRotateBody()
    {
        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.StopRotateBody();
        }
    }
    public void ControllerEndRotateHead()
    {
        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.StopRotateHead();
        }
    }

    public void ControllerEndAllActive()
    {
        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.StopAllActive();
        }
    }

    public void ControllerToPlayMoodForHappy00()
    {
        if (monsterMood != null)
        {
            monsterMood.PlayMood(MonsterMood.MoodType.happy00);
        }
    }
    public void ControllerToPlayMoodForHappy01()
    {
        if (monsterMood != null)
        {
            monsterMood.PlayMood(MonsterMood.MoodType.happy01);
        }
    }
    public void ControllerToPlayMoodForSad()
    {
        if (monsterMood != null)
        {
            monsterMood.PlayMood(MonsterMood.MoodType.sad);
        }
    }
    public void ControllerToPlayMoodForHudong00()
    {
        if (monsterMood != null)
        {
            monsterMood.PlayMood(MonsterMood.MoodType.hudong00);
        }
    }
    public void ControllerToPlayMoodForHudong01()
    {
        if (monsterMood != null)
        {
            monsterMood.PlayMood(MonsterMood.MoodType.hudong01);
        }
    }




    public virtual void ControllerToPlayMoodForSayHello00()
    {
        monsterMood.PlayMood(MonsterMood.MoodType.sayhello00);
    }

    public virtual void ControllerToPlayMoodForSayHello01()
    {
        monsterMood.PlayMood(MonsterMood.MoodType.sayhello01);
    }

    /// <summary>
    /// 晕眩
    /// </summary>
    public virtual void ControllerToPlayMoodForYunxuan()
    {
        monsterMood.PlayMood(MonsterMood.MoodType.yunxuan);
    }
    public virtual void ControllerToPlayMoodIdle()
    {
        monsterMood.PlayMood(MonsterMood.MoodType.normalIdle);
    }

    public virtual void ControllerToPlayMoodBreakon()
    {
        monsterMood.PlayMood(MonsterMood.MoodType.broke);
    }

    #endregion




    #region 发送消息

    //向关系受伤事件的脚本 发送 受伤消息
    private void SendMessageCareHitEvent()
    {
        if (monsterPowerBar != null)
        {
            monsterPowerBar.UpdatePower(currentMonsterBlood, currentMonsterMaxPower);
        }

        if (MonsterHaeBeenHit != null)
        {
            //Debug.Log("Hit!!!!!!!!!!!!!!!!1");
            MonsterHaeBeenHit(currentMonsterBlood, currentMonsterMaxPower);
        }
    }


    #endregion

    #region 接收事件

    //接收来自技能使用完成的消息，用于记录技能是否击中
    public void ReceiveSkillMessage(int skillID, int skillType, bool isHit)
    {
        //monsterDataValue.UpdateUseSkillData(skillID, isHit);
        //
        //if (MonsterUseSkillHitOther != null)
        //{
        //   MonsterUseSkillHitOther(skillID, skillType,isHit);
        // }
    }

    public void UpdateSKillUseData(int makePower,int value, int skillType, int skilllID, int skillIndex)
    {
        if(UsedSkillAttackedTarget!=null)
        {
            UsedSkillAttackedTarget(makePower);
        }
        monsterDataValue.UpdateUseSkillData(value, skillType, skilllID, skillIndex);
    }

    #endregion


    #region 功能执行
    private float tmpDistance = 0;

    private float intervelTime;
    private float intervalLimit;
    private void Update()
    {
        OnUpdate();

        //float dis = Mathf.Abs(powerBarPoint.transform.position.x - headChildPoint.transform.position.x);
        //tmpDistance = headChildPoint.transform.position.x - withHeadDistance;
        //tmpDistance = Mathf.Lerp(tmpDistance,  headChildPoint.transform.position.x - withHeadDistance , Time.deltaTime );
        //powerBarPoint.transform.position = new Vector3 (tmpDistance , powerBarPoint.transform.position.y,powerBarPoint.transform.position.z); 

    }
    public virtual void OnUpdate()
    {

        if (monsterActiveBasic != null)
        {
            monsterActiveBasic.Update();
        }
        if (playerMonster != null)
        {
            playerMonster.Update();
        }
        if (enmeyMonster != null)
        {
            enmeyMonster.Update();
        }
        if (monsterInfo != null)
        {
            monsterInfo.OnUpdate();
        }

        if (monsterDataValue != null)
        {
            //执行攻击时候 事件间隔
            ExcuteUseSkill();
        }

    }

    #endregion

    #region 工具 快熟获取一些点


    public Transform GetSkillSetPoint()
    {
        switch (monsterAnimator.getCurClipName)
        {
            case "fight00":
                return GetPoint(8);//normalSkillSetPoint[0];
            case "fight01":
                return GetPoint(7);// normalSkillSetPoint[1];
            case "skill":
                return GetPoint(0); //specialSkillSetPoint[0];
            case "defense":
                return GetPoint(0); //defenseSkillSetPoint[0];
            default:
                return GetPoint(0);
        }
    }

    public Transform GetPoint(int pointIndex)
    {
        switch (pointIndex)
        {
            case (int)PointType.head:
                return head;
            case (int)PointType.body:
                return body;
            case (int)PointType.allBody:
                return allBody;
            case (int)PointType.top:
                return top;
            case (int)PointType.center:
                return center;
            case (int)PointType.bot:
                return bot;
            case (int)PointType.leftHand:
                return leftHand;
            case (int)PointType.rightHan:
                return rightHand;
            case (int)PointType.leftLeg:
                return leftLeg;
            case (int)PointType.rightLeg:
                return rightLeg;
            default:
                return center;
        }
    }

    private string CheckUseSkillTip()
    {
        if (isStartSkill) return "正在使用";
        //if (currentMonsterEnergy < currentSkillConsumeEnergy) { return "能量不够"; }
        if (Time.time - currentSkillCDLoadTime < currentSkillCDLimit) { return "正在冷却"; }
        return null;
    }
    #endregion;


    #region 显示状态相关

    public override void Display()
    {
        base.Display();
        if (monsterInfo != null) monsterInfo.Display();
    }

    public override void Hide()
    {
        base.Hide();
        if (monsterInfo != null) monsterInfo.Hide();
    }

    public virtual void Levelup(int targetValue)
    {
        PowerLevelup powerLevelup = AndaDataManager.Instance.InstantiateOtherObj<PowerLevelup>(ONAME.PowerLevelUp);
        powerLevelup.transform.position = selfPostion;
        powerLevelup.SetInfo(monsterDataValue.monsterMaxPower, targetValue);
    }


    public override void SkinHologarm(bool isUI = false)
    {
        base.SkinHologarm(isUI);
    }

    public override void SkinNormal()
    {
        base.SkinNormal();
    }
    public override void SkingrowUp()
    {
        base.SkingrowUp();
    }

    public override void SkingrowUp(float _value)
    {
        base.SkingrowUp(_value);
    }

    public virtual void BuildPowerInUI()
    {
        if (monsterPowerBar == null) monsterPowerBar = AndaDataManager.Instance.InstantiateOtherObj<MonsterPowerBar>(ONAME.MonsterPowerBar);
        monsterPowerBar.BuildPowerBarInUI(powerBarPoint);
    }
    public virtual void BuildPowerBar()
    {
        if (monsterPowerBar == null) monsterPowerBar = AndaDataManager.Instance.InstantiateOtherObj<MonsterPowerBar>(ONAME.MonsterPowerBar);
        monsterPowerBar.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;
        monsterPowerBar.BuildPowerBar(transform);
    }

    public virtual void SetPowerBar(int maxPower)
    {
        monsterPowerBar.UpdatePowerSingleValue(maxPower);
    }
    public virtual void SetPowerBar(int curPower, int MaxPower)
    {
        monsterPowerBar.UpdatePower(curPower, MaxPower);
    }

    #endregion



    #region fadeIN
    public override void MonsterFadeIn()
    {
        base.MonsterFadeIn();
        ControllerToPlayMoodForSayHello00();
        StartCoroutine(ExcuteFadeIn());
    }

    public override void MonsterFadeOut()
    {
        base.MonsterFadeOut();
        StartCoroutine(ExcuteFadeOut());
    }

    private IEnumerator ExcuteFadeOut()
    {
        monsterFadeInEffect.gameObject.SetTargetActiveOnce(false);
        monsterFadeInEffect.OpenP1();
        monsterFadeInEffect.SetValueP1(1);

        float t = 1;
        float p1 = 1;
        float p = 1;
        float p2 = 1;

        float offset = 0.5f;
        float duration = 1f / fadeInDuration;
        while (t > 0)
        {
            t -= Time.deltaTime * duration;
            monsterFadeInEffect.SetValueP1(t);
            if (t >= offset)
            {
                p = (t - offset) / (1 - offset);


                if (p >= 0.5f)
                {
                    p1 = p * 3.14f;
                    p1 = Mathf.Sin(p1);
                    SetAlpha(p1);
                   
                }
                monsterFadeInEffect.OpenP2();
                monsterFadeInEffect.SetValueP2(p);
                SetRongjie(p);
            }

            yield return null;
        }
        monsterFadeInEffect.gameObject.SetTargetActiveOnce(false);

    }
    private IEnumerator ExcuteFadeIn()
    {
        monsterFadeInEffect.gameObject.SetTargetActiveOnce(true);
        monsterFadeInEffect.OpenP1();
        monsterFadeInEffect.SetValueP1(0);

        float t = 0;
        float p1 = 0;
        float p = 0;
        float p2 = 0;

        float offset = 0.5f;
        float duration = 1f / fadeInDuration;
        while (t < 1)
        {
            t += Time.deltaTime * duration;
            monsterFadeInEffect.SetValueP1(t);
            if (t >= offset)
            {
                p = (t - offset) / (1 - offset);


                if (p >= 0.5f)
                {
                    p1 = p * 3.14f;
                    p1 = Mathf.Sin(p1);
                    SetAlpha(p1);
                    //  bodyRender.material.SetFloat("_alpha",p1);
                }
                monsterFadeInEffect.OpenP2();
                monsterFadeInEffect.SetValueP2(p);
                SetRongjie(p);
            }

            yield return null;
        }
        monsterFadeInEffect.gameObject.SetTargetActiveOnce(false);



    }

    public virtual void SetAlpha(float v)
    {
        int count = bodyRender.Length;
        v = Mathf.Clamp01(v);
        for (int i = 0; i < count; i++)
        {
            bodyRender[i].material.SetFloat("_alpha", v);
        }
    }

    public virtual void SetRongjie(float v)
    {
        int count = bodyRender.Length;
        v = Mathf.Clamp01(v);
        for (int i = 0; i < count; i++)
        {
            bodyRender[i].material.SetFloat("_rongjie", v);
        }
    }
    #endregion


    #region 获取数据

    private Vector3 GetPlayerLookAt()
    {
        return ARMonsterSceneDataManager.Instance.FightRayHit();
    }

    #endregion

    #region 
    public void SynchroLayer(GameObject _t)
    {
        foreach (Transform _item in _t.GetComponentsInChildren<Transform>())
        {
            _item.gameObject.layer = transform.gameObject.layer;//更改物体的Layer层
        }
    }
    #endregion
}

