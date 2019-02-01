using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerCouponView : MonoBehaviour {
    public GameObject main;

    public GameObject ContentPanel;

    public GameObject ScrollContent;
    public List<GameObject> ItemList;
    public int Type = 0; // -1全部 0未使用1已提交2已审核成功3已审核审核失败4已过期5已作废

    public GameObject ButtonCheack;
    public GameObject ButtonFail;


    public Text TitleText;
    public Text ContentText;
    public Text dateText;


    public void Awake()
    {
        AndaPlayerCouponManager.Instance.playerCouponView = this;
    }



    public void ShowMain()
    {
        InstanceContentPanel();
        main.SetActive(true);
    }

    public void CloseMain()
    {
        main.SetActive(false);
    }
    public void InstanceContentPanel()
    {
        SetContentPanel(AndaPlayerCouponManager.Instance.GetPlayerCouponData());
        ChangeType(1);
    }

    public void SetContentPanel(List<PlayerCoupon> list)
    {
        if (ItemList == null)
            ItemList = new List<GameObject>();
        if (list == null)
            return;
        int count = list.Count;
        if (ItemList != null)
        {
            foreach (var m in ItemList)
            {
                m.transform.parent = null;
            }
            ItemList.Clear();
        }
        for (int i = 0; i < count; i++)
        {
            //GameObject item = AndaDataManager.Instance.GetItemInfoPrefab("PlayerCouponItem");
            //item = Instantiate(item);
            //item.transform.parent = ScrollContent.transform;
            //item.transform.localScale = Vector3.one;
            //item.transform.localPosition = Vector3.zero;
            //item.GetComponent<ItemInfo_PlayerCoupon>().SetInfo(this, ContentPanel, list[i]);
            //ItemList.Add(item);
        }

    }
    
    public void ChangeType(int type)
    {
        if (ItemList == null)
            return;
        foreach (var m in ItemList)
        {
            if (m.GetComponent<ItemInfo_PlayerCoupon>().playerCoupon.status == type)
            {
                m.SetActive(true);
            }
            else
            {
                m.SetActive(false);
            }
        }
    }
    // Use this for initialization
    void Start () {
    
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
