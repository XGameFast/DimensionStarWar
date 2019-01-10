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

    private List<LD_Objs> bloodBottleItems;
    private List<LD_Objs> searcItems;
    private List<LD_Objs> luckyItems;


    private List<DimensionRoomItem_Info> dimensionRoomItem_Infos;
    public Transform[] itemPoints;

    private int curIndex =-1;
    private int typeIndex=-1;
    private LD_Objs[] selectItemIndex;

    public System.Action callbackStartSearch;
    private int monsterIndex;
    private int changeIndex = 4;
    private int changeNextIndex = 7;
    public PlayerMonsterAttribute pma;

    public void SetMonsterIndex(PlayerMonsterAttribute _pma)
    {
        pma = _pma;
        monsterIndex = pma.monsterIndex;
    }
    public void SetInfo()
    {
        Invoke("InvockExcute" ,1f);
    }

    private void InvockExcute()
    {

        if (typeIndex == -1)
        {
            InitData();
            JIRVIS.Instance.PlayTips("您可以为星宿佩戴探索装备，可以探索更为稀有的东西哦！");
            SelectType(0);

        } //else SelectType(typeIndex);
    }


    public void SelectType(int type)
    {
        if(typeIndex == type)return;
        typeIndex = type;
        centerGroup.gameObject.SetTargetActiveOnce(false);
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

                    int count = bloodBottleProps.Count;

                    for (int i = 0; i < count; i++)
                    {
                        if (bloodBottleItems == null) bloodBottleItems = new List<LD_Objs>();
                        bloodBottleItems.AddRange(bloodBottleProps[i].lD_Objs);
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

                    int count = searchProps.Count;
                    for (int i = 0; i < count; i++)
                    {
                        if (searcItems == null) searcItems = new List<LD_Objs>();
                        searcItems.AddRange(searchProps[i].lD_Objs);
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

                    int count = luckyProps.Count;
                    for (int i = 0; i < count; i++)
                    {
                        if (luckyItems == null) luckyItems = new List<LD_Objs>();
                        luckyItems.AddRange(luckyProps[i].lD_Objs);
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
        int count = bloodBottleItems.Count;
        for(int i = 0 ; i < count; i++)
        {
            if (i > 6) return;
            BuildItem(bloodBottleItems[i],i,i);
        }

        Repositon();

    }


    private void BuildSearchItems()
    {
        ClearItems();
        int count = searcItems.Count;
        for (int i = 0; i < count; i++)
        {
            if (i > 6) return;
            BuildItem(searcItems[i],i ,i);
        }

        Repositon();
    }


    private void BuildLuckyItmes()
    {
        ClearItems();
        int count = luckyItems.Count;
        for (int i = 0; i < count; i++)
        {
            if (i > 6) return;
            BuildItem(luckyItems[i],i,i);
        }

        Repositon();
    }

    private void BuildItem(LD_Objs _itemdata, int _itemdIndex, int _pointIndex)
    {
        DimensionRoomItem_Info dimensionRoomItem_Info = AndaDataManager.Instance.InstantiateMenu<DimensionRoomItem_Info>(ONAME.DimensionRoomItem_tableItemInfo);
        dimensionRoomItem_Info.SetInto(transform);
        dimensionRoomItem_Info.SetInfo(_itemdata, _itemdIndex);
        dimensionRoomItem_Info.transform.position = itemPoints[_pointIndex].position;
        dimensionRoomItem_Info.callback = ScrollTable;
        if (dimensionRoomItem_Infos == null) dimensionRoomItem_Infos = new List<DimensionRoomItem_Info>();
        dimensionRoomItem_Infos.Add(dimensionRoomItem_Info);
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
        /*if(bloodBottleProps!=null && bloodBottleProps.Count!=0)
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
        }*/

        if(bloodBottleItems!=null && bloodBottleItems.Count!=0)
        {
            bloodBottleItems.Clear();
        }
        if (searcItems != null && searcItems.Count != 0)
        {
            searcItems.Clear();
        }
        if (luckyItems != null && luckyItems.Count != 0)
        {
            luckyItems.Clear();
        }

    }

    private void ClearItemData()
    {

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
            if (selectItemIndex[typeIndex] != null)
            {
                ScrollTable(dimensionRoomItem_Infos.FirstOrDefault(s => s.itemData == selectItemIndex[typeIndex]));
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

    private Vector3 touchPose1;


    private void Update()
    {
        if(gameObject.activeSelf&& scrollProgress.Equals(0))
        {
#if UNITY_EDITOR


            if (Input.GetMouseButtonDown(0))
            {
                touchPose1 = Input.mousePosition;
            }

            if (Input.GetMouseButtonUp(0))
            {
                float x =  touchPose1.x - Input.mousePosition.x;
                float p = Mathf.Abs(x);
                if (p > 5)
                {
                    ScrollTo((int)(x/p));
                }
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

    private void ScrollTo(int _dir)
    {
        int dir =_dir;
        int t = curIndex + _dir;
        switch(typeIndex)
        {
            case 0:
              
                if(t > bloodBottleItems.Count-1) t =0 ;
                else if(t < 0)t = bloodBottleItems.Count - 1;
                break;
            case 1:
                if (t > searcItems.Count - 1) t = 0;
                else if (t < 0) t = searcItems.Count - 1;
                break;
            case 2:
                if (t > luckyItems.Count - 1) t = 0;
                else if (t < 0) t = luckyItems.Count - 1;
                break;
        }

        ScrollTable(t, dir);
    }

    private void ChangeItem()
    {
        switch (typeIndex)
        {
            case 0:
              /*  int next = t - halfWheelCount + allWheelCount;
                if (next > bloodBottleItems.Count - 1) return;
                LD_Objs lD_Objs = bloodBottleItems[next];
                bloodBottleItems[next] = bloodBottleItems[curIndex - halfWheelCount];
                bloodBottleItems[curIndex - halfWheelCount] = lD_Objs;
                */break;
            case 1:
                break;
            case 2:
                break;
        }

        //dimensionRoomItem_Infos[changeIndex-1] = 
    }


    private void ScrollTable(int _index ,int _dir = 1)
    {
        if(curIndex == -1) curIndex =_index;

        float w1 = curIndex / allWheelCount;
        float t1 = curIndex - w1 * allWheelCount;

        float w = _index / allWheelCount;
        float t = _index - w * allWheelCount;
        float angle = 0;
        if (_dir.Equals(1))
        {
            if(_index < curIndex)
            {

            }else
            {

            }
            angle = t1 * perAngle - t * perAngle;//获取角度
        }
        else
        {
            angle = t1 * perAngle - t * perAngle;//获取角度
            angle = 360 - angle;

        }

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

      //  ScrollTable(_index);
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

    private int halfWheelCount = 3;
    private int allWheelCount = 6;
    private int perAngle = 60;


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
            selectItemIndex[typeIndex] = dimensionRoomItem_Infos[curIndex].itemData;
        }
    }


    public void ClickStartSearch()
    {
        if(!scrollProgress.Equals(0))return;
        int minlimit = MonsterGameData.monsterSearchConfig.consumePower;
        int bloodGivevalue = 0;
        if(selectItemIndex[0] != null) bloodGivevalue = selectItemIndex[0].giveValue;
        if(bloodGivevalue.Equals(0))
        {
            JIRVIS.Instance.PlayTips("当前星宿的意志力不足以支撑它完成本次探索，请为他配置意志力意志力药水");
            return;
        }else 
        {
            if (pma.mosterPower + bloodGivevalue < minlimit)
            {
                JIRVIS.Instance.PlayTips("当前配置的意志力药水不足以支撑星宿完成本次探索,请更换更大瓶的意志力药水,至少需要 " + bloodGivevalue +"的意志力");
                return;
            }else
            {
                AndaDataManager.Instance.CallUpStartSearch(monsterIndex, selectItemIndex[0], selectItemIndex[1], selectItemIndex[2], CallbackStartSearch);
            }
        }
    }

    private void CallbackStartSearch(int finishSearchTime)
    {
        if(finishSearchTime!=-1)
        {
            callbackStartSearch();
            InitData();
            CloseBar();
        }
        else
        {
            JIRVIS.Instance.PlayTips("请检查网络，再次点击探索试试");
        }
    }

    public void CloseBar()
    {
        if(!scrollProgress.Equals(0))return;

        gameObject.SetTargetActiveOnce(false);
    }



    private void InitData()
    {
        scrollProgress = 0;
        selectItemIndex = new LD_Objs[3] { null, null, null };
        curIndex = -1;
        typeIndex = -1;
        itemSprites[0].GetComponentInParent<Toggle>().isOn= true;
        ClearItems();
      //  ClearData();
        ClearSelectItemboard();
        CenterImage.sprite = null;
        centerGroup.gameObject.SetTargetActiveOnce(false);
        Vector3 vector3 = tableItem.transform.localEulerAngles;
        vector3.z = 0;
        tableItem.transform.localEulerAngles = vector3;
    }

   
}

