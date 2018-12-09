using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBarForSlider : AndaObjectBasic {

    public UILabel infoLabel;
    public UISlider slider;
    public UISlider smoothSlider;

    #region Lerp

    private float startValue;
    private float endValue;
    private float lerpTimer;
    private float speed;
    private bool isStart;
    private float laterExcuteTime;//延时时间
    private int valueMax;
    private float laterExcuteTimeLimit;


    private bool isStartFromTo =false;
    private int startV;
    private int endV;

    #endregion
    
    public override void InitValue()
    {
        base.InitValue();
        isStart = false;
        slider.value = 0;
        smoothSlider.value = 0;
    }

    public void KeepValue(int data)
    {
        slider.value = data;
        smoothSlider.value = data;
    }

    public void SetInformation( float _laterExcuteTimeLimit, float _lerpSpeed)
    {
        laterExcuteTimeLimit = _laterExcuteTimeLimit;
        speed = _lerpSpeed;
    }

    public void UpdateValueFromTo(int fromValue, int _endValue)
    {
        startV = fromValue;
        endV = _endValue;
        valueMax = startV > endV ? startV : endV;

        lerpTimer = 0;
        laterExcuteTime = Time.time;

        isStartFromTo = true;
    }

    public void UpdateValue(int updateValue, int maxValue)
    {
        float per = (float)updateValue / maxValue;
        //Debug.Log("per" + per);
        slider.value = per;
        if (slider.value != smoothSlider.value)
        {
            valueMax= maxValue;
            smoothSlider.gameObject.SetActive(true);
            laterExcuteTime= Time.time;
            lerpTimer = 0;
            startValue= smoothSlider.value;
            endValue = slider.value;
            isStart = true;
        }
        else
        {
            infoLabel.text = updateValue + "/" + maxValue;
        }
    }

    private void ExcuteSlider()
    {
        if (Time.time - laterExcuteTime > laterExcuteTimeLimit)
        {
            if (smoothSlider.value != endValue)
            {
                lerpTimer+= Time.deltaTime;
                var dust = lerpTimer / speed;
               smoothSlider.value = Mathf.Lerp(startValue, endValue, dust);
                infoLabel.text = ((int)Mathf.Lerp(startValue * valueMax, endValue* valueMax, dust)) + "/" +valueMax;
                return;
            }
            smoothSlider.gameObject.SetActive(false);
            isStart = false;
        }
    }

    private void ExcuteSlideFromTo()
    {
        if (Time.time - laterExcuteTime > laterExcuteTimeLimit)
        {
            if (slider.value < 1)
            {
                lerpTimer += Time.deltaTime;
                var dust = lerpTimer / speed;
                float tmp = Mathf.Lerp(startV , endV, dust);
                float per = tmp / valueMax;
                slider.value = tmp / valueMax;
                infoLabel.text = ((int)tmp).ToString();
            }
            else
            {
                isStartFromTo = false;
            }
        }
    }

    public void OnUpdate()
    {
        if (isStart)
        {
            ExcuteSlider();
        }

        if (isStartFromTo)
        {
            ExcuteSlideFromTo();
        }
    }
}
