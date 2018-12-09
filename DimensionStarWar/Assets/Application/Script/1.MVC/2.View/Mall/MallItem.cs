using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class MallItem : AndaObjectBasic , IPointerClickHandler {

    public Image itemSprite;
    public Text des;
    public int oID;
    public CD_MallDetail cD_Mall;
    public System.Action<CD_MallDetail> CallBack;
    public Image mask;
    public bool isClick=true;
    public void OnPointerClick(PointerEventData eventData)
    {
        if (isClick)
        {
            if (CallBack == null)
                return;
            CallBack(cD_Mall);
        }
    }

    //public Text objName;
    public void SetInfo(CD_MallDetail lD_Objs, System.Action<CD_MallDetail> callBack)
    {
        mask.gameObject.SetActive(false);
        isClick = true;
        CallBack = callBack;
        cD_Mall = lD_Objs;
        itemSprite.sprite = AndaDataManager.Instance.GetConsumableSprite(lD_Objs.objectID.ToString());
        oID = lD_Objs.objectID;
        des.text = "";
        if (lD_Objs.sellingType.Contains(2) || lD_Objs.sellingType.Contains(5) || lD_Objs.sellingType.Contains(6))
        {
            if (lD_Objs.sellingLimit.Count == 3)
            {
                if (!(lD_Objs.sellingLimit[1] == 0))
                {
                    des.text += "限时 ";
                }

            }
        }
        if (lD_Objs.sellingType.Contains(3) || lD_Objs.sellingType.Contains(5) || lD_Objs.sellingType.Contains(6))
        {
            if (lD_Objs.sellingLimit.Count == 3)
            {
                if (!(lD_Objs.sellingLimit[2] == 0))
                {
                    des.text += "限量 ";
                }
            }
        }
        if (lD_Objs.sellingType.Contains(4))
        {
            tip("下架");
        }
        if (lD_Objs.payType.Contains(5))
        {
            des.text = "掉落 ";
        }
        
        if ((lD_Objs.sellingType.Contains(2)
            || lD_Objs.sellingType.Contains(3)
            || lD_Objs.sellingType.Contains(5)
            || lD_Objs.sellingType.Contains(6)) && lD_Objs.Surplus <= 0)
        {
            tip("售罄");
        }

        if ((lD_Objs.sellingType.Contains(2)
            || lD_Objs.sellingType.Contains(3)
            || lD_Objs.sellingType.Contains(5)
            || lD_Objs.sellingType.Contains(6)) && lD_Objs.sellingLimit.Count == 3)
        {
            if (lD_Objs.sellingLimit[2] != 0)
            {
                var time = AndaGameExtension.GetCurrentUnixTime();
                if (time < lD_Objs.sellingLimit[0] || time > lD_Objs.sellingLimit[1])
                {
                    tip("限时结束");
                }
            }
        }

    }
    public void tip(string tips)
    {
        mask.gameObject.SetActive(true);
        isClick = false;
        des.text = tips;
    }

}
