using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerSkill_PowerLink : AndaObjectBasic {

    public GameObject dandao;
    public GameObject successObj;
    public GameObject faildObj;
    public GameObject powerObj;//基础
    public SkillTriggerEvent skillTriggerEvent;
    private Transform hitTarget;
    private int catchRate;
    private System.Action<bool> CallBackCatchResult;
    private System.Action CallBackWasHit;
    private bool wasCoutch =false;

    public override void OnDispawn()
    {
        faildObj.transform.localPosition = Vector3.zero;
        successObj.transform.localPosition = Vector3.zero;
        faildObj.transform.localPosition =Vector3.zero;
        dandao.transform.localPosition = Vector3.zero;
        wasCoutch =false; 
        wasShut = false;
        catchRate = 0;
        faildObj.SetInto(transform);
        faildObj.gameObject.SetTargetActiveOnce(false);
        successObj.SetInto(transform);
        successObj.gameObject.SetTargetActiveOnce(false);
        powerObj.SetInto(transform);
        powerObj.gameObject.SetTargetActiveOnce(false);
        dandao.SetInto(transform);
        dandao.gameObject.SetTargetActiveOnce(false);
        base.OnDispawn();
    }

    private bool wasShut =false;

    public void ShotPowerLink( Vector3 targPoint , int  rate , System.Action<bool> _callbackResult,System.Action _callbackWasHt)
    {
        skillTriggerEvent.RegisterTagEvent("Monster" , OnTriggerEnterCallBack);
        CallBackCatchResult = _callbackResult;
        CallBackWasHit = _callbackWasHt;
        dandao.gameObject.SetTargetActiveOnce(true);
        dandao.transform.forward = targPoint - dandao.transform.position;
        catchRate = rate;
        wasShut = true;
        Debug.Log("Runhere??????");
    }



    private void Update()
    {
        if(wasShut)
        {
            dandao.transform.position += dandao.transform.forward.normalized *Time.deltaTime * 15f * ARMonsterSceneDataManager.Instance.getARWorldScale;
        }
    }

    private void OnTriggerEnterCallBack(Transform taget)
    {
        wasShut = false;
        if (CallBackWasHit != null) CallBackWasHit();
        hitTarget = taget;
        AndaGameExtension.ImpactFeedbackStyleLight();

        dandao.gameObject.SetTargetActiveOnce(false);

        Transform pose = taget.GetComponent<MonsterBasic>().powerLinkPoint;
        powerObj.SetInto(pose);
        powerObj.gameObject.SetActive(true);

        successObj.SetInto(pose);
        faildObj.SetInto(pose);
       
        StartCoroutine(ExuteDetermin());
    }

    private IEnumerator ExuteDetermin()
    {
        int  i = 0; 
        while(i < 8 )
        {
            AndaGameExtension.ImpactFeedbackStyleLight();
            yield return new WaitForSeconds(0.25f);
            i += 1;
        }

        //----

        Invoke("DeterminResult" , 1f);
         
    }


    private void DeterminResult()
    {

        int i = Random.Range(0, 100);
        if (i < catchRate)
        {
            Success();
        }
        else
        {
            Faild();
        }
    }


    private void Success()
    {
        JIRVIS.Instance.PlayTips("精神链接建立成功");
        wasCoutch = true;
        Invoke("InvokeOpenEffectForSuccess" , 0.7f);
        BackResult();
    }

    private void Faild()
    {
        JIRVIS.Instance.PlayTips("精神链接建立失败，再试一次八");
        wasCoutch =false;
        Invoke("InvokeOpenEffectForFaild", 0.75f);
        BackResult();
    }

    private void InvokeOpenEffectForSuccess()
    {
        powerObj.gameObject.SetActive(false);
        successObj.gameObject.SetActive(true);
        AndaGameExtension.UIImpactFeedbackStyleHeavy();
    }

    private void InvokeOpenEffectForFaild()
    {
        powerObj.gameObject.SetActive(false);
        faildObj.gameObject.SetActive(true);
        AndaGameExtension.UIImpactFeedbackStyleHeavy();
    }

    private void BackResult()
    {
        if(CallBackCatchResult!=null)
        {
            CallBackCatchResult(wasCoutch);
        }
    }
}
