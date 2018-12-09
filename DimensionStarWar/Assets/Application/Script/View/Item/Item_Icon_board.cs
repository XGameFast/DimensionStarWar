using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Item_Icon_board : AndaObjectBasic {
    public UI2DSprite icon;
    public UI2DSprite board;

    public void SetValue(int iconId, int boardId)
    {
        icon.sprite2D = AndaDataManager.Instance.GetSprite(iconId);
        board.sprite2D =
            AndaDataManager.Instance.GetMonsterLevelBoardSprite(boardId+1);
    }
}
