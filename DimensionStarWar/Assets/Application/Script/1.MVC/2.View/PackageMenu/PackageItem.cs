using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class PackageItem : AndaObjectBasic {

    public Image itemSprite;
    public Text count;
    //public Text objName;


    public void SetInfo(LD_Objs lD_Objs)
    {
        itemSprite.sprite = AndaDataManager.Instance.GetConsumableSprite(lD_Objs.objID.ToString());
        count.text = "x" + lD_Objs.lessCount.ToString();
    }
	
}
