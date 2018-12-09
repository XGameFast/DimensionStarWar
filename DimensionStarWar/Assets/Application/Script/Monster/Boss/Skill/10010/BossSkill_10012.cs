﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossSkill_10012 : BossSkillBasic {

    public Magical elGunsBall;
    private Boss2002 boss2002 {get{return bossBasic as Boss2002;}}
    public GameObject shotLine;
    public override void OnSpawn()
    {
        base.OnSpawn();
        elGunsBall.gameObject.SetTargetActiveOnce(true);
    }

    public override void OnDispawn()
    {
     
        elGunsBall.gameObject.SetTargetActiveOnce(false);
        base.OnDispawn();
    }


    public override void SetInfo(PlayerSkillAttribute playerSkillAttribute, BossBasic _bossBasic)
    {
        base.SetInfo(playerSkillAttribute, _bossBasic);
        elGunsBall.SetInfo(HasBeenDestroy);
    }


    public override void SetGatherPose()
    {
        gatherObj.transform.parent = null;
        Vector3 fwd = bossBasic.headFwdPint.forward;
        fwd.y = 0;
        gatherObj.transform.forward = fwd;
        elGunsBall.gameObject.SetTargetActiveOnce(false);
        gatherObj.gameObject.SetTargetActiveOnce(true);
        ResetDestory(2f);
        //base.SetGatherPose(transform);
    }

    private RaycastHit hit;
    public override void SetMainObjPose()
    {
        gatherObj.transform.parent = null;



        //mainObj.transform.position = targetTra.position;
        mainObj.transform.forward =/* bossBasic.headFwdPint.forward;// */ bossBasic.bossData.getCurrentEnemy.selfPostion - mainObj.transform.position;
        mainObj.SetTargetActiveOnce(true);
        if(Physics.Raycast(mainObj.transform.position , mainObj.transform.forward , out hit))
        {

            float distance = Vector3.Distance(hit.point , transform.position);
            float scale = (distance/2.632178f)/5f;
            shotLine.transform.localScale = new Vector3 (1,1,scale);
            Debug.Log("击中");
            exploreObj.transform.parent = null;
            exploreObj.transform.position = hit.point;
            exploreObj.gameObject.SetTargetActiveOnce(true);
            ResetDestory(2f);
        }
       // base.SetMainObjPose(transform);
    }

    public override void HasBeenDestroy()
    {
        base.HasBeenDestroy();
        boss2002.getBossData2002.RemoveElgunObjToList(this);//(i);
        AndaDataManager.Instance.RecieveItem(this);
    }
}
