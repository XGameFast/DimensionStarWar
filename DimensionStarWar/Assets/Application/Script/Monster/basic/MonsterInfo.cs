using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterInfo : ObjectsInfo{

    private MonsterBasic self_monster;
    private bool isExuteUpdateStrenthValue = false;

    #region 体力恢复相关
    private int targetStrengthRecoverTime;
    private float offsetStrengthTime;
    private int currentStrengthValue;
    private int targetStrengthValue;
    private int offsetStrengthValue;
    #endregion

    #region 战斗数据相关

    private InfoBar_Slider_Label bloodBar;
    private InfoBar_Slider_Label energyBar;
    private InfoBar_Slider_Label strengthBar;

    #endregion

    public override void DownloadMessage(AndaObjectBasic mb)
    {
        base.DownloadMessage(mb);
        self_monster = mb as MonsterBasic ;
        
    }
    
    public override void InitValue()
    {
        base.InitValue();
        //Debug.Log("Initvalue __MonsterInfo");
        isExuteUpdateStrenthValue = false;
    }

    //构建名字条
    public void BuildNameInfoBar()
    {
        InitValue();
        BuildFollowTargetBoard();
        SetNameInfo();
    }

    private void SetNameInfo()
    {
        InfoBar_Label name_label = AndaUIManager.Instance.PopInfoBar_Label();
        if (self_monster.monsterDataValue.monsterNickName == null || self_monster.monsterDataValue.monsterNickName == "")
            name_label.SetValue(self_monster.monsterDataValue.monsterName);
        else
            name_label.SetValue(self_monster.monsterDataValue.monsterNickName);
        followBoard.SetNameToPoint(name_label.transform);
        itemList.Add(name_label);
    }

    #region 构建战斗信息1.血量 2.蓝量2.体力 。
    public void BuildFightInfoBar()
    {
        InitValue();
        BuildFollowTargetBoard();
        SetNameInfo();
        SetBloodInfoBar();
        SetEnergyInfoBar();
        SetStrengthInfoBar();
    }
    #region 私有构建函数
    private void SetBloodInfoBar()
    {
        if (bloodBar == null)
        {
            bloodBar = AndaUIManager.Instance.PopInfoBar_Slider_label_Line();
            self_monster.MonsterHaeBeenHit = UpdateBloodInfo;
        }
        bloodBar.UpdateValue(self_monster.monsterDataValue.monsterCurrentPower, self_monster.monsterDataValue.monsterMaxPower, "HP", true, true);
        followBoard.SetToIcon_Board_Value_Tips(bloodBar.transform);
        itemList.Add(bloodBar);
    }

    private void UpdateBloodInfo(int currentVlaue,int maxValue)
    {
        bloodBar.UpdateValue(currentVlaue, maxValue, "HP", true, true);
    }

    private void SetEnergyInfoBar()
    {
        if (energyBar == null)
        {
            energyBar = AndaUIManager.Instance.PopInfoBar_Slider_label_Line();
            self_monster.MonsetCosumeEnergy = UpdateEnergyInfo;
        }
        energyBar.UpdateValue(self_monster.monsterDataValue.monsterCurrentEnergy, self_monster.monsterDataValue.monsterBaseEnergy, "EP", true, true);
        followBoard.SetToIcon_Board_Value_Tips2(energyBar.transform);
        
        itemList.Add(energyBar);
    }
    private void UpdateEnergyInfo(int currentVlaue, int maxValue)
    {
        energyBar.UpdateValue(currentVlaue, maxValue, "EP", true, true);
    }

    private void SetStrengthInfoBar()
    {
        if (strengthBar == null)
        {
            strengthBar = AndaUIManager.Instance.PopInfoBar_Slider_label_Line();
            self_monster.MonsterCosumeStrength = UpdateStrengthInfo;
        }
        //-- --//
        strengthBar.UpdateValue(self_monster.monsterDataValue.monsterCurrentStrength, self_monster.monsterDataValue.monsterBaseStrength, "SP", true, true);
        followBoard.SetToIcon_Board_LevelName(strengthBar.transform);
        itemList.Add(strengthBar);
    }
    private void UpdateStrengthInfo(int currentVlaue, int maxValue)
    {
        strengthBar.UpdateValue(currentVlaue, maxValue, "SP", true, true);
    }

    #endregion

    #endregion

    #region 构建体力恢复，经验值
    public void BuildRecoveryInfoBar()
    {
        InitValue();
        BuildFollowTargetBoard();
        SetStrengthRecovery();
        SetExprenceValue();
    }
    #region 体力
    private void SetStrengthRecovery()
    {
        InfoBar_Slider_Label strengthRecoveryBar = AndaUIManager.Instance.PopInfoBar_Slider_Label_Circle();
        followBoard.SetToIcon_Board_LevelName(strengthRecoveryBar.transform);
        itemList.Add(strengthRecoveryBar);
        targetStrengthRecoverTime = self_monster.monsterDataValue.pma.monsterRecoveryTime;
       // currentStrengthValue = self_monster.monsterDataValue.pma.monsterCurrentStrength;
       // targetStrengthValue = self_monster.monsterDataValue.pma.monsterStrength ;
        offsetStrengthValue = targetStrengthValue - currentStrengthValue;
        offsetStrengthTime = targetStrengthRecoverTime - AndaGameExtension.GetCurrentUnixTime();
        if (!isExuteUpdateStrenthValue)
        {
            self_monster.StartCoroutine(UpdateStrengValue(strengthRecoveryBar));
        }
    }
    public IEnumerator UpdateStrengValue(InfoBar_Slider_Label item)
    {
        isExuteUpdateStrenthValue = true;
        while (AndaGameExtension.GetCurrentUnixTime() < targetStrengthRecoverTime)
        {
            int lessTime = targetStrengthRecoverTime - AndaGameExtension.GetCurrentUnixTime();
            float timerPer = 1 - ((float)lessTime / offsetStrengthTime);
            int tmpCurValue = currentStrengthValue + (int)(timerPer * offsetStrengthValue);
            item.UpdateValue(tmpCurValue, targetStrengthValue, lessTime.UnixCovertToTime(), true, false);
            yield return null;
        }
        isExuteUpdateStrenthValue = false;
        item.UpdateValue(targetStrengthValue, targetStrengthValue, "FULL", true, false);
    }
    #endregion
    #region 经验
    private void SetExprenceValue()
    {
        InfoBar_Slider_Label expbar = AndaUIManager.Instance.PopInfoBar_Slider_Label_Circle();
        //设置位置
        followBoard.SetToIcon_Board_Value_Tips(expbar.transform);
        //加入列表
        itemList.Add(expbar);
        string lv = "Lv." + (self_monster.monsterDataValue.pma.monsterLevel + 1);
        //int curExp = self_monster.monsterDataValue.pma.monsterCurEXP;
       // int maxExp = self_monster.monsterDataValue.pma.monsterMaxExp;
       // expbar.UpdateValue(curExp, maxExp,lv,true,false );
    }
    #endregion
    #endregion


    #region  构建基础信息 1. 类明， 2.背景故事 ，3技能说明
    public void BuildBaseInfoBar(int monsterID)
    {
        InitValue();
        BuildFollowTargetBoard();
        MonsterBaseConfig mbc = MonsterGameData.GetMonsterBaseConfig(monsterID);
        SetClassName(mbc.monsterName);
        SetBackgroundDescription(mbc.monsterDescription);
        SetMonsterSkillDescription(mbc);
    }
    #region 私有构建函数
    private void SetClassName(string value)
    {
        InfoBar_Label nameBar = AndaUIManager.Instance.PopInfoBar_Label();
        nameBar.SetValue(value);
        followBoard.SetNameToPoint(nameBar.transform);
        itemList.Add(nameBar);
    }
    private void SetBackgroundDescription(string value)
    {
        InfoBar_Label  descriptionBar = AndaUIManager.Instance.PopInfoBar_LabelBackground();
       
        descriptionBar.SetValue(value);
        followBoard.SetDesToBotPoint(descriptionBar.transform);
        itemList.Add(descriptionBar);
    }

    private void SetMonsterSkillDescription(MonsterBaseConfig mbc)
    {
        InfoBar_Icon_Board_List skillDes = AndaUIManager.Instance.PopIcon_Board_List();
        List<int> idList = new List<int>();
        List<int> boardList = new List<int>();
        foreach (var go in mbc.monsterBaseSkillList)
        {
            SkillBaseAttribute sba = MonsterGameData.GetSkillBaseAttribute(go);
            idList.Add(sba.skillID);
            boardList.Add(1);
        }
        skillDes.SetValue(idList, boardList);
        followBoard.SetToListPoint(skillDes.transform);
        itemList.Add(skillDes);
        
    }
    #endregion

    #endregion



}
