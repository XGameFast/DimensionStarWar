using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1005 : MonsterBasic {

    public GameObject Ani_SayHello;
    public GameObject Ani_SayHello2;
    public GameObject fankui01l;
    public GameObject fankui01r;
    public GameObject fankui02;
    public GameObject fankui03;

    public GameObject jiqiren;
    public GameObject lvdail;
    public GameObject lvdair;

    public void SayHollo()
    {
        Ani_SayHello.SetTargetActiveOnce(true);
    }
    public void SayHollo2()
    {
        Ani_SayHello2.SetTargetActiveOnce(true);

        jiqiren.SetTargetActiveOnce(false);
        lvdail.SetTargetActiveOnce(false);
        lvdair.SetTargetActiveOnce(false);
        Invoke("Showjqr", 2.1f);
    }
    public void Showjqr()
    {
        jiqiren.SetTargetActiveOnce(true);
        lvdail.SetTargetActiveOnce(true);
        lvdair.SetTargetActiveOnce(true);
    }

    public void FanKui01()
    {
        fankui01l.SetTargetActiveOnce(true);
        fankui01r.SetTargetActiveOnce(true);
    }
    public void FanKui02()
    {
        fankui02.SetTargetActiveOnce(true);
    }
    public void FanKui03()
    {
        fankui03.SetTargetActiveOnce(true);
    }
    public override void EndOfMonsterMoodAnimation()
    {
        fankui01l.SetTargetActiveOnce(false);
        fankui01r.SetTargetActiveOnce(false);
        fankui02.SetTargetActiveOnce(false);
        Ani_SayHello.SetTargetActiveOnce(false);
        fankui03.SetTargetActiveOnce(false);
        Ani_SayHello2.SetTargetActiveOnce(false);
        base.EndOfMonsterMoodAnimation();
    }

}
