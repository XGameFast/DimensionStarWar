using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBar_Icon : AndaObjectBasic {

    public UI2DSprite icon;
    public void SetValue(string id)
    {
        if (id == null)
        {
            icon.gameObject.SetTargetActiveOnce(false);
        }
        else
        {
            icon.gameObject.SetTargetActiveOnce(true);
            icon.sprite2D = AndaDataManager.Instance.GetStateSprite(id);
        }

    }
}
