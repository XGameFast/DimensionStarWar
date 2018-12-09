using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class PowerBlockItem : AndaObjectBasic {

    public Image icon;

    public Text lessCount;

    public Text giveValue;

    public void SetInfo(int _id,int _count,int _value)
    {
        icon.sprite = AndaDataManager.Instance.GetConsumableSprite (_id.ToString());
        lessCount.text = "x" +_count.ToString();
        giveValue.text = "+" + _value.ToString();
    }

    public void UpdateLessCount(int count)
    {
        lessCount.text = "x" +count.ToString();
    }
}
