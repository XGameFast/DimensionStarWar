using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectDimensionRoomSetMonster : UIBasic2 {


    public Transform grid;

    public Transform selectMask;

    public GameObject comfirmBtn;

    private List<Item_SetMonsterToSelectDimensionRoomItem> itemList;

    public PlayerMonsterAttribute selectMonsterAttribute;
    private PlayerStrongholdAttribute selectStrongholdAttribute;

    public System.Action clickCloseBar;



    public override void OnDispawn()
    {
        selectMask.gameObject.SetTargetActiveOnce(false);
        selectMask.SetInto(transform);
        if (itemList !=null)
        {
            int count = itemList.Count;
            for(int i = 0; i <count; i++)
            {
                AndaDataManager.Instance.RecieveItem(itemList[i]);
            }
            itemList.Clear();
        }

        selectMonsterAttribute = null;
        selectStrongholdAttribute = null;

        SetComfirmBtnState(false);
        base.OnDispawn();
    }


    public void SetInfo(PlayerMonsterAttribute _pma)
    {
        selectMonsterAttribute = _pma;
        BuildDimensionRoom();
    }


    private void BuildDimensionRoom()
    {

        List<PlayerStrongholdAttribute> pmaList =AndaDataManager.Instance.GetPlayerAllStrongholdAttribute();
        List<PlayerStrongholdAttribute> tmp = new List<PlayerStrongholdAttribute>();
        List<PlayerStrongholdAttribute> tmp2 = new List<PlayerStrongholdAttribute>();
        int count = pmaList.Count;
        for(int i = 0; i < count; i++)
        {
            if(pmaList[i].monsterCount< pmaList[i].playerStrongholdCapacity)
            {
                tmp.Add(pmaList[i]);
            }else
            {
                tmp2.Add(pmaList[i]);
            }
        }

        pmaList = new List<PlayerStrongholdAttribute>();
        pmaList.AddRange(tmp);
        pmaList.AddRange(tmp2);

        count = pmaList.Count;

        for(int i = 0 ; i< count; i ++)
        {
            Item_SetMonsterToSelectDimensionRoomItem _item = AndaDataManager.Instance.InstantiateMenu<Item_SetMonsterToSelectDimensionRoomItem>(ONAME.Item_SetMonsterToSelectDimensionRoomItem);
            _item.SetInto(grid);
            _item.SetInfo(pmaList[i]);
            _item.callbackSelect = ClickItem;
            if (itemList == null) itemList= new List<Item_SetMonsterToSelectDimensionRoomItem>();
            itemList.Add(_item);
        }
    }


    private void ClickItem(Item_SetMonsterToSelectDimensionRoomItem _item)
    {
        int _index = itemList.IndexOf(_item);
        selectMask.gameObject.SetTargetActiveOnce(true);
        selectMask.SetInto(_item.transform);
        //selectMask.transform.position = itemList[_index].transform.position;
        if(itemList[_index].pma.monsterCount < itemList[_index].pma.playerStrongholdCapacity)
        {
            selectStrongholdAttribute = _item.pma;
            SetComfirmBtnState(true);
        }
        else
        {
            JIRVIS.Instance.PlayTips("这个占星庭已经满了，换一个");
            SetComfirmBtnState(false);
        }
    }


    private void SetComfirmBtnState(bool isOpen)
    {
        comfirmBtn.gameObject.SetTargetActiveOnce(isOpen);
    }


    public void ClickComfrimBtn()
    {
        if(selectStrongholdAttribute!=null)
        {
            CallSereverSetMonsterToStronghold();
        }
    }
    public void ClickCloseBar()
    {
        if (clickCloseBar != null)
        {
            clickCloseBar();
        }
    }
    private void CallSereverSetMonsterToStronghold()
    {
         
        AndaDataManager.Instance.CallServerInsertMonsterToStronghold(selectMonsterAttribute.monsterIndex, selectStrongholdAttribute.strongholdIndex,selectMonsterAttribute.monsterNickName, FinishSetMonsterToStronghold);
    }

    private void FinishSetMonsterToStronghold(bool isSuccess)
    {
        if(isSuccess)
        {
            AndaDataManager.Instance.RecieveItem(this);
        }else
        {
            JIRVIS.Instance.PlayTips("请检查网络");
        }
    }


  
}
