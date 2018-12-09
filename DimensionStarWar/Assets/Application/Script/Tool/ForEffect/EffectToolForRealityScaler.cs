using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EffectToolForRealityScaler : MonoBehaviour {

	// Use this for initialization
	void Start () {

        transform.GetComponent<TrailRenderer>().startWidth *= ARMonsterSceneDataManager.Instance.getARWorldScale;
        transform.GetComponent<TrailRenderer>().endWidth *= ARMonsterSceneDataManager.Instance.getARWorldScale;

    }
	

}
