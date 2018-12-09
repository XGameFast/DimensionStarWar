using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DimensionSpace : AndaObjectBasic {
   
    public Transform monsterPoint;
    public Renderer[] renderers;


    #region 执行

    #region 淡入 淡出

    public void FadeIn(System.Action callback = null)
    {
        StartCoroutine(ExcuteFadeIn(callback));
    }

    private IEnumerator ExcuteFadeIn(System.Action callback)
    {
        float t =  0;
        while(t <1 )
        {
            t += Time.deltaTime;
            t = Mathf.Clamp01(t);
            foreach(var go in renderers)
            {
                go.material.SetFloat("_alpha", t);
            }
            yield return null;
        }
        if(callback!=null)
        {
            callback();
        }
    }


    public void FadeOut(System.Action callback = null)
    {
        StartCoroutine(ExcuteFadeOut(callback));
    }

    public IEnumerator ExcuteFadeOut(System.Action callback)
    {
        float t= 1;
        while(t >0)
        {
            t -= Time.deltaTime;
            t= Mathf.Clamp01(t);
            foreach(var go in renderers)
            {
                go.material.SetFloat("_alpha" ,t);
            }
            yield return null;
        }

        if(callback!=null)
        {
            callback();
        }
    }

    #endregion

    #endregion


}
