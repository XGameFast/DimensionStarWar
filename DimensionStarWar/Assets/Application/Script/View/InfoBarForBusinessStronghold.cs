using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBarForBusinessStronghold : AndaObjectBasic {

    public UI2DSprite levelBoard;
    public UI2DSprite icon;
    public UILabel strongholdName;
    public UIGrid monsterGrid;
    public UIGrid rewardGrid;
    public UILabel levelNameLabel;
    public UISlider expSlider;
    public UILabel expLabel;
    private List<MonsterPortraitItem> monsterPoraitItem;
    public override void InitValue()
    {
        base.InitValue();
        if (monsterPoraitItem == null) monsterPoraitItem = new List<MonsterPortraitItem>();
    }

    public override void OnDispawn()
    {
        base.OnDispawn();
        ClearMonsterIcon();
    }
    private void ClearMonsterIcon()
    {
        foreach (var go in monsterPoraitItem)
        {
            AndaDataManager.Instance.DestoryObj(go);
        }
    }
    private void CloseMonsterBoardItem()
    {
        foreach (var go in monsterPoraitItem)
        {
            go.gameObject.SetActive(false);
        }
    }

    private StrongholdBaseAttribution lastbussinessStrongholdAttributeConvert;
    public void SetValue(StrongholdBaseAttribution bsa)
    {
        CloseMonsterBoardItem();

        strongholdName.text = bsa.strongholdNickName;
        //和徽章共用一张贴图
        string levelBoardName = "MedalLevelBoard" + bsa.strongholdLevel;
        levelBoard.sprite2D = AndaDataManager.Instance.GetMedalLevelBoardSprite(levelBoardName);

        int baseGlory = MonsterGameData.GetBusinessStrongholddBaseAttribute().businessStrongholdGrowupExp[bsa.strongholdLevel];
        expSlider.value = (float)bsa.strongholdGloryValue / baseGlory;
        expLabel.text = bsa.strongholdGloryValue + "/" + baseGlory;
       
        BuildMonsterIcon(bsa.fightMonsterListIndex,
bsa.hostIndex,bsa.hostType);
    }
    //

    private void BuildMonsterIcon(List<int> monsterIndexList , int playerIndex ,int playerType)
    {
        if (monsterPoraitItem != null)
        {
            for (int i = 0; i < monsterIndexList.Count; i++)
            {
                if (i < monsterPoraitItem.Count)
                {
                    monsterPoraitItem[i].gameObject.SetActive(true);
                    monsterPoraitItem[i].SetValue(monsterIndexList[i], playerIndex, playerType);
                }
                else
                {
                    MonsterPortraitItem _monsterPortraitItem =
               AndaUIManager.Instance.PopingMenu<MonsterPortraitItem>("MonsterPortraitItem");
                    _monsterPortraitItem.transform.SetParent(monsterGrid.transform);
                    _monsterPortraitItem.ResetTran();
                   _monsterPortraitItem.SetValue(monsterIndexList[i],playerIndex , playerType);
                    monsterPoraitItem.Add(_monsterPortraitItem);
                }
               
            }
        }
        monsterGrid.Reposition();
    }

}
