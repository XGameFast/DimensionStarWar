using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillGasgathering : MonoBehaviour {
    
    public void StartlGasgathering(Vector3 scale, float time)
    {
        StartCoroutine(Scalling(scale, time));
    }

    private IEnumerator Scalling(Vector3 targetScale ,float timer)
    {
        while (transform.localScale != targetScale)
        {
            transform.localScale = Vector3.Lerp(transform.localScale, targetScale, Time.deltaTime * timer * 10); 
            yield return null;
        }
    }
}
