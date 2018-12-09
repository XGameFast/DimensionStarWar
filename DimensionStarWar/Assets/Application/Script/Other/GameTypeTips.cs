using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameTypeTips : UIBasic {

    public UILabel gameTypeTips;
    public Transform followTarget;
    private FollowTargetUI followUI;

    public override void OnDispawn()
    {
        base.OnDispawn();
        if (followUI != null)
        {
            AndaDataManager.Instance.DestoryObj(followUI);
        }
    }

    public void SetFollowTarget(Transform target)
    {
        if (followUI == null)
        {
            followUI = AndaUIManager.Instance.PopingMenu<FollowTargetUI>("FollowTargetUI");
        }

        followUI.SetFollowValue(OTYPE.UIActiveType.equls, target);

        followUI.SetTargetToTopPoint(followTarget);
    }

    public void SetFollowPoint(Vector3 point)
    {
        if (followUI == null)
        {
            followUI = AndaUIManager.Instance.PopingMenu<FollowTargetUI>("FollowTargetUI");
        }
        followUI.SetFollowValue(OTYPE.UIActiveType.equls, point);
        followUI.SetTargetToTopPoint(followTarget);
    }

    public void SetValue(string content )
    {
        gameTypeTips.text = content;
    }

    private void Update()
    {
        if (followUI != null)
        {
            followUI.OnUpdate();
        }
    }

}
