using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SearchTipsArrow : AndaObjectBasic {

    public GameObject ArrowObj;
    public List<SearchObjectItem> searchItmes;
    private int currentItemIndex;
    public Animator arrowAnimator;
    private System.Action CallBackFoundMonster;
    public override void OnDispawn()
    {

        /*if (searchItmes != null)
        {
            searchItmes.Clear();
            searchItmes = null;
        }*/
        isFoundMonster =false;
        CallBackFoundMonster = null;
        isFound = false;
        base.OnDispawn();
       
    }


    public void SetInfo(List<SearchObjectItem> _searchItems , System.Action callback)
    {
        if(callback!=null)
        {
            CallBackFoundMonster = callback;
        }
        currentItemIndex = 0;
        searchItmes = _searchItems;
       
        arrowAnimator.Play("idle");

    }

    private void Update()
    {
        if(searchItmes != null)
        {
            LookAtSearchItem();
        }
    }
    private bool isFound = false;
   
    private void LookAtSearchItem()
    {

        Vector3 fwd = searchItmes[currentItemIndex].transform.position - ARMonsterSceneDataManager.Instance.mainCamera.transform.position;
        Quaternion quaternion = Quaternion.LookRotation(fwd , Vector3.up);
        ArrowObj.transform.eulerAngles = new Vector3(0, quaternion.eulerAngles.y, 0);

        Vector3 cameraForward =  ARMonsterSceneDataManager.Instance.mainCamera.transform.forward;
        cameraForward.y = 0;
        float angle = Quaternion.Angle(Quaternion.LookRotation(ArrowObj.transform.forward, Vector3.up), Quaternion.LookRotation(cameraForward, Vector3.up));
        Debug.Log("angle" + angle);

       // float distance = Vector3.Distance(ARMonsterSceneDataManager.Instance.mainCamera.transform.position, searchItmes[currentItemIndex].transform.position);



        if(!isFound)
        {
            if (angle < 10)
            {
                isFound = true;
            }else
            {
                arrowAnimator.Play("idle");
            }


        }else
        {
            if(!isFoundMonster)
            {
                FoundMonster();
                arrowAnimator.Play("happy");
                isFoundMonster =true;
            }
           
        }
    }

    private bool isFoundMonster =false;

    private void FoundMonster()
    {
        if(CallBackFoundMonster!=null)
        {
            CallBackFoundMonster();
            CallBackFoundMonster = null;
        }
       
    }

}
