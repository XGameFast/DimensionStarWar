using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossData2002 : BossData {

    public Boss2002 boss2002 {get {return bossBasic as Boss2002 ;} }
    public BossSkillLogic2002 getBossSkillLogic2002 {get {return bossSkillLogic as BossSkillLogic2002 ;}}
    public BossLogic2002 getBossLogic2002 {get {return bossLogic as BossLogic2002 ;}}
    public BossAnimation_2002 getBossAnimation20002 {get {return bossAnimation as BossAnimation_2002 ;}}
  

    public float getStartInstanceElgunTime {get {return startInstanceElgunTime ;}}
    public List<BossSkill_2001_Basic> getElgunObjsList {get {return elGunsObjList ;}}
    public List<float>getInstancElgunTimeList {get {return elInstanceTimeList; }}
    public bool getElgunsShotPoseInRight { get {return elShotPoseInRight ;}}
    public PlayerSkillAttribute getBigElgun{get {return bigElgun ;}}
    private int lastElPointIndex=-1;
    private float startInstanceElgunTime;
    private PlayerSkillAttribute[] elGuns;
    private PlayerSkillAttribute bigElgun;//大招
    private List<BossSkill_2001_Basic> elGunsObjList;
    private List<float> elInstanceTimeList;
    private bool elShotPoseInRight =false;
    private int lastFreeIndex = -1;

    public override void InitValue()
    {
        base.InitValue();
        bossLogic = null;
        bossSkillLogic = null;
       
    }

    public override void CreatData(BossBasic _bossBasic, PlayerMonsterAttribute _playerMonsterAttribute)
    {
        base.CreatData(_bossBasic, _playerMonsterAttribute);
        bigElgun = getSkills[0];
        elGuns = new PlayerSkillAttribute[2]{ getSkills[1] , getSkills[2]};
    }

    protected override void BuildBossAnimation()
    {
        bossAnimation = new BossAnimation_2002();
        bossAnimation.BuildBossAnimation(bossBasic);
    }

    protected override void BuildBossSKillLogic()
    {
        bossSkillLogic = new BossSkillLogic2002();
        bossSkillLogic.BuildSkillLogic(bossBasic);
    }

    protected override void BuildBossLogic()
    {
        bossLogic = new BossLogic2002();
        bossLogic.BuildBossLogic(bossBasic);
    }


    public Transform GetNextElPoint()
    {
        int randomPointIndex = Random.Range(0 , boss2002.elGunPoints.Length);
        if(lastElPointIndex!=-1)
        {
            while(lastElPointIndex == randomPointIndex)
            {
                randomPointIndex = Random.Range(0 ,boss2002.elGunPoints.Length);
            }
            lastElPointIndex = randomPointIndex;

        }
        elShotPoseInRight = randomPointIndex%2 == 0? true:false;
        return boss2002.elGunPoints[randomPointIndex];
    }

    public PlayerSkillAttribute GetNextElAttribute()
    {
        int randomIndex = Random.Range(0 , elGuns.Length);
        return elGuns[randomIndex];
    }

    public void SetStartElGunTime()
    {
        startInstanceElgunTime = Time.time;
    }

    public void AddElgunObjTolist(BossSkill_2001_Basic _bossSkillBasic)
    {
        if(elGunsObjList == null)
        {
            elGunsObjList = new List<BossSkill_2001_Basic>();
            elInstanceTimeList = new List<float>();
        }

        if(lastFreeIndex!=-1)
        {
            elGunsObjList[lastFreeIndex]= _bossSkillBasic;
            elInstanceTimeList[lastFreeIndex] = Time.time;
            lastFreeIndex = -1;
        }else
        {
            elGunsObjList.Add(_bossSkillBasic);
            elInstanceTimeList.Add(Time.time);
        }
    }

    public void RemovelgunObjTolist(int _index)
    {
        if(elGunsObjList != null)
        {
            elGunsObjList[_index] = null;
            elInstanceTimeList[_index] = -1;
            lastFreeIndex = _index;
        }
    }

    public void RemoveElgunObjToList(BossSkill_2001_Basic bossSkillBasic)
    {
        int index  = elGunsObjList.IndexOf(bossSkillBasic);
        RemovelgunObjTolist(index);
    }

    public void ClearElgunObjList()
    {
        int count = elGunsObjList.Count;
        for(int i = 0 ; i <count; i++)
        {
            if(elGunsObjList[i]!=null)
            {
                AndaDataManager.Instance.RecieveItem(elGunsObjList[i]);
                elGunsObjList[i] = null;
            }
        }
        elGunsObjList.Clear();
        elInstanceTimeList.Clear();
        lastElPointIndex = - 1;
    }

}
