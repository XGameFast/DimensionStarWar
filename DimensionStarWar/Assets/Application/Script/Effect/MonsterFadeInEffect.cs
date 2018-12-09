using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterFadeInEffect : MonoBehaviour {

    public Renderer p1; //向下流动的线条

    public Renderer p2; //流动线条溶解

    public void OnDisable()
    {
        p1.gameObject.SetTargetActiveOnce(false);
        p2.gameObject.SetTargetActiveOnce(false);
    }

    public void OpenP1()
    {
        p1.gameObject.SetTargetActiveOnce(true);
    }
    public void OpenP2()
    {
        p2.gameObject.SetTargetActiveOnce(true);
    }

    public void SetValueP1(float _value)
    {

        float per = _value;
        p1.material.SetFloat("_liudong" , _value);
    }

    public void SetValueP2(float _value)
    {
        p2.material.SetFloat("_rongjie", _value);
    }
}
