using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEngine.UI;
public class ExchangeMenu : UIBasic2 {

    public Text exchangeName;
    public Text exchangeDescription;
    public Image userImage;
    public Transform grid;
    public ExchangeMenu_BuyBar exchangeMenu_BuyBar;
    public ExchangeMenu_SellBar exchangeMenu_SellBar;
    public Text title;
    private List<ExchangeUIItem_BuyItem> exchangeUIItem_BuyItems ;
    private List<ExchangeUIItem_SellItem> exchangeUIItem_SellItems;
    private Exchange exchangeInfo;

    private List<ExchangeObject> exDataList_BuyConsumable;
    private List<ExchangeObject> exDataList_BuyMonster;
    private List<ExchangeBusinessCoupon> exDataLIst_BuyBSCoupon;

    private List<ExchangeObject> exDataList_SelingConsumable;
    private List<ExchangeObject> exDataList_SellingFreeMonster;
    private List<ExchangeBusinessCoupon> exDataList_SellingBSCoupon;

    public System.Action CallBackClose ;
    private int wantTo = 0;
    private int detialType = 0;
    private int lastSellingDetailType =-1;
    private int lastBuyDetailType =-1;

    public override void OnSpawn()
    {
        base.OnSpawn();
        exchangeMenu_BuyBar.ClickCallBackForExObj += CallBackBuyItem;
        exchangeMenu_BuyBar.ClickCallBackForExBscoupon += CallBackBuyItemForExbsCoupon;
        exchangeMenu_BuyBar.ClickCloseCallBack += CallBackCloseBuyBar;
        exchangeMenu_SellBar.CallBackUploadSellingItem += FinishUploadSellingItem;
        exchangeMenu_SellBar.CallBackUploadSellingItemForExchangeBussinessCoupon+=FinishUploadSellingItemForBSCoupon;
        exchangeMenu_SellBar.ClickCloseBar += CallBackCloseBuyBar;
    }

    public override void OnDispawn()
    {

        wantTo = 0;
        detialType = 0;
        lastBuyDetailType = -1;
        lastSellingDetailType = -1;
        if(exDataList_BuyConsumable!=null) exDataList_BuyConsumable.Clear();
        if(exDataList_BuyMonster!=null) exDataList_BuyMonster.Clear();
        if(exDataLIst_BuyBSCoupon!=null) exDataLIst_BuyBSCoupon.Clear();
        if(exDataList_SelingConsumable!=null) exDataList_SelingConsumable.Clear();
        if(exDataList_SellingFreeMonster!=null) exDataList_SellingFreeMonster.Clear();
        if(exDataList_SellingBSCoupon!=null) exDataList_SellingBSCoupon.Clear();
        ClearBuyItem();
        ClearSellItem();
        exchangeMenu_BuyBar.ClickCallBackForExObj -= CallBackBuyItem;
        exchangeMenu_BuyBar.ClickCallBackForExBscoupon -= CallBackBuyItemForExbsCoupon;
        exchangeMenu_BuyBar.ClickCloseCallBack -= CallBackCloseBuyBar;
        exchangeMenu_SellBar.CallBackUploadSellingItem -= FinishUploadSellingItem;
        exchangeMenu_SellBar.CallBackUploadSellingItemForExchangeBussinessCoupon -= FinishUploadSellingItemForBSCoupon;
        exchangeMenu_SellBar.ClickCloseBar -= CallBackCloseBuyBar;
        base.OnDispawn();
    }

