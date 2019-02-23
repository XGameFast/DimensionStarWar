using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SCM_1007 : ShowCenterMonsterBasic {

    public Renderer[] _renderer;

    public GameObject[] fire;

    public float excuteFadeInTimer;
    public int requestAnimationCount;
    public int sayHelloAnimationCount;
    public override void FadeIn()
    {
        int count = fire.Length;
        for (int i = 0; i < count; i++)
        {
            fire[i].gameObject.SetActive(false);
        }
        base.FadeIn();
        StartCoroutine(ExcuteFadeIn());
    }

    private IEnumerator ExcuteFadeIn()
    {
        float t = 0;
        while(t < excuteFadeInTimer)
        {
            t += Time.deltaTime;
            float per = t / excuteFadeInTimer;
            _renderer[0].material.SetFloat("_Dissolve" , per);

            _renderer[1].material.SetFloat("_alpha", per);
            _renderer[2].material.SetFloat("_alpha", per);

            _renderer[3].material.SetFloat("_Alpha", per);
            _renderer[4].material.SetFloat("_Alpha", per);

            _renderer[5].material.SetFloat("_dissolve", per);

            yield return null;
        }

        int count = fire.Length;
        for(int i = 0 ; i < count; i++)
        {
            fire[i].gameObject.SetActive(true);
        }
    }

    public override void PlayRequestAnimation()
    {
        base.PlayRequestAnimation();
        int aIndex = Random.Range(0, requestAnimationCount);
        animator.CrossFade("Request0" + aIndex, 0.1f);
    }

    public override void PlayHelloAnimation()
    {
        base.PlayHelloAnimation();
        int aIndex= Random.Range(0, sayHelloAnimationCount);
        animator.CrossFade("SayHello0" + aIndex, 0.1f);

    }
}
