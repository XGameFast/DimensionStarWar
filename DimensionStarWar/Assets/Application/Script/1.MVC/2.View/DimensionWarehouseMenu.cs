using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
public class DimensionWarehouseMenu : UIBasic2 {


    public Transform grid;
    List<DimensionWareHouseChildItem> dimensionWareHouseChildItems =new List<DimensionWareHouseChildItem>();
   
    private Dictionary<int , int> monsterDatas;

    //private Dictionary<>
    public Animator centerItemGroup;
    public Image centerImage;
    public Text centerItemName;
    public Text centerItemCount;
    public Transform monsterPoint;

    private MonsterBasic monsterBasic;
    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
    }



    public override void OnDispawn()
    {

        ClearMonsterData();
        ClearItems();

        base.OnDispawn();
    }


    private void ClearMonsterData()
    {
        if(monsterDatas!=null)
        {
            monsterDatas.Clear();
        }
    }

 
    private void ClearItems()
    {
        if(dimensionWareHouseChildItems!=null && dimensionWareHouseChildItems.Count!=0)
        {
            int count = dimensionWareHouseChildItems.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(dimensionWareHouseChildItems[i]);
            }

            dimensionWareHouseChildItems.Clear();
        }
       
    }

    #region 构建自由宠物

    /// <summary>
    /// 现把配置表里的宠物信息加载出来，然后对比玩家已经拥有的宠物，顺便判断一下哪些是自由宠物，将数据结构按照有到无排
    /// </summary>
    public void BuildMonsterItem()
    {
        if(monsterDatas == null)
        {
            monsterDatas = new Dictionary<int, int>();
            List<PlayerMonsterAttribute> mineMonster = AndaDataManager.Instance.userData.userMonsterList;
            int count = mineMonster.Count;
            for (int i = 0; i < count; i++)
            {

                if (monsterDatas.ContainsKey(mineMonster[i].monsterID))
                {
                    monsterDatas[mineMonster[i].monsterID] += 1;
                }
                else
                {
                    monsterDatas.Add(mineMonster[i].monsterID, 1);
                }
            }
            //然后编辑整个配置表，把没有的添加进来
            List<MonsterBaseConfig> mbcList = MonsterGameData.GetUserMonsterBaseConfigList();
            int mbccount = mbcList.Count;
            for(int i = 0 ; i < mbccount; i++)
            {
                if(!monsterDatas.ContainsKey(mbcList[i].monsterID))
                {
                    monsterDatas.Add(mbcList[i].monsterID,0);
                }
            }
             
        }
        //把物件清理一下然后构建宠物物件
        ClearItems();

        List<PlayerMonsterAttribute> freeMonster = AndaDataManager.Instance.GetUserFreesMonster();
        int freemCount = freeMonster != null && freeMonster.Count!=0? freeMonster.Count : 0;
        foreach (var go in monsterDatas.Keys)
        {
            DimensionWareHouseChildItem _item = AndaDataManager.Instance.InstantiateMenu<DimensionWareHouseChildItem>("DimensionWarehouseChild");
            _item.SetCallBack(ClickItem);
            _item.transform.SetInto(grid);
            MonsterBaseConfig mbc = MonsterGameData.GetMonsterBaseConfig(go);
            _item.SetNameAndCount(mbc.monsterName, monsterDatas[go], mbc.monsterID.ToString());
            if(monsterDatas[go] != 0)
            {
                //玩家拥有这个 星宿，
                _item.SetImageColorful();

                if (freemCount!=0)
                {
                    _item.SetRedPointState(false);
                    for (int i = 0;  i < freemCount; i++)
                    {
                        //当前这对星宿有自由宠物
                        if(freeMonster[i].monsterID == go) //当前这只是自由宠物
                        {
                            _item.SetRedPointState(true);
                            break;
                        }

                        //_item.SetRedPointState(freeMonster[i].monsterID == go);
                    }

                    //_item.SetRedPointState(false);
                }
                else
                {
                    _item.SetRedPointState(false);
                }
            }else //说明这个角色是没有的
            {
                _item.SetImageBlack();
                _item.SetRedPointState(false);
            }

            dimensionWareHouseChildItems.Add(_item);
        }
    }
    #endregion

    #region 构建消耗品 除金币外

    public void BuildCoumsable()
    {
        ClearItems();
        List<UserObjsBox> UserObjsBoxs = AndaDataManager.Instance.userData.GetConsumableListExceptCurrency();
        int count = UserObjsBoxs.Count;
        for (int i = 0 ; i < count; i++)
        {
            UserObjsBox uob = UserObjsBoxs[i];
            DimensionWareHouseChildItem _item = AndaDataManager.Instance.InstantiateMenu<DimensionWareHouseChildItem>("DimensionWarehouseChild");
            _item.SetCallBack(ClickItem);
            _item.transform.SetInto(grid);
            CD_ObjAttr cD_ObjAttr = MonsterGameData.GetCD_ObjAttr(uob.id);
            _item.SetNameAndCount(cD_ObjAttr.objectName[uob.lD_Objs[0].objSmallID], uob.count, uob.id.ToString());
            dimensionWareHouseChildItems.Add(_item);
        }
       
    }

    #endregion

    /*public void BuildConsumbaleItem()
    {
        int count = MonsterGameData.objectsList.Count;
        for(int i = 0 ; i < count ; i++)
        {
            int idType = MonsterGameData.objectsList[i].objectID;// 这里的objectID = idType
            BuildObjItem(idType);
        }
    }

    public void BuildObjItem(int objType)
    {
        CD_ObjAttr cD_ObjAttr  = MonsterGameData.GetCD_ObjAttrs(objType);
        if(cD_ObjAttr.values.Count <=0)return;
        AndaObjectBasic itemBoard = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic> ("largeBox");
        itemBoard.transform.GetComponentInChildren<Text>().text = AndaDataManager.Instance.GetIDTypeName(objType);
        itemBoard.SetInto(grid.transform);
        itemboards.Add(itemBoard);
        int itemCount = cD_ObjAttr.values.Count;
        for(int i = 0 ; i < 15; i++)
        {
            DimensionWareHouseChildItem _item = AndaDataManager.Instance.InstantiateMenu<DimensionWareHouseChildItem> ("DimensionWarehouseChild");
            _item.SetCallBack(ClickItem);
            Transform t = itemBoard.transform.GetChild(0).GetChild(i).transform;
            _item.transform.SetUIInto(t);
            if(i >= itemCount)
            {
                _item.SetNameAndCount("未知", 0 ,"kong");
            }else
            {
                bool had = AndaDataManager.Instance.CheckUserHasThiComsumableItem(cD_ObjAttr.objectID + i);
                if(had)
                {

                     int count = AndaDataManager.Instance.userData.userObjs[cD_ObjAttr.objectID].FirstOrDefault(s=>s.id == cD_ObjAttr.objectID + i).count;
                    _item.SetNameAndCount(cD_ObjAttr.objectName[i], count, (cD_ObjAttr.objectID + i).ToString());
                }else
                {
                    _item.SetNameAndCount("未知", 0 ,"kong");
                }
            }
          
            dimensionWareHouseChildItems.Add( _item );
        }   

    }

    private void CheckBox(int maxCount ,CD_ObjAttr cD_ObjAttr , int count)
    {

        Debug.Log("maxCount" +maxCount);
        //计算出要循环的次数
        float per = cD_ObjAttr.values.Count / (float)maxCount;
        Debug.Log("itemCount" + cD_ObjAttr.values.Count);
        //Debug.Log("roundTimes" + roundTimes);
        if(per <= 1) //代表这种框的可填充的数量足够
        {
            int type = maxCount ==5?0 : maxCount == 10? 1: 2;
            string boardName =boardNamelist[type];
            AndaObjectBasic itemBoard = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic> (boardName);
            itemBoard.SetInto(grid.transform);
            Vector3 tmpPose = itemBoard.transform.localPosition ;
            tmpPose.y = lastPoseY + (lastboardType == -1 ? 0 :  cellDistance[lastboardType]);
            itemBoard.transform.localPosition = tmpPose;
            lastPoseY = tmpPose.y ;
            lastboardType = type;
            int itemCount = cD_ObjAttr.values.Count;
            //contentSizeFitter.enabled = true;
            Debug.Log("itemCount"+ itemCount + ":boardName" + boardName);
            for(int i = 0 ; i < itemCount; i++)
            {
                Debug.Log("ID:" + (cD_ObjAttr.objectID + i));
                GameObject _item = AndaDataManager.Instance.GetSpritePerfab((cD_ObjAttr.objectID + i).ToString());
                _item = _item.Clone();
                Transform t = itemBoard.transform.GetChild(0).GetChild(i).transform;
                _item.transform.SetUIInto(itemBoard.transform.GetChild(0).GetChild(i).transform);
                DimensionWareHouseChildItem _itemScript = _item.GetComponent<DimensionWareHouseChildItem>();
               // _itemScript.SetNameAndCount(cD_ObjAttr.objectName[i],count);
                dimensionWareHouseChildItems.Add(_itemScript);
            }   

            //contentSizeFitter.enabled = false;
        }else
        {
            maxCount+=5;
            CheckBox( maxCount , cD_ObjAttr , count);
        }
    }*/

    private void SetCenterImage(Sprite sprite, string itemName, string itemsCount)
    {
        centerImage.sprite = sprite;
        centerItemName.text =itemName;
        centerItemCount.text = itemsCount;
        if(!centerItemGroup.gameObject.activeSelf)
        {
            centerItemGroup.gameObject.SetActive(true);
        }
    }

    public void SetPlayerConpon()
    {

    }



    private void ClickItem(int itemID)
    {

        int idType = AndaDataManager.Instance.GetObjectGroupID(itemID);
        switch(idType)
        {
            case -1:
               
                break;
            case 1000:
                BuildMonsterItem(itemID);
                break;
            case 40000:
                centerItemGroup.gameObject.SetActive(false);
                DimensionWareHouseChildItem dimensionWareHouseChildItem = dimensionWareHouseChildItems.FirstOrDefault(s => s.itemID == itemID);
                SetCenterImage(dimensionWareHouseChildItem.sprite.sprite, dimensionWareHouseChildItem.itemNameText.text, dimensionWareHouseChildItem.countText.text);
                break;
            default:
                break;
        }


      /*  int idType =AndaDataManager.Instance.GetObjTypeID(itemID);
        //如果点击的是宠物，那么检查一下这个选中宠物类别中是否有为插入据点的
        if(idType == 1000)
        {
            PlayerMonsterAttribute playerMonsterAttribute = AndaDataManager.Instance.userData.GetFreeMonster().FirstOrDefault(s => s.monsterID == itemID);
            //打开编辑宠物面板
            if (playerMonsterAttribute != null)
            { 
                JIRVIS.Instance.BuildEditorBarForMonsterChangeNameOrBelongStorngholdIndex(playerMonsterAttribute,-1,null,null);
            }
            else //打开详情面板
            {
                JIRVIS.Instance.BuildEditorBarForItemInformation(itemID);
            }
        }else
        {
            JIRVIS.Instance.BuildEditorBarForItemInformation(itemID);
        }*/
    }

    private void BuildMonsterItem(int id)
    {
        if (monsterBasic != null) AndaDataManager.Instance.RecieveItem(monsterBasic);
        if (monsterDatas[id] != 0)
        {
            monsterBasic = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(id.ToString());
            monsterBasic.SetInto(monsterPoint);
            monsterBasic.gameObject.SetLayer(ONAME.LayerUI);
        }
        else
        {
            //----
            Debug.Log("这个东西没有");
        }
    }
}

