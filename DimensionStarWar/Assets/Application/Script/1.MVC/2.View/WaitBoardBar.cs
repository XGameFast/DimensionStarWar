using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class WaitBoardBar : UIBasic2 {
    public CanvasGroup canvasAlpha;
    public Text tipsContent;
    private bool isFadeIn =false;
    private bool isExcute =false;
    private float fadeInProgress= 0;

    public GameObject dancer;
    public Renderer[] bodyRender;
    public Animator danceAnimation;

    public MonsterFadeInEffect monsterFadeInEffect;
    private int animationType = 0;
    public override void OnDispawn()
    {
        isFadeIn =false;
        isExcute =false;
        fadeInProgress = 0;
        SetAlpha(0);
        SetRongjie(0);
        base.OnDispawn();
         
    }

    public void SetTips(string tips , int _animationType = 0)
    {
        animationType= _animationType;
        tipsContent.text = tips;
        OpenWaitBoard();
    }

    public void OpenWaitBoard()
    {
        isFadeIn = true;

        if (!isExcute)
        {
            danceAnimation.Play("dance");
            StartCoroutine(ExcuteFadeInWaitBoard());
            isExcute = true;
        }

       
    }

    public void CloseWatiBoard()
    {
        isFadeIn = false;
        if (!isExcute) 
        {
            dancer.gameObject.SetTargetActiveOnce(false);
            monsterFadeInEffect.gameObject.SetTargetActiveOnce(false);
            StopCoroutine("ExcuteFadeIn");
            StartCoroutine(ExcuteFadeInWaitBoard());
            isExcute = true;
        }
       

    }

    private IEnumerator ExcuteFadeInWaitBoard()
    {
        fadeInProgress = 0;

        while(fadeInProgress < 1)
        {

            if(isFadeIn)
            {
                fadeInProgress += Time.deltaTime * 0.5f;
                canvasAlpha.alpha = fadeInProgress;
            }else
            {
                fadeInProgress += Time.deltaTime * 2f;
                canvasAlpha.alpha = 1 - fadeInProgress;
            }
            yield return null;
        }
        if(isFadeIn)
        {
            dancer.gameObject.SetTargetActiveOnce(true);
            monsterFadeInEffect.gameObject.SetTargetActiveOnce(true);
            StartCoroutine("ExcuteFadeIn");
        }else
        {
            AndaDataManager.Instance.RecieveItem(AndaUIManager.Instance._waitBoard);
            AndaUIManager.Instance._waitBoard =null;
        }
        isExcute =false;
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
