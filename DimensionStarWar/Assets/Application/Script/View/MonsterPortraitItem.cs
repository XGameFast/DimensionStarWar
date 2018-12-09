using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterPortraitItem : AndaObjectBasic {

    /*
     * 头像 + 等级边框 
     */

    public UI2DSprite icon;
    public UI2DSprite levelBoard;
    public UILabel monsterNickName;
    public UILabel monsterBaseName;

    public void SetValue(int monsterIndex ,int playerIndex,int playerType)
    {
        PlayerMonsterAttribute pma = AndaDataManager.Instance.GetPlayerMonsterAttribute(monsterIndex, playerIndex, playerType);

        monsterNickName.text = pma.monsterNickName;
        monsterBaseName.text = pma.monsterName;
        //头像
        icon.sprite2D = AndaDataManager.Instance.GetMonsterIconSprite(pma.monsterID.ToString());

        //等级边框
        string levelBoardName = "MonsterBoardLevel" + pma.monsterLevel;
        levelBoard.sprite2D = AndaDataManager.Instance.GetMedalLevelBoardSprite(levelBoardName);
    }
}
