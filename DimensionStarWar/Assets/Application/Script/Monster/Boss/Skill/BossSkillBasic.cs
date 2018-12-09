using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossSkillBasic : AndaObjectBasic {
    #region 变量
    public int getSkillID { get {return  bossSkillData.playerSkillAttribute.skillID ;}}
    public BossSkillData bossSkillData;
    public BossBasic bossBasic;
    #endregion;

    #region 物件

    public GameObject gatherObj;
    public GameObject mainObj;
    public GameObject exploreObj;
    public GameObject board;
    #endregion

    public override void OnDispawn()
    { 
        gatherObj.SetTargetActiveOnce(false);
        gatherObj.SetInto(board.transform);
      
        mainObj.SetTargetActiveOnce(false);
        mainObj.SetInto(board.transform);
      

     
        exploreObj.gameObject.SetTargetActiveOnce(false);
        exploreObj.SetInto(transform);
        base.OnDispawn();
    }



    public virtual void SetInfo(PlayerSkillAttribute playerSkillAttribute , BossBasic _bossBasic)
    {
        bossBasic = _bossBasic;
        BuildBossSkillData(playerSkillAttribute);
    }

    private void BuildBossSkillData(PlayerSkillAttribute _playerSkillAttribute)
    {
        bossSkillData = new BossSkillData();
        bossSkillData.BuildData(this  , _playerSkillAttribute );
       // ResetDestory(3f);
    }

    public virtual void SetGatherPose( )
    {
        
    }
    public virtual void SetMainObjPose( )
    {
        
    }

    public virtual void SetExploreObj( )
    {
        
    }

    public virtual void StartSkill()
    {
        
    }
    public virtual void ShotSkill()
    {
        
    }
    public virtual void EndSkill()
    {
        
    }


    public virtual void HasBeenDestroy()
    {
        
    }


}

