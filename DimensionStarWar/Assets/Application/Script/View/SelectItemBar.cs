using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectItemBar : UIBasic {
    public UIGrid uiGrid;
    public UICenterOnChild uiCenterOnChild;
    public GameObject itemBoard;
    //闪光特效
    public TweenAlpha sparkLight;

    //local
    protected int currentIndex;
    protected bool isHiden = false;


    public override void InitValue()
    {
        base.InitValue();
        itemBoard.SetActive(false);
        currentIndex = 0;
    }

    public virtual void ResetValue(object data)
    {
        isHiden = true;
        InitValue();
        foreach (var go in uiGrid.GetChildList())
        {
            Destroy(go.gameObject);
        }
        BuildItem(data);

        isHiden = false;
    }

    public void  UpdateItemIndex(int _currentIndex)
    {
        currentIndex = _currentIndex;
        CenterOnTartet();
    }


    public virtual void BuildItem(object data)
    {
        
    }

    protected virtual void CenterOnTartet()
    {
        uiCenterOnChild.CenterOn(uiGrid.GetChild(currentIndex));
    }

}
