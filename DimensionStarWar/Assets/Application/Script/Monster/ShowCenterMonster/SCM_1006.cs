using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SCM_1006 : ShowCenterMonsterBasic {

    public Renderer[] _renderer;
    public float excuteFadeIntimer;
    public int requestAnimationCount;
    public int sayHelloAnimationCount;
    public override void FadeIn()
    {
        base.FadeIn();

        StartCoroutine(ExcuteFadeIn());

    }

    private IEnumerator ExcuteFadeIn()
    {
        float t = 0;



        while(t < excuteFadeIntimer)
        {
            t += Time.deltaTime;
            float per = t / excuteFadeIntimer;

            _renderer[0].materials[0].SetFloat("_Dissolve" ,per);
            _renderer[0].materials[1].SetFloat("_Dissolve", per);
            _renderer[0].materials[2].SetFloat("_Dissolve", per);

            Color c = _renderer[0].materials[3].GetColor("_TintColor");
            c.a = per;
            _renderer[0].materials[3].SetColor("_TintColor", c);

            _renderer[1].material.SetFloat("_Dissolve", per);

            _renderer[2].materials[0].SetFloat("_Dissolve", per);

            _renderer[2].materials[1].SetFloat("_Intensity", per);

            _renderer[3].materials[0].SetFloat("_Dissolve", per);

            c = _renderer[3].materials[1].GetColor("_TintColor");
            c.a = per;
            _renderer[3].materials[1].SetColor("_TintColor", c);


            _renderer[4].materials[0].SetFloat("_Dissolve", per);

            c = _renderer[4].materials[1].GetColor("_TintColor");
            c.a = per;
            _renderer[4].materials[1].SetColor("_TintColor", c);


            yield return null;
        }
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
