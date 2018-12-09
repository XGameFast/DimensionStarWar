using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FishCtrData : ControllerData {
    public FishMenu getFishMenu {get {return fishMenu ;}}
    private FishController fishController;
    private FishMenu fishMenu;
    #region 执行
    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        fishController = baseController  as FishController;
    }


    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        fishMenu = m_Menu as FishMenu;
    }

    #endregion
}
