using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class OpenMall : MonoBehaviour , IPointerClickHandler
{
    public MallController mallController;
    public void OnPointerClick(PointerEventData eventData)
    {
        mallController.StartController();
    }
    // Use this for initialization
    void Start () {
     
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
