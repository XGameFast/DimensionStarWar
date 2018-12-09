using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ARSetPointEffect : AndaObjectBasic {

    public Renderer ren;

    public void OnEnable()
    {
        StartCoroutine(ExcutePlayEffect());
    }

    private IEnumerator ExcutePlayEffect()
    {
        float t = 0;
        while(t  <1 )
        {
            t+= Time.deltaTime;
            float value = Mathf.Sin(t*Mathf.PI);
            ren.material.SetFloat("_alpha" , value);
            ren.material.SetFloat("_liudong" ,t);
            yield return null;
        }
    }
}
