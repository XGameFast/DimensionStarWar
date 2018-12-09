using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestSendValueToShader : MonoBehaviour {

    public Renderer rendererigng;

    private Material mat;
    private float value;
    public void Start()
    {
        mat = rendererigng.material;
    }
    public void Update()
    {
        if (mat != null)
        {
            value += Time.deltaTime;
            //mat.SetVector("_Progress", value);

        }
    }
}
