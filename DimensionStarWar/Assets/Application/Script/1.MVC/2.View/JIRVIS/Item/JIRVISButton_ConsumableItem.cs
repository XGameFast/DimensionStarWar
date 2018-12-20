using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISButton_ConsumableItem : JIRVISButtonItemBase {

    public Image icon;
    public Text itemname;
    public Text itemCount;
    private System.Action<int> callback;

    private LD_Objs lD_Objs;


    public override void OnSpawn()
    {
        base.OnSpawn();
    }

    public void SetInfo(LD_Objs _lD_Objs,System.Action<int> callback_clickItem)
    {
        lD_Objs = _lD_Objs;
        callback = callback_clickItem;
        icon.sprite = AndaDataManager.Instance.GetConsumableSprite(lD_Objs.objID.ToString());
        itemname.text = lD_Objs.objName;
        itemCount.text = "x" + lD_Objs.lessCount.ToString();



    }

    public override void ClickItem()
    {
        base.ClickItem();
        if(lD_Objs.lessCount <=0)
        {
            JIRVIS.Instance.PlayTips("没有图纸啦");
            return;
        }
        callback(lD_Objs.objID);
    }
}
