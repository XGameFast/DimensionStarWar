using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProtectGameData_2001 : ProtectGameData_Basic {
    public MonsterBasic getCurrentMineMonster{get {return currentMonsterItem ;}}
    public PlayerMonsterAttribute getCurrentMineMonsterData {get { return currentMonsterData ;}}
    public ProtectGameView_2001 getProtectGameView2001 {get {return protectGameView_2001;} }
    public Boss2002 getBoss2001 {get {return boss2002; }}
    private ProtectGameCtr_2001 protectGameCtr_2001;
    private ProtectGameView_2001 protectGameView_2001;
    private Boss2002 boss2002;
   
    public override void BuildData(ProtectGameCtr_Basic _protectGameCtr_Basic)
    {
        base.BuildData(_protectGameCtr_Basic);
        InitValue();
        protectGameCtr_2001 = _protectGameCtr_Basic as ProtectGameCtr_2001;
    }

    public override void BuildMenu(string name)
    {
        base.BuildMenu(name);
        protectGameView_2001 = m_View as ProtectGameView_2001;
        protectGameView_2001.SetCtr(protectGameCtr_2001);
        protectGameView_2001.FadeIn();
        protectGameView_2001.SetCtrCallBack(protectGameCtr_2001.StartGame);
    }

    public void InitValue()
    {
       
        Clear();
    }

    public override void Clear()
    {
        base.Clear();
        if (boss2002 != null)
        {
            AndaDataManager.Instance.RecieveItem(boss2002);
            boss2002= null;
        }

        protectGameView_2001 = null;
    }

    public void BuildBoss()
    {
        if(boss2002 !=null)AndaDataManager.Instance.RecieveItem(boss2002);
        boss2002 = AndaDataManager.Instance.InstantiateMonster<Boss2002>("2001");
        boss2002.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        boss2002.transform.position = ARMonsterSceneDataManager.Instance.GetCameraPostionWithARWorldY() + Vector3.Normalize(boss2002.transform.position - ARMonsterSceneDataManager.Instance.GetCameraPostionWithARWorldY()) * 10;

        PlayerMonsterAttribute playerMonster = new PlayerMonsterAttribute();
        playerMonster.monsterID = 2001;
        MonsterBaseConfig mbc = MonsterGameData.GetMonsterBaseConfig(playerMonster.monsterID);
        playerMonster.mosterPower = mbc.monsterBaseBlood;
        playerMonster.monsterMaxPower =mbc.monsterBaseBlood;
        int count = mbc.monsterBaseSkillList.Count;

        for (int i = 0 ; i < count; i ++)
        {
            SkillBaseAttribute sba = MonsterGameData.GetSkillBaseAttribute(mbc.monsterBaseSkillList[i]);
            PlayerSkillAttribute pas = new PlayerSkillAttribute();
            pas.skillID = sba.skillID;
            pas.skillPower = sba.skillPower[0];
            pas.skillCosumeEnergy = sba.skillCosumeEenrgy[0];
            if (playerMonster.monsterSkillIDList == null) playerMonster.monsterSkillIDList = new List<PlayerSkillAttribute>();
            playerMonster.monsterSkillIDList.Add(pas);
        }
       
        boss2002.SetInfo(playerMonster);
        boss2002.bossData.SetBossActive(true);
        boss2002.BossHasBeenAttack += getProtectGameView2001.UpdateEnmeyMonsterPower;
        boss2002.BossHadDeath += protectGameCtr_2001.ListenToMonsterPower;
    }

    public override void BuildMonster()
    {
        base.BuildMonster();
        currentMonsterItem.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        currentMonsterItem.transform.position = ARMonsterSceneDataManager.Instance.GetCameraForwardFixPoint(4f);
        currentMonsterItem.transform.forward = -ARMonsterSceneDataManager.Instance.GetMainCameraForwardYZero();
        currentMonsterItem.DownloadMonsterValue(currentMonsterData, OTYPE.MonsterStateType.fight);
        currentMonsterItem.MonsterHaeBeenHit += getProtectGameView2001.UpdateMineMonsterPower;
        currentMonsterItem.MonsterDeadEvent += protectGameCtr_2001.ListenToMonsterPower;
    }

}
