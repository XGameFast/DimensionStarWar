using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class MallBar : UIFollowWithTarget {

    public CommodityItemForMall itemPrefab;
    public UI2DSprite showIcon; 
    public UIGrid consumalList;
    public UIGrid objectsList;
    public UIGrid monsterList;
    public UIGrid skinList;
    public UIGrid currencyList;
    public Transform infoBoard;
    public TweenAlpha talpha;

    

    private List<LD_Commodity> commodityList;
    private LD_Commodity currentCommdity;
    private GameObject lastGrid;

    public UILabel commodityDes;
    public UILabel commodityName;
    public UILabel tipsInfoLabel;
    public UIGrid payBtnGrid;
    public GameObject coinPayBtn;
    public GameObject stonPayBtn;
    public GameObject TaskPayBtn;
    public GameObject archPayBtn;
    public GameObject rmbPayBtn;


    public UILabel coinPayPriceLabel;
    public UILabel staonePayPriceLabel;
    public UILabel RMBPayPriceLabel;

    public void BuildBar(List<LD_Commodity> list , Vector3 point)
    {
        DidplayAlpha(1.2F);
        if (commodityList == null)
        {
            commodityList = list;
            BuildItem();
        }

        SetFollowPoint(point);

       // ChangeTable(OTYPE.ObjectTypeIndex.bloodBlock);//后面要改成基础type
    }

    public void UpdateFollowPoint(Vector3 point)
    {
        SetFollowPoint(point);
    }

    public void CloseMall()
    {
        EndFollow();
    }

    public void ChangeTable(/*OTYPE.ObjectTypeIndex objectTypeIndex*/)
    {
        ///暂时先用 objectIndex区分。 原因是 货币属于 玩家的消耗品。但又单独列出来，所以 但是暂时先这么分。原本 货币应该直接属于 物件里面。
        /*if (lastGrid != null) lastGrid.SetTargetActiveOnce(false);
        switch (objectTypeIndex)
        {
            case OTYPE.ObjectTypeIndex.bloodBlock:
            case OTYPE.ObjectTypeIndex.energyBlock:
            case OTYPE.ObjectTypeIndex.strengthBlock:
            case OTYPE.ObjectTypeIndex.expBlock:
                consumalList.gameObject.SetTargetActiveOnce(true);
                lastGrid = consumalList.gameObject;
                consumalList.GetChild(0).GetComponent<CommodityItemForMall>().ClickItem();
                break;
            case OTYPE.ObjectTypeIndex.currency:
                currencyList.gameObject.SetTargetActiveOnce(true);
                lastGrid = currencyList.gameObject;
                currencyList.GetChild(0).GetComponent<CommodityItemForMall>().ClickItem();
                break;
            case OTYPE.ObjectTypeIndex.detector:
            case OTYPE.ObjectTypeIndex.dimensionDoor:
            case OTYPE.ObjectTypeIndex.strongholdDrawing:
                objectsList.gameObject.SetTargetActiveOnce(true);
                lastGrid = objectsList.gameObject;
                objectsList.GetChild(0).GetComponent<CommodityItemForMall>().ClickItem();
                break;
        }*/
    }

    private void BuildItem()
    {
       /* foreach (var go in commodityList)
        {
            OTYPE.ObjectTypeIndex typeIndex = OTYPE.GetObjectTypeIndex(go.c_id);
            GameObject aob = itemPrefab.Clone();
            aob.name = go.c_id.ToString();
            aob.gameObject.SetActive(true);
            CommodityItemForMall cim = aob.GetComponent<CommodityItemForMall>();
            cim.SetValue(go, ClickItem) ;
            switch (typeIndex)
            {
                case OTYPE.ObjectTypeIndex.bloodBlock:
                case OTYPE.ObjectTypeIndex.energyBlock:
                case OTYPE.ObjectTypeIndex.strengthBlock:
                case OTYPE.ObjectTypeIndex.expBlock:
                    aob.transform.SetParent(consumalList.transform);
                    break;
                case OTYPE.ObjectTypeIndex.currency:
                    aob.transform.SetParent(currencyList.transform);
                    break;
                case OTYPE.ObjectTypeIndex.detector:
                case OTYPE.ObjectTypeIndex.dimensionDoor:
                case OTYPE.ObjectTypeIndex.strongholdDrawing:
                    aob.transform.SetParent(objectsList.transform);
                    break;
            }
            aob.ResetTran();
        }

        consumalList.Reposition();
        objectsList.Reposition();
        */
    }

    public void SetCommodityInformation(Transform clickTarget)
    {
        if (currentCommdity.tips != null)
        {
            tipsInfoLabel.gameObject.SetTargetActiveOnce(true);
            tipsInfoLabel.text = currentCommdity.tips;
        }
        else
        {
            tipsInfoLabel.gameObject.SetTargetActiveOnce(false);
        }
        commodityName.text = currentCommdity.commodityName;
        commodityDes.text = currentCommdity.des;
        CheckPayType();
        SetInfoBarPosition(clickTarget);
    }

    private void RemoveBtn(Transform btn)
    {
        btn.transform.SetParent(transform);
        btn.gameObject.SetTargetActiveOnce(false);
    }
    private void AddPayBtn(Transform btn)
    {
        btn.transform.SetParent(payBtnGrid.transform);
        btn.gameObject.SetTargetActiveOnce(true);
    }
    private void CloseAllPayBtn()
    {
        RemoveBtn(coinPayBtn.transform);
        RemoveBtn(stonPayBtn.transform);
        RemoveBtn(TaskPayBtn.transform);
        RemoveBtn(archPayBtn.transform);
        RemoveBtn(rmbPayBtn.transform);
    }

    private void CheckPayType()
    {
        CloseAllPayBtn();

        for (int i = 0; i < currentCommdity.payType.Count;i++)
        {
            switch (currentCommdity.payType[i])
            {
                case (int)OTYPE.PayType.coin:
                    SetCoinPayInfo(currentCommdity.price[i]);
                   // payBtnGrid.transform.parent.gameObject.SetTargetActiveOnce(true);
                    break;
                case (int)OTYPE.PayType.stone:
                    SetStonePayInfo(currentCommdity.price[i]);
                 //   payBtnGrid.transform.parent.gameObject.SetTargetActiveOnce(true);
                    break;
                case (int)OTYPE.PayType.rmb:
                    SetRMBPayInfo(currentCommdity.price[i]);
                  //  payBtnGrid.transform.parent.gameObject.SetTargetActiveOnce(true);
                    break;
                case (int)OTYPE.PayType.none:
                  //  payBtnGrid.transform.parent.gameObject.SetTargetActiveOnce(false);
                    break;
            }
        }

        payBtnGrid.Reposition();
    }

    private void SetInfoBarPosition(Transform clickTarget)
    {
        talpha.ResetToBeginning();
        talpha.PlayForward();
        infoBoard.transform.position = clickTarget.transform.position;
    }

    private void SetCoinPayInfo(int price)
    {
        coinPayPriceLabel.text = price.ToString();
        AddPayBtn(coinPayBtn.transform);
    }
    private void SetStonePayInfo(int price)
    {
        staonePayPriceLabel.text = price.ToString();
        AddPayBtn(stonPayBtn.transform);
        
    }
    private void SetTaskPayInfo()
    {

    }
    private void SetArchiPayInfo()
    {

    }

    private void SetRMBPayInfo(int price)
    {
        RMBPayPriceLabel.text = price.ToString();
        AddPayBtn(rmbPayBtn.transform);
        
    }

    #region 

    public void ClickItem(LD_Commodity value , Transform itemTran)
    {
        currentCommdity = commodityList.FirstOrDefault(s => s == value);
        if (currentCommdity != null)
        {
            SetCommodityInformation(itemTran);
        }
    }
    #endregion
}
