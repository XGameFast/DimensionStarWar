using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateControl : MonoBehaviour {

    public Transform head;
    public Transform body;

    [HideInInspector]
    public bool rotateHead;
    [HideInInspector]
    public bool rotateBody;

    [HideInInspector]
    public Quaternion target_rotation_head;
    [HideInInspector]
    public Quaternion target_rotation_body;

    [HideInInspector]
    public Quaternion start_rotation_head;
    [HideInInspector]
    public Quaternion start_rotation_body;


    public float speed_head = 1;
    public float speed_body = 1;
    private Vector3 tmpPoint;
    public void LookRotation(Vector3 point)
    {
        if (isMove)
        {
            return;
        }
      //  Debug.Log(" look rotation ");
        tmpPoint = point;
        var direction = point - transform.position;
        //  Debug.Log("Look Rotation");
        direction = direction.normalized;
        Vector3 temp = new Vector3(0,direction.y,0);
        direction = new Vector3(direction.x,0,direction.z);

        Quaternion a = Quaternion.LookRotation(direction);


        // 判断目标方向和当前方向的角度
        int angle = (int)Vector3.Angle(transform.forward,direction);
        if (Vector3.Angle(transform.forward,direction) > 60)
        {
            // 判断是正方向 还是 负方向

            var result = Quaternion.AngleAxis(angle, Vector3.up) * transform.forward;
            if (Vector3.Angle(result,direction) <= 5)
            {
              //  Debug.Log("正方向");
                // 先让头正方向移动 60 度 
                Vector3 headDir = Quaternion.AngleAxis(60, Vector3.up) * transform.forward;

               // Debug.Log(Vector3.Angle(headDir, (headDir + temp)));

                if (Vector3.Angle(headDir, (headDir + temp)) > 60)
                {
                    if (temp.y > 0)
                    {
                        temp = Quaternion.AngleAxis(-60, head.transform.right) * head.transform.forward;
                        temp = new Vector3(0, temp.y, 0);
                    }
                    else
                    {
                        temp = Quaternion.AngleAxis(45, head.transform.right) * head.transform.forward;
                        temp = new Vector3(0, temp.y, 0);
                    }
                }


                target_rotation_head = Quaternion.LookRotation(headDir + temp);
                
                start_rotation_head = head.transform.rotation;
                rotateHead = true;
                // 剩下的角度让身体转动

                Vector3 bodyDir = Quaternion.AngleAxis(angle - 60, Vector3.up) * transform.forward;
                target_rotation_body = Quaternion.LookRotation(bodyDir);
                start_rotation_body = body.transform.rotation;
                rotateBody = true;

            }
            else {
             //   Debug.Log("负方向");
                Vector3 headDir = Quaternion.AngleAxis(-60, Vector3.up) * transform.forward;

               // Debug.Log(Vector3.Angle(headDir, (headDir + temp)));
                // 限定上下范围
                if (Vector3.Angle(headDir, (headDir + temp)) > 60)
                {
                    if (temp.y > 0)
                    {
                        temp = Quaternion.AngleAxis(-60, head.transform.right) * head.transform.forward;
                        temp = new Vector3(0, temp.y, 0);
                    }
                    else
                    {
                        temp = Quaternion.AngleAxis(45, head.transform.right) * head.transform.forward;
                        temp = new Vector3(0, temp.y, 0);
                    }
                }

                target_rotation_head = Quaternion.LookRotation(headDir + temp);
                start_rotation_head = head.transform.rotation;
                rotateHead = true;
                // 剩下的角度让身体转动

                Vector3 bodyDir = Quaternion.AngleAxis(-(angle - 60), Vector3.up) * transform.forward;
                target_rotation_body = Quaternion.LookRotation(bodyDir);
                start_rotation_body = body.transform.rotation;
                rotateBody = true;

            }

            // 先把头转过去

        }
        else
        {
            // 可以直接转过去

            if (Vector3.Angle(direction, (direction + temp)) > 60)
            {
                if (temp.y > 0)
                {
                    temp = Quaternion.AngleAxis(-60, head.transform.right) * head.transform.forward;
                    temp = new Vector3(0, temp.y, 0);
                }
                else
                {
                    temp = Quaternion.AngleAxis(45, head.transform.right) * head.transform.forward;
                    temp = new Vector3(0, temp.y, 0);
                }
            }
            target_rotation_head = Quaternion.LookRotation(direction + temp);
            rotateHead = true;
            start_rotation_head = head.transform.rotation;
        }
    }

    


    float timer = 0;


    Vector3 headPosition;
    Vector3 headUpPosition;
    Vector3 headDownPosition;

    private bool isMove = false;

    private MoveType m_CurrentMoveType;


    float moveTimer = 0;
    public void StartMove(Quaternion direction,Quaternion headDir)
    {
        isMove = true;

        moveTimer += Time.deltaTime;

        start_rotation_head = headDir;
        target_rotation_head = headDir;

        start_rotation_body = direction;
        target_rotation_body = direction;

        head.transform.rotation = headDir;


        body.transform.rotation = Quaternion.Lerp(body.transform.rotation,  direction,moveTimer);

        if (moveTimer >= 1)
        {
            moveTimer = 0;
        }

    }

    public void StopMove()
    {
        isMove = false;
    }

    private void Update()
    {
        Debug.DrawLine(head.position,tmpPoint ,Color.blue );

        
        if (rotateHead)
        {
            timer += Time.deltaTime *(speed_head) ;
            head.transform.rotation = Quaternion.Lerp(start_rotation_head, target_rotation_head,timer);
            if (timer >= 1)
            {
                timer = 0;
                rotateHead = false;
            }

            if (head.transform.rotation .Equals(target_rotation_head))
            {
                rotateHead = false;
            }

        }

        //if (rotateHead == false) // 说明头已经转动结束了
        //{
         
            if (rotateBody == true) // 开始转动身体
            {
                timer += Time.deltaTime * speed_body;
                body.transform.rotation = Quaternion.Lerp(start_rotation_body, target_rotation_body, timer);
                if (timer >= 1)
                {
                    timer = 0;
                    rotateBody = false;
                }
            }
        
        //}
        //}

    }
    
}

public enum MoveType
{
    Left,
    Right
}
