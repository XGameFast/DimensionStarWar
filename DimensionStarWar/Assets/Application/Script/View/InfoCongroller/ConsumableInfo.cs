using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConsumableInfo : UIFollowWithTarget
{
    private InfoBar_Label infoBarForCount;
    private InfoBar_Label infoBarForName;
    
    public override void InitValue()
    {
        base.InitValue();
        infoBarForCount.DestroyByAndaDataManager();
    }

    public override void OnDispawn()
    {
        infoBarForCount.DestroyByAndaDataManager();
        base.OnDispawn();
    }

    public void SetValue(string name , int value ,Transform target)
    {
        BuildInfoBar();
        infoBarForName.SetValue(name);
        infoBarForCount.SetValue("x:" +value.ToString());
        SetFollowTarget(target);
    }

    private void BuildInfoBar()
    {
        if (infoBarForName == null)
        {
            infoBarForName = AndaUIManager.Instance.PopingMenu<InfoBar_Label>(ONAME.InfoBar_Label_board);
            infoBarForName.transform.SetParent(point[0]);
            infoBarForName.ResetTran();
            infoBarForName.InitValue();

        }

        if (infoBarForCount == null)
        {
            infoBarForCount = AndaUIManager.Instance.PopingMenu<InfoBar_Label>(ONAME.InfoBar_Label_board);
            infoBarForCount.transform.SetParent(point[1]);
            infoBarForCount.ResetTran();
            infoBarForCount.InitValue();
        }
        
    }
}
