using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StrongholdPorItem : AndaObjectBasic {

    public Image icon;
    public Image levelIcon;
    public Text strongholdName;
    public int strongholdIndex;

    private System.Action <int> callbackStrongholdIndex;
    public void SetInfo(string _strongholdName, int medalID , int levelID , int _strongholdIndex)
    {
        strongholdIndex = _strongholdIndex;
        icon.sprite = AndaDataManager.Instance.GetStrongholdPorSprite(medalID.ToString());
        icon.color = AndaGameExtension.GetLevelColor(levelID);
        levelIcon.sprite = AndaDataManager.Instance.GetStrongholdLevelBoardSprite(levelID);
        strongholdName.text = _strongholdName;
    }


    public void SetCallBack(System.Action <int> callback)
    {
        callbackStrongholdIndex = callback;
    }

    public void ClickItem()
    {
        if(callbackStrongholdIndex!=null)
        {
            callbackStrongholdIndex(strongholdIndex);
        }
    }
}
