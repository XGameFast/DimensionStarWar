using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestCameraLookAtEnemy : MonoBehaviour {
    public bool willLookAtEnemy =false;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if(ARMonsterSceneDataManager.Instance.currentEnemy!=null)
        {
            if(willLookAtEnemy)
            {
                transform.LookAt(ARMonsterSceneDataManager.Instance.currentEnemy.center);
            }
        }
 
	}
}
