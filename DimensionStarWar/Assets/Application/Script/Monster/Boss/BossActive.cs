using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossActive  {


    public float getRotateProgress { get  {return rotateProgress ;}}
    public float getMoveProgress{get {return moveProgress ;}}
    public float getRotateHeadProgress { get {return rotateHeadProgress ;}}

    private BossBasic bossBasic; 
    private bool isStopActive = false;

    private bool isRatate = false;
    private Quaternion targetQuaternion;
    private Quaternion startQuaternion;
    private float rotateAngle;
    private float rotateTime ;
    private float rotateProgress;
    private float rotatePercent;
    private int perAnlge = 90;//旋转90需要一秒。这个数值用于计算//以转90度需要1秒的时间，那个根据要旋转的的角度，百分比得出选择时间，反推出 progress 加的1的 每秒 加多少

    private bool isRotateHead =false;
    private Quaternion targetQuaternionHead;
    private Quaternion startQuaternionHead;
    private float rotateAnlgeHead;
    private float rotateTimeHead;
    private float rotateHeadProgress;
    private float rotateHeadPercent;
    private int perHeadAngel = 90;
    private Quaternion keepHeadRotation;

    private bool isMove =false;
    private Vector3 targetPoint;
    private Vector3 startPoint;
    private float distance;
    private float moveTime;
    private float moveProgress;
    private float movePercent;
    private float moveSpeed= 5;

    public void BuildActive(BossBasic _bossActive)
    {
        bossBasic = _bossActive;
    }

    //[用于控制行为停止]
    public void StopActive(bool _isStopActive)
    {
        isStopActive = _isStopActive; 
    }

    //[用于控制停止旋转]
    public void StopRotate()
    {
        isRatate =false;
    }

    public void StopHeadRotate()
    {
        isRotateHead =false;
    }

    public void StopMove()
    {
        isMove = false;
    }

    #region 头部旋转

    public void HeadLookAtDir(Vector3 direction) //保持一个方向
    {
        //bossBasic.head.rotation.SetLookRotation(direction);
        bossBasic.head.up = direction;
    }

    public void PlayRotateHead(Quaternion _targetQuaternion)
    {
        startQuaternionHead = bossBasic.headFwdPint.rotation;
        targetQuaternionHead = _targetQuaternion;
        rotateAnlgeHead = Quaternion.Angle(startQuaternionHead ,targetQuaternionHead);
        rotateTimeHead = 0;
        rotateHeadProgress = 0;
        rotateHeadPercent = rotateAnlgeHead / perHeadAngel ;
        if(!isRotateHead)
        {
            isRotateHead =true;
            bossBasic.StartCoroutine(ExcutePlayRotateHead());
        }

    }

    public IEnumerator ExcutePlayRotateHead()
    {
        while(rotateHeadProgress < 1f  && !isStopActive && isRotateHead)
        {
            rotateTimeHead += Time.deltaTime;
            //Debug.Log("rotateTimeHead" + rotateTimeHead); 
            rotateHeadProgress = rotateTimeHead / rotateHeadPercent;
            Quaternion quaternion = Quaternion.Lerp(startQuaternionHead , targetQuaternionHead ,rotateHeadProgress);
            bossBasic.headFwdPint.rotation = quaternion;
            Vector3 vector3 = quaternion.eulerAngles;
            vector3.x+=-90;
            quaternion.eulerAngles = vector3;
            bossBasic.head.rotation = quaternion;
            yield return  null; 
        }
        isRotateHead =false;
    }

    #endregion

    #region 旋转

    public void PlayRotate(Quaternion _targetQuaternion )
    {
        startQuaternion = bossBasic.transform.rotation;
        targetQuaternion = _targetQuaternion;
        rotateAngle = Quaternion.Angle(startQuaternion ,targetQuaternion);
        rotateTime = 0;
        rotateProgress = 0;
        rotatePercent = rotateAngle / perAnlge ;
        if(!isRatate)
        {
            isRatate =true;
            bossBasic.StartCoroutine(ExcutePlayRotate());
        }


    }

    private IEnumerator ExcutePlayRotate()
    {
        while(rotateProgress < 1f  && !isStopActive && isRatate)
        {
            rotateTime += Time.deltaTime;
            rotateProgress = rotateTime / rotatePercent;
            bossBasic.transform.rotation = Quaternion.Slerp(startQuaternion , targetQuaternion ,rotateProgress);
            yield return  null; 
        }

        isRatate=false;
    }

    #endregion

   
    #region 直行
    //[沿着身体的方向前进]
    public void PlayGone(Vector3 _targetPoint , float speed )
    {

        startPoint = bossBasic.selfPostion;
        targetPoint = _targetPoint;
        distance = Vector3.Distance(startPoint , targetPoint);
        moveProgress = 0;
        movePercent = distance + bossBasic.safeDistance;/// perDistance;
        if(!isMove)
        {
            moveSpeed = bossBasic.moveSpeed * speed;
            isMove =true;
            bossBasic.StartCoroutine(ExcutePlayMove());
        }
    }


    private IEnumerator ExcutePlayMove()
    {
        while(moveProgress < 1f && !isStopActive && isMove)
        {
            distance = Vector3.Distance(bossBasic.selfPostion , targetPoint);
            //Debug.Log("distance"+distance);
            float t = distance / movePercent;
            if(distance < bossBasic.safeDistance)
            {
                moveProgress = 1;
            }else
            {
                moveProgress = distance/ movePercent;
            }
            //Debug.Log("mvoeProgerss" +moveProgress);
            bossBasic.transform.position += bossBasic.transform.forward *Time.deltaTime * moveSpeed;
            yield return null;
        }
        isMove = false;
        moveSpeed = bossBasic.moveSpeed;
    }
    #endregion


}
