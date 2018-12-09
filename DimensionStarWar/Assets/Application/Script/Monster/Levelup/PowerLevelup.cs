using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerLevelup : AndaObjectBasic {

    public TextMesh valueText;
    public GameObject levelupEffect;
    public MathTool_Slider mathTool_Slider;
    private int max;
    private int cur;
    public override void OnDispawn()
    {
        valueText.gameObject.SetTargetActiveOnce(false);
        valueText.text ="";

        max =0 ;
        base.OnDispawn();

    }

    public void SetInfo(int _cur ,int _max)
    {
        max = _max;
        cur = _cur;
        Invoke("UpdatePower" , 1.25f);
      
    }
    private void UpdatePower()
    {
        valueText.transform.LookAt(-ARMonsterSceneDataManager.Instance.mainCamera.transform.position);
        valueText.gameObject.SetTargetActiveOnce(true);
        valueText.text = cur +  "/" + max;
        mathTool_Slider.StartSlider((float)max,CallBackupdateSlider);
    }

    private void CallBackupdateSlider(float _value)
    {
        valueText.text = (int)_value+ "/" + max;
    }

}
