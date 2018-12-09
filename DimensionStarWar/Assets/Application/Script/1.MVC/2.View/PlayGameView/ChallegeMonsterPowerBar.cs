using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class ChallegeMonsterPowerBar : UIBasic2 {

	
    public Slider fill;

    public Text text;

    public MathTool_Slider mathTool_Slider;

    private int maxPower;
    private int curPower;

    public void UpdatePowerSingleValue(int _cur, int max)
    {
        curPower = _cur;
        maxPower = max;
        mathTool_Slider.StartSlider(curPower, CallBackUpdatePowerSingleValue);
    }

    public void CallBackUpdatePowerSingleValue(float _value)
    {

        float per = _value / maxPower;
        fill.value = per;//.SetFloat("_Value", _value);
        text.text = ((int)_value).ToString();
    }

}

