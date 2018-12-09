using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;

public class MallMenu : UIBasic2
{
    public Transform menuContent;
    private MallController mallController;

    private List<MallItem> mallItemList;
    //public MallDetail mallDetail;

    public Text gold1;
    public Text gold2;
    public Text gold3;
    public void Start()
    {
        
    }


    public override void OnDispawn()
    {
        if (mallItemList != null)
        {
            int count = mallItemList.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(mallItemList[i]);
            }
            mallItemList = null;
        }

        base.OnDispawn();
    }

    public void GetGold()
    {
        var list= AndaDataManager.Instance.userData.GetGoldList();
        if(list == null)return;
        var item = list.FirstOrDefault(o => o.id == 42030);
        if (item != null)
            gold1.text = item.count.ToString();
        else
            gold1.text = "0";
        item = list.FirstOrDefault(o => o.id == 42031);
        if (item != null)
            gold2.text = item.count.ToString();
        else
            gold2.text = "0";
        item = list.FirstOrDefault(o => o.id == 42032);
        if (item != null)
            gold3.text = item.count.ToString();
        else
            gold3.text = "0";
    }

    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
        mallController = baseController as MallController;
        GetGold();
    }

    public void BuildConsumableItem(List<CD_MallDetail> itemList)
    {
        if (menuContent.childCount > 0)
        {
            for (int i = menuContent.childCount-1; i >= 0; i--)
            {
                AndaDataManager.Instance.RecieveItem(menuContent.GetChild(i).GetComponent<MallItem>());
            }
        }

        int count = itemList.Count;
        for (int i = 0; i < count; i++)
        {
            if (mallItemList == null) mallItemList = new List<MallItem>();
            MallItem mallItem = AndaDataManager.Instance.InstantiateMenu<MallItem>(ONAME.MallConsumableItem);
            mallItem.SetInfo(itemList[i], mallController.ShowMallDetail);
            mallItem.transform.SetInto(menuContent);
            mallItemList.Add(mallItem);
        }
    }
   
}
