using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
public class BuildDimensionRoomMenu : UIBasic2 {

    public Transform itemPoint;
    public GridLayoutGroup gridLayoutGroup;
    public ScrollRect scrollRect;
    public RectTransform contentTransform;
    public RectTransform viewPointTransform;
    private BuildDimensionRoomController buildDimensionRoomController;
    public BuildDimensionMenu_RoomInfoBar buildDimensionMenu_RoomInfoBar;
    public BuildDimensionMenu_RoomAddtionBar buildDimensionMenu_RoomAddtionBar;
    public CanvasGroup VVItem;
    public Transform uiBotPoint;
    public List<BuildDimensionMenu_RoomInfoBar> infoItems;

    public BuildDimensionMenu_MonsterInforBar buildDimensionMenu_MonsterInforBar;
    public CanvasGroup itemGroupBoard;

    public CanvasGroup backStroy;

    public override void OnDispawn()
    {
        ClearItem();
        //buildDimensionRoomController.data.RemoveDimensionMenu_RoomInfoBars();
        base.OnDispawn();
    }

    public void OpenItemGroup(bool isOpen , System.Action callback = null)
    {
        if(isOpen)
        {
            StartCoroutine(ExcuteOpneItemGroup(callback));
        }else
        {
            StartCoroutine(ExcuteCloseItemGroup(callback));
        }
    }

    private IEnumerator ExcuteOpneItemGroup(System.Action callback)
    {
        int count = infoItems.Count;
        for (int i = 0; i < count; i++)
        {
            infoItems[i].gameObject.SetTargetActiveOnce(true);
        }

        float t = 0;
        while(t < 1)
        {
            t+= Time.deltaTime;
            t = Mathf.Clamp01(t);
            itemGroupBoard.alpha = t ;
            yield return null;   
        }

        if(callback!=null)
        {
            callback();
        }
    }

    private IEnumerator ExcuteCloseItemGroup(System.Action callback)
    {
        float t =  1;
        while(t > 0)
        {
            t -= Time.deltaTime;
            t = Mathf.Clamp01(t);
            itemGroupBoard.alpha = t;
            yield return null;
        }

        if(callback!= null)
        {
            callback();
        }

        int count = infoItems.Count;
        for(int i = 0 ; i <count ;i++)
        {
            infoItems[i].gameObject.SetTargetActiveOnce(false);
        }
    }


    public void ClearItem()
    {
        if(infoItems == null || infoItems.Count == 0)return;
        foreach(var go in infoItems)
        {
            Destroy(go.gameObject);
        }

        infoItems.Clear();

    }


    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
       
