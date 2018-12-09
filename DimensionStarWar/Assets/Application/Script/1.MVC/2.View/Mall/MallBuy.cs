using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class MallBuy : MonoBehaviour,IPointerClickHandler {

    public InputField countText;
    public int objectID;
    public int type;
    //1=RMB, 2=星币，3星石，4赤金，5掉落
    public MallDetail mallDetail;
    public bool IsCanBuy=true;

    public void OnPointerClick(PointerEventData eventData)
    {
        if(!IsCanBuy)
            return;
        if (type == 5)
            return;
        var count = 1;
        if (countText.text != "")
            count = int.Parse(countText.text);
        mallDetail.MallBuy(null, count, type, objectID);
    }
}
