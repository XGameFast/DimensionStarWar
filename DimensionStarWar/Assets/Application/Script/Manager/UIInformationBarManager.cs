using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIInformationBarManager  {
    private static UIInformationBarManager _instance;
    public static UIInformationBarManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new UIInformationBarManager();
            }
            return _instance;
        }
    }
    
    public void BuildCirclePatternInfomation(List<DisplayInformationData> list)
    {
        
    }


    private void BuildInfomationBarForSlider(OTYPE.InfoShapesType infoShapesType , DisplayInformationData displayInformationData)
    {
       
    }
}
public class DisplayInformationData
{
    public int value { get; set; }
    public int maxValue { get; set; }
    public int shapesType { get; set; }
}

