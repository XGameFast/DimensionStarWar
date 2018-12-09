using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CallShaderSetPosition : AndaObjectBasic {

    public Renderer re;

    private Material mat;
	void Start () {
     //   mat = re.material;

    }
    private void OnEnable()
    {
       // Invoke("SetPose", 0.1f);
    }

    private void SetPose()
    {
       // Vector4 v4 = new Vector4(selfPosX, selfPosY, selfPosZ, 0);
       // mat.SetVector("_Center", v4);
    }
}
