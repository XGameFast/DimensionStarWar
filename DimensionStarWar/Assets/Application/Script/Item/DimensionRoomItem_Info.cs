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

    public int itemIndex;
    public UserObjsBox userObjsBox;
    public void SetInfo(UserObjsBox uob)
    {
        userObjsBox = uob;
        itemIndex = uob.lD_Objs[uob.lD_Objs.Count-1].objIndex;
        #region

        CD_ObjAttr cD_ObjAttr = MonsterGameData.GetCD_ObjAttr(uob.id);
        int smallID = uob.id - uob.idType;
        itemImage.sprite = AndaDataManager.Instance.GetConsumableSprite(uob.id.ToString());
        itemName.text = cD_ObjAttr.objectName[smallID];
        itemCount.text = "x" + uob.count;
        //itemDescpriton.text = cD_ObjAttr.objectDescription[smallID];
        #endregion
    }

    public void ClickItem()
    {
        if(callback!=null)
        {
            callback(transform.GetComponent<DimensionRoomItem_Info>());
        }
    }


}
