using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossData {
    
    public PlayerMonsterAttribute getPlayerMonsterAttribute { get {return playerMonsterAttribute ;}}
    public float getThinkTime {get {return thinkTime ;}}
    public float getStartThinkTime {get  {return startThinkTime ;}}
    public MonsterBasic getCurrentEnemy{ get {return currentEnemy ;}}
    public BossActive getBossActive { get {return bossActive ; }}
    public BossLogic getBossLogic { get { return bossLogic ;}}
    public BossAnimation getBossAnimtion{get {return bossAnimation ;}}
    public BossSkillLogic getBossSkillLogic {get { return bossSkillLogic ;}}
    public bool getBossIsActive {get { return bossIsActive ; }}
    public int getBossId {get {return playerMonsterAttribute.monsterID ;}}
    public BossLogic.BossActiveState getCurBossActiveState {get {return curBossActiveState ;}}
    public Vector3 getCurLookPoint {get {return curLookPoint ;}}
    public bool getIsFoundEnemy{get {return isFoundEnemy ;}}
    public float getWithEnemyDistance { get {return Vector3.Distance(bossBasic.selfPostion , currentEnemy.selfPostion) ;}}
    public PlayerSkillAttribute getCurPlayerSkillAtrribute { get { return curPlayerSkillAttribute ;}}
    public List<PlayerSkillAttribute> getSkills {get {return playerMonsterAttribute.monsterSkillIDList ;}}
    public bool getIsEndOfAttack { get {return isEndOfAttack ;}}
    public bool getIsEndOfRealeseMagical {get{return isEndOfRealeaseMagical ;}}
    public Transform getSkillIntanceTra { get {return skillInstancePoint ;}}//技能生成的位置
    public BossSkillBasic getCurSkillObj {get {return curSkillObj ;}}

    protected BossBasic bossBasic;
    protected PlayerMonsterAttribute playerMonsterAttribute; 
    protected BossActive bossActive;
    protected BossLogic bossLogic;
    protected BossAnimation bossAnimation;
    protected BossSkillLogic bossSkillLogic;
    protected bool bossIsActive =false;
    protected BossLogic.BossActiveState curBossActiveState = BossLogic.BossActiveState.think;
    protected MonsterBasic currentEnemy ;
    protected float thinkTime ;
    protected float startThinkTime;
    protected Vector3 curLookPoint;
    protected bool isFoundEnemy =false;
    protected PlayerSkillAttribute curPlayerSkillAttribute;
    protected bool isEndOfAttack = false;
    protected bool isEndOfRealeaseMagical ;
    protected Transform skillInstancePoint;
    protected BossSkillBasic curSkillObj;

    public virtual void CreatData(BossBasic _bossBasic , PlayerMonsterAttribute _playerMonsterAttribute)
    {
        bossBasic =_bossBasic;
        InitValue();
        playerMonsterAttribute = _playerMonsterAttribute;
        BuildBossActive();
        BuildBossAnimation();
        BuildBossLogic();
        BuildBossSKillLogic();
    }

    public virtual void  InitValue()
    {
        playerMonsterAttribute = null;
        bossActive = null;
        bossAnimation = null;
        isEndOfAttack =true;
        isEndOfRealeaseMagical =true;
    }

    #region 构建数据

    protected virtual void BuildBossActive()
    {
        bossActive = new BossActive();
        bossActive.BuildActive(bossBasic);
    }

    protected virtual void BuildBossAnimation()
    {
        bossAnimation = new BossAnimation();
        bossAnimation.BuildBossAnimation(bossBasic);
    }

    protected virtual void BuildBossSKillLogic()
    {
        
    }

    protected virtual void BuildBossLogic()
    {
        
    }

    #endregion

    #region 设置数据
    public void SetBossActive(bool _isActive)
    {
        bossIsActive = _isActive;
    }

    public void SetEnemy(MonsterBasic _enemy)
    {
        currentEnemy = _enemy;
    }

    public void SetCurBossActiveState(BossLogic.BossActiveState _curBossActiveState)
    {
        curBossActiveState = _curBossActiveState;
    }

    public void SetThinkTime()
    {
        startThinkTime = Time.time;
        thinkTime = Random.Range(1f,3f);
    }

    public void SetCurLookPoint(Vector3 _curLookPoint)
    {
        curLookPoint = _curLookPoint;
    }

    public void SetIsFoundEnemy(bool _isFound)
    {
        isFoundEnemy = _isFound;
    }
    public void SetCurSkillAttribute(PlayerSkillAttribute _playerSkillAttribute)
    {
        curPlayerSkillAttribute = _playerSkillAttribute;
    }
    public void SetEndOfAttack(bool _isEndOfAttact)
    {
        isEndOfAttack =_isEndOfAttact;    
    }   
    public void SetEndOfRealseMagicalState(bool isEnd)
    {
        isEndOfRealeaseMagical = isEnd;
    }

    public void SetSkillInstanceTran(Transform  _tran)
    {
        skillInstancePoint = _tran;
    }

    public void SetCurSkillObj(BossSkillBasic _skillObj)
    {
        curSkillObj = _skillObj;
    }
    #endregion
}
