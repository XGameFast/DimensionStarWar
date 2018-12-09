using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBar_Label : AndaObjectBasic {
    public UILabel contentLabel;
    public override void InitValue()
    {
        base.InitValue();
    }

    public void SetValue(string content)
    {
        contentLabel.text = content;
    }
}
