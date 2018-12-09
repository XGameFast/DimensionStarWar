using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CommodityItemForMall : AndaObjectBasic {
    public UI2DSprite icon;
    
    private System.Action<LD_Commodity,Transform> clickItemCallBack;
    private LD_Commodity ld_commdity;
    public override void InitValue()
    {
        base.InitValue();
    }

    public void SetValue(LD_Commodity ldCommodity, System.Action<LD_Commodity,Transform> callback)
    {
        ld_commdity = ldCommodity;
        clickItemCallBack = callback;
        icon.sprite2D = AndaDataManager.Instance.GetSprite(ld_commdity.c_id);
    }

    public void ClickItem()
    {
        clickItemCallBack(ld_commdity,transform);
    }
}
