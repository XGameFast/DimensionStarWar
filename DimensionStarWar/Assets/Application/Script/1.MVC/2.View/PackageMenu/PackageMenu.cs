using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PackageMenu : UIBasic2
{
    public Transform menuContent;
    private PackageController packageController;

    private List<PackageItem> packItemList ;

    public override void OnDispawn()
    {
        if(packItemList != null)
        {
            int count =  packItemList.Count;
            for(int i = 0 ; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(packItemList[i]);
            }

            packItemList = null;
        }
        
        base.OnDispawn();
    }


    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
        packageController = baseController as PackageController;
    }

    public void BuildConsumableItem(List<LD_Objs> itemList)
    {
        int count = itemList.Count;
        for(int i = 0 ; i < count; i ++)
        {
            if(packItemList == null)packItemList = new List<PackageItem>();
            PackageItem packageItem = AndaDataManager.Instance.InstantiateMenu<PackageItem>(ONAME.PackageConsumableItem);
            packageItem.SetInfo(itemList[i]);
            packageItem.transform.SetInto(menuContent);
            packItemList.Add(packageItem);
        }
    }

}
