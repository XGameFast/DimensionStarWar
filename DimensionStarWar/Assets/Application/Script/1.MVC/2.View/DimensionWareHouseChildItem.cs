using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
public class DimensionWareHouseChildItem : AndaObjectBasic {
    public Text countText;
    public Text itemNameText;
    public Image sprite;
    private System.Action<int> callbackAction;
    private System.Action<int ,int> callbackClickItem;
    public int itemID;
    public int itemIndex;

    public GameObject redPoint;

    public override void OnDispawn()
    {
        itemID =-1;
        itemIndex =-1;
        callbackAction =null;
        callbackClickItem = null;
        base.OnDispawn();
    }
    public void ClicItem()
    {
        if(callbackAction!=null)
        {
            callbackAction(itemID);
        }

        if (callbackClickItem != null)
        {
            callbackClickItem(itemID,itemIndex);
        }
    }

    public void SetCallBack( System.Action<int>  _callback)
    {
        callbackAction = _callback;
    }
    public void SetCallBack2(System.Action<int,int> _callback)
    {
        callbackClickItem = _callback;
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
        SetCount(count);


    }

    public void SetNameHeadImageCount(string _itemName, int count, string headImagePath ,int strongholdIndex ,int playerCouponIndex, bool isPlayer)
    {
        itemID = -2;
        itemIndex = playerCouponIndex;
        if (isPlayer)
        { 
            AndaDataManager.Instance.GetPlayerPorImg(SetImage);
        }else
        {
            AndaDataManager.Instance.GetStrongholdImg(strongholdIndex, headImagePath, SetImage);
        }
        itemNameText.text = _itemName;
        SetCount(count);
    }

    private void SetCount(int count)
    {
        if (count != 0)
        {
            countText.text = "x" + count.ToString();
        }
        else
        {
            countText.text = "";
        }
    }

    public void SetImage(int shIndex,Sprite _sp)
    {
        SetImage(_sp);
    }

    private void SetImage(Sprite _sp)
    {
        sprite.sprite =  _sp;
    }


    public void SetRedPointState(bool isOpen)
    {
        redPoint.gameObject.SetTargetActiveOnce(isOpen);
    }

    public void SetImageBlack()
    {
        sprite.color = Color.black;
    }

    public void SetImageColorful()
    {
        sprite.color = Color.white;
    }


}
