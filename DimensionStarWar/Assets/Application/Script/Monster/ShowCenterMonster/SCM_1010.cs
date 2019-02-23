using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SCM_1010 : ShowCenterMonsterBasic {

    public Renderer[] _renderer;
    public float excuteFadeInTimer;
    public int requestAnimationCount;
    public int sayHelloAnimationCount;
    public override void FadeIn()
    {
        base.FadeIn();
        _renderer[0].material.SetFloat("_Dissolve", 0);
        _renderer[1].material.SetFloat("_Dissolve", 0);
        StartCoroutine(ExcuteFadeIn());
    }

    private IEnumerator ExcuteFadeIn()
    {
        float t = 0;
        while(t < excuteFadeInTimer)
        {
            t+=Time.deltaTime;
            float per = t / excuteFadeInTimer;
            _renderer[0].material.SetFloat("_Dissolve" , per);
            _renderer[1].material.SetFloat("_Dissolve", per);
            yield return null;
        }

        _renderer[0].material.SetFloat("_Dissolve", 1.1f);
        _renderer[1].material.SetFloat("_Dissolve", 1.1f);


    }

    public override void PlayRequestAnimation()
    {
        base.PlayRequestAnimation();
        int aIndex = Random.Range(0, requestAnimationCount);
        animator.CrossFade("Request0" + aIndex, 0.0f);
    }

    public override void PlayHelloAnimation()
    {
        base.PlayHelloAnimation();
        int aIndex = Random.Range(0, sayHelloAnimationCount);
        animator.CrossFade("SayHello0" + aIndex, 0.1f);

    }

}
