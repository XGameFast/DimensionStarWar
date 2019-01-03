using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SMManager : MonoBehaviour {

    public float standardTime = 30f;
    public int Status = 0; //0初始化 1开始 2停止
    public void Awake()
    {
        AndaMessageManager.Instance.sMManager = this;
    }
    // Use this for initialization
    void Start () {
        Status = 0;
    }
	
	// Update is called once per frame
	void Update () {
        if (Status == 0)
        {
            Status = 1;
            StartCoroutine("TimeChange");
        }
	}
    IEnumerator TimeChange()
    {
        while (Status==1)
        {
            AndaMessageManager.Instance.GetServerMessage();
            yield return new WaitForSeconds(standardTime);
        }
    }
    public void Stop()
    {
        if (Status == 1)
        {
            Status = 2;
            StopCoroutine("TimeChange");
        }
    }
    public void Begin()
    {
        if (Status == 2)
            StopCoroutine("TimeChange");
        Status = 0;
    }
}
