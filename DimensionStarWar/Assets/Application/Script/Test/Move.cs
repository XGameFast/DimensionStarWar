using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Move : MonoBehaviour {

    public Transform followTarget;
    public RotateControl player;

    Vector3 offset;

    private void Start()
    {
        offset = followTarget.position - transform.position;
        anim = transform.GetComponentInChildren<Animator>();
    }

    Vector3 lastFrame;
    Animator anim;

    Vector3 lastFollowFrame;

    Vector3 targetPosition;


    float timer = 0;
    private void Update()
    {
      //  Debug.Log( "timer ：" + timer);
        targetPosition = new Vector3((followTarget.position + followTarget.forward * 2).x, 0, (followTarget.position + followTarget.forward * 2).z);
        
        transform.position = Vector3.Lerp(transform.position, targetPosition,timer);

        if (timer >= 1) { timer = 0; }

        if (transform.position.Equals(lastFrame))
        {
            anim.SetBool("ismove", false);
            timer += Time.deltaTime *0.5f;
        }
        else {
            anim.SetBool("ismove", true);
            // timer += Time.deltaTime * 0.01f;
             
        }
        lastFrame = transform.position;


        ListenerPosition();
        ListenerRotation();
    }

    public void ListenerPosition()
    {
       

        if (!followTarget.position.Equals(lastFollowFrame))
        {

            if (Vector3.Distance(followTarget.position, lastFollowFrame) < 0.2f)
            {
                return;
            }
            //  Debug.Log(Vector3.Angle((followTarget.position - lastFollowFrame).normalized, followTarget.right));
            // 移动了
            if (Vector3.Angle((followTarget.position - lastFollowFrame).normalized, followTarget.right) < 60)
            {
                Debug.Log("向右");
                player.StartMove(Quaternion.LookRotation(followTarget.forward + followTarget.right), Quaternion.LookRotation(followTarget.forward));
            }
            else if (Vector3.Angle((followTarget.position - lastFollowFrame).normalized, followTarget.right) > 145)
            {
                Debug.Log("向左");
                player.StartMove(Quaternion.LookRotation(followTarget.forward - followTarget.right), Quaternion.LookRotation(followTarget.forward));
            }
            else
            {
                Debug.Log("向前");
                player.StartMove(Quaternion.LookRotation(followTarget.forward), Quaternion.LookRotation(followTarget.forward));
            }
        }
        else
        {
            player.StopMove();
        }

        lastFollowFrame = followTarget.position;
    }

    Vector3 lastFrameQuaternion;

    public void ListenerRotation()
    {
        if (!followTarget.eulerAngles.Equals(lastFrameQuaternion))
        {

            if (Mathf.Abs(followTarget.eulerAngles.y - lastFrameQuaternion.y)<1)
            {
                return;
            }

            if ((followTarget.eulerAngles.y - lastFrameQuaternion.y) > 0)
            {
                player.StartMove(Quaternion.LookRotation(followTarget.forward + followTarget.right), Quaternion.LookRotation(followTarget.forward));
            }
            else
            {
                player.StartMove(Quaternion.LookRotation(followTarget.forward - followTarget.right), Quaternion.LookRotation(followTarget.forward));
            }
        }
        lastFrameQuaternion = followTarget.transform.eulerAngles;
    }

}
