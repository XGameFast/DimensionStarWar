using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIFollowTargetPoint : UIBasic{
    public Transform board;
    protected FollowTargetUI followTargetUI;
    public List<Transform> infoPoint;
    protected int pointIndex;
    public override void InitValue()
    {
        base.InitValue();
        followTargetUI.DestroyByAndaDataManager();
        pointIndex = 0;
    }
    public override void OnDispawn()
    {
        followTargetUI.DestroyByAndaDataManager();
        base.OnDispawn();
    }
    protected void SetFollowValue(Transform target)
    {
        BuildFollowTargetUI();
        followTargetUI.SetFollowValue(OTYPE.UIActiveType.equls,target);
    }

    private void BuildFollowTargetUI()
    {
        if (followTargetUI == null)
        {
            followTargetUI = AndaUIManager.Instance.PopingMenu<FollowTargetUI>(ONAME.FollowTargetUI);
        }

        followTargetUI.SetTargetToCenterPoint(board);
    }

    protected void SetInfoBarToPoint(Transform target)
    {
        target.SetParent(infoPoint[pointIndex]);
        target.ResetTran();
        pointIndex += 1;
    }
    
    public override void OnUpdate()
    {
        base.OnUpdate();

        if (followTargetUI != null)
        {
            followTargetUI.OnUpdate();
        }
    }

}
