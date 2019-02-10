using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterFadeInEffect : MonoBehaviour {

    public Renderer p1; //向下流动的线条

    public Renderer p2; //流动线条溶解

    public void OnDisable()
    {
        if(p1!=null) p1.gameObject.SetTargetActiveOnce(false);

        if(p2!=null)p2.gameObject.SetTargetActiveOnce(false);
    }

    public void OpenP1()
    {
        if (p1 != null) p1.gameObject.SetTargetActiveOnce(true);
    }
    public void OpenP2()
    {
        if (p2 != null) p2.gameObject.SetTargetActiveOnce(true);
    }

    public void SetValueP1(float _value)
    {

        float per = _value;
        if (p1 != null) p1.material.SetFloat("_liudong" , _value);
    }

    public void SetValueP2(float _value)
    {
        if (p2 != null )p2.material.SetFloat("_rongjie", _value);
    }
}
