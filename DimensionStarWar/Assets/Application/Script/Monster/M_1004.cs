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
    public void Dazhaohu()
    {
        dazhaohu1.SetTargetActiveOnce(true);
    }

   
    public void Sayhello()
    {
        isfly = false;
        sayhello.gameObject.SetTargetActiveOnce(true);
        time = 0f;
       // sayHelloChild00.gameObject.SetTargetActiveOnce(true);
        sayHelloChild00.gameObject.SetTargetActiveOnce(true);
        sayhello.gameObject.transform.LookAt(ARMonsterSceneDataManager.Instance.GetUsedCamera.transform);
        
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