    private void ClearBuyItem()
    {
        if (exchangeUIItem_BuyItems != null)
        {
            int count = exchangeUIItem_BuyItems.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(exchangeUIItem_BuyItems[i]);
            }
            exchangeUIItem_BuyItems.Clear();
        }
    }

    private void ClearSellItem()
    {
        if(exchangeUIItem_SellItems!=null)
        {
            int count = exchangeUIItem_SellItems.Count;
            for(int i = 0; i <count; i++)
            {
                AndaDataManager.Instance.RecieveItem(exchangeUIItem_SellItems[i]);
            }
            exchangeUIItem_SellItems.Clear();
        }
    }


    public void ClickLevelOut()
    {
        JIRVIS.Instance.CloseTips();
        if (CallBackClose!=null)
        {
            CallBackClose();
        }
    }

    public void SetInfo(Exchange _exchangeInfo)
    {
        exchangeInfo = _exchangeInfo;
        //如果是自己的交易所，那么头像获取的路径不同
        if (exchangeInfo.userIndex == AndaDataManager.Instance.userData.userIndex)
        {
            AndaDataManager.Instance.GetPlayerPorImg(SetImage);
        }else
        {
            AndaDataManager.Instance.GetOtherPlayerPorImg(_exchangeInfo.userIndex, _exchangeInfo.headImg , SetImage);
        }

        exchangeName.text = _exchangeInfo.ExchangeName;

        exchangeDescription.text = _exchangeInfo.note;

        ConverExchangeTo();

        ConverterMineCounsumableToExchangeObj();
        ConverterMineFreeMonsterToExchangeObj();
        ConverterMineCouponToExbussinessCoupon();


        ClickWanttoBuy();
    }
    /// <summary>
    /// 把传进来的 物品列表进行转换赋值 , 优惠券无需转换
    /// </summary>
    private void ConverExchangeTo()
    {
        if(exchangeInfo.exchangeObjects!=null && exchangeInfo.exchangeObjects.Count!=0)
        {

            int count = exchangeInfo.exchangeObjects.Count;
            for (int i = 0; i < count; i++)
            {
                ExchangeObject eo = null;
                int idGroup = AndaDataManager.Instance.GetObjectGroupID(exchangeInfo.exchangeObjects[i].objectID);
                switch (idGroup)
                {
                    case 1000:
                        eo = ConvertTool.ConvertMonsterInfoToExchangeObj(exchangeInfo.exchangeObjects[i]);
                        if(exDataList_BuyMonster == null)exDataList_BuyMonster = new List<ExchangeObject>();
                        exDataList_BuyMonster.Add(eo); 
                        break;
                    case 40000:
                        eo = ConvertTool.ConverterConsumableInfoToExchangeObj(exchangeInfo.exchangeObjects[i]);
                        if(exDataList_BuyConsumable == null)exDataList_BuyConsumable = new List<ExchangeObject>();
                        exDataList_BuyConsumable.Add(eo);
                        break;
                }
            }

            TranslateExchangeobjSeatForBuy(ref exDataList_BuyConsumable);
            TranslateExchangeobjSeatForBuy(ref exDataList_BuyMonster);
        }
        if(exchangeInfo.exchangeCoupons!=null && exchangeInfo.exchangeCoupons.Count!=0)
        {
            exDataLIst_BuyBSCoupon = exchangeInfo.exchangeCoupons;
            TranslateBussinessCouponSeatForBuy(ref exDataLIst_BuyBSCoupon);
        }
    }
    /// <summary>
    /// 调换一下位置，把有关于这个玩家的数据往前提
    /// </summary>
    private void TranslateExchangeobjSeatForBuy(ref List<ExchangeObject> exchangeObjects)
    {
        if (exchangeObjects != null && exchangeObjects.Count != 0)
        {
            int count = exchangeObjects.Count;
            List<ExchangeObject> mineObj = new List<ExchangeObject>();
            List<ExchangeObject> otherObj = new List<ExchangeObject>();
            for (int i = 0; i < count; i++)
            {
                if (exchangeObjects[i].userIndex == AndaDataManager.Instance.userData.userIndex)
                {
                    mineObj.Add(exchangeObjects[i]);
                }
                else
                {
                    otherObj.Add(exchangeObjects[i]);
                }
            }
            exchangeObjects.Clear();
            exchangeObjects.AddRange(mineObj);
            exchangeObjects.AddRange(otherObj);
            //分类完毕
        }
    }
    /// <summary>
    /// 调换一个下位置 ，把有关与这个玩家的奖励券往前提
    /// </summary>
    private void TranslateBussinessCouponSeatForBuy(ref List<ExchangeBusinessCoupon> exchangeBusinessCoupons)
    {
        if (exchangeBusinessCoupons != null && exchangeBusinessCoupons.Count != 0)
        {
            int count = exchangeBusinessCoupons.Count;
            List<ExchangeBusinessCoupon> mineObj = new List<ExchangeBusinessCoupon>();
            List<ExchangeBusinessCoupon> otherObj = new List<ExchangeBusinessCoupon>();
            for (int i = 0; i < count; i++)
            {
                if (exchangeBusinessCoupons[i].userIndex == AndaDataManager.Instance.userData.userIndex)
                {
                    mineObj.Add(exchangeBusinessCoupons[i]);
                }
                else
                {
                    otherObj.Add(exchangeBusinessCoupons[i]);
                }
            }

            exchangeBusinessCoupons.Clear();
            exchangeBusinessCoupons.AddRange(mineObj);
            exchangeBusinessCoupons.AddRange(otherObj);
            //分类完毕
        }
    }

    /// <summary>
    /// 将我的消耗品转化为 交易所能用的格式
    /// </summary>
    private void ConverterMineCounsumableToExchangeObj()
    {
        List<UserObjsBox> userObjsBoxes = AndaDataManager.Instance.userData.GetConsumableListExceptCurrency();
        if (userObjsBoxes != null && userObjsBoxes.Count != 0)
        {
            exDataList_SelingConsumable = new List<ExchangeObject>();
            int count = userObjsBoxes.Count;
            for (int i = 0; i < count; i++)
            {
                UserObjsBox userObjsBox = userObjsBoxes[i];
                int uoLength = userObjsBox.lD_Objs.Count;
                for (int m = 0 ; m < uoLength ; m++)
                {
                    ExchangeObject exchangeObject = new ExchangeObject();
                    exchangeObject.userIndex = AndaDataManager.Instance.userData.userIndex;
                    exchangeObject.exchangeIndex = exchangeInfo.exchangeIndex;
                    exchangeObject.objectID = userObjsBox.id;

                    exchangeObject.objectCount = userObjsBox.lD_Objs[m].lessCount;
                    exchangeObject.objectValue = userObjsBox.lD_Objs[m].giveValue;
                    exchangeObject.objName = userObjsBox.lD_Objs[m].objName;
                    exchangeObject.objDescription = userObjsBox.lD_Objs[m].objDescription;
                    exchangeObject.objectIndex = userObjsBox.lD_Objs[m].objIndex;
                    exDataList_SelingConsumable.Add(exchangeObject);
                }
            }
        }
    }
    /// <summary>
    /// 将我的自由宠物转换成交易所能用的格式
    /// </summary>
    private void ConverterMineFreeMonsterToExchangeObj()
    {
        List<PlayerMonsterAttribute> pma = AndaDataManager.Instance.GetUserFreesMonster();
        if(pma!=null && pma.Count!=0)
        {
            int count = pma.Count;
            for (int i = 0; i < count; i++)
            {
                MonsterBaseConfig mbc = MonsterGameData.GetMonsterBaseConfig(pma[i].monsterID);
                ExchangeObject exchangeObject = new ExchangeObject();
                exchangeObject.userIndex = AndaDataManager.Instance.userData.userIndex;
                exchangeObject.exchangeIndex = exchangeInfo.exchangeIndex;
                exchangeObject.objectID = mbc.monsterID;
                exchangeObject.objectCount = 1; 
                exchangeObject.objectValue = 0;
                exchangeObject.objName = mbc.monsterName;
                exchangeObject.objDescription = mbc.monsterDescription;
                exchangeObject.objectIndex = pma[i].monsterIndex;
                if(exDataList_SellingFreeMonster == null) exDataList_SellingFreeMonster= new List<ExchangeObject>();
                exDataList_SellingFreeMonster.Add(exchangeObject);
            }
        }

    }
    /// <summary>
    /// 将我的优惠券转换成交易所能用的格式
    /// </summary>
    private void ConverterMineCouponToExbussinessCoupon()
    {
        List<PlayerCoupon> playerCoupons = AndaDataManager.Instance.userData.playerdata.playerCoupons;
        if(playerCoupons!=null  && playerCoupons.Count!=0)
        {
            int count = playerCoupons.Count;
            for (int i = 0; i < count; i++)
            {
                if(playerCoupons[i].count>0)
                {
                    ExchangeBusinessCoupon exBC = new ExchangeBusinessCoupon();
                    exBC.userIndex = AndaDataManager.Instance.userData.userIndex;
                    exBC.playerCouponIndex = playerCoupons[i].playerCouponIndex;
                    exBC.exchangeIndex = exchangeInfo.exchangeIndex;
                    exBC.couponCount = playerCoupons[i].count;
                    exBC.coupon = playerCoupons[i].coupon;
                    if (exDataList_SellingBSCoupon == null) exDataList_SellingBSCoupon = new List<ExchangeBusinessCoupon>();
                    exDataList_SellingBSCoupon.Add(exBC);
                }
            }
        }
    }

    private void SetImage(Sprite _sp)
    {
        userImage.sprite = _sp;
    }

    private void SetImage(int _index, Sprite _sp)
    {
        userImage.sprite =_sp;
    }

