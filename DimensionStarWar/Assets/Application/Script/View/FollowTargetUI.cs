using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class FollowTargetUI : AndaObjectBasic {

    public Transform followUI;
    private HUDFollowTargetTool hUDFollowTargetTool;
    public Transform[] infoPoint;
    public Transform topInfoPoint;
    public Transform topInfoPointReverse;
    private int pointIndex;
    private int pointRevereseIndex;
    public Transform centerInfoPoint;
    
    public Transform getTopPoint
    {
        get
        {
            return infoPoint.FirstOrDefault(s => s.name == "topPoint");
        }
    }
    public Transform getTopPoint2
    {
        get
        {
            return infoPoint.FirstOrDefault(s => s.name == "topPoint2");
        }
    }

    //
    public override void InitValue()
    {
        base.InitValue();
        pointIndex = 0;
        pointRevereseIndex = 3;
        hUDFollowTargetTool = new HUDFollowTargetTool();
        hUDFollowTargetTool.InitValue();
    }
    public void SetInformation(bool isReverse)
    {
        pointIndex = isReverse ? 3 : 0;
    }
    public void SetTargetToPoint(Transform target)
    {
        target.SetParent(infoPoint[pointIndex]);
        target.ResetTran();
        pointIndex += 1;
    }

    public void SetTargetToTopPoint(Transform target)
    {
        target.SetParent( topInfoPoint);
        target.ResetTran();
    }
    public void SetTargetToCenterPoint(Transform target)
    {
        target.SetParent(centerInfoPoint);
        target.ResetTran();
    }

    public void SetTargetPointReverse(Transform target )
    {
        target.SetParent(infoPoint[pointRevereseIndex]);
        target.ResetTran();
        pointRevereseIndex += 1;
    }


    public void SetFollowValue(OTYPE.UIActiveType followType ,Transform followTarget , float followSpeed, float intervalTimer)
    {
        hUDFollowTargetTool.SetFollowValue(followTarget,followType, followSpeed, intervalTimer, followUI, CheckFollowTargetIsInFrontOfCamer);
    }

   
    /// <summary>
    /// 
    /// </summary>
    /// <param name="followType">跟随类型 </param>
    /// <param name="followTarget">跟随目标</param>
    public void SetFollowValue(OTYPE.UIActiveType followType, Transform followTarget)
    {
        hUDFollowTargetTool.SetFollowValue(followTarget, followType , followUI, CheckFollowTargetIsInFrontOfCamer);
    }

    public void SetFollowValue(OTYPE.UIActiveType followType, Vector3 point)
    {
        hUDFollowTargetTool.SetFollowValue(point, followType, followUI, CheckFollowTargetIsInFrontOfCamer);
    }

    private void CheckFollowTargetIsInFrontOfCamer(bool isInFrontOfCamera)
    {
        followUI.gameObject.SetTargetActiveOnce(isInFrontOfCamera);
    }

    public void OnUpdate()
    {
        if (hUDFollowTargetTool != null)
        {
            hUDFollowTargetTool.OnUpdate2();
           
        }
    }
}
