using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HUDFollowTargetTool : ToolBasic {
    
    private float followSpeed;
    private float followTime;
    private Transform followTarget;
    private Transform followUI;
    private Vector3 followStartPosition;
    private Vector3 followEndPosition;
    private float updateTime;
    private bool followIsStart;
    private OTYPE.UIActiveType followType;
    private float intervalTimer;
    private float followTimer;
    private Vector3 followTargetPoint;

    public override void InitValue()
    {
        base.InitValue();
        followSpeed = 0;
        followTime = 0;
        followTarget = null;
        updateTime = 0;
        followIsStart = false;
    }

    public void StopFollow()
    {
        followIsStart = false;
        InitValue();
    }

    public void SetFollowValue(Transform _followTarget, OTYPE.UIActiveType _followType , float _followSpeed ,float _intervalTime ,Transform _followUI ,System.Action<bool> callBack)
    {
        callBack = CheckIsInFrontOfCamera;
        followTarget = _followTarget;
        followType = _followType;
        followSpeed = _followSpeed;
        intervalTimer = _intervalTime;
        updateTime = Time.time;
        followUI = _followUI;
        followIsStart = true;
    }




    public void SetFollowValue(Transform _followTarget, OTYPE.UIActiveType _followType,Transform _followUI, System.Action<bool> callBack)
    {
        callBack = CheckIsInFrontOfCamera;
        followTarget = _followTarget;
        followType = _followType;
        followUI = _followUI;
        followIsStart = true;
     }

    public void SetFollowValue(Vector3 point, OTYPE.UIActiveType _followType, Transform _followUI, System.Action<bool> callBack)
    {
        callBack = CheckIsInFrontOfCamera;
        followTargetPoint = point;
        followType = _followType;
        followUI = _followUI;
        followIsStart = true;
    }

    private void ExcuteFollowLinear()
    {
        if (followTarget == null)
        {
            Debug.Log("AndaSaid: Follow target is null");
            return;
        }
        Vector3 point = followTarget == null ? followTargetPoint : followTarget.position;
        Vector3 targetWithNGUIScreenPosition = point.ConvertWorldPostionToNGUIPosition();
        bool isFrontCamera = point.IsInFrontOfCamera();
        if (isFrontCamera)
        {
            CheckIsInFrontOfCamera(true);
            if (Time.time - updateTime > intervalTimer)
            {
                followTimer = 0;
                followStartPosition = followUI.transform.position;
                followEndPosition = targetWithNGUIScreenPosition;
                updateTime = Time.time;
            }

            followTimer += Time.deltaTime;
            followUI.transform.position = Vector3.Lerp(followStartPosition, followEndPosition, followTimer / followSpeed);
        }
        else
        {
            CheckIsInFrontOfCamera(false);
        }
    }

    private void ExcuteFollowEquals()
    {
        Vector3 point = followTarget == null ? followTargetPoint : followTarget.position;
        Vector3 targetWithNGUIScreenPosition =
           point.ConvertWorldPostionToNGUIPosition();
        bool isFrontCamera = point.IsInFrontOfCamera();
        if (isFrontCamera)
        {
            CheckIsInFrontOfCamera(true);
            followUI.transform.position = targetWithNGUIScreenPosition;
        }
        else
        {
            CheckIsInFrontOfCamera(false);
        }
    }
    
    //回调
    private void CheckIsInFrontOfCamera(bool isInFrontOfCamera) { }


    public override void OnUpdate2()
    {
        base.OnUpdate2();
        if (!followIsStart)
        {
           
            return;
        }

        if (followTarget!=null &&  !followTarget.gameObject.activeSelf)
        {
            CheckIsInFrontOfCamera(false);
        }

        switch (followType)
        {
            case OTYPE.UIActiveType.equls:
              
                ExcuteFollowEquals();
                break;
            case OTYPE.UIActiveType.linear:
                ExcuteFollowLinear();
                break;
        }
    }
    
}
