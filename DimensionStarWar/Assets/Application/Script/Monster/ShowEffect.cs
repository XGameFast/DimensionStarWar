using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShowEffect : MonoBehaviour {

    public void OnEnable()
    {
        if (ARMonsterSceneDataManager.Instance.IsUICamera())
        {
            Debug.Log(ONAME.LayerUI);
            gameObject.SetLayer(ONAME.LayerUI);
        }
        else
        {
            Debug.Log(ONAME.LayerDeafualt);
            gameObject.SetLayer(ONAME.LayerDeafualt);
        }
    }
}
