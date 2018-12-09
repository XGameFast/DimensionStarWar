using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestSkybox : MonoBehaviour {

    public Skybox skybox;
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        float step = skybox.material.GetFloat("_StepSize");

        skybox.material.SetFloat("_CamScroll", 55 * Mathf.Sign(step));
    }
}
