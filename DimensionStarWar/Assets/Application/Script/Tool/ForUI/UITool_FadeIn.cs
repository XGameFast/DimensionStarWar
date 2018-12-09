using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class UITool_FadeIn : MonoBehaviour {

    public OTYPE.UIFadeType currentFadeInType;


    private System.Action callback;

    private bool curIsDisplay = false;


    public void PlayFadeIn(bool _isDisplay , System.Action _callback)
    {
        callback = _callback;
        switch(currentFadeInType)
        {
            case OTYPE.UIFadeType.slider:
                Slider(_isDisplay);
                break;
        }
    }


    private void Slider(bool _isDisplay)
    {
        if(curIsDisplay != _isDisplay)
        {
            curIsDisplay = _isDisplay;
            if(curIsDisplay)
            {
                StartCoroutine(ExcutingSliderDisplay());
            }else
            {
                StartCoroutine(ExcutingSlideClose());
            }
        }
    }

    private IEnumerator ExcutingSliderDisplay()
    {
        Slider slider = transform.GetComponent<Slider>();
         while(slider.value<1 && curIsDisplay)
        {
            slider.value += Time.deltaTime;
            yield return null;
        }
        if(curIsDisplay)
            callback();
     
    }
    private IEnumerator ExcutingSlideClose()
    {
        Slider slider = transform.GetComponent<Slider>();
        while(slider.value>0 && !curIsDisplay)
        {
            slider.value -= Time.deltaTime;
            yield return null;
        }
        if (!curIsDisplay)
            callback();
     
    }
}
