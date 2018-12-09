using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HandBookMenu : UIBasic {
    [HideInInspector]
    public HandbookController handbookController;
    public GameObject closeStarBtn;
    public override void SetController(BaseController baseController)
    {
        base.SetController(baseController);
        handbookController = baseController as HandbookController;
    }

    public void DisCloseStarBtn(bool isOpen)
    {
        closeStarBtn.SetTargetActiveOnce(isOpen);
    }

    public void ClickCloseStar()
    {
        if (handbookController != null)
        {
            handbookController.ClickHideStar();
            DisCloseStarBtn(false);
        }
    }
}
