using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBar_Slider_Label_Icon : InfoBar_Slider_Label {

    public UI2DSprite icon;
    public void SetIcon(int id)
    {
        icon.sprite2D = AndaDataManager.Instance.GetSprite(id);
    }
}
