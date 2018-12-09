using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class PlayerScreenInfoBar : AndaObjectBasic {

    public Text playerName;
    public Text playerLevel;
    public Text playerTalk;
    public MathTool_Slider mathTool_Slider;
    public CanvasGroup canvasGroup;
    public Slider slider;
    public Animator animator;
    private bool isFadeIn =false;
    public void SetInfo(string _playerName,int _playerLevel, string _playerTalk)
    {
        playerName.text = _playerName;
        playerTalk.text = _playerTalk;
        playerLevel.text = "等级" + _playerLevel;
    }

    public 
    void OpenBar(bool isOpen)
    {
        if(isOpen)
        {
            if(isFadeIn)return;
            isFadeIn = true;
            animator.SetBool("FadeIn",isFadeIn);
            //mathTool_Slider.StartSlider(1,UpdateValue);
        }else
        {
            if(!isFadeIn)return;
            isFadeIn = false;
            animator.SetBool("FadeIn",isFadeIn);
            //mathTool_Slider.StartSlider(0,UpdateValue);
        }
    }

    private void UpdateValue(float _value)
    {
        slider.value = _value;
        canvasGroup.alpha =_value;
    }
}
