using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DimensionRoomItem_Info : AndaObjectBasic {

    public Image itemImage;
    public Text itemName;
    public Text itemCount;
    public Text itemDescpriton;
     
    public System.Action<DimensionRoomItem_Info> callback;

    public int itemIndex;//处于列表中的位置
    public LD_Objs itemData;
    public int giveValue;



    public void SetInfo(LD_Objs _itemData ,int _itemIndex)
    {
        itemIndex = _itemIndex;
        itemData = _itemData;

        CD_ObjAttr cD_ObjAttr = MonsterGameData.GetCD_ObjAttr(itemData.objID);
        itemImage.sprite = AndaDataManager.Instance.GetConsumableSprite(itemData.objID.ToString());
        switch (_itemData.objectType)
        {
            case 40000:
                if(itemData.giveValue.Equals(0))
                {
                    giveValue = cD_ObjAttr.values[itemData.objSmallID];
                    itemName.text = cD_ObjAttr.objectName[itemData.objSmallID];
                }else
                {
                    giveValue = itemData.giveValue;
                    itemName.text = giveValue + "ml意志力药水";
                }
               
                break;
            default:
                itemName.text = cD_ObjAttr.objectName[itemData.objSmallID];
                break;
        }

        itemCount.text = "x" + itemData.lessCount;

        #region



        //itemDescpriton.text = cD_ObjAttr.objectDescription[smallID];
        #endregion
    }

    public void ClickItem()
    {
        if(callback!=null)
        {
            callback(this);
        }
    }


}
