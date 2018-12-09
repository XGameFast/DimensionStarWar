using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HologramScreenEffect : MonoBehaviour {
   
    public Renderer rendererMat;

    public void OpenEffect()
    {
        StartCoroutine(ExcuteOpen());
    }

    private IEnumerator ExcuteOpen()
    {
        float t = 3 ;
        while(t > 2.25f)
        {
            t-=Time.deltaTime;
            rendererMat.material.SetFloat("_width" ,t);
            yield return null;
        }
    }
}
