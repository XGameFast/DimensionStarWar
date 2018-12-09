using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConsuableItem : AndaObjectBasic {

    public UI2DSprite icon;
    public UILabel countLabel;
    public void SetValue(LD_Objs odb)
    {
        icon.sprite2D = AndaDataManager.Instance.GetConsumableSprite(odb.objID.ToString());
        countLabel.text = "x" + odb.lessCount.ToString();
    }

    public void UpdateValue(int cotent)
    {
        countLabel.text = "x" + cotent.ToString();
    }
}
