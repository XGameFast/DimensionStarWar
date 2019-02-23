using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1004 : MonsterBasic {
    public GameObject lefteye;
    public GameObject dazhaohu1;
    public GameObject sayhello;
    public GameObject sayHelloChild01;
    public GameObject sayHelloChild00;

    public float time = 0f;
    public bool isfly = false;


    public Renderer bodyRenderer;
    public float excuteFadeInTimer;


    public override void SetState01()
    {
        base.SetState01();
        bodyRenderer.material.SetFloat("_Dissolve" , 0);
        StartCoroutine(ExcuteSetState01());
    }

    private IEnumerator ExcuteSetState01()
    {
        float t = 0;
        while(t < excuteFadeInTimer)
        {
            t += Time.deltaTime;
            float per = t / excuteFadeInTimer;
            bodyRenderer.material.SetFloat("_Dissolve", per);
            yield return null;
        }

        bodyRenderer.material.SetFloat("_Dissolve", 1.1f);
    }




    public void Dazhaohu()
    {
        dazhaohu1.SetTargetActiveOnce(true);
        SynchroLayer(dazhaohu1);
    }

   
    public void Sayhello()
    {
        isfly = false;
        sayhello.gameObject.SetTargetActiveOnce(true);

        time = 0f;
       // sayHelloChild00.gameObject.SetTargetActiveOnce(true);
        sayHelloChild00.gameObject.SetTargetActiveOnce(true);
        SynchroLayer(sayHelloChild00);
        sayhello.gameObject.transform.LookAt(ARMonsterSceneDataManager.Instance.GetUsedCamera.transform);
        SynchroLayer(sayhello);
        // sayhello.transform.GetChild(1).gameObject.SetTargetActiveOnce(false);
        // sayhello.transform.GetChild(0).gameObject.SetTargetActiveOnce(true);
    }
    public override void OnUpdate()
    {
        base.OnUpdate();
        time -= Time.deltaTime*2;
        if (!isfly&&time <= 0)
        {
            sayhello.transform.position = leftHand.transform.position;
        }
        else if(time >0){
            sayhello.transform.position = Vector3.Lerp(sayhello.transform.position, ARMonsterSceneDataManager.Instance.GetUsedCamera.transform.position,Time.deltaTime);
        }

    }
    public void StartFly()
    {
        isfly = true;
        time = 1f;
    }
    public void Shot()
    {
        time = 0;
        sayHelloChild00.gameObject.SetTargetActiveOnce(false);
        sayHelloChild01.gameObject.SetTargetActiveOnce(true);
        sayHelloChild01.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.screenEffectPoint.transform);
        SynchroLayer(sayHelloChild01);
        Invoke("EndOfMonsterMoodAnimation", 2f);
    }

    private void TriggerHit()
    {
       
        // sayhello.transform.GetChild(1).gameObject.SetTargetActiveOnce(true);
    }

    public override void EndOfMonsterMoodAnimation()
    {
        isfly = false;
        dazhaohu1.SetTargetActiveOnce(false);
        CloseDazhaohu01();
        base.EndOfMonsterMoodAnimation();
    }
    //特效结束
    public override void OnDispawn()
    {
        EndOfMonsterMoodAnimation();
        base.OnDispawn();
    }

    private void CloseDazhaohu01()
    {
        sayHelloChild01.SetInto(sayhello.transform);
        sayHelloChild01.SetTargetActiveOnce(false);
        sayHelloChild00.SetTargetActiveOnce(false);
        sayhello.SetTargetActiveOnce(false);
    }

    private float t0;
    private float t1;
    public void TestPlaySkillStep01()
    {
        t0 = Time.time;
    }

    public void TestPlaySkillStep02()
    {
        t1 = Time.time;
        float t3 = t1 - t0 ;
        Debug.Log("t3" + t3);
    }

}
