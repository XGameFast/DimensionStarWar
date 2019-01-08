using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
public class Table_SelectItemToSearch : UIBasic2 {

    public Image CenterImage;
    public Text centerItemName;
    public Image[] itemSprites;
    public Transform centerGroup;
    public Transform tableCenterPoint;
    public Transform tableEdgePoint;
    public Transform tableItem;
    private List<UserObjsBox> bloodBottleProps;
    private List<UserObjsBox> searchProps;
    private List<UserObjsBox> luckyProps;
    private List<DimensionRoomItem_Info> dimensionRoomItem_Infos;
    public Transform[] itemPoints;

    private int curIndex =-1;
    private int typeIndex=-1;
    private int[] selectItemIndex;

    public void SetInfo()
    {
        Invoke("InvockExcute" ,1f);
    }

    private void InvockExcute()
    {
        if (typeIndex == -1)
        {
            selectItemIndex=new int[3]{0,0,0};
            JIRVIS.Instance.PlayTips("您可以为星宿佩戴探索装备，可以探索更为稀有的东西哦！");
            SelectType(0);

        } //else SelectType(typeIndex);
    }


    public void SelectType(int type)
    {
        if(typeIndex == type)return;
        typeIndex = type;
        switch (type)
        {
            case 0: //雪瓶
                if(bloodBottleProps == null || bloodBottleProps.Count == 0) 
                {
                    bloodBottleProps = AndaDataManager.Instance.userData.GetRecoveryList();
                    JIRVIS.Instance.PlayTips("为星宿配备志力药水，让其更探索更持久：）");

                    if (bloodBottleProps == null || bloodBottleProps.Count == 0)
                    {
                        JIRVIS.Instance.PlayTips("暂时没有意志力药水，好可惜呀！");
                        return;
                    }
                }

                BuildBloodbottleItems();

                break;
            case 1: //探测器
                if (searchProps == null || searchProps.Count == 0)
                {
                    searchProps = AndaDataManager.Instance.userData.GetMonsterSearchList();
                    JIRVIS.Instance.PlayTips("为星宿装配探测器，有利于发现意想不到的东西哦）");
                    if (searchProps == null || searchProps.Count == 0)
                    {
                        JIRVIS.Instance.PlayTips("暂时没有相关装备，好可惜呀！");
                        return;
                    }
                }   
              
                BuildSearchItems();
               
                break;
            case 2: //幸运物
                if (luckyProps == null || luckyProps.Count == 0)
                {
                    luckyProps = AndaDataManager.Instance.userData.GetLuckyObjectList();
                    JIRVIS.Instance.PlayTips("为星宿佩戴幸运物，开过光的哦");
                    if (luckyProps == null || luckyProps.Count == 0)
                    {
                        JIRVIS.Instance.PlayTips("暂时没有相关的幸运物，好可惜呀！");
                        return;
                    }
                }
                  
                BuildLuckyItmes();
             
                break;
        }
    }

   
    /// <summary>
    /// 构建类别物件
    /// </summary>
    /// <param name="userObjsBox">User objects box.</param>
    private void BuildBloodbottleItems()
    {
        ClearItems();
        int count = bloodBottleProps.Count;
        for (int i = 0 ; i < count; i++)
        {
            if( i > 6 )return;
            DimensionRoomItem_Info dimensionRoomItem_Info = AndaDataManager.Instance.InstantiateMenu<DimensionRoomItem_Info>(ONAME.DimensionRoomItem_tableItemInfo);
            dimensionRoomItem_Info.SetInto(transform);
            //dimensionRoomItem_Info.transform.eulerAngles = new Vector3(-63f,0,0);
            dimensionRoomItem_Info.SetInfo(bloodBottleProps[i]);
            dimensionRoomItem_Info.transform.position = itemPoints[i].position;
            dimensionRoomItem_Info.callback = ScrollTable;
            if (dimensionRoomItem_Infos == null) dimensionRoomItem_Infos =new List<DimensionRoomItem_Info>();
            dimensionRoomItem_Infos.Add(dimensionRoomItem_Info);
        }

        Repositon();

    }

    private void BuildSearchItems()
    {
        ClearItems();
        int count = searchProps.Count;
        for (int i = 0; i < count; i++)
        {
            if (i > 6) return;
            DimensionRoomItem_Info dimensionRoomItem_Info = AndaDataManager.Instance.InstantiateMenu<DimensionRoomItem_Info>(ONAME.DimensionRoomItem_tableItemInfo);
            dimensionRoomItem_Info.SetInto(transform);
            //dimensionRoomItem_Info.transform.eulerAngles = new Vector3(-63f,0,0);
            dimensionRoomItem_Info.SetInfo(searchProps[i]);
            dimensionRoomItem_Info.transform.position = itemPoints[i].position;
            dimensionRoomItem_Info.callback = ScrollTable;
            if (dimensionRoomItem_Infos == null) dimensionRoomItem_Infos = new List<DimensionRoomItem_Info>();
            dimensionRoomItem_Infos.Add(dimensionRoomItem_Info);
        }

        Repositon();
    }

