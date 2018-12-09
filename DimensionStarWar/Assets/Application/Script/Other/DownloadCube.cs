using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DownloadCube : AndaObjectBasic {

    public Rigidbody rigi;
    public TextMesh textmesh;
    public override void OnSpawn()
    {
        base.OnSpawn();
       // rigi.Sleep();
       // textmesh.text = "";
    }
    public void Init(string value)
    {
        //rigi.WakeUp();
        textmesh.text = value + "%";
    }


}
