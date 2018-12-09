using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
//地图上的据点UI专用
public class MapUIItem_icon_lvBoard_Name : AndaObjectBasic {

    public Image porImg;
    public Image levelboard;
    public Text shName;

    public int dataIndex;
    private  int shDataType;
    private StrongholdBaseAttribution strongholdBaseAttribution;
    private System.Action<StrongholdBaseAttribution> clickCallBack;
    public void SetInfo(StrongholdBaseAttribution _shAttr)
    {
        strongholdBaseAttribution = _shAttr;
        shDataType = _shAttr.hostType;
        dataIndex = _shAttr.strongholdIndex;
        switch(shDataType)
        {
            case 0:
                Sprite imgPor = AndaDataManager.Instance.GetStrongholdPorSprite(_shAttr.statueID.ToString());
                Sprite levelBoard = AndaDataManager.Instance.GetStrongholdLevelBoardSprite(_shAttr.strongholdLevel);
                UpdatePorImage(imgPor);
                levelboard.sprite = levelBoard;
                break;
            case 1:
               // Sprite imgPor = AndaDataManager.Instance AndaDataManager.Instance.GetStrongholdPorSprite(p.statueID.ToString());
               levelboard.sprite = AndaDataManager.Instance.GetBussinessLevelBoardSprite(_shAttr.strongholdLevel); ;
                break;
            case 2:
                break;
        }
       

        shName.text = _shAttr.strongholdNickName;
    }

    public void RegisterClickCallBack(System.Action<StrongholdBaseAttribution> callback)
    {
        clickCallBack = callback;
    }

    public void UpdatePorImage(Sprite sp)
    {
        porImg.sprite = sp;
    }

    public void ClickItem()
    {
        if(clickCallBack!=null)
        {
            clickCallBack(strongholdBaseAttribution);
        }
    }
}
