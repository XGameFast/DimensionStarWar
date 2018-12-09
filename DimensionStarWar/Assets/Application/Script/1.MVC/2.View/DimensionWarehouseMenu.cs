using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
public class DimensionWarehouseMenu : UIBasic2 {


    public Transform grid;
    List<AndaObjectBasic> itemboards = new List<AndaObjectBasic>();
    List<DimensionWareHouseChildItem> dimensionWareHouseChildItems =new List<DimensionWareHouseChildItem>();
    public ContentSizeFitter contentSizeFitter;
    public float smallCell;
    public float midCell;
    public float largeCell;

    public GameObject setMonsterToStrongholdBtn;

    public List<string> boardNamelist  = new List<string>
    {
        "smallBox" , "midBox" , "largeBox"
    };
    public List<float> cellDistance;
    private int lastboardType;
    private float lastPoseY;


    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
    }

    public override void OnDispawn()
    {

        if(dimensionWareHouseChildItems.Count!=0)
        {
            int count = dimensionWareHouseChildItems.Count;
            for(int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(dimensionWareHouseChildItems[i]);
            }

            dimensionWareHouseChildItems.Clear();
        }

        if(itemboards.Count!=0)
        {
            int count = itemboards.Count;
            for(int i = 0; i < count; i ++)
            {
                AndaDataManager.Instance.RecieveItem(itemboards[i]);
            }

            itemboards.Clear();
        }

        base.OnDispawn();

    }

    public void BuildMonsterItem()
    {
        int count = MonsterGameData.gameBaseMonsterAttributeList.Count;
        if(count <=0 )return;
        AndaObjectBasic itemBoard = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic> ("largeBox");
        itemBoard.transform.GetComponentInChildren<Text>().text = AndaDataManager.Instance.GetIDTypeName(1000);
        itemBoard.SetInto(grid.transform);
        itemboards.Add(itemBoard);
        for (int i = 0 ; i < 15; i++)
        {
            DimensionWareHouseChildItem _item = AndaDataManager.Instance.InstantiateMenu<DimensionWareHouseChildItem> ("DimensionWarehouseChild");
            _item.SetCallBack(ClickItem);
            Transform t = itemBoard.transform.GetChild(0).GetChild(i).transform;
            _item.transform.SetUIInto(t);
            if(i >= count)
            {
                _item.SetNameAndCount("未知", 0 ,"kong");
            }else
            {
                MonsterBaseConfig monsterBaseConfig = MonsterGameData.gameBaseMonsterAttributeList[i];
                bool had = AndaDataManager.Instance.userData.userMonsterList.FirstOrDefault(s=>s.monsterID == monsterBaseConfig.monsterID)!=null;
                if(had)
                {
                    _item.SetNameAndCount(monsterBaseConfig.monsterName,0 ,monsterBaseConfig.monsterID.ToString());
                }else
                {
                    _item.SetNameAndCount("未知", 0 ,"kong");
                }
            }

            dimensionWareHouseChildItems.Add( _item );
        }
    }
   
    public void BuildConsumbaleItem()
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
    }

    private void ClickItem(int itemID)
    {
        int idType =AndaDataManager.Instance.GetObjTypeID(itemID);
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
        }
    }
}
