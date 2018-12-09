using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaTool_ParabolaMove : AndaPhysicToolsBaisc {

    private float moveTime;
    private Vector3 startPoint;
    private Vector3 endPoint;
    private Transform target;

    private float g = -10f;//重力
    private Vector3 speed;//初始速度向量;
    private Vector3 Gravity;//重力向量
    private System.Action CallBackFinishMove;
    private bool isStartMove = false;
    public void SetParabolaMove(Vector3 _startPoint,Vector3 _endPoint,float _moveTime,System.Action callback)
    {
        CallBackFinishMove = callback;
        moveTime = _moveTime;
        startPoint = _startPoint;
        endPoint = _endPoint;
        target = transform;
        target.position = startPoint;

        //通过一个式子计算初速度
        speed = new Vector3((endPoint.x - startPoint.x) / moveTime,
            (endPoint.y - startPoint.y) / moveTime - 0.5f * g * moveTime, (endPoint.z - startPoint.z) / moveTime);

        Gravity = Vector3.zero;//重力初始速度为0

    }

    public void StartParabolaMove()
    {
        isStartMove = true;
    }

    private float dTime = 0;

    protected override void OnFixedUpdate()
    {
        base.OnFixedUpdate();
        if (!isStartMove) return;

        if (currentIndex < pointlist.Length)
        {
            if (transform.position == pointlist[currentIndex])
            {
                timer = 0;
                startMovePoint = pointlist[currentIndex];
                currentIndex += 1;

            }
            else
            {
                timer += Time.deltaTime*10;
                transform.position = Vector3.Lerp(startMovePoint, pointlist[currentIndex], timer);
            }
        }
        else
        {
            isStartMove = false;
            CallBackFinishMove();
        }

       // target.transform.position = Vector3.Lerp()


        /*Gravity.y = g * (dTime += Time.fixedDeltaTime);//v=at
        target.Translate(speed * Time.fixedDeltaTime);
        target.Translate(Gravity * Time.fixedDeltaTime);

        if (Vector3.Distance(target.position, endPoint) < 0.1f)
        {
            isStartMove = false;
            CallBackFinishMove();
        }*/
    }

    //---test--
    private Vector3[] pointlist;
    private int currentIndex;
    private Vector3 startMovePoint;
    private float timer;
    public void SetPoint(Vector3[] _pointliset,System.Action callback)
    {
        CallBackFinishMove = callback;
        pointlist = _pointliset;
        currentIndex = 0;
        isStartMove = true;
        timer = 0;
        //----
    }
}
