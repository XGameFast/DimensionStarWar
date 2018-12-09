using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossSkill_10010 : BossSkillBasic {

    public GameObject elPower;

    public GameObject powerLine;

    private Boss2002 boss2002;

    public override void OnDispawn()
    {


        elPower.gameObject.SetTargetActiveOnce(false);
        elPower.SetInto(transform);



        base.OnDispawn();

    }

    public override void SetInfo(PlayerSkillAttribute playerSkillAttribute, BossBasic _bossBasic)
    {
        base.SetInfo(playerSkillAttribute, _bossBasic);
        boss2002 = _bossBasic as Boss2002;
        elPower.gameObject.SetTargetActiveOnce(true);

    }

    public override void SetGatherPose()
    {
        gatherObj.transform.parent = null;
        Vector3 fwd = boss2002.shotPont.forward;//.poin.forward;
        fwd.y = 0;
        gatherObj.transform.forward = fwd;
        gatherObj.gameObject.SetTargetActiveOnce(true);
        ResetDestory(2f);
    }

    private RaycastHit hit;

    public override void SetMainObjPose()
    {
        gatherObj.transform.parent = null;
        //mainObj.transform.position = targetTra.position;
        mainObj.transform.forward = boss2002.shotPont.forward;// bossBasic.bossData.getCurrentEnemy.selfPostion - mainObj.transform.position;
        mainObj.SetTargetActiveOnce(true);

        elPower.gameObject.SetTargetActiveOnce(false);
        elPower.SetInto(transform);
        if(Physics.Raycast(mainObj.transform.position , mainObj.transform.forward , out hit, 10))
        {

            float distance = Vector3.Distance(hit.point , transform.position);
            float scale = (distance/2.632178f)/4f;
            powerLine.transform.localScale = new Vector3 (1,1,scale);
            exploreObj.transform.parent = null;
            exploreObj.transform.position = hit.point;
            exploreObj.gameObject.SetTargetActiveOnce(true);
            Debug.Log("击中");
            ResetDestory(2f);
        }
        //base.SetMainObjPose(transform);
    }
}
