using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FishMenu : UIBasic2 {

    private FishController fishController;
    public GameObject scanBar;
    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
        fishController = _baseController as FishController;
        GetComponent<RectTransform>().sizeDelta = new Vector2(0,0);
    }


    public void OpenScanBar(bool isOpen)
    {
        scanBar.SetTargetActiveOnce(isOpen);
    }
}
