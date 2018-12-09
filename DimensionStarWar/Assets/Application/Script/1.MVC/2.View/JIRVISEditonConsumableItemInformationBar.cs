using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISEditonConsumableItemInformationBar : UIBasic2  {

    public Text itemCount;
    public Text itemNameText;
    public Image sprite;
    private int itemID;
    private System.Action callbackAction;
    private bool isopendetailbar;
    /*public void OnClick()
    {
        if(callbackAction!=null)
        {
            callbackAction();
        }
    }*/

    public void SetCallBack( System.Action  _callback)
    {
        callbackAction = _callback;
    }
     

    public void SetNameAndCount(string _name ,string id ,int count,bool _isopendetailbar=true)
    {
        if(count != 0)
        {
            itemCount.text = "x" + count;
        }else
        {
            itemCount.text = "";
        }
       //itemCount.text = "x" + count; // AndaGameExtension.ConverString(count);
        itemID = int.Parse(id);
        sprite.sprite = AndaDataManager.Instance.GetConsumableSprite(id);
        itemNameText.text = _name;
        isopendetailbar = _isopendetailbar;
    }

    public void ClickItem()
    {
        if(callbackAction!=null) callbackAction();

        if (!isopendetailbar)
            return;
        int idType = AndaDataManager.Instance.GetObjTypeID(itemID);
        //如果点击的是宠物，那么检查一下这个选中宠物类别中是否有为插入据点的
        if (idType == 1000)
        {
            PlayerMonsterAttribute playerMonsterAttribute = AndaDataManager.Instance.userData.GetFreeMonster(itemID);
            //打开编辑宠物面板
            if (playerMonsterAttribute != null)
            {
                JIRVIS.Instance.BuildEditorBarForMonsterChangeNameOrBelongStorngholdIndex(playerMonsterAttribute, -1, null, null);
            }
            else //打开详情面板
            {
                JIRVIS.Instance.BuildEditorBarForItemInformation(itemID);
            }
        }
        else
        {
            JIRVIS.Instance.BuildEditorBarForItemInformation(itemID);
        }
    }
}
