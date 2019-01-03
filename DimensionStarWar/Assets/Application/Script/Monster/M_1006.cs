using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1006 : MonsterBasic {
    public List<Renderer> renderers;


    public GameObject fankui00;
    public GameObject fankui01;
    public GameObject sayhello;

    public GameObject excity00;
    public GameObject excity01;
    public override void SetAlpha(float v)
    {
        base.SetAlpha(v);
        //for (int i = 0; i < renderers.Count; i++)
        //{
        //    renderers[i].material.SetFloat("_alpha", v);
        //}
    }
    public override void SetRongjie(float v)
    {
        base.SetRongjie(v);
        for (int i = 0; i < renderers.Count; i++)
        {
            foreach (var m in renderers[i].materials)
            {
                m.SetFloat("_rongjie", v);
            }
          
        }
    }
    public void Dazhaohu00()
    {
        Initialization();
        fankui00.SetTargetActiveOnce(true);
        SynchroLayer(fankui00);
    }
    public void Dazhaohu01()
    {
        Initialization();
        fankui01.SetTargetActiveOnce(true);
        SynchroLayer(fankui01);
    }
    public void Sayhello()
    {
        Initialization();
        sayhello.SetTargetActiveOnce(true);
        SynchroLayer(sayhello);
    }
    public void Excity()
    {
        Initialization();
        excity00.SetTargetActiveOnce(true);
        excity01.SetTargetActiveOnce(true);
        SynchroLayer(excity00);
        SynchroLayer(excity01);
    }
    public void Initialization()
    {
        excity00.SetTargetActiveOnce(false);
        excity01.SetTargetActiveOnce(false);
        fankui00.SetTargetActiveOnce(false);
        fankui01.SetTargetActiveOnce(false);
        sayhello.SetTargetActiveOnce(false);
    }
    public override void EndOfMonsterMoodAnimation()
    {
        Initialization();
        base.EndOfMonsterMoodAnimation();
    }
}
