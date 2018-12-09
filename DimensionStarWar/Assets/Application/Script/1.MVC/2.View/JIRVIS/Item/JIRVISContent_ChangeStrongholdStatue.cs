using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISContent_ChangeStrongholdStatue : UIBasic2 {


    //----scrollview--
    public GridLayoutGroup gridLayoutGroup;
    public ScrollRect scrollRect;
    public RectTransform contentTransform;
    public RectTransform viewPointTransform;
    //----

    public GameObject itemPrefab;
    public Transform towerPoint;
    private List<GameObject> items;
    private List<TowerBase> towerBases;
    private bool canControl =false;
    private int currentItemIndex = -1;
    private System.Action<int> callbcakSelectItem;
    #region 逻辑
    public override void OnDispawn()
    {
        FingerEvent.HoriDrag -= CallbcakDragItem;
        RecieveItems();
        base.OnDispawn();
       
    }

    #endregion

    #region 执行

    private void RecieveItems()
    {
        if(towerBases!=null)
        {
            int count = towerBases.Count;
            for(int i = 0 ; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(towerBases[i]);
            }
        }
        foreach(var go in items)
        {
            Destroy(go);
        }
        items.Clear();
    }

    public void SetInfo(List<int> monsterIDs , int strongholdLevel , System.Action<int> callbackSelect)
    {
        callbcakSelectItem = callbackSelect;
        int _strongholdID = (int)OTYPE.ObjectsIDType.stronghold + strongholdLevel;
        BuildItem(monsterIDs , _strongholdID);
        BuildFingerEvent();
    }

    public void CloseBar()
    {
        AndaDataManager.Instance.RecieveItem(this);
    }



    private void BuildFingerEvent()
    {
        FingerEvent.HoriDrag += CallbcakDragItem;
    }


    private void AddItem(GameObject _item ,TowerBase _towerbase)
    {
        if(items == null )items = new List<GameObject>();
        if(towerBases == null) towerBases = new List<TowerBase>();
        items.Add(_item);
        towerBases.Add(_towerbase);
    }
    private void BuildItem(List<int> monsterIDs , int towerID)
    {
        int count = monsterIDs.Count;
        for(int i = 0 ; i< count; i++)
        {
            GameObject _item = itemPrefab.Clone();
            _item.transform.SetUIInto(gridLayoutGroup.transform);
            StrongholdBaseAttribution strongholdBaseAttribution = new StrongholdBaseAttribution()
            {
                strongholdID = towerID,
                statueID = monsterIDs[i]
            };

            TowerBase _towerBase = AndaDataManager.Instance.InstantiateTower<TowerBase>(towerID.ToString());
            _towerBase.SetInfo(strongholdBaseAttribution); 
            _towerBase.SetInto(_item.transform.Find("monsterPoint"));
            _item.SetLayer(ONAME.LayerHoloUI);
            AddItem(_item,_towerBase);
        }

        ShowItem(0);
    }


    private void ShowItem(int _index)
    {
        currentItemIndex = _index;
        CenterOnItem(items[_index].GetComponent<RectTransform>(),scrollRect,viewPointTransform,contentTransform);
        towerBases[_index].SkinStone(true);
        callbcakSelectItem(towerBases[_index].getStrongholdStatusID);
    }


    private void Update()
    {
        if(!canControl)return;
        FingerEvent.OnUpdate();
    }



    #endregion


    #region 回调

    private void CallbcakDragItem(int dir)
    {
        if(dir == 0)
        {
            if(currentItemIndex-1 < 0)return;
            ShowItem(currentItemIndex -1);
        }else
        {
            if(currentItemIndex + 1 > items.Count-1)return;
            ShowItem(currentItemIndex+1 );
        }
    }


    #endregion

}
