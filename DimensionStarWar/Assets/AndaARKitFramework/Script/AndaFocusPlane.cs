using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaFocusPlane : AndaObjectBasic {

    public Renderer re;
    public TextMesh textMesh;
    public TextMesh distanceMesh;
    private Material mat;
    

    public void SetValue(float value)
    {
        if (mat == null)
        {
            mat = re.material;
        }
        float angle = value * 360;

        textMesh.text = (int)(((1 - value) * 100)) + "%";

       // Debug.Log("angle:" + angle);

        mat.SetFloat("_Angle", angle);

      //  textMesh.transform.parent.LookAt(-ARMonsterSceneDataManager.Instance.GetCameraPositionWihtSelfY(textMesh.transform.position.y));
    }

    public void UpdateDistanceMesh(float t)
    {
        string v = t.ToString("0.0");
        distanceMesh.text  = v + "m";
    }
}
