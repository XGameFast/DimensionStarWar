using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class HologarmCameraMonsterInfoItem : AndaObjectBasic {

    public MathTool_Slider bloodSlider;
    public MathTool_Slider energySlider;
    public MathTool_Slider StengthSlider;

    private Text bloodText = null;
    private Text energyText = null;

    private MonsterBasic monsterBasic;

    public void SetObjectsData(AndaObjectBasic andaObjectBasic)
    {
        monsterBasic = andaObjectBasic as MonsterBasic;
        monsterBasic.MonsterHaeBeenHit += UpdateBlood;
        monsterBasic.MonsetCosumeEnergy += UpdateEnergy;
       
        UpdateBlood(1,1);
        UpdateEnergy(1,1);
    }

    public void UpdateBlood(int targetValue , int maxValue)
    {
        float t = (float)targetValue / maxValue;
        if(bloodText == null)bloodText = bloodSlider.GetComponent<Text>();
        bloodText.text ="HP " + targetValue+"/"+maxValue;

        //bloodSlider.StartSlider(targetValue,CallBackUpdateBlood);
        //Debug.Log("UpdateBlood");
    }

    public void UpdateEnergy(int targetValue , int maxValue)
    {
       // float t = (float)targetValue / maxValue;
        //energySlider.StartSlider(targetValue ,CallbackUpdateEnergy);
        if(energyText ==  null )energyText = energySlider.GetComponent<Text>();
        energyText.text ="EP "+ targetValue+ "/" + maxValue ;
    }

    private void CallBackUpdateBlood(float value)
    {
        int max = monsterBasic.monsterDataValue.monsterMaxPower;
        int cur = (int)(value*max);
        if(bloodText == null)bloodText = bloodSlider.GetComponent<Text>();
        bloodText.text = "Hp" +cur;
    }

    private void CallbackUpdateEnergy(float value)
    {
        int max = monsterBasic.monsterDataValue.monsterBaseEnergy;
        int cur = (int)(value*max);
        if(energyText ==  null )energyText = energySlider.GetComponent<Text>();
        energyText.text = "Ep" + cur;
    }

    public void UpdatePosition(Vector3 position)
    {
        
    }

}
