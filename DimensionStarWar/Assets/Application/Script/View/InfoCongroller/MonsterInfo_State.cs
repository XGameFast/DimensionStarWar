using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterInfo_State : UIFollowWithTarget {

    private InfoBar_Icon monsterStateIcon;

    public override void InitValue()
    {
        base.InitValue();
        monsterStateIcon.DestroyByAndaDataManager();
    }
    
    public void SetFollowValue(Transform followTarget)
    {
        SetFollowTarget(followTarget);
    }

    private void SetStateInformation(string currentState)
    {
        BuildStateInfomation();
        monsterStateIcon.SetValue(currentState);
    }

    private void BuildStateInfomation()
    {
        if (monsterStateIcon == null)
        {
            monsterStateIcon = AndaUIManager.Instance.PopingMenu<InfoBar_Icon>(ONAME.InfoBar_Icon);
            monsterStateIcon.transform.SetParent(point[0]);
            monsterStateIcon.ResetTran();
        }
    }

    public void UpdateState(string stateId)
    {
        if (monsterStateIcon != null)
        {
            monsterStateIcon.SetValue(stateId);
        }
    }
}
