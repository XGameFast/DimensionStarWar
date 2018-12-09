using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ARScannerData  {
    
    public ARScannerMenu getARScannerMenu
    {
        get 
        {
            return aRScannerMenu;
        }
    }

    public AndaObjectBasic getScannerItem
    {
        get {return scannerItem ;}
    }
    private AndaObjectBasic scannerItem;
    private AndaARWorldController andaARWorldController;
    private ARScannerMenu aRScannerMenu;
   


    public void BuildData(AndaARWorldController _andaARWorldController)
    {
        andaARWorldController = _andaARWorldController;
    }

    public void BuildMenu()
    {
        if(aRScannerMenu == null)
        {
            aRScannerMenu = AndaUIManager.Instance.PopingMenu2<ARScannerMenu> (ONAME.ARScannerMenu);
        }
        andaARWorldController.aRScannerMenu = aRScannerMenu;
        aRScannerMenu.SetController(andaARWorldController);
    } 

    public void BuildScannerItem(int id)
    {
        if(scannerItem!=null)AndaDataManager.Instance.RecieveItem(scannerItem);
        scannerItem = AndaDataManager.Instance.InstantantiateItem(id);
        //scannerItem.SkinHologarm();
        //scannerItem.gameObject.SetLayer(ONAME.LayerHoloUI);
        aRScannerMenu.SetItemtoScreenPoint(scannerItem);
    }

    public void SetItemToScreenMedalPoint(Transform _item)
    {
        _item.SetInto(aRScannerMenu.MedalPoint.transform);
    }

    public void RecieveItem()
    {
        if(scannerItem!=null)
        {
            AndaDataManager.Instance.RecieveItem(scannerItem);
            scannerItem = null;
        }
    }

    public void InvokeRecieveItem()
    {
        RecieveItem();
    }

    public void UpdatePoseItem(Vector3 hitPoint,Quaternion hitRotation)
    {
        if(scannerItem!=null)
        {
           //scannerItem.UpdateItemScreentoRealworldPoint(hitPoint,hitRotation);
        }
    }

}