/// <summary>
/// 在购买模式下构建商品item
/// </summary>
/// <param name="_data">Data.</param>
    private void BuildItem(List<ExchangeObject> _data )
    {
        ClearBuyItem();
        int count = _data.Count;
        for (int i = 0; i < count; i++)
        {
            if(_data[i].exchangeStatus == 0)
            {
                if (exchangeUIItem_BuyItems == null) exchangeUIItem_BuyItems = new List<ExchangeUIItem_BuyItem>();
                ExchangeUIItem_BuyItem _buyItem = AndaDataManager.Instance.InstantiateMenu<ExchangeUIItem_BuyItem>(ONAME.ExchangeMenuItem_BuyItem);
                _buyItem.SetInto(grid);
                _buyItem.SetInfo(_data[i], ClickBuyItem);
                exchangeUIItem_BuyItems.Add(_buyItem);
            }
        }
    }


    /// <summary>
    /// 购买模式下，优惠券的构建
    /// </summary>
    private void BuildBuytItemWithCoupon(List<ExchangeBusinessCoupon> _data)
    {
        ClearBuyItem();
        int count = _data.Count;
        for (int i = 0; i < count; i++)
        {
            if(_data[i].exchangeStatus == 0)
            {
                if (exchangeUIItem_BuyItems == null) exchangeUIItem_BuyItems = new List<ExchangeUIItem_BuyItem>();
                ExchangeUIItem_BuyItem _buyItem = AndaDataManager.Instance.InstantiateMenu<ExchangeUIItem_BuyItem>(ONAME.ExchangeMenuItem_BuyItem);
                _buyItem.SetInto(grid);
                _buyItem.SetInfo(_data[i], ClickBuyItem);
                exchangeUIItem_BuyItems.Add(_buyItem);
            }
        }
    }

    /// <summary>
    /// 构建出售模式下的Item ，需要要将 物件转换成 exchangObj结构
    /// </summary>
    private void BuildSellingItem(List<ExchangeObject> _data)
    {
        ClearSellItem();
        int count  =_data.Count;
        for (int i = 0; i < count; i++)
        {
            if (exchangeUIItem_SellItems == null) exchangeUIItem_SellItems = new List<ExchangeUIItem_SellItem>();
            ExchangeUIItem_SellItem _sellItem = AndaDataManager.Instance.InstantiateMenu<ExchangeUIItem_SellItem>(ONAME.ExchangeMenuItem_SellItem);
            _sellItem.SetInto(grid);
            _sellItem.SetInfo(_data[i], ClickSellItem);
            exchangeUIItem_SellItems.Add(_sellItem);
        }
    }

    private void BuildSellingItem(List<ExchangeBusinessCoupon> _data)
    {
        ClearSellItem();
        int count = _data.Count;
        for (int i = 0; i < count; i++)
        {
            if (exchangeUIItem_SellItems == null) exchangeUIItem_SellItems = new List<ExchangeUIItem_SellItem>();
            ExchangeUIItem_SellItem _sellItem = AndaDataManager.Instance.InstantiateMenu<ExchangeUIItem_SellItem>(ONAME.ExchangeMenuItem_SellItem);
            _sellItem.SetInto(grid);
            _sellItem.SetInfo(_data[i], ClickSellItem);
            exchangeUIItem_SellItems.Add(_sellItem);
        }
    }

    private void BuildJIRVISBtn()
    {
        List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>();
        switch (wantTo)
        {
            case 0://当前处于购买项
                jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>()
                {

                    new JIRVISFuncBtnStruct
                    {
                        btnName = "返回" , btnIconKey = ONAME.BackStep , clickCallBack = ClickLevelOut
                    },
                    new JIRVISFuncBtnStruct
                    {
                        btnName = "寄售" , btnIconKey = ONAME.consumableIcon , clickCallBack = ClickWantoSell
                    },
                    new JIRVISFuncBtnStruct
                    {
                        btnName = "消耗品", btnIconKey = ONAME.consumableIcon,clickCallBack = ClickConsumable
                    },
                    new JIRVISFuncBtnStruct
                    {
                        btnName = "星宿" , btnIconKey =  ONAME.MonsterIcon ,clickCallBack = ClickMonsterIcon
                    },
                    new JIRVISFuncBtnStruct
                    {
                        btnName = "卡券" , btnIconKey = ONAME.cardTicket,clickCallBack = ClickActivityCard
                    }

                };

                JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);
                break;
            case 1://当前处于寄售项
                jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>()
                {
                    new JIRVISFuncBtnStruct
                    {
                        btnName = "返回" , btnIconKey = ONAME.BackStep , clickCallBack = BackToWanttoBuy
                    },
                    new JIRVISFuncBtnStruct
                    {
                        btnName = "消耗品", btnIconKey = ONAME.consumableIcon,clickCallBack = ClickConsumable
                    },
                    new JIRVISFuncBtnStruct 
                    {
                        btnName = "星宿" , btnIconKey =  ONAME.MonsterIcon ,clickCallBack = ClickMonsterIcon
                    },
                    new JIRVISFuncBtnStruct
                    {
                        btnName = "卡券" , btnIconKey = ONAME.cardTicket,clickCallBack = ClickActivityCard
                    }
                };

                JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);
                break;
            case 2:
                break;


        }
       
    }

    private void BackToWanttoBuy()
    {
        // ----------  -//

        switch(detialType)
        {
            case 0:

                if(exDataList_BuyConsumable ==null || exDataList_BuyConsumable.Count == 0)
                {
                    if(exDataList_BuyMonster == null || exDataList_BuyMonster.Count == 0)
                    {
                        if(exDataLIst_BuyBSCoupon == null || exDataLIst_BuyBSCoupon.Count == 0)
                        {
                            detialType = 0;
                        }
                        else
                        {
                            detialType =2;
                        }
                    }else
                    {
                        detialType = 1;
                    }
                }else
                {
                    detialType = 0;
                }

                break;
            case 1:
                if (exDataList_BuyMonster == null || exDataList_BuyMonster.Count == 0)
                {
                    if (exDataList_BuyConsumable == null || exDataList_BuyConsumable.Count == 0)
                    {
                        if (exDataLIst_BuyBSCoupon == null || exDataLIst_BuyBSCoupon.Count == 0)
                        {
                            detialType = 0;
                        }
                        else
                        {
                            detialType = 2;
                        }
                    }
                    else
                    {
                        detialType = 0;
                    }
                }
                else
                {
                    detialType = 1;
                }
                break; 
            case 2:
                if (exDataLIst_BuyBSCoupon == null || exDataLIst_BuyBSCoupon.Count == 0)
                {
                    if (exDataList_BuyConsumable == null || exDataList_BuyConsumable.Count == 0)
                    {
                        if (exDataList_BuyMonster == null || exDataList_BuyMonster.Count == 0)
                        {
                            detialType = 0;
                        }
                        else
                        {
                            detialType = 2;
                        }
                    }
                    else
                    {
                        detialType = 0;
                    }
                }
                else
                {
                    detialType = 2;
                }
                break;
        }

        ClickWanttoBuy();
    }

    /// <summary>
    /// 想要购买
    /// </summary>
    private void ClickWanttoBuy()
    {

        lastBuyDetailType =-1;
        ClearSellItem();
        wantTo =  0;
        BuildJIRVISBtn();
        JumpToTargetDetailClass();

    }

    private void ClickToSellWithConsumabl()
    {
        detialType = 0;
        ClickWantoSell();
       
    }
    private void ClickToSellWithMonster()
    {
        detialType =1;
        ClickWantoSell();
       
    }

    private void ClickToSellWithBussinessCoupon()
    {
        detialType = 2;
        ClickWantoSell();
     
    }
    /// <summary>
    /// 想要寄售
    /// </summary>
    private void ClickWantoSell()
    {
        lastSellingDetailType =-1;
        JIRVIS.Instance.CloseTips();

        ClearBuyItem();

        wantTo = 1;

        BuildJIRVISBtn();

        JumpToTargetDetailClass();
       
    }
    /// <summary>
    /// 点击寄售的返回，会默认回到购买界面
    /// </summary>
    private void ClickSellingBackStep()
    {
        ClickWanttoBuy();
    }
    /// <summary>
    /// 点击消耗品
    /// </summary>
    private void ClickConsumable()
    {
        if(wantTo == 0) //购买模式
        {
            #region 构建模式的消耗品列表
          
            if (exDataList_BuyConsumable == null || exDataList_BuyConsumable.Count == 0)
            {
                JIRVIS.Instance.PlayTipsForchoose("这个交易所暂时没什么东西可以出售的，你可以将自己暂时不需要的物品在这里寄售", OTYPE.TipsType.chooseTips, "寄售", "离开", ClickToSellWithConsumabl, ClickLevelOut);
            }
            else
            {
                detialType = 0;
                if (lastBuyDetailType == detialType) return;
                SetTitle();
                lastBuyDetailType = detialType;
                BuildItem(exDataList_BuyConsumable);
            }
            #endregion

        }else //want to  == 1 //寄售模式
        {
            #region 寄售模式的消耗品列表
           
            if(exDataList_SelingConsumable == null || exDataList_SelingConsumable.Count == 0)
            {
                ClearSellItem();
                JIRVIS.Instance.PlayTips("很抱歉，您暂时没有多余的消耗品可以寄售");

            }else
            {
                detialType = 0;
                if (lastSellingDetailType == detialType) return;
                SetTitle();
                lastSellingDetailType = detialType;
                BuildSellingItem(exDataList_SelingConsumable);
            }

            #endregion
        }
    }
    /// <summary>
    /// 构建玩家所有的自由宠物，用于交易
    /// </summary>
    private void ClickMonsterIcon()
    {
        if(wantTo == 0)
        {

            if (exDataList_BuyMonster == null || exDataList_BuyMonster.Count == 0)
            {
                JIRVIS.Instance.PlayTipsForchoose("这个交易所暂时没有可以出售的星宿，你可以将自己暂时不需要的星宿在这里寄售", OTYPE.TipsType.chooseTips, "寄售", "不了", ClickToSellWithMonster, JIRVIS.Instance.CloseTips);
            }
            else
            {
                detialType = 1;
                if (lastBuyDetailType == detialType) return;
                SetTitle();
                lastBuyDetailType = detialType;
                BuildItem(exDataList_BuyMonster);
            }

        }else
        {

            if(exDataList_SellingFreeMonster == null || exDataList_SellingFreeMonster.Count == 0)
            {
                ClearSellItem();
                JIRVIS.Instance.PlayTips("很抱歉，您暂时没有自由星宿可以寄售");
            }
            else
            {
                detialType = 1;
                if (lastSellingDetailType == detialType) return;
                SetTitle();
                lastSellingDetailType = detialType;
                BuildSellingItem(exDataList_SellingFreeMonster);
            }
        }
       

      
    }

    /// <summary>
    /// 构建完加的所有卡券，用于交易
    /// </summary>
    private void ClickActivityCard()
    {
      
        if(wantTo == 0)
        {
           
            if (exDataLIst_BuyBSCoupon == null || exDataLIst_BuyBSCoupon.Count == 0)
            {
                ClearSellItem();
                JIRVIS.Instance.PlayTipsForchoose("这个交易所暂时没有可以出售的商品优惠券，你可以将自己暂时不需要的商品优惠券放在这里寄售", OTYPE.TipsType.chooseTips, "寄售", "不了", ClickToSellWithBussinessCoupon, JIRVIS.Instance.CloseTips);
            }
            else
            {
                detialType = 2;
                if (lastBuyDetailType == detialType) return;
                lastBuyDetailType = detialType;
                SetTitle();
                BuildBuytItemWithCoupon(exDataLIst_BuyBSCoupon);
            }

        }else
        {
           
            if (exDataList_SellingBSCoupon == null || exDataList_SellingBSCoupon.Count == 0)
            {
                JIRVIS.Instance.PlayTips("很抱歉，您暂时没有优惠券可以寄售");
            }
            else
            {
                detialType = 2;
                if (lastSellingDetailType == detialType) return;
                lastSellingDetailType = detialType;
                SetTitle();
                BuildSellingItem(exDataList_SellingBSCoupon);
            }
        }
    }



    private void ClickSellItem(ExchangeObject _item)
    {
        OpenSellBar(_item,null);
    }
    /// <summary>
    /// 这2个方法的名称一样 ，参数不一样，注意区分。这个是用于传券的。另一个是传exchangeobect
    /// </summary>
    /// <param name="_item">Item.</param>
    private void ClickSellItem(ExchangeBusinessCoupon _item)
    {
        OpenSellBar(null,_item);
    }

    /// <summary>
    /// 点击了 _buyItem 的回调，告诉我 是点了哪个 Item
    /// </summary>
    private void ClickBuyItem(int _itemIndex)
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        switch (detialType)
        {
            case 0:
                //传入要购买的Item数据
                OpenBuyBar(exDataList_BuyConsumable.FirstOrDefault(s => s.exchangeObjectIndex == _itemIndex), null);
                break;
            case 1:
                OpenBuyBar(exDataList_BuyMonster.FirstOrDefault(s => s.exchangeObjectIndex == _itemIndex), null);
                break;
            case 2:
                OpenBuyBar(null, exDataLIst_BuyBSCoupon.FirstOrDefault(s => s.exchangeCouponIndex == _itemIndex));
                break;
        }
    }

    /// <summary>
    /// 打开购小面板
    /// </summary>
    private void OpenBuyBar(ExchangeObject exchangeObject , ExchangeBusinessCoupon exchangeBusinessCoupon)
    {
        exchangeMenu_BuyBar.gameObject.SetTargetActiveOnce(true);
        switch (detialType)
        {
            case 0:
            case 1:
                exchangeMenu_BuyBar.SetInfo(ref exchangeObject);
                break;
            case 2:
                exchangeMenu_BuyBar.SetInfo(ref exchangeBusinessCoupon);
                break;
        }
     
    }

    /// <summary>
    /// 打开寄售小面板 , 参数自行扩展
    /// </summary>
    private void OpenSellBar(ExchangeObject exchangeObject , ExchangeBusinessCoupon exchangeBusinessCoupon)
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        exchangeMenu_SellBar.gameObject.SetTargetActiveOnce(true);
        switch (detialType)
        {
            case 0:
            case 1:
                exchangeMenu_SellBar.SetInfo(ref exchangeObject);
                break;
            case 2:
                exchangeMenu_SellBar.SetInfo(ref exchangeBusinessCoupon);
                break;
        }
      
      
    }

    /// <summary>
    /// 购买成功exchangobj
    /// </summary>
    private void CallBackBuyItem(ExchangeObject oldData ,ExchangeObject newData)
    {
        oldData.exchangeStatus = 1;
        int idGroup = AndaDataManager.Instance.GetObjectGroupID(oldData.objectID);
        switch(idGroup)
        {
            case 1000:
                break;
            case 40000:
                //exDataList_BuyConsumable.Remove(oldData);
                ExchangeObject eo = ConvertTool.ConverterConsumableInfoToExchangeObj(newData);
                if(exDataList_SelingConsumable == null) exDataList_SelingConsumable = new List<ExchangeObject>();
                exDataList_SelingConsumable.Add(eo);

                break;
        }
        lastBuyDetailType = -1;//这里是未来更新之后允许再次加载
        JumpToTargetDetailClass();
        JIRVIS.Instance.PlayTips("购买成功");
    }

    private void CallBackBuyItemForExbsCoupon(ExchangeBusinessCoupon oldData, ExchangeBusinessCoupon newData)
    {
        oldData.exchangeStatus = 1;
        //exDataLIst_BuyBSCoupon.Remove(oldData);
        if(exDataList_SellingBSCoupon == null) exDataList_SellingBSCoupon = new List<ExchangeBusinessCoupon>();
        exDataList_SellingBSCoupon.Add(newData);
        lastBuyDetailType = -1;//这里是未来更新之后允许再次加载
        JumpToTargetDetailClass();
        JIRVIS.Instance.PlayTips("购买成功");
    }

    private void CallBackCloseBuyBar()
    {
        BuildJIRVISBtn();
    }

    /// <summary>
    /// 完成寄售上传
    /// </summary>
    private void FinishUploadSellingItem(ExchangeObject oldData , ExchangeObject newData)
    {
      
        ExchangeObject eo = null;
        int idGroup = AndaDataManager.Instance.GetObjectGroupID(oldData.objectID);
        switch (idGroup)
        {
            case 1000:
                eo = ConvertTool.ConvertMonsterInfoToExchangeObj(newData);
                if (exDataList_BuyMonster == null) exDataList_BuyMonster = new List<ExchangeObject>();
                exDataList_BuyMonster.Add(eo);
                TranslateExchangeobjSeatForBuy(ref exDataList_BuyConsumable);
                exDataList_SellingFreeMonster.Remove(oldData);
                break;
            case 40000:
                eo = ConvertTool.ConverterConsumableInfoToExchangeObj(newData);
                if (exDataList_BuyConsumable == null) exDataList_BuyConsumable = new List<ExchangeObject>();
                exDataList_BuyConsumable.Add(eo);
                TranslateExchangeobjSeatForBuy(ref exDataList_BuyMonster);
                if(oldData.objectCount<=0) exDataList_SelingConsumable.Remove(oldData);
                break;
        }

        lastSellingDetailType = -1;//这里是未来更新之后允许再次加载
        //更新一下寄售列表
        JumpToTargetDetailClass();
        //
        JIRVIS.Instance.PlayTips("物品已经成功放入寄售盒子，点击返回您就可以看到啦");
    }

    private void FinishUploadSellingItemForBSCoupon(ExchangeBusinessCoupon oldData , ExchangeBusinessCoupon newData)
    {
        if(exDataLIst_BuyBSCoupon == null) exDataLIst_BuyBSCoupon = new List<ExchangeBusinessCoupon>();
        exDataLIst_BuyBSCoupon.Add(newData);
        TranslateBussinessCouponSeatForBuy(ref exDataLIst_BuyBSCoupon);
        if(oldData.couponCount<=0) exDataList_SellingBSCoupon.Remove(oldData);
        lastSellingDetailType = -1;//这里是未来更新之后允许再次加载
        JumpToTargetDetailClass();
        JIRVIS.Instance.PlayTips("物品已经成功放入寄售盒子，点击返回您就可以看到啦");
    }

    /// <summary>
    /// 这个接口用于购买成功后，更新列表的数量，把整个列表都传一遍，重新构建一遍，由于多种情
    /// </summary>
    private void UpdateItem(ExchangeObject _exchangeObjects)
    {
       
        /*
        int count = exchangeInfo.exchangeObjects.Count;
        for(int i = 0 ; i <count; i++)
        {
            if(exchangeInfo.exchangeObjects[i].exchangeObjectIndex == _exchangeObjects.exchangeObjectIndex)
            {
                int lessCount = exchangeInfo.exchangeObjects[i].objectCount - _exchangeObjects.objectCount;
                if(lessCount <=0)
                {
                    exchangeInfo.exchangeObjects.RemoveAt(i);
                }else
                {
                    exchangeInfo.exchangeObjects[i].objectCount = lessCount;
                }

                break;
            }
        }*/

        //重新构建item
        //BuildItem(exchangeInfo.exchangeObjects);
    }

    private void JumpToTargetDetailClass()
    {
        switch(detialType)
        {
            case 0:
                ClickConsumable();
                break;
            case 1:
                ClickMonsterIcon();
                break;
            case 2:
                ClickActivityCard();
                break;
        }
    }

    public void SetTitle()
    {
        if(wantTo == 0)
        {
            switch(detialType)
            {
                case 0:
                    title.text = "待交易的消耗品";
                    break;
                case 1:
                    title.text = "待交易的自由星宿";
                    break;
                case 2:
                    title.text = "待交易的奖励券";
                    break;
            }
        }else 
        {
            switch (detialType)
            {
                case 0:
                    title.text = "我的消耗品";
                    break;
                case 1:
                    title.text = "我的自由星宿";
                    break;
                case 2:
                    title.text = "我的奖励券";
                    break;
            }
        }
    }
}
