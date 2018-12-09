using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Magical : AndaObjectBasic {

    private System.Action callback;
    public void SetInfo(System.Action _callback)
    {
        callback = _callback;
    }

    public void DestoryYou()
    {
        callback();

        Debug.Log("hit");
       // Destroy(gameObject);
    }
}
