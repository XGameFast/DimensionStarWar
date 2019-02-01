using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Item_SetMonsterToSelectDimensionRoomItem : AndaObjectBasic {

    public Text levelText;
    public Slider levelSlider;
    public Text dimensionRoomName;
    public Image dimensionMedalLevelImage;
    public Image dimensionMedalStatusImage;

    public PlayerStrongholdAttribute pma;
    public System.Action<Item_SetMonsterToSelectDimensionRoomItem> callbackSelect;


    public override void OnDispawn()
    {

        callbackSelect = null;
        levelText.text ="";
        levelSlider.value =0;
        dimensionRoomName.text ="";
        dimensionMedalLevelImage.gameObject.SetTargetActiveOnce(false);
        dimensionMedalStatusImage.gameObject.SetTargetActiveOnce(false);
        pma = null;
        base.OnDispawn();
    }

    public void SetInfo(PlayerStrongholdAttribute _pma)
    {
        pma = _pma;
        levelText.text = (_pma.strongholdLevel).ToString();
        float per = (float)_pma.strongholdGloryValue / _pma.strongholdMaxValue;
        levelSlider.value = per;
        dimensionRoomName.text = _pma.strongholdNickName;
        dimensionMedalLevelImage.sprite = AndaDataManager.Instance.GetStrongholdLevelBoardSprite(_pma.medalLevel);
        dimensionMedalStatusImage.sprite = AndaDataManager.Instance.GetStrongholdStutedSprite(_pma.statueID);
    }

    public void ClickItem()
    {
        if(callbackSelect!=null)
        {
            callbackSelect(this);
        }
    }

}
