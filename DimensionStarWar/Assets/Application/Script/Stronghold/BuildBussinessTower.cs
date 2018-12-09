using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BuildBussinessTower : TowerBase {

    public Transform bussinessStrongholdPoint;

    public Renderer[] towerRenderers;

    private BussinessTowerItem bussinessTowerItem ;

    public override void OnDispawn()
    {
        if(bussinessTowerItem!=null)
        {
            AndaDataManager.Instance.RecieveItem(bussinessTowerItem);
            bussinessTowerItem = null;
        }
        base.OnDispawn();
    }
    public void SetInfo(BusinessStrongholdAttribute businessStrongholdAttribute )
    {
        BuildBussinessStronghold(businessStrongholdAttribute.strongholdLevel);
    }

    public void BuildBussinessStronghold(int strongholdLevel)
    { 
        if(bussinessTowerItem != null)AndaDataManager.Instance.RecieveItem(bussinessTowerItem);
        bussinessTowerItem = AndaDataManager.Instance.InstantiateTower<BussinessTowerItem>((20001 + strongholdLevel).ToString());
        bussinessTowerItem.SetInto(bussinessStrongholdPoint);
    }

}
