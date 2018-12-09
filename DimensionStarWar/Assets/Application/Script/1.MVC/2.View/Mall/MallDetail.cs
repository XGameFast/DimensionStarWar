using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;

public class MallDetail : UIBasic2
{

    public Text objectName;
    public Text des;
    public Text objectCount;
    public Text objectSellType;

    public GameObject buyBtton;

    public Image objectImage;
    public InputField countText;
    public CD_MallDetail info;

    public System.Action callBack;
    public MallMenu mallMenu;

    private int paytype;
    private int paycount;
    public void Close()
    {
        callBack();
    }

    public void BuildData(CD_MallDetail _info, System.Action _callBack, MallMenu _mallMenu) {
        info = _info;
        callBack = _callBack;
        mallMenu = _mallMenu;
    }
    
    public void AddCount()
    {
        countText.text = (int.Parse(countText.text)+1).ToString();
        CheackMoney();
    }
    public void Add10Count()
    {
        countText.text = (int.Parse(countText.text) + 10).ToString();
    }
    public void Del10Count()
    {
        var count = int.Parse(countText.text) - 10;
        if (count <= 0)
            count = 1;
        countText.text = count.ToString(); 
    }
    public void DelCount()
    {
        var count = int.Parse(countText.text) - 1;
        if (count <= 0)
            count = 1;
        countText.text = count.ToString();
        CheackMoney();
    }
    // Use this for initialization
    void Start () {
    }
    public void SetInfo()
    {
        objectImage.sprite = AndaDataManager.Instance.GetConsumableSprite(info.objectID.ToString());
        countText.text = "1";
        objectCount.text ="x"+info.count.ToString();
        objectName.GetComponent<Text>().text = MonsterGameData.GetConsuambleObjectName(info.objectID);
        des.GetComponent<Text>().text = info.tips;
        objectSellType.text = "";
        if (info.sellingType.Contains(2)|| info.sellingType.Contains(5) || info.sellingType.Contains(6))
        {
            if (info.sellingLimit.Count == 3)
            {
                if (!(info.sellingLimit[1] == 0))
                {
                    objectSellType.text += "限时 ";
                }

            }
        }
        if (info.sellingType.Contains(3) || info.sellingType.Contains(5) || info.sellingType.Contains(6))
        {
            if (info.sellingLimit.Count == 3)
            {
                if (!(info.sellingLimit[2] == 0))
                {
                    objectSellType.text += "限量 ";
                }
            }
        }
        if (info.sellingType.Contains(4))
        {
            objectSellType.text += "下架 ";
        }
        if (info.payType.Contains(5))
        {
            objectSellType.text += "掉落 ";
        }



        for (int i = 0; i < buyBtton.transform.GetChildList().Count; i++)
        {
            buyBtton.transform.GetChild(i).gameObject.SetActive(false);
        }
        for (int i = 0; i < info.payType.Count; i++)
        {
            var item = buyBtton.transform.GetChild(i).GetComponent<MallBuy>();
            item.gameObject.SetActive(true);
            item.type = info.payType[i];
            item.objectID = info.objectID;
            var typeName = "";
            switch (item.type)
            {
                case 1:
                    typeName = "RMB";
                    break;
                case 2:
                    typeName = "星币";
                    break;
                case 3:
                    typeName = "星石";
                    break;
                case 4:
                    typeName = "赤金";
                    break;
                case 5:
                    typeName = "掉落";
                    break;
            }
            if (item.type != 5)
                item.transform.GetChild(0).GetComponent<Text>().text = typeName + ":" + info.price[i].ToString();
            else
                item.transform.GetChild(0).GetComponent<Text>().text = typeName;
        }
        CheackMoney();
    }
	// Update is called once per frame
	void Update () {
       
    }

    public void CheackMoney()
    {
        var GoldList = AndaDataManager.Instance.userData.GetGoldList();

        if (int.Parse(countText.text) > 10000)
            countText.text = "10000";

        for (int i = 0; i < info.payType.Count; i++)
        {
            var item = buyBtton.transform.GetChild(i).GetComponent<MallBuy>();
            if (GoldList == null)
            {
                item.IsCanBuy = false;
                item.GetComponent<Button>().interactable = false;
                continue;
            }
            var money = GoldList.FirstOrDefault(o => o.id == 42030+ info.payType[i]-2);
            if ( money == null || info ==null||money.count < int.Parse(countText.text) * info.price[i])
            {
                item.IsCanBuy = false;
                item.GetComponent<Button>().interactable = false;
            }
            else {
                item.IsCanBuy = true;
                item.GetComponent<Button>().interactable = true;
            }
            var typeName = "";
            switch (item.type)
            {
                case 1:
                    typeName = "RMB";
                    break;
                case 2:
                    typeName = "星币";
                    break;
                case 3:
                    typeName = "星石";
                    break;
                case 4:
                    typeName = "赤金";
                    break;
                case 5:
                    typeName = "掉落";
                    break;
            }
            if (item.type != 5)
                item.transform.GetChild(0).GetComponent<Text>().text = typeName + ":" + (int.Parse(countText.text) * info.price[i]).ToString();
            else
                item.transform.GetChild(0).GetComponent<Text>().text = typeName;
        }

        objectCount.text = "x" + info.count * int.Parse(countText.text);
    }
    public void CountChanged()
    {
        var count = int.Parse(countText.text);
        if (count <= 0)
            count = 1;
        countText.text = count.ToString();

        CheackMoney();

    }
    public void MallBuy(System.Action<bool> callBack, int count, int type, int objectID)
    {
        paytype = type;
        paycount = count;
        if (callBack == null)
            callBack = CallBackBuy;
        AndaDataManager.Instance.MallBuy(callBack, count, type, objectID);
    }
    public void CallBackBuy(bool isBuy)
    {
        if (isBuy)
        {
            var list = AndaDataManager.Instance.userData.GetGoldList();
            if (list == null)
                return;
            var item = list.FirstOrDefault(o => o.id == 42030+paytype-2);
            if (item == null)
                return;
            var price = 0;
            for (int i = 0; i < info.payType.Count; i++)
            {
                if (info.payType[i] == paytype)
                    price = info.price[i];
            }
            item.count -= price*paycount;
            mallMenu.GetGold();
            Debug.Log("购买成功");
        }
        else
        {
            Debug.Log("购买失败");
        }
    }
}
