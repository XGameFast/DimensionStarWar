using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBarForRecoverTime : AndaObjectBasic {

    public UISlider slider;
    public UILabel sliderValueLabel;
    public UILabel lessTimeLabel;


    private bool isStart;
    private int curentValue;
    private int targetValue;
    private int targetTime;

    private float offsetValue;
    private float offsetTime;
    public override void InitValue()
    {
        base.InitValue();
        slider.value = 0;
        sliderValueLabel.text = "";
        lessTimeLabel.text = "";
        isStart = false;
    }
    public void SetValue(int _curValue,int _tarValue, int _tarTime)
    {
        if (_tarTime.isCurTimeGreat())
        {
            slider.value =1;
            lessTimeLabel.text = "满";
            sliderValueLabel.text = _tarValue.ToString();
            isStart = false;
            return;
        }
        
        curentValue = _curValue;
        targetValue = _tarValue;
        targetTime = _tarTime;
        offsetValue = targetValue - curentValue;
        offsetTime = targetTime - AndaGameExtension.GetCurrentUnixTime();
        
        isStart = true;
    }

    private void CaculTime()
    {
        int lessTime = targetTime - AndaGameExtension.GetCurrentUnixTime() ;

        float timerPer = 1 - ((float)lessTime / offsetTime);

        int tmpCurValue =  curentValue +  (int)(timerPer * offsetValue);

        sliderValueLabel.text = tmpCurValue + "/" + targetValue;

        slider.value = (float)tmpCurValue / targetValue;

        lessTimeLabel.text = lessTime.UnixCovertToTime();

        if (targetTime.isCurTimeGreat())
        {
            slider.value = 0;
            lessTimeLabel.text = "满";
            sliderValueLabel.text = targetValue.ToString();
            isStart = false;
        }
    }
    
    public void OnUpdate()
    {
        if (!isStart) return;
        CaculTime();
    }
}
