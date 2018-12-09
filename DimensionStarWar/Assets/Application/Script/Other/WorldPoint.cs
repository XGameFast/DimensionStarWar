using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldPoint : AndaObjectBasic {

    public Renderer re;
    private Material mat;

     void Start()
    {
        mat = re.material;
        SetCenter();
    }

    public void SetCenter()
    {
        Vector4 v4 = new Vector4(selfPosX, selfPosY, selfPosZ, 0);
        mat.SetVector("_Center", v4);
        StartCoroutine(DisplayTexture());
    }

    private IEnumerator DisplayTexture()
    {
        float v = 0;
        while (0 < 1)
        {
            v += Time.deltaTime *0.5f;
            mat.SetFloat("_Dissvo", v);
            yield return null;
        }
    }
}
