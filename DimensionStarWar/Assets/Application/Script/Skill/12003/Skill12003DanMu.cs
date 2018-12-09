using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12003DanMu : MonoBehaviour {

    public int bz;
	// Use this for initialization
	void Start () {
       
        while (bz == 0)
        {
            bz = Random.Range(0, 2);
        }
        transform.Rotate(new Vector3(0, 0, Random.Range(0,360)));
    }
	
	// Update is called once per frame
	void Update () {
      
    }
}
