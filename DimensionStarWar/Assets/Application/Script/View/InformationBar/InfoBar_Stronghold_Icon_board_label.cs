using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBar_Stronghold_Icon_board_label : AndaObjectBasic {

    /*
     * icon 
     * board
     * des
     * 以上都可以动态更改。只需传入ID
     */
    public UI2DSprite board;
    public UI2DSprite icon;
    public UILabel content;
    public Transform item;
    public void SetValue(int iconID, int boardID, string description,int dir = 0)
    {
        board.sprite2D = AndaDataManager.Instance.GetStrongholdLevelBoardSprite(boardID+1);
        icon.sprite2D = AndaDataManager.Instance.GetSprite(iconID);
        content.text = description;
        //if (dir == 0) SetLeft();
        //else SetRight();
    }

    public void SetLeft()
    {
        item.SetInto(leftPoint);
    }

    public void SetRight()
    {
        item.SetInto(rightPoint);
    }
}
