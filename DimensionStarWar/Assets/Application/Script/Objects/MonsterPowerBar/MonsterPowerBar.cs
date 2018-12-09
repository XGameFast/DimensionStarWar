using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterPowerBar : AndaObjectBasic {

    public MathTool_Slider mathTool_Slider;
    public Renderer powerRender;
    public TextMesh textMesh;
    private int maxPower;
    private Transform target;
    private bool autoFollow =false;

    public override void OnDispawn()
    {
        target = null;
        autoFollow=false;
        base.OnDispawn();
    }
    public void BuildPowerBar(Transform _target)
    {
        target = _target;
        autoFollow =true;
    }
    public void BuildPowerBarInUI(Transform _target)
    {
        transform.SetInto(_target);
    }
   
    public void UpdatePower(int targetPower, int _maxPower)
    {
        maxPower = _maxPower;
        mathTool_Slider.StartSlider(targetPower,CallbackUpdatePower);
    }

    public void UpdatePowerSingleValue(int _maxPower)
    {
        maxPower = _maxPower;
        mathTool_Slider.StartSlider(maxPower,CallBackUpdatePowerSingleValue);
    }

    public void CallBackUpdatePowerSingleValue(float _value)
    {
        float per = _value / maxPower;
        powerRender.material.SetFloat("_Value",_value);
        textMesh.text = ((int)_value).ToString();
    }

    public void CallbackUpdatePower(float _value)
    {
        textMesh.text = (int)_value +"/" +maxPower;
        float per = _value / maxPower;
        powerRender.material.SetFloat("_Value",per);
    }

    public void Update()
    {
        if(!autoFollow && target ==null)return;
        transform.position = new Vector3(target.position.x - 0.5f *ARMonsterSceneDataManager.Instance.getARWorldScale ,target.position.y + 1f* ARMonsterSceneDataManager.Instance.getARWorldScale, target.position.z);
    }
}
