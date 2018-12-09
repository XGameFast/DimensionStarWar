using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameWorld : MonoBehaviour {

	// Use this for initialization
	void Start () {
        ARMonsterSceneDataManager.Instance.gameWorld = this;
	}
	
	


}
