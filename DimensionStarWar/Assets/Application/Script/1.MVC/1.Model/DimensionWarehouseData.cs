using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DimensionWarehouseData : ControllerData {
    public DimensionWarehouseMenu getDimensionwarehouse
    {
        get {return dimensionWarehouseMenu ;}
    }

    private DimensionWarehouseController dimensionWarehouseController;
    private DimensionWarehouseMenu dimensionWarehouseMenu;
   
    public void ClearData()
    {
        RemoveMenu();
    }

    public override void RemoveMenu()
    {
        base.RemoveMenu();
        dimensionWarehouseMenu = null;
    }

    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        dimensionWarehouseController = _baseController as DimensionWarehouseController;
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        dimensionWarehouseMenu = getm_Menu as DimensionWarehouseMenu;
    }


}

public class DimensionWarehouseItemData
{
    public int id {get;set;}

    public bool isIsGet{get;set;}

    public int count {get;set;}
}