        buildDimensionRoomController =_baseController as  BuildDimensionRoomController;
    }

    public void BuildInfoBar(List<PlayerStrongholdAttribute> playerStrongholdAttributes, System.Action callbcak , System.Action addtionCallback ,System.Action<int,int> dragFinish)
    {
        int count = playerStrongholdAttributes.Count;
        for(int i = 0 ; i < count; i++)
        {
            GameObject item = buildDimensionMenu_RoomInfoBar.Clone();
            item.SetTargetActiveOnce(true);
            item.name = playerStrongholdAttributes[i].strongholdIndex.ToString();
            BuildDimensionMenu_RoomInfoBar b = item.GetComponent<BuildDimensionMenu_RoomInfoBar>();
            b.SetValue(i, playerStrongholdAttributes[i],callbcak,this,dragFinish);
            item.transform.SetUIInto(uiBotPoint.transform);
            item.transform.SetAsFirstSibling();
            AddItem(b);
        }

        GameObject addtionItem = buildDimensionMenu_RoomInfoBar.Clone();
        addtionItem.SetTargetActiveOnce(true);
        addtionItem.name = "Addtion";
        BuildDimensionMenu_RoomInfoBar rb = addtionItem.GetComponent<BuildDimensionMenu_RoomInfoBar>();
        rb.SetAdditionBar(count,dragFinish,addtionCallback);
        addtionItem.transform.SetUIInto(uiBotPoint.transform);
        addtionItem.transform.SetAsFirstSibling();
        AddItem(rb);
      
        /*GameObject additionItem = buildDimensionMenu_RoomAddtionBar.Clone();
        additionItem.SetTargetActiveOnce(true);
        additionItem.GetComponent<BuildDimensionMenu_RoomAddtionBar>().SetCallBack(addtionCallback);
        //SetItemToGridlayoutGroup(additionItem.gameObject);
        additionItem.transform.SetUIInto(uiBotPoint.transform);
        AddItem(additionItem.GetComponent<AndaObjectBasic>());*/
       
    }


    
    public void SetItemToItemPoint(Transform item)
    {
        item.SetInto(itemPoint);
    }

    public void SetItemToGridlayoutGroup(GameObject item)
    {
        item.transform.SetUIInto(gridLayoutGroup.transform);
    }


    public void FadeOutofVVItem()
    {
        VVItem.alpha = 0;    
    }

    public void FadeInofVVItem()
    {
        VVItem.alpha = 1;   
    }
    public void ShowCurrentItem(int index)
    {
        //RectTransform rectTransform =  infoItems[index].GetComponent<RectTransform>();
        //CenterOnItem(rectTransform,scrollRect,viewPointTransform,contentTransform);
       
    }

    public void OffsetBar(float value , int _index)
    {
        Vector3 vector3 = infoItems[_index].transform.eulerAngles;
        vector3.z = value;
        infoItems[_index].transform.eulerAngles = vector3;
    }

    public void CloseBoard(float value , int _index)
    {
        infoItems[_index].GetComponent<BuildDimensionMenu_RoomInfoBar>().CloseBoard(value);
      
    }

    public void DisplayItem(float value , int _index)
    {
        infoItems[_index].GetComponent<BuildDimensionMenu_RoomInfoBar>().Fade(value);
    }

    public void DisplayTower(bool isDisplay, int _index)
    {
        infoItems[_index].GetComponent<BuildDimensionMenu_RoomInfoBar>().DisplayTower(isDisplay);
    }

    public void ShowCurrentItemInfo(int index)
    {
        infoItems[index].Fade(1);

        infoItems[index].PlayInfo();
    }

    /*public void ShowItem(RectTransform rectTransform)
    {
        CenterOnItem(rectTransform,scrollRect,viewPointTransform,contentTransform);
    }*/

    public void PlayInfo(BuildDimensionMenu_RoomInfoBar _item)
    {
        _item.PlayInfo();
    }

    public void PlayCurrentItemEnterStarmap(int _index)
    {
        infoItems[index].PlayItemEnterStarMap();
    }

    private void AddItem(BuildDimensionMenu_RoomInfoBar andaObject)
    {
        if(infoItems == null)infoItems = new List<BuildDimensionMenu_RoomInfoBar>();
        infoItems.Add(andaObject);
    }

    public void PauseFingervent(bool isPause)
    {
        buildDimensionRoomController.PauseFingEvent(isPause);
    }

    public void DisplayMonsterInfo(PlayerMonsterAttribute playerMonster)
    {
        if(buildDimensionMenu_MonsterInforBar!=null)
        {
            if(!buildDimensionMenu_MonsterInforBar.gameObject.activeSelf)
            {
                buildDimensionMenu_MonsterInforBar.gameObject.SetTargetActiveOnce(true);
                buildDimensionMenu_MonsterInforBar.GetComponent<Animator>().Play("FadeIn");
            }

            buildDimensionMenu_MonsterInforBar.SetInfo(playerMonster);
        }
    }
    public void CloseMonsterInfo()
    {
        buildDimensionMenu_MonsterInforBar.gameObject.SetTargetActiveOnce(false);
    }


    public void OpenBackgroundStroyBar(bool isOpen)
    {
        if(isOpen)
        {
            
            StartCoroutine(ExcuteOpen());   
       
        }else
        {
            backStroy.gameObject.SetActive(false);
         
        }
    }

    public void ClickEnterStarMap()
    {
        buildDimensionRoomController.ClickAddStrongholdButton();
    }

    private IEnumerator ExcuteOpen()
    {
        backStroy.gameObject.SetActive(true);
        float t =0 ;
        while(t <1 )
        {
            t += Time.deltaTime;
            t = Mathf.Clamp01(t);
            backStroy.alpha = t;
            yield return null;
        }
    }
    public void DelMonster()
    {
        buildDimensionRoomController.DelMonster();
    }

   
}
