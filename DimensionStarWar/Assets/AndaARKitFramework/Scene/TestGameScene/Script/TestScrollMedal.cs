using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestScrollMedal : MonoBehaviour {

    Vector3 tmpEuler ;
    private bool autoRotate =false;
    private float startEuler;
    private float curTime;
    private float lessTime;
    private float loadTime;
    private float curSpeed;
    private float angle;
    private float tagetAnlge;

    private bool isStartRotate =false;
    private float timer = 0;
    private float speed = 0;
    private int dir = 1;
    private Quaternion curQuaernion;
    private Quaternion targetQuaternion;
   // private float le
	// Use this for initialization
	void Start () {
        FingerEvent.HoriDragGetSpeed += ControlMedalRotate;
    }
	public void ControlMedalRotate(float delta,float _speed ,bool isDown)
    {
        speed = _speed*0.09f;
        if(isDown)
        {
            isStartRotate=false;
            Vector3 vector = transform.eulerAngles;
            vector.y+= -speed*Time.deltaTime;
            transform.eulerAngles = vector;
            autoRotate=false;
        }else
        {
            curTime =1f;
            curSpeed = speed;
            isStartRotate = true;
        }
    }

    private void ExcuteRotate()
    {


        if(Mathf.Abs(speed) < 50)
        {
            if(!autoRotate)
            {

                if(transform.eulerAngles.y > 270 && transform.eulerAngles.y <360 || transform.eulerAngles.y >0 && transform.eulerAngles.y < 90)
                {
                    angle = 360 - transform.eulerAngles.y;
                    if(angle> 270)
                    {
                        angle = Mathf.Abs( angle -360);
                    }
                   
                    curQuaernion = transform.rotation;
                    targetQuaternion = new Quaternion(0,0,0,1);
                }else
                {
                    
                    curQuaernion = transform.rotation;
                    targetQuaternion = new Quaternion(0,1,0,0);
                }
                curTime= 0;
                loadTime =  angle /90;
                loadTime = 1- loadTime;
                autoRotate =true;
                lessTime = 0.5f;



                //Debug.Log("LoddTime" + loadTime);
            }else
            {  
                curTime += Time.deltaTime;
                if(curTime < loadTime)
                {
                    lessTime =  curTime / loadTime;
                }

                transform.rotation = Quaternion.Lerp(curQuaernion , targetQuaternion,lessTime);
                if(lessTime >1 )
                {
                    isStartRotate =false;
                }
            }
        }else
        {
            curTime -= Time.deltaTime;
            speed*=curTime;
            Vector3 vector = transform.eulerAngles;
            vector.y+= -speed*Time.deltaTime;
            transform.eulerAngles = vector;
        }
    }

    public void Update()
    {
        FingerEvent.OnUpdate();
        if(isStartRotate)
        {
            ExcuteRotate();
        }
    }
}
