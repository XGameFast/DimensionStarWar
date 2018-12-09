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
    }
    public void Dazhaohu2()
    {
        dazhaohu2.SetTargetActiveOnce(true);
        xin.SetTargetActiveOnce(true);
        Invoke("EndOfMonsterMoodAnimation", 3f);
    }
    public void Fankui()
    {
        fankui.SetTargetActiveOnce(true);
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
