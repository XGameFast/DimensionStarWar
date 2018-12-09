using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterItemTouchEvent : MonoBehaviour {

    public void OnDisable()
    {
        #if UNITY_EDITOR
        Debug.Log("remove componment");
        #endif
        FingerEvent.RotateItemEvent -= ListenrRotateEvent;
        FingerEvent.ScaleItemEvent -= ListenerScaleEvent;
        FingerEvent.StopUpdate();
    }

    public void OnEnable()
    {

        #if UNITY_EDITOR
        Debug.Log("add componment");
        #endif
        FingerEvent.RotateItemEvent += ListenrRotateEvent;
        FingerEvent.ScaleItemEvent += ListenerScaleEvent;
    }

    public void OnUpdate()
    {
        FingerEvent.OnUpdate();
    }

    private bool isTrigger =false;
    private bool isScaleTrigger  = false;
    private void ListenrRotateEvent(Vector3 delta)
    {
        delta*=1;

        if(!isTrigger)
        {
          //  Debug.Log("anlge" + angle);

            if(Mathf.Abs((360 - delta.y)%360) < 185 )
            {
                AndaGameExtension.ImpactFeedbackStyleLight();
                isTrigger = true;

                #if UNITY_EDITOR
                Debug.Log("旋转锁定");
                #endif
            }
        }else
        {
            if(Mathf.Abs((360 - delta.y) % 360) > 175 )
            {
                isTrigger = false;

                #if UNITY_EDITOR
                Debug.Log("旋转解锁");
                #endif
            }
                
        }
        transform.eulerAngles = delta + new Vector3(0, 180f, 0);


    }

    private void ListenerScaleEvent(Vector3 scale)
    {
        transform.localScale = scale;
        if (transform.localScale.x <= 1&& transform.localScale.x>0.5)
        {
            if (isScaleTrigger)
            {
                AndaGameExtension.ImpactFeedbackStyleLight();
                isScaleTrigger = false;
            }
        }
        else 
        {
            isScaleTrigger = true;
        }

//        Debug.Log(Mathf.Abs(scale.x));
//        if (transform.localScale.x > 1 && scale.x < 1)
//        {
//            isScaleTrigger = true;
//        }
//        if ( scale.x > 2)
//        {
//            isScaleTrigger = false;
//        }
//        else
//        {
//            if (!isScaleTrigger)
//            {
//                if (Mathf.Abs(scale.x - 1) < 0.15f)
//                {
//                    scale = Vector3.one;
//                    AndaGameExtension.ImpactFeedbackStyleLight();
//                    isScaleTrigger = true;

//#if UNITY_EDITOR
//                    Debug.Log("缩放锁定");
//#endif
//                }
//                transform.localScale = scale;
//            }
//            else
//            {
//                if (Mathf.Abs(scale.x - 1) > 0.15f)
//                {
//                    isScaleTrigger = false;
//#if UNITY_EDITOR
//                    Debug.Log("缩放解锁");
//#endif
//                }
//                transform.localScale = Vector3.one;

//            }
//        }
      

    }
}
