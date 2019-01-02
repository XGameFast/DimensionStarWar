using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1003 : MonsterBasic {
    public GameObject dazhaohu1;
    public GameObject dazhaohu2;
    public GameObject fankui;
    public GameObject xin;
    public GameObject shanxin;

    public void Dazhaohu1()
    {
      
        dazhaohu1.SetTargetActiveOnce(true);
        shanxin.SetTargetActiveOnce(true);
        SynchroLayer(shanxin);
        SynchroLayer(dazhaohu1);
    }
    public void Dazhaohu2()
    {
       
        dazhaohu2.SetTargetActiveOnce(true);
        xin.SetTargetActiveOnce(true);
        SynchroLayer(dazhaohu2);
        SynchroLayer(xin);
        Invoke("EndOfMonsterMoodAnimation", 3f);
    }
    public void Fankui()
    {
        fankui.SetTargetActiveOnce(true);
        SynchroLayer(fankui);
    }
   
    public override void EndOfMonsterMoodAnimation()
    {
        fankui.SetTargetActiveOnce(false);
        dazhaohu1.SetTargetActiveOnce(false);
        dazhaohu2.SetTargetActiveOnce(false);
        xin.SetTargetActiveOnce(false);
        shanxin.SetTargetActiveOnce(false);
        base.EndOfMonsterMoodAnimation();
    }
}
