using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
public class CameraGlory : MonoBehaviour {


    private Gyroscope gyro;
    private bool gyroSupported;
    private Quaternion rotFix;

    [SerializeField]
    private Transform gameWorld;
    private float startY;

    private bool isStartGlory;
    public UnityEvent OnGyroIsNotSupported;

    private Vector2 limitx;
    private Vector2 limity;

    private void StartCheck()
    {
        gyroSupported = SystemInfo.supportsGyroscope;
        gyro = Input.gyro;

    }

    public void SetLimit(Vector2 x , Vector2 y)
    {
        limitx=x;
        limity = y;
    }

    public void OpenGlory(Vector2 x, Vector2 y)
    {
        limitx = x;
        limity = y;

        if (!gyroSupported)
        {
            StartCheck();
        }

        if (gyroSupported)
        {

            gyro.enabled = true;
          //transform.transform.rotation = Quaternion.Euler(90f, 180f, 0f);
            rotFix = new Quaternion(0f, 0f, -1f, 0f);
            isStartGlory = true;
        }

    }

    public void CloseGlory()
    {
        if (gyroSupported)
        {
            gyro.enabled = false;
            //transform.transform.rotation = Quaternion.Euler(90f, 180f, 0f);
            rotFix = new Quaternion(0f, 0f, -1f, 0f);
            isStartGlory = false;
        }

        limitx = Vector2.zero;
        limity= Vector2.zero;
    }

    float timer = 0;


    Quaternion lastQuaternion ;
    Quaternion startQuaternion;

    public void FixedUpdate()
    {
        if (isStartGlory && gameObject.activeSelf)
        {

            startQuaternion = gyro.attitude * rotFix;

            lastQuaternion = transform.rotation;// Quaternion.Lerp(lastQuaternion, startQuaternion, Time.deltaTime);
           // lastQuaternion.x += startQuaternion.x;
            lastQuaternion.y -= startQuaternion.x;

            //Debug.Log("LastQuatere" + lastQuaternion.y);

            float e = Mathf.Clamp(lastQuaternion.y,limity[0],limity[1]);

            lastQuaternion.y = e;

            transform.rotation = Quaternion.Lerp(transform.rotation,lastQuaternion,Time.deltaTime*3f);



            //if(Vector3.a(t.y , transform.eulerAngles.y) < 5)return;


            //Debug.Log("x:" + t.x + "y:" + t.y + "z:" + t.z );
            ///float w = t.y*-1;
            /*if (t.y > 270)
             {
                 t.y = t.y - 360;
             }

             t.x = 0;

             t.z = 0;

             t.y *= -0.35f;*/

            //y = Mathf.Lerp(transform.eulerAngles.y , w, Time.deltaTime * 0.8f);

//            transform.eulerAngles = new Vector3(90,y,0);
        }
    }
}
