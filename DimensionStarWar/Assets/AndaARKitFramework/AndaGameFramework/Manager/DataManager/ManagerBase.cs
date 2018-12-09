using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ManagerBase : MonoBehaviour {

    private void Awake()
    {
        OnAwake();
    }

    protected virtual void OnAwake()
    {

    }
    protected virtual void InitValue()
    {

    }
}
