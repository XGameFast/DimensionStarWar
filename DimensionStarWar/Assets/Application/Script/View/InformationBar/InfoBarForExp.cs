using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBarForExp : InfoBarForSlider
{
    public UILabel levelLabel;

    public void SetLevel(int level)
    {
        int l = level + 1;
        levelLabel.text = "Lv" + l;
    }

}
