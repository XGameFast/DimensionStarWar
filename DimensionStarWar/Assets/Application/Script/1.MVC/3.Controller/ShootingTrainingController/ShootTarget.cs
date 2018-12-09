using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class ShootTarget : AndaObjectBasic {
    //设计房中的数据
    public ShootingTrainingData data;
    //靶子离人的距离
    public float dis;

    public Transform player;

    public GameObject target;

    public float moveTime;

    public bool isStart;

    public override void  InitValue()
    {
        base.InitValue();
        player = data.getMineMonster.transform;
        if (player == null)
            return;
        transform.position += player.transform.position + new Vector3(5, 0, 0);
        isStart = true;
        gameObject.SetActive(true);
        transform.LookAt(new Vector3(player.position.x, transform.position.y, player.position.z));
        GetComponent<BoxCollider>().enabled = true;
    }
    // Update is called once per frame
    void Update() {
        if (!isStart)
            return;
        if (!data.getIsStartGame)
            return;
        moveTime += Time.deltaTime;
        transform.LookAt(new Vector3(player.position.x, transform.position.y,player.position.z));
        if (data.getIsStartGame)
        {
            //transform.localPosition+= new Vector3(Time.deltaTime, 0, 0);
            //transform.position = new Vector3(transform.position.x , transform.position.y, Mathf.Sin(moveTime) * 2 );
            transform.RotateAround(player.transform.position,new Vector3 (0,1,0), Time.deltaTime*6);
        }
	}
   
    public void OnTriggerEnter(Collider collision)
    {
        if (data.shootTime <= 0)
            return;
        data.shootTime -= 1;
        var DS = 0;
        var d = Vector3.Distance(collision.transform.position, transform.position);
        if (d < 1f)
            DS = 20;
        else if (d < 2f)
        {
            DS = 5;
        }
        else 
        {
            DS = 1;
        }
        string skillname = "";
        var FAtransform = collision.transform.parent;
        while (FAtransform != null)
        {
            skillname = FAtransform.name;
            FAtransform = FAtransform.transform.parent;
        }

        data.SaveScore(Convert.ToInt32(skillname), DS);
        GetComponent<BoxCollider>().enabled = false;
        target.SetActive(false);
        Debug.Log(data.score);
        Debug.Log(skillname);
        Invoke("Show", 2f);
    }
    public void Show()
    {
        transform.RotateAround(player.transform.position, new Vector3(0, 1, 0), UnityEngine.Random.Range(0,360));
        GetComponent<BoxCollider>().enabled = true;
        target.SetActive(true);
    }
    
}
