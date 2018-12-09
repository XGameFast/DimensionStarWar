using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class VirtualARSetMenu : UIBasic2 {

    public System.Action<float> callbackSliderValue;

    public System.Action callbackScanner;

    public Slider slider;

    public Text distanceTips;

    public void SetInfo(System.Action<float> _callbackSliderValue, System.Action _callbackScanner)
    {
        JIRVIS.Instance.PlayTips("请预估一下您想要识别的平面与您设备的垂直距离，拖动滑块进行调整。目前该功能处于Beta版本。",false);
        callbackSliderValue = _callbackSliderValue;
        callbackScanner = _callbackScanner;
        SetSliderValue(1f);
    }

    public void SetSliderValue(float v)
    {
        float t = v * 1.6f;
        t = Mathf.Clamp(t, 0.2f, 1.6f);
        distanceTips.text = t.FloatToFloat() + "m";
        callbackSliderValue(-t);
    }

    public void UpdateSlider( )
    {
        SetSliderValue(slider.value);
    }

    public void ClickScannerBtn()
    {
        JIRVIS.Instance.CloseTips();
        callbackScanner();
        AndaDataManager.Instance.RecieveItem(this);
    }
}
