using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12003Danmulizi : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    private void OnParticleTrigger()
    {
        Debug.Log(123);
    }
    private void OnParticleCollision(GameObject other)
    {
        Debug.Log(112234);
    }
}
