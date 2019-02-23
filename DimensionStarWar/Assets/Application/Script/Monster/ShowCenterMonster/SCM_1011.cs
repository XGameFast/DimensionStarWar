using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SCM_1011 : ShowCenterMonsterBasic {

    public Renderer[] _renderer;
    public float excuteFadeInTimer;
    public GameObject wolun;
    public int requestAnimationCount;
    public int sayHelloAnimationCount;
    public override void FadeIn()
    {

        base.FadeIn();
        wolun.gameObject.SetActive(false);
        StartCoroutine(ExcuteFade());
    }

    private IEnumerator ExcuteFade()
    {
        float t = 0;
        while(t < excuteFadeInTimer)
        {
            t += Time.deltaTime;
            float per = t /excuteFadeInTimer;

            _renderer[0].material.SetFloat("_Dissolve",per);
            _renderer[1].material.SetFloat("_Dissolve", per); 

            yield return null;
        }

        wolun.gameObject.SetActive(true);
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
