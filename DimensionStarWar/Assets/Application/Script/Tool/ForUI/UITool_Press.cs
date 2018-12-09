using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UITool_Press :MonoBehaviour {

    public GameObject targetBtn;
    private System.Action CallBackPress;
    private bool onPress=false;


    public void SetPress(bool state)
    {
        onPress=state;
    }

    public void BuildPressEvent(System.Action callback)
    {
        onPress=false;
        CallBackPress = callback;
        EventTriggerListener.Get(gameObject).onDown += OnClickDown;
        EventTriggerListener.Get(gameObject).onUp += OnClickUp;
    }

    public void OnDisable()
    {
        Unregiser();
    }

    public void Unregiser()
    {
        EventTriggerListener.Get(gameObject).onDown -= OnClickDown;
        EventTriggerListener.Get(gameObject).onUp -= OnClickUp;
    }
    //

    private void OnClickDown(GameObject btn)
    {
        onPress =true;   
        Debug.Log("OnclickPress");
    }

    private void OnClickUp(GameObject btn)
    {
        onPress =false;
    }

    private void Update()
    {
        if(!onPress)return;
        CallBackPress();
    }
}
