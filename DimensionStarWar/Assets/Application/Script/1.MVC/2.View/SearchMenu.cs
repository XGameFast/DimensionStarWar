using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;

public class SearchMenu : UIBasic2
{
    private SearchController searchController;

    public GameObject objectDetail;

    public GameObject choiceNeedObject;

    public Image itemSprite;
    public Text des;
    public Text objectname;

    public Text detector1;
    public Text detector2;
    public Text detector3;

    public GameObject fightButton;
    public GameObject pickupButton;

    public UIBasic2 scannerBoard;//
    public TweenPosition scannerLine;

    public SearchObjectItem searchObjectItem;

    public Text scannerDuration;

    private SearchTipsArrow searchTipsArrow;
    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
        choiceNeedObject.SetTargetActiveOnce(false);
        SetMenuData();
        searchController = _baseController as SearchController;
    }

    public void SetMenuData()
    {
        List<UserObjsBox> objectList = AndaDataManager.Instance.userData.GetDetectorList();
        if(objectList==null)return;
        var item = objectList.FirstOrDefault(o => o.id == 42020);
        if (item != null)
            detector1.text = item.count.ToString();
        else
            detector1.text = "0";
        item = objectList.FirstOrDefault(o => o.id == 42021);
        if (item != null)
            detector2.text = item.count.ToString();
        else
            detector2.text = "0";
        item = objectList.FirstOrDefault(o => o.id == 42022);
        if (item != null)
            detector3.text = item.count.ToString();
        else
            detector3.text = "0";
    }
    public void ShowObjectDetail(SearchObjectItem _searchObjectItem)
    {
        int id = _searchObjectItem.searchObject.objectID;
        int idType = AndaDataManager.Instance.GetObjectGroupID(id);
        searchObjectItem = _searchObjectItem;
        if (idType == 40000)
        {
           

           /* objectDetail.SetTargetActiveOnce(true);
            pickupButton.SetTargetActiveOnce(true);
            fightButton.SetTargetActiveOnce(false);
            itemSprite.sprite = AndaDataManager.Instance.GetConsumableSprite(_searchObjectItem.searchObject.objectID.ToString());
            objectname.text = MonsterGameData.GetConsuambleObjectName(_searchObjectItem.searchObject.objectID);
            des.text = MonsterGameData.GetConsumableObjectDescription(_searchObjectItem.searchObject.objectID);
            searchObjectItem = _searchObjectItem;*/
        }
        else if(idType == 1000)
        {
            //objectDetail.SetTargetActiveOnce(true);
            //pickupButton.SetTargetActiveOnce(false);
            //fightButton.SetTargetActiveOnce(true);
            //searchObjectItem = _searchObjectItem;
            Debug.Log("遇到是星宿是否捕捉！");
        }

    }
  
    //选择搜索模式,选择需要消耗的物品
    public void Choice(int objectID)
    {
        //关闭面板
        //choiceNeedObject.SetTargetActiveOnce(false);
        //SetMenuData();
        //searchController.DownLodeData(objectID);
    }

    //选择搜索模式
    public void ReSearch()
    {
        //choiceNeedObject.SetTargetActiveOnce(true);
    }


    public void OpenScannerBoard(int scannerLevel , List<SearchObjectItem> searchObjectItemss)
    {
        scannerBoard.gameObject.SetTargetActiveOnce(true);
        switch(scannerLevel)
        {
            case 0:
                scannerBoard.FadeIn();
                break;
            case 1:
                scannerBoard.FadeIn();
                break;
            case 2:
                scannerBoard.FadeIn();
                if(searchTipsArrow == null)
                {
                    searchTipsArrow = AndaDataManager.Instance.InstantiateOtherObj<SearchTipsArrow>(ONAME.searchTipArrowObj);
                    searchTipsArrow.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.CameraFwdPoint.transform);
                    searchTipsArrow.SetInfo(searchObjectItemss, searchController.PlayerFoundMonster);
                }
                break;
        }
      
    }



    public void CloseScannerBoard(int scannerLevel)
    {
      
        switch(scannerLevel){
            case 0:
                scannerBoard.FadeOut();
                break;
            case 1:
                scannerBoard.FadeOut();
                break;
            case 2:
                scannerBoard.FadeOut();
                if (searchTipsArrow!=null)
                {
                    AndaDataManager.Instance.RecieveItem(searchTipsArrow);
                    searchTipsArrow = null;
                }
                break;

        }
    }

    public void SetLineSpeed(float durationTime)
    {
        scannerLine.duration = durationTime ;
    }


    public void UpdateTime(float t)
    {
        scannerDuration.text = t.FloatToInt() + "s";
    }


   
}

