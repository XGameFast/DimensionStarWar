using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class CheckConfigMenu : UIBasic2 {

    //public Animator blackhole;
    public GameObject monster;
    public float progress = 0f;
    public Text progressText;
    public Renderer[] bodyRender;
    public MonsterFadeInEffect monsterFadeInEffect;
    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
        //blackhole.Play("FadeInScale");
        monster.gameObject.SetActive(true);
        StartCoroutine(ExcuteFadeIn());
        StartCoroutine(LoadProgress());

        Invoke("InvokeFadeInMenu", 1.65f);

        //AndaObjectBasic andaObjectBasic = AndaDataManager.Instance.InstantiateOtherObj("Logo2");
        //andaObjectBasic.SetInto(transform);
    }

    private void InvokeFadeInMenu()
    {
        FadeIn();
    }

    public IEnumerator LoadProgress()
    {
        while(isActive)
        {
            if (progress < 90)
            {
                progress += Time.deltaTime * 10;
                progressText.text = progress.FloatToInt() + "%";
            }
            else if (progress < 98)
            {
                progress += Time.deltaTime;
                progressText.text = progress.FloatToInt() + "%";
            }
            if (progress == 100)
            {
                progressText.text = "100%";
                yield break;
            }
            yield return null;
        }
    }
    private IEnumerator ExcuteFadeIn()
    {
        monsterFadeInEffect.gameObject.SetTargetActiveOnce(true);
        monsterFadeInEffect.OpenP1();
        monsterFadeInEffect.SetValueP1(0);

        float t = 0;
        float p1 = 0;
        float p = 0;
        float p2 = 0;

        float offset = 0.5f;
        float duration = 1f / 2;
        while (t < 1)
        {
            t += Time.deltaTime * duration;
            monsterFadeInEffect.SetValueP1(t);
            if (t >= offset)
            {
                p = (t - offset) / (1 - offset);


                if (p >= 0.5f)
                {
                    p1 = p * 3.14f;
                    p1 = Mathf.Sin(p1);
                    SetAlpha(p1);
                    //  bodyRender.material.SetFloat("_alpha",p1);
                }
                monsterFadeInEffect.OpenP2();
                monsterFadeInEffect.SetValueP2(p);
                SetRongjie(p);
            }

            yield return null;
        }
        monsterFadeInEffect.gameObject.SetTargetActiveOnce(false);


    }


    private void SetAlpha(float v)
    {
        int count = bodyRender.Length;
        v = Mathf.Clamp01(v);
        for (int i = 0; i < count; i++)
        {
            bodyRender[i].material.SetFloat("_alpha", v);
        }
    }

    private void SetRongjie(float v)
    {
        int count = bodyRender.Length;
        v = Mathf.Clamp01(v);
        for (int i = 0; i < count; i++)
        {
            bodyRender[i].material.SetFloat("_rongjie", v);
        }
    }
}