using System.Collections;
using System.Collections.Generic;
using UnityEngine;
/// <summary>
/// 信息面板，带有 slide 和 label
/// </summary>
public class InfoBar_Slider_Label : AndaObjectBasic {

    //提示内容
    public UILabel tipsLabel;
    //这个显示Slide的值
    public UILabel slideValue_Label;
    //显示平滑过度的Slide
    public UISlider mainSlider;

    //数值增加的时候 会调用这个，Depth 低于 smoothSlider 的 depth
    public UISlider smoothSlideBackgound;
    //数据减少的时候会调用这个，Depth 高于 smoothSlider 的 depth
    public UISlider smoothSlideUp;
    
    //localdata
    private float currentSlideValue;
    private float targetSlideValue;
    private float smoothAddSpeed;
    private float smoothTimer;
    private bool isExcuteSmooth = false;
    private float maxValue;
    public override void InitValue()
    {
        base.InitValue();
        slideValue_Label.text = "";
        //slideValue_Label.gameObject.SetActive(false);
        mainSlider.value = 0;
       // mainSlider.gameObject.SetActive(false);
        smoothSlideBackgound.value = 0;
        smoothSlideBackgound.gameObject.SetActive(false);

        smoothSlideUp.value = 0;
        smoothSlideUp.gameObject.SetActive(false);

        currentSlideValue = -1;
        targetSlideValue = 0;
        smoothAddSpeed = 0;
        smoothTimer = 0;
    }

    /// <summary>
    /// 更新数据
    /// </summary>
    /// <param name="_targetValue">目标值</param>
    /// <param name="_maxValue">最大值</param>
    /// <param name="_tipsContent">提示内容</param>
    /// <param name="needDipalyMaValue">需要显示最大值吗</param>
    /// <param name="_smoothEnable">需要平滑过度吗</param>
    /// <param name="speed">平滑过度速度</param>
    public void UpdateValue(int _targetValue ,int _maxValue , string _tipsContent , bool needDipalyMaValue = true, bool _smoothEnable = true , float speed = 1)
    {
        maxValue = _maxValue;
        tipsLabel.text = _tipsContent;
        float percent = (float)_targetValue / _maxValue;
        if (currentSlideValue == percent) return;
        //不需要平滑过度，直接赋值
        if (!_smoothEnable)
        {
            string content = needDipalyMaValue? _targetValue + "/" + _maxValue : _targetValue.ToString();
            slideValue_Label.text = content;
            mainSlider.value = percent;
        }
        else//需要平滑过度
        {
            smoothAddSpeed = speed;
            currentSlideValue = mainSlider.value;
            targetSlideValue = percent;
            
            //判断是递增还是递减。smoothSlideBackgound smoothSlideUp的区别在于Depth(为了不遮挡)
            if (currentSlideValue < targetSlideValue)
            {
                //递增
                smoothSlideBackgound.gameObject.SetTargetActiveOnce(true);
                smoothSlideBackgound.value = percent;
            }
            else
            {
                //递减
                smoothSlideUp.gameObject.SetTargetActiveOnce(true);
                smoothSlideUp.value = percent;
            }

            smoothTimer = 0;
            if (!isExcuteSmooth)
            {
                StartCoroutine(ExcuteUpdateValue());
            }
        }
    }
    //执行平滑过度
    
    //执行平滑过度
    private IEnumerator ExcuteUpdateValue()
    {
        isExcuteSmooth = true;
        while (mainSlider.value != targetSlideValue)
        {
            smoothTimer += Time.deltaTime * smoothAddSpeed;
            mainSlider.value = Mathf.Lerp(currentSlideValue, targetSlideValue, smoothTimer);
            string content = (int)(mainSlider.value* maxValue) + "/" + maxValue;
            slideValue_Label.text = content;
            yield return null;
        }
        isExcuteSmooth = false;
        smoothSlideBackgound.gameObject.SetTargetActiveOnce(false);
        smoothSlideUp.gameObject.SetTargetActiveOnce(false);
    }
}
