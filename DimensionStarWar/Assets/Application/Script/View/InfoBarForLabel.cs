using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBarForLabel : AndaObjectBasic {

    public UILabel contentLabel;

    public void SetValue(string content)
    {
        contentLabel.text = content; 
    }
}
