using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BuildDimensionMenu_RoomAddtionBar : AndaObjectBasic {

    private System.Action ClickCallback ;
    public CanvasGroup canvasBoardGroup;
    public void SetCallBack(System.Action callback)
    {
        ClickCallback = callback;
    }

    public void ClickItem()
    {
        if(ClickCallback!=null )
        {
            ClickCallback();
        }
    }

    public void Fade(float t)
    {
        canvasBoardGroup.alpha = t;
    }

}
