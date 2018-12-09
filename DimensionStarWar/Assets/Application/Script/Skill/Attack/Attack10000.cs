using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Attack10000 : AndaObjectBasic {

    public Renderer re1;
    public Renderer re2;

    public Renderer re3;
    public Renderer re4;

    public Renderer re5;

   

    public override void OnSpawn()
    {
        base.OnSpawn();
        StartCoroutine(Play());
    }

    private IEnumerator Play()
    {
        float i = 0 ;
        float z = 0;
        while(z < 1 )
        {

            transform.forward = -(ARMonsterSceneDataManager.Instance.mainCamera.transform.position - transform.position);

            i+=Time.deltaTime*0.8f; 
            re1.material.SetFloat("_Value",i*1.8f);
            if(i>=0.2f)
            { 
                z+=Time.deltaTime * 0.8f;
                re2.material.SetFloat("_Value",z);

                re3.material.SetFloat("_Value",z);
                re4.material.SetFloat("_Value",z);
            }
            float t = Mathf.Clamp01(i);
            re5.material.SetFloat("_Value",t);
            yield return null;
        }

       // StartCoroutine(Play());

        AndaDataManager.Instance.RecieveItem(this);
    }

}
