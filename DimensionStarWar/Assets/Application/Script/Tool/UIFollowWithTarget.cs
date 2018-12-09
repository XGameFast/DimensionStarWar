using System.Collections;
using System.Collections.Generic;
using UnityEngine;
/// <summary>
/// 这个是新的。老的要逐步替换掉
/// </summary>
public class UIFollowWithTarget : UIBasic {

    private Transform followTarget;
    private Vector3 followPoint;
    public List<Transform> point;
    public Transform followBoard;
    private bool isExute = false;
    public override void InitValue()
    {
        base.InitValue();
        isExute = false;
    }

    public override void OnDispawn()
    {

        base.OnDispawn();
    }
    


    public void SetFollowTarget(Transform target)
    {
        followTarget = target;
        if (!isExute)
        {
            StartCoroutine(ExcuteFollowTarget());
        }
    }
    public void SetFollowPoint(Vector3 _point)
    {
        followPoint = _point;
        if (!isExute)
        {
            StartCoroutine(ExcuteFollowPoint());
        }
    }

    public void EndFollow()
    {
        isExute = false;
    }

    private IEnumerator ExcuteFollowTarget()
    {
        isExute = true;
        while (followTarget != null)
        {
            Vector3 point = followTarget==null?followPoint : followTarget.position;
            Vector3 targetWithNGUIScreenPosition = point.ConvertWorldPostionToNGUIPosition();
            bool isFrontCamera = point.IsInFrontOfCamera();
            if (isFrontCamera)
            {
                followBoard.gameObject.SetTargetActiveOnce(true);
                followBoard.position = targetWithNGUIScreenPosition;
            }
            else
            {
                followBoard.gameObject.SetTargetActiveOnce(false);
            }
            yield return null;
        }
        isExute = false;
        this.DestroyByAndaDataManager();
    }
    private IEnumerator ExcuteFollowPoint()
    {
        isExute = true;
        while (isExute)
        {
            Vector3 point = followTarget == null ? followPoint : followTarget.position;
            Vector3 targetWithNGUIScreenPosition = point.ConvertWorldPostionToNGUIPosition();
            bool isFrontCamera = point.IsInFrontOfCamera();
            if (isFrontCamera)
            {
                followBoard.gameObject.SetTargetActiveOnce(true);
                followBoard.position = targetWithNGUIScreenPosition;
            }
            else
            {
                followBoard.gameObject.SetTargetActiveOnce(false);
            }
            yield return null;
        }
        isExute = false;
        CloseAlpha(1.2F);
        // this.DestroyByAndaDataManager();
    }
}
