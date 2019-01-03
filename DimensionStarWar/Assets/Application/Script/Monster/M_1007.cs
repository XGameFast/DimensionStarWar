using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1007 : MonsterBasic
{
    public List<Renderer> renderers;

    public List<GameObject> fankui00;
    public GameObject fankui01;
    public List<GameObject> happy;
    public GameObject nanGuo;
    public List<GameObject> sayHello;
    public override void SetAlpha(float v)
    {
        base.SetAlpha(v);
       
    }
    public override void SetRongjie(float v)
    {
        base.SetRongjie(v);
        for (int i = 0; i < renderers.Count; i++)
        {
            renderers[i].material.SetFloat("_Alpha", v);
        }
    }
    public void Dazhaohu00()
    {
        Initialization();
        SetListActive(fankui00, true);
      
    }
    public void Dazhaohu01()
    {
        Initialization();
        fankui01.SetTargetActiveOnce(true);
        SynchroLayer(fankui01);
    }
    public void Happy()
    {
        Initialization();
        SetListActive(happy, true);
    }
    public void NanGuo()
    {
        Initialization();
        nanGuo.SetActive(true);
        SynchroLayer(nanGuo);
    }
    public void Hello()
    {
        Initialization();
        SetListActive(sayHello, true);
    }
    public override void EndOfMonsterMoodAnimation()
    {
        Initialization();
        base.EndOfMonsterMoodAnimation();
    }
    public void Initialization()
    {
        fankui01.SetTargetActiveOnce(false);
        nanGuo.SetActive(false);
        fankui01.SetTargetActiveOnce(false);
        SetListActive(fankui00, false);
        SetListActive(happy, false);
        SetListActive(sayHello, false);
    }
    public void SetListActive(List<GameObject> list,bool activity)
    {
        if (list == null)
            return;
        for (int i = 0; i < list.Count; i++)
        {

            list[i].SetTargetActiveOnce(activity);
            if (activity)
                SynchroLayer(list[i]);
        }
    }
}
