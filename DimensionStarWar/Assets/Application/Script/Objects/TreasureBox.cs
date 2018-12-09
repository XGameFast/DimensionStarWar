using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreasureBox : ObjectBasic {

    public GameObject hidObject;


    public override void ControllerToHidenSelf()
    {
        base.ControllerToHidenSelf();
        hidObject.SetActive(false);
    }

    public override void ControllerToDisplay()
    {
        base.ControllerToDisplay();
        hidObject.SetActive(true);
    }

    public override void ControllerPickUpForPlayer()
    {
        base.ControllerPickUpForPlayer();
        AndaDataManager.Instance.DestoryObj(this);
        Debug.Log("向玩家飞去");
    }
}
