using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterActiveBaisc {

    private System.Action CallBackArrivalPoint;

    public  MonsterBasic self = null;
    private bool bodyFollowHead;
    #region AboutMove

    protected Vector3 move_StartPosition;
    protected Vector3 move_EndPosition;
    protected float move_timer;
    protected bool move_StartMove;
    private float move_Speed;
    private float move_Distance;
    private Vector3 lastPosition;
    private AndaObjectBasic followTarget;
    private bool isfollowTarget;
    private float updateIntevalLimit;
    private float updateIntevalTime;
    #endregion

    #region AbboudRotationBody
    protected Quaternion rotate_bodyStartDir;
    protected Quaternion rotate_bodyEndDir;
    protected float rotate_bodyTimer;
    protected bool rotate_bodyStartRotate;
    private float rotate_bodyRotateSpeed;

    #endregion

    #region AboutRotateHead
    protected Quaternion rotate_headStartDir;
    protected Quaternion rotate_headEndDir;
    protected float rotate_headTimer;
    protected bool rotate_headStartRotate;
    private float rotate_headRotateSpeed;

    //AlwaysLookAt
    private bool allwalyLookAT;
    private Transform allwayLookAtTarget;
    private Quaternion lastLookAtRotate;
    #endregion

    public void DownloadMessage(MonsterBasic mb)
    {
        self = mb;
        InitValue();
    }

    public virtual void InitValue()
    {
       
        InitMoveValue();
        InitRotateBodyValue();
        InitRotateHeadValue();
    }


    private void InitMoveValue()
    {
        move_StartPosition = Vector3.zero;
        move_EndPosition = Vector3.zero;
        move_timer = 0;
        move_StartMove = false;
        move_Speed = 0;
        move_Distance = 0;
    }

    private void InitRotateBodyValue()
    {
        rotate_bodyStartDir = Quaternion.identity;
        rotate_bodyEndDir = Quaternion.identity;
        rotate_bodyTimer = 0;
        rotate_bodyStartRotate = false;
        rotate_bodyRotateSpeed = 0;
    }

    private void InitRotateHeadValue()
    {
        rotate_headStartDir = Quaternion.identity;
        rotate_headEndDir = Quaternion.identity;
        rotate_headTimer = 0;
        rotate_headStartRotate = false;
        rotate_headRotateSpeed = 0;
    }



    public void ControllerLookAtTargetPoint(Vector3 point)
    {
        ControllerLerpRotateHead(point);
      /*  float headBetweenBodyAngle = Quaternion.Angle(self.head.rotation, self.selfRotation);
        if (headBetweenBodyAngle > 90)
        {
            ControllerLearRotateBody(new Vector3(point.x,self.selfPosY,point.z));
        }*/
    }

    public void ControllerLearRotateBody(Vector3 point)
    {
        rotate_bodyStartDir = self.selfRotation;
        rotate_bodyEndDir = Quaternion.LookRotation(point - self.selfPostion);
        rotate_bodyTimer = 0;
        rotate_bodyRotateSpeed = 0.15f;
        rotate_bodyStartRotate = true;
    }
    public void ControllerLearRotateBody(Quaternion startDir, Quaternion endDir, float rotateSpeed )
    {
        rotate_bodyStartDir = startDir;
        rotate_bodyEndDir = endDir;
        rotate_bodyTimer = 0;
        rotate_bodyRotateSpeed = rotateSpeed;
        rotate_bodyStartRotate = true;
    }
    public void ControllerLerpRotateHead(Vector3 point)
    {
        rotate_headStartDir = self.head.rotation;
        rotate_headEndDir = Quaternion.LookRotation(point - self.head.position);
        rotate_headTimer = 0;
        rotate_headRotateSpeed = 0.15f;
        rotate_headStartRotate = true;
    }
    public void ControllerLerpRotateHead(Quaternion startDir, Quaternion endDir, float rotateSpeed, bool _bodyFollowHead = false)
    {
        rotate_headStartDir = startDir;
        rotate_headEndDir = endDir;
        rotate_headTimer = 0;
        bodyFollowHead = _bodyFollowHead;
        rotate_headRotateSpeed = rotateSpeed;
        rotate_headStartRotate = true;
    }

    public void ControllerAwaysLookAtTraget(Transform target, float rotateSpeed)
    {
        allwayLookAtTarget = target;
        rotate_headRotateSpeed = rotateSpeed;
        allwalyLookAT = true;
    }
    #region 移动
    public void ControllerLerpMoveBySpeed(Vector3 startPoint, Vector3 endPoint, float moveSpeed , System.Action callBack = null)
    {
        move_StartPosition = startPoint;
        move_EndPosition = endPoint;
        move_Speed = moveSpeed * ARMonsterSceneDataManager.Instance.getARWorldScale;
        move_Distance = Vector3.Distance(move_StartPosition, move_EndPosition);
        move_timer = Time.time;
        if (callBack != null && CallBackArrivalPoint == null)
        {
            CallBackArrivalPoint = callBack;
        }
        move_StartMove = true;
    }

    public void ControllerLerMoveByTran(AndaObjectBasic target)
    {
        followTarget = target;
        move_Speed = self.monsterDataValue.moveSpeed * ARMonsterSceneDataManager.Instance.getARWorldScale;
        move_StartPosition = self.selfPostion;
        move_EndPosition = target.selfPosZeroHeight;
        move_Distance = Vector3.Distance(move_StartPosition, move_EndPosition);
        move_timer = Time.time;
        updateIntevalTime = Time.time;
        updateIntevalLimit = 0.01f;
        isfollowTarget = true;
    }
    #endregion


    #region 执行移动
    protected void ExcuteControllerLerpMoveBySpeed()
    {
        if (self.selfPostion != move_EndPosition)
        {
            float dist = (Time.time - move_timer) * move_Speed;
            self.selfPostion = Vector3.Lerp(move_StartPosition, move_EndPosition, dist / move_Distance);
        }
        else
        {
            if (CallBackArrivalPoint != null)
            {
                CallBackArrivalPoint();
                CallBackArrivalPoint = null;//执行完就置空
            }
            self.ControllerToIdle();//到目标点了就赋值为待机
            move_StartMove = false;
        }
        //
    }
    protected void ExucteControllerFollowTarget()
    {
        
        if (followTarget != null)
        {
            /*if (Time.time - updateIntevalTime > updateIntevalLimit)
            {
                move_StartPosition = self.selfPostion;
                move_EndPosition = followTarget.selfPosZeroHeight;
                move_Distance = Vector3.Distance(move_StartPosition, move_EndPosition);
                updateIntevalTime = Time.time;
                move_timer = Time.time;
            }*/
            move_EndPosition = followTarget.selfPosZeroHeight;
            // float dist = (Time.time - move_timer) * move_Speed;
            // self.selfPostion = Vector3.Lerp(move_StartPosition,move_EndPosition,dist/move_Distance);

            self.selfPostion = Vector3.MoveTowards(self.selfPostion,move_EndPosition,Time.deltaTime * move_Speed);
        }
        else
        {
            StopMove();
        }
    }

    #endregion

    protected void ExcuteContyrollerLerpRotateBodySpeed()
    {
        if (self.selfRotation != rotate_bodyEndDir)
        {
            rotate_bodyTimer += Time.deltaTime;
            self.allBody.rotation = Quaternion.Lerp(rotate_bodyStartDir, rotate_bodyEndDir, rotate_bodyTimer / rotate_bodyRotateSpeed);
        }
        else
        {
            rotate_bodyStartRotate = false;
        }
    }

    protected void ExcuteControllerLErpRotateHeadSpeed()
    {
        if (self.head.rotation != rotate_headEndDir)
        {
            rotate_headTimer += Time.deltaTime;
            if (self.head.localRotation.eulerAngles.x < 45 && self.head.localRotation.eulerAngles.y < 45)
            {
                self.head.rotation = Quaternion.Lerp(rotate_headStartDir, rotate_headEndDir, 
                    rotate_headTimer / rotate_headRotateSpeed);
            }
        }
        else
        {
            rotate_headStartRotate = false;
        }
    }

    //执行注视
    protected void ExcuteControllerAllwayLookAtTarget()
    {
        if (allwayLookAtTarget == null)
        {
            allwalyLookAT = false;
            return;
        }
        lastLookAtRotate = Quaternion.LookRotation(allwayLookAtTarget.position - self.head.position);
        if (rotate_headEndDir != lastLookAtRotate)
        {
            rotate_headTimer = 0;
            rotate_headStartDir = self.head.rotation;
            rotate_headEndDir = lastLookAtRotate;
        }
        rotate_headTimer += Time.deltaTime;
        if (!self.isMove)
        {
            //没有移动的情况下 头部会决定身体转向 
            float headWithBodyAngle = Quaternion.Angle(self.head.rotation, self.selfRotation);
            if (headWithBodyAngle > 45)
            {
                Vector3 targetPosition = ARMonsterSceneDataManager.Instance.GetPositionWithARWorldY(allwayLookAtTarget.position);
                Quaternion targetRotate = Quaternion.LookRotation(targetPosition - self.selfPostion);
                ControllerLearRotateBody(self.selfRotation, targetRotate, 0.25f);
            }
            self.head.rotation = Quaternion.Lerp(rotate_headStartDir, rotate_headEndDir, rotate_headTimer / rotate_headRotateSpeed);
        }
    }


    public void StopMove()
    {
        move_StartMove = false;
        isfollowTarget = false;
    }

    public void StopRotateBody()
    {
        rotate_bodyStartRotate = false;
    }

    public void StopRotateHead()
    {
        rotate_headStartRotate = false;
    }

    public void StopAllActive()
    {
        StopMove();
        StopRotateBody();
        StopRotateHead();

    }


    public virtual void Update()
    {
        if (move_StartMove)
        {
            ExcuteControllerLerpMoveBySpeed();
        }

        if (rotate_bodyStartRotate)
        {
            ExcuteContyrollerLerpRotateBodySpeed();
        }

        if (rotate_headStartRotate)
        {
            ExcuteControllerLErpRotateHeadSpeed();
        }
        if (allwalyLookAT)
        {
            ExcuteControllerAllwayLookAtTarget();
        }
        if (isfollowTarget)
        {
            ExucteControllerFollowTarget();
        }
    }
    
}
