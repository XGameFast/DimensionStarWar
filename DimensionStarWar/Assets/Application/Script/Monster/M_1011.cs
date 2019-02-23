﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1011 : MonsterBasic
{
    public GameObject dazhaohu0;
    public GameObject dazhaohu1;
    public GameObject sayhello;
    public GameObject excity00;
    public GameObject happy;
    public GameObject nanguo;

    public Renderer[] monsterRenderes;
   

    public override void SetState00()
    {
        int count = monsterRenderes.Length;
        for(int i = 0 ; i < count; i++)
        {
            monsterRenderes[i].materials[0].SetFloat("_Dissolve", -0.1f);
            monsterRenderes[i].materials[1].SetFloat("_Alpha", 1);
        }
    }


    public override void SetState01()
    {
        StartCoroutine(ExcuteMonsterFadeIn());
    }

    private IEnumerator ExcuteMonsterFadeIn()
    {
        float t = 0;
        while(t < 2)
        {
            t +=Time.deltaTime;

            int count2 = monsterRenderes.Length;
            for (int i = 0; i < count2; i++)
            {
                monsterRenderes[i].materials[0].SetFloat("_Dissolve", t);
            }


            yield return null;
        }

        int count = monsterRenderes.Length;
        for (int i = 0; i < count; i++)
        {
            monsterRenderes[i].materials[1].SetFloat("_Alpha", 0);
        }
    }

    public void SayHello()
    {
        Initialization();
        sayhello.SetTargetActiveOnce(true);
    }
    public void Excity()
    {
        Initialization();
        excity00.SetTargetActiveOnce(true);
    }
    public void Happy()
    {
        Initialization();
        happy.SetTargetActiveOnce(true);
    }
    public void DaZhaoHu00()
    {
        Initialization();
        dazhaohu0.SetTargetActiveOnce(true);
    }
    public void DaZhaoHu01()
    {
        Initialization();
        dazhaohu1.SetTargetActiveOnce(true);
    }
    public void NanGuo()
    {
        Initialization();
        nanguo.SetTargetActiveOnce(true);
    }
    public override void EndOfMonsterMoodAnimation()
    {
        Initialization();
        base.EndOfMonsterMoodAnimation();
    }

    public void Initialization()
    {
        nanguo.SetTargetActiveOnce(false);
        dazhaohu0.SetTargetActiveOnce(false);
        dazhaohu1.SetTargetActiveOnce(false);
        excity00.SetTargetActiveOnce(false);
        happy.SetTargetActiveOnce(false);
        sayhello.SetTargetActiveOnce(false);
    }
}
