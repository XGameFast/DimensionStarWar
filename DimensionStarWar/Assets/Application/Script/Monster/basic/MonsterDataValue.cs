using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class MonsterDataValue {

    public PlayerMonsterAttribute pma;

    public float moveSpeed;

    public string monsterName;

    public string monsterNickName;

    public int monsterLevel;

    public int monsterMaxPower;

    public int monsterCurrentPower;

    public int monsterBaseEnergy;

    public int monsterCurrentEnergy;

    //这个宠物使用的所有技能的数据
    public List<MonsterUseSkillValue> monsterUseSkillValueList;
    //
    public List<PlayerSkillAttribute> playerSkillAttributeList;

    public List<float> skillCDTimeBox;

    public List<LD_Objs> prop_PowerBlock;

    public bool isUsing = false;//是否正在触发技能

    public bool isStartSkill = false;

    public bool readOnceUseSkill = false;//用于判断时段。是否要使用技能你了;

    /// <summary>
    /// 技能Item的游标 ，不是数据库的游标
    /// </summary>
    public int currentSkillIndex =-1 ;

    public int monsterCurrentStrength;
    public int monsterBaseStrength;

    public int currentMonsterType = -1;//-1 为空 ，不同模式下。会检测不同状态切换的优先级


    private float normalSkillAnimationSpeed;
    private List<float> normalSkillIntervalsTime;

    private float specialSkillAnimationSpeed;
    private List<float> specialSkillIntervalsTime;

    private float defenseSkillAnimationSpeed;
    private List<float> defenseSkillIntervalsTime;

    private float currentSkillAnimationSpeed;
    private List<float> currentSkillAnimationInterval;



    public OTYPE.MonsterMoodStateType currentMonsterMoodType;
    public OTYPE.MonsterStateType currentPlayType;

    public string powerPerString
    {
        get { return monsterCurrentPower + "/" + monsterMaxPower; }
    }
    public int playerSkillAtrributeCount
    {
        get { return playerSkillAttributeList.Count; }
    }

    public float currentSkillCDLoadTime
    {
        get { return skillCDTimeBox[currentSkillIndex]; }
    }
    public float currentSkillCDLimit
    {
        get { return curretnPlayerAttribute.skillCD; }
    }
    public int currentSkillCosumeEnergy
    {
        get { return curretnPlayerAttribute.skillCosumeEnergy; }
    }
    public PlayerSkillAttribute curretnPlayerAttribute { get; set; }
    public bool CurrentSkillIsConbination
    {
        get { return curretnPlayerAttribute.baseSkillAttribute.attackType == 1 ; }
    }
    public int currentSkillType
    {
        get { return curretnPlayerAttribute.baseSkillAttribute.skillType; }
    }
    
    public bool currentSkillIsCownDown
    {
        get { return Time.time - currentSkillCDLoadTime > currentSkillCDLimit; }
    }
    public int currentSkillAttackType
    {
        get {return curretnPlayerAttribute.baseSkillAttribute.attackType; }
    }

    public bool skillIsCownDown(int inlistIndex)
    {
        return Time.time - skillCDTimeBox[inlistIndex] > playerSkillAttributeList[inlistIndex].skillCD ; 
    }



    public float getNormalSkillAnimationSpeed 
    {
        get { return  normalSkillAnimationSpeed ;}
    }

    public float getDefenseSkillAnimationSpeed
    {
        get {return defenseSkillAnimationSpeed ;}
    }

    public float getSpecialSkillAnimationSpeed
    {
        get {return specialSkillAnimationSpeed ;}
    }

    public List<float> getNormalSkillAnimationInterval
    {
        get {return normalSkillIntervalsTime ;}
    }

    public List<float> getSpecialSkillAnimationInterval
    { 
        get {return specialSkillIntervalsTime ;}
    }

    public List<float> getDefenseSkillAnimationInterval
    {
        get {return defenseSkillIntervalsTime ;}
    }

    public float getCurrentSkillAnimationSpeed
    {
        get {return currentSkillAnimationSpeed ;}
    }

    public List<float> getCurrentSkillAnimationInterval
    {
        get {return currentSkillAnimationInterval ;}
    }

    public float getNormalSkillCDLimit
    {
        get {return playerSkillAttributeList[1].skillCD ;}
    }

    public float getDefenseSkillCDLimit
    {
        get {return playerSkillAttributeList[0].skillCD;}
    }
    public float getSpecialSkillCDLimit
    {
        get{return playerSkillAttributeList[2].skillCD;}
    }

    public float getNormalSkillCurrentCD
    {
        get{ return skillCDTimeBox[1] ;}
    }

    public float getDefnseSkillCurrentCD
    {
        get {return skillCDTimeBox[0] ;}
    }

    public float getSpecialSkillCurrentCD
    {
        get { return skillCDTimeBox[2]; }
    }

    #region 状态
    public bool isHit
    {
        get { return currentMonsterType == (int)OTYPE.MonsterActiveStateType.hit; }
    }
    public bool isAttack
    {
        get { return currentMonsterType == (int)OTYPE.MonsterActiveStateType.attack; }
    }

    public bool isMove
    {
        get { return currentMonsterType == (int)OTYPE.MonsterActiveStateType.move; }
    }

    public bool isIdle
    {
        get { return currentMonsterType == (int)OTYPE.MonsterActiveStateType.idle; }
    }

    public bool isDead
    {
        get { return currentMonsterType == (int)OTYPE.MonsterActiveStateType.dead; }
    }
    public bool isLeisure
    {
        get { return currentMonsterType == (int)OTYPE.MonsterActiveStateType.mood; }
    }

    #endregion

    #region 心情

    public bool isHappy
    {
        get { return currentMonsterMoodType == OTYPE.MonsterMoodStateType.happy; }
    }

    public bool isExcited
    {
        get { return currentMonsterMoodType == OTYPE.MonsterMoodStateType.excited; }
    }

    public bool isSad
    {
        get { return currentMonsterMoodType == OTYPE.MonsterMoodStateType.sad; }
    }

    #endregion

    #region 玩法

    public bool isFightType
    {
        get { return currentPlayType == OTYPE.MonsterStateType.fight; }
    }
    public bool isTreasureType
    {
        get { return currentPlayType == OTYPE.MonsterStateType.treasure; }
    }

    #endregion

    

    public void InitValue()
    {
        monsterMaxPower = 0; 
        monsterCurrentPower = 0;
       
        currentMonsterType = (int)OTYPE.MonsterActiveStateType.none;
        currentMonsterMoodType = OTYPE.MonsterMoodStateType.none;
        currentPlayType = OTYPE.MonsterStateType.none; 

        InitSkillValue();
    }
    private void InitSkillValue()
    {
        currentSkillIndex = 0;
        curretnPlayerAttribute = null;
        skillCDTimeBox = new List<float>();
        playerSkillAttributeList = new List<PlayerSkillAttribute>();
        monsterUseSkillValueList = new List<MonsterUseSkillValue>();
        prop_PowerBlock = new List<LD_Objs>();
    }
    public void BuildData(PlayerMonsterAttribute playerMonsterAttribute)
    {
        pma = playerMonsterAttribute;
        moveSpeed = playerMonsterAttribute.monsterMoveSpeed;
        monsterLevel = playerMonsterAttribute.monsterRareType;
        monsterName = playerMonsterAttribute.monsterName;
        monsterNickName = playerMonsterAttribute.monsterNickName;
        monsterMaxPower = playerMonsterAttribute.monsterMaxPower;// + mgua.bloodGrowup;
        monsterCurrentPower = playerMonsterAttribute.mosterPower ;
        playerSkillAttributeList = playerMonsterAttribute.monsterSkillIDList;
        prop_PowerBlock = AndaDataManager.Instance.GetUserPropPowerBlockList();
        BuildCDBox();
        CaculSkillAnimationSpeed();
    }
    private void BuildCDBox()
    {
        int skillCount = playerSkillAttributeList.Count;
        for (int i = 0; i < skillCount; i++)
        {
            //i  =  0 = 防御技能

            //i =  1 = 普通攻击 

            //i = 2 = 特殊技能

            //保证一个开始是冷却完毕的
            skillCDTimeBox.Add(0);
        }

      
    }

    private void CaculSkillAnimationSpeed()
    {
        MonsterSkillAnimationConfig monsterSkillAnimationConfig = MonsterGameData.GetMonsterSkillAnimationConfig(pma.monsterID);
        SkillAnimationConfig defenseSkill = monsterSkillAnimationConfig.skillAnimationConfigs.FirstOrDefault(s=>s.skillID == playerSkillAttributeList[0].skillID);
        defenseSkillAnimationSpeed = 1;
        float t0 = defenseSkill.skillAnimationInterval[0] / 30f ;// * 100 / defenseSkillAnimationSpeed;
        float t1 = (defenseSkill.skillAnimationInterval[1] - defenseSkill.skillAnimationInterval[0]) / 30f ;//* 100 / defenseSkillAnimationSpeed;
        float t2 = (defenseSkill.skillAnimationInterval[2] - defenseSkill.skillAnimationInterval[1]) / 30f ;//* 100 / defenseSkillAnimationSpeed;
        defenseSkillIntervalsTime = new List<float> { t0 , t1 -t0  , t2 - t1};

        SkillAnimationConfig normalSkill = monsterSkillAnimationConfig.skillAnimationConfigs.FirstOrDefault(s => s.skillID == playerSkillAttributeList[1].skillID);
      
        float timeRate = playerSkillAttributeList[1].skillCD / normalSkill.skillAnimationLength;
        float speedRate = 1 / timeRate;
        normalSkillAnimationSpeed = 1;

        //触发攻击特效的时间
        t0 = normalSkill.skillAnimationInterval[0] / 30f;/// speedRate;
        t1 = (normalSkill.skillAnimationInterval[1] - normalSkill.skillAnimationInterval[0] ) / 30f;/// speedRate;
        t2 = (normalSkill.skillAnimationInterval[2] - normalSkill.skillAnimationInterval[1]) / 30f;// / speedRate;
        normalSkillIntervalsTime = new List<float> { t0, t1, t2 };

        SkillAnimationConfig specicalSkill = monsterSkillAnimationConfig.skillAnimationConfigs.FirstOrDefault(s => s.skillID == playerSkillAttributeList[2].skillID);
        specialSkillAnimationSpeed = 1;
        t0 = specicalSkill.skillAnimationInterval[0] /30 ;// / 30f * 100 / specialSkillAnimationSpeed;
        t1 = (specicalSkill.skillAnimationInterval[1] - specicalSkill.skillAnimationInterval[0]) / 30f ;//* 100 / specialSkillAnimationSpeed;
        t2 = (specicalSkill.skillAnimationInterval[2] - specicalSkill.skillAnimationInterval[1]) / 30f;// * 100 / specialSkillAnimationSpeed;
        specialSkillIntervalsTime = new List<float> { t0, t1, t2 };


        //ChangeCurrentSkill(1);
       // curretnPlayerAttribute = playerSkillAttributeList[1];
        ChangeCurrentSkill(1);
    }
  
   /// <summary>
    /// 增减体力
    /// </summary>
    /// <param name="value"></param>
    /* public int UpdateEnergy(int value)
    {
        if (monsterCurrentEnergy < 0) return -1;
       // Debug.Log("energy00" + monsterCurrentEnergy);
        var tmp = monsterCurrentEnergy + value;
      //  Debug.Log("energy01" + monsterCurrentEnergy);
        if (tmp < 0)
        {
            tmp = 0;
        }
        else if (tmp > monsterBaseEnergy)
        {
            //   Debug.Log("energy02" + monsterCurrentEnergy);
            tmp = monsterBaseEnergy;
        }
        monsterCurrentEnergy = tmp;
        //    Debug.Log("energy04" + monsterCurrentEnergy);
        return monsterCurrentEnergy;
    }*/

    /// <summary>
    /// 增减血量
    /// </summary>
    /// <param name="value"></param>
    public int UpdatePower(int value)
    {
        if (monsterCurrentPower <= 0) return -1;

        var tmp = monsterCurrentPower + value;
        if (tmp < 0)
            tmp = 0;
        else if (tmp >= monsterMaxPower)
            tmp = monsterMaxPower;

        monsterCurrentPower = tmp;

        return monsterCurrentPower;
    }

    public int UpdatePropPowerBlock(int _itemIndex)
    {
        return -1;
        //返回-1代表使用不成功
       /* int count = prop_PowerBlock[_itemIndex].count;

        if(count >=1)
        {
            prop_PowerBlock[_itemIndex].lessCount -=1;
            return prop_PowerBlock[_itemIndex].lD_Objs[count-1].giveValue;
        }
        return -1;
        */
}

   /* public int UpdateStrength(int value)
    {
        if (monsterBaseStrength <= 0) return -1;
        var tmp = monsterCurrentStrength + value;

        if (tmp < 0)
            tmp = 0;
        else if (tmp >= monsterBaseStrength)
            tmp = monsterBaseStrength;

        monsterCurrentStrength = tmp;

        //跟新数据
        AndaDataManager.Instance.UpdateMonsterStrengthValue(pma.monsterIndex,pma.hostIndex,pma.hostType,monsterCurrentStrength);

        return monsterCurrentStrength;
    }*/

    public void ChangeCurrentSkill(int index)
    {
        if(currentSkillIndex == index)return;
        currentSkillIndex = index;
        curretnPlayerAttribute = playerSkillAttributeList[index];

        switch(index)
        {
            case 0:
                currentSkillAnimationSpeed = defenseSkillAnimationSpeed;
                currentSkillAnimationInterval = defenseSkillIntervalsTime;
                break;
            case 1:
                currentSkillAnimationSpeed = normalSkillAnimationSpeed;
                currentSkillAnimationInterval = normalSkillIntervalsTime;
                break;
            case 2:
                currentSkillAnimationSpeed = specialSkillAnimationSpeed;
                currentSkillAnimationInterval = specialSkillIntervalsTime;
                break;
        }


        //Debug.Log(curretnPlayerAttribute.skillID);
    }
    public void UpdateCurrentSkillCDLoadTime()
    {
        skillCDTimeBox[currentSkillIndex] = Time.time;
    }

    public void UpdateUseSkillData(int _value, int _skillType,int _skillID, int _skillIndex)
    {
        //找出这个id对应的技能使用数据
        MonsterUseSkillValue musv = monsterUseSkillValueList.FirstOrDefault(s => s.skillID == _skillID);
        if(musv == null)
        {
            musv = new MonsterUseSkillValue();
            musv.skillID = _skillID;
            musv.value = _value;
            musv.skillType = _skillType;
            musv.skillIndex = _skillIndex;
            monsterUseSkillValueList.Add(musv);
        }else
        {
            musv.value += _value;
        }
    }



    public PlayerSkillAttribute GetPlayerSkillAttribute(int _skillID)
    {
        return playerSkillAttributeList.FirstOrDefault(s => s.skillID == _skillID);
    }

    public void UpdateIsStartSkill(bool _isStartSkill)
    {
        isStartSkill = _isStartSkill;
    }
    public void UpdateSkillUsingState(bool _isUsing)
    {
        isUsing = _isUsing;
    }


    #region 设置状态
    public bool SetMonsterState(int _monsterStateType)
    {
       return CheckMonsterActiveStateType(_monsterStateType);
    }
  

    #region 检测状态是否可以切换状态 ， 状态的优先级
    private bool CheckMonsterActiveStateType(int _monsterFightStateType)
    {
        if (_monsterFightStateType == -1)
        {
            currentMonsterType = _monsterFightStateType;
            return true;
        }
        else if (_monsterFightStateType < currentMonsterType)
        {
            return false;
        }
        else 
        {
            currentMonsterType = _monsterFightStateType;
            return true;
        }
    }
    #endregion
    
    public void SetPlayType(OTYPE.MonsterStateType _playType)
    {
        currentPlayType = _playType;
    }
    public void SetMoodType(OTYPE.MonsterMoodStateType _moodType)
    {
        currentMonsterMoodType = _moodType;
    }
    #endregion
}

public class MonsterUseSkillValue
{
    public int value {get;set;}
    public int skillType {get;set;}

    public int skillID { get; set; }

    public int skillIndex {get;set;}




  
    public int hitCount { get; set; }
    public int currentMakePower { get; set; }
    public int useCount { get; set; }

    public int needMakePower { get; set; }
}