    private void BuildLuckyItmes()
    {
        ClearItems();
        int count = luckyProps.Count;
        for (int i = 0; i < count; i++)
        {
            if (i > 6) return;
            DimensionRoomItem_Info dimensionRoomItem_Info = AndaDataManager.Instance.InstantiateMenu<DimensionRoomItem_Info>(ONAME.DimensionRoomItem_tableItemInfo);
            dimensionRoomItem_Info.SetInto(transform);
            //dimensionRoomItem_Info.transform.eulerAngles = new Vector3(-63f,0,0);
            dimensionRoomItem_Info.SetInfo(luckyProps[i]);
            dimensionRoomItem_Info.transform.position = itemPoints[i].position;
            dimensionRoomItem_Info.callback = ScrollTable;
            if (dimensionRoomItem_Infos == null) dimensionRoomItem_Infos = new List<DimensionRoomItem_Info>();
            dimensionRoomItem_Infos.Add(dimensionRoomItem_Info);
        }

        Repositon();
    }

    private void ClearItems()
    {
        if(dimensionRoomItem_Infos!=null && dimensionRoomItem_Infos.Count!=0)
        {
            int count = dimensionRoomItem_Infos.Count;
            for(int i = 0 ; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(dimensionRoomItem_Infos[i]);
            }
            dimensionRoomItem_Infos.Clear();
        }
    }

    private void ClearData()
    {
        if(bloodBottleProps!=null && bloodBottleProps.Count!=0)
        {
            bloodBottleProps.Clear();
        }

        if(searchProps!=null && searchProps.Count!=0)
        {
            searchProps.Clear();
        }

        if(luckyProps!=null && luckyProps.Count!=0)
        {
            luckyProps.Clear();
        }
    }

    private void ClearSelectItemboard()
    {
        int count = itemSprites.Length;
        for(int i = 0;i < count; i++)
        {
            itemSprites[i].sprite = null;
            itemSprites[i].gameObject.SetTargetActiveOnce(false);
        }

    }

    private void Repositon()
    {
        if (curIndex == -1) ScrollTable(0);
        else
        {
            if (selectItemIndex[typeIndex] != 0)
            {
                ScrollTable(dimensionRoomItem_Infos.FirstOrDefault(s => s.itemIndex == selectItemIndex[typeIndex]));
            }
            else
            {
                if (curIndex > dimensionRoomItem_Infos.Count - 1)
                {
                    ScrollTable(0);
                }
                else
                {
                    ScrollTable(curIndex);
                }
            }
        }
    }


    private void Update()
    {
        if(isActive)
        {
#if UNITY_EDITOR


            if (Input.GetMouseButtonDown(0))
            {

            }

            if (Input.GetMouseButton(0))
            {

            }

#else
            if (Input.touchCount == 1)
            {
                Touch touch = Input.GetTouch(0);
                Vector2 deltaPos = touch.deltaPosition;
                ControlDragMoveCamera(deltaPos * 5);
            }
#endif

        }
    }

    private float scrollProgress = 0;
    private Vector3 quaternion1;
    private Vector3 quaternion2;

    private void ScrollTable(int _index)
    {
        if (!scrollProgress.Equals(0)) return;

        if(curIndex == -1)curIndex = _index;


        float angle = curIndex * 60 - _index * 60;//获取角度

        curIndex = _index;

        quaternion1 = tableItem.transform.localEulerAngles;

        //quaternion1.y += angle;

        quaternion2 = quaternion1;
        quaternion2.z += angle;

        StartCoroutine(ExcuteScroll());
    }

    private void ScrollTable(DimensionRoomItem_Info item)
    {
        int _index = dimensionRoomItem_Infos.IndexOf(item);

        ScrollTable(_index);
    }

    private IEnumerator ExcuteScroll()
    {
        while ( scrollProgress < 1)
        {
            scrollProgress += Time.deltaTime*1.5f;
            scrollProgress = Mathf.Clamp01(scrollProgress);
            tableItem.transform.localEulerAngles = Vector3.Lerp(quaternion1,quaternion2 , scrollProgress);
            int count = dimensionRoomItem_Infos.Count;
            for(int i = 0; i < count; i++)
            {
                dimensionRoomItem_Infos[i].transform.position = itemPoints[i].position;
            }
            yield return null;
        }
        scrollProgress = 0;
        SetCenterItemInfo();
    }


    private void ChangeItem()
    {

    }

    private void SetCenterItemInfo()
    {
        if(!centerGroup.gameObject.activeSelf)
        {
            centerGroup.gameObject.SetTargetActiveOnce(true);
        }
        centerGroup.GetComponent<Animator>().Play("FadeIn");
        centerItemName.text = dimensionRoomItem_Infos[curIndex].itemName.text;
        CenterImage.sprite = dimensionRoomItem_Infos[curIndex].itemImage.sprite;
        if(typeIndex != -1)
        {
            if (!itemSprites[typeIndex].gameObject.activeSelf)
            {
                itemSprites[typeIndex].gameObject.SetTargetActiveOnce(true);
            }
            itemSprites[typeIndex] .sprite= CenterImage.sprite;
            selectItemIndex[typeIndex] = dimensionRoomItem_Infos[curIndex].itemIndex;
        }
    }

    public void ClickStartSearch()
    {

    }

    private void CallbackStartSearch(bool isSuccess)
    {
        if(isSuccess)
        {
            curIndex = -1;
            typeIndex = -1;
            ClearItems();
            ClearData();
            ClearSelectItemboard();
            CloseBar();
        }
        else
        {
            JIRVIS.Instance.PlayTips("请检查网络，再次点击探索试试");
        }
    }

    public void CloseBar()
    {
        gameObject.SetTargetActiveOnce(false);
    }
}

