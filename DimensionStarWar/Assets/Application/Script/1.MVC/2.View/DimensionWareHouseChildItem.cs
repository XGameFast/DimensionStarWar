﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
public class DimensionWareHouseChildItem : AndaObjectBasic {
    public Text countText;
    public Text itemNameText;
    public Image sprite;
    private System.Action<int> callbackAction;
    private int itemID;
   
    public void ClicItem()
    {
        if(callbackAction!=null)
        {
            callbackAction(itemID);
        }
    }

    public void SetCallBack( System.Action<int>  _callback)
    {
        callbackAction = _callback;
    }

    public void SetNameAndCount(string _name , int count  ,string id)
    {
        if(id!="kong")
        {
            itemID = int.Parse(id);
        }else
        {
            itemID = -1;
        }
        sprite.sprite = AndaDataManager.Instance.GetConsumableSprite(id);
        itemNameText.text = _name;
        if(count!=0)
        {
            countText.text = "x" + count.ToString();
        }else
        {
            countText.text = "";
        }
      
    }



}
