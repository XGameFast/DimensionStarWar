using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestCameraLookAtEnemy : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if(ARMonsterSceneDataManager.Instance.currentEnemy!=null)
        {
            transform.LookAt(ARMonsterSceneDataManager.Instance.currentEnemy.center);

        }
 
	}
}
