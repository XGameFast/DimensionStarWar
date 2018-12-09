using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Test : MonoBehaviour {

    public Renderer re;
	// Use this for initialization
	void Start () {
		
	}

    public float t = 0;
	// Update is called once per frame
	void Update () {

        if (t < 1)
        {
            t += 0.1f;
            re.material.SetFloat("_Amount", t);
        }
	}
}
