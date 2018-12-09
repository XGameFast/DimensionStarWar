using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestQuickBuyItem : MonoBehaviour {
    public int itemID;
    public int itemCount;

    public void ClickItem()
    {
        AndaDataManager.Instance.MallBuy(CallBackFinish , itemCount, 0, itemID);
    }

    private void CallBackFinish(bool isfinish)
    {

    }
}
