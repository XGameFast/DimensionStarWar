using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBar_Icon_board : AndaObjectBasic  {


    /*
     * 多种 赋值
     */

    public UI2DSprite icon;
    public UI2DSprite board;

    public void SetMonsterIcon(int ID , int BoardID)
    {
        icon.sprite2D = AndaDataManager.Instance.GetSprite(ID);
        board.sprite2D = AndaDataManager.Instance.GetMonsterLevelBoardSprite(BoardID);
    }
    public void SetSkillIcon(int ID, int BoardID)
    {
        icon.sprite2D = AndaDataManager.Instance.GetSprite(ID);
        board.sprite2D = AndaDataManager.Instance.GetSkillTypeBoardSprite(BoardID);
    }


   
}
