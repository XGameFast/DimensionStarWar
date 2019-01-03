using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProtectGameCtrData : ControllerData {

    public ProtectGameCtr_Basic getProtectGameCtr_Basic {get {return protectGameCtr_Basic; } }
    private ProtectGameController protectGameController;
    private ProtectGameCtr_Basic protectGameCtr_Basic;
    public bool isWin =false;
    public override void BuildData(BaseController _baseController)
    {
        Clear();
        base.BuildData(_baseController);
        protectGameController = _baseController as ProtectGameController;
    }

    public void BuildMode_2001()
    {
        RemoveGameCtr();
        protectGameCtr_Basic = AndaDataManager.Instance.InstantiateOtherObj<ProtectGameCtr_Basic>(ONAME.PROTECTGAMECTR_2001);
       ((ProtectGameCtr_2001)protectGameCtr_Basic).SetInto(protectGameController.transform);
        protectGameCtr_Basic.parentCtr = protectGameController;

    }

    private void RemoveGameCtr()
    {
       
        if (protectGameCtr_Basic != null)
        {
            AndaDataManager.Instance.RecieveItem(protectGameCtr_Basic);
            protectGameCtr_Basic = null;
        }

    }

    public void Clear()
    {
        isWin = false;
        RemoveGameCtr();
    }

}
