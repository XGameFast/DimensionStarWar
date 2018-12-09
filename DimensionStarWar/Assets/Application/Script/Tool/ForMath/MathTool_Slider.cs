using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MathTool_Slider : MonoBehaviour {

    private bool isExcuteSlider = false;
    private float targetValue;
    private float curValue;
    private float excuteTime;
    private System.Action<float> callbackSlider;

    public void OnEnable()
    {
        curValue = 0;
        targetValue = 0;
        isExcuteSlider = false;
    }
    public void OnDisable()
    {
        
    }
    public void StartSlider(float _targetValue, System.Action<float> _callback)
    {
        if(callbackSlider == null) callbackSlider  =_callback ;
        targetValue = _targetValue;
        excuteTime = 0;
        if(!isExcuteSlider)
        {
            isExcuteSlider = true;
            StartCoroutine(ExcuteSlider());
        }
    }

    private IEnumerator ExcuteSlider()
    {
        while(excuteTime < 1)
        {
            excuteTime += Time.deltaTime;
            curValue = Mathf.Lerp(curValue , targetValue , excuteTime);
            callbackSlider(curValue);
            yield return null;
        }
        isExcuteSlider=false;
    }
}
