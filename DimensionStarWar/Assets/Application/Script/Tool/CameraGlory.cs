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
           // transform.transform.rotation = Quaternion.Euler(90f, 180f, 0f);
            rotFix = new Quaternion(0f, 0f, 1f, 0f);
            isStartGlory = true;
        }

    }

    public void CloseGlory()
    {
        if (gyroSupported)
        {
            gyro.enabled = false;
           // transform.transform.rotation = Quaternion.Euler(90f, 180f, 0f);
            rotFix = new Quaternion(0f, 0f, 1f, 0f);
            isStartGlory = false;
        }

        limitx = Vector2.zero;
        limity= Vector2.zero;
    }

    float timer = 0;

    public void Update()
    {
        if (isStartGlory && gameObject.activeSelf)
        {

            Quaternion quaternion = gyro.attitude * rotFix;
            transform.localRotation = quaternion;



            Vector3 t = transform.eulerAngles;
            if(t.y>270)
            {
                t.y = t.y - 360;
            }
            //Debug.Log("t.yyyyyyyyyyyyyyyyyy" + t.y);
            t.x = 0;//Mathf.Clamp(t.x,liitx[0],limitx[1]);
            t.y = Mathf.Clamp(t.y,limity[0],limity[1]);
           // Debug.Log("t.y" + t.y);
            t.z = 0;//Mathf.Clamp(t.z, limity[0], limity[1]);

            // float y = Mathf.Lerp(transform.eulerAngles.y , t.y ,Time.deltaTime);
            t.y*=0.1f;
           // t.y = y;
            transform.eulerAngles =t;
            // float y = Time.deltaTime * t.y;
            // t.y = y;
            //transform.eulerAngles = t;
            //timer += Time.deltaTime;
           // transform.eulerAngles = Vector3.Lerp(transform.eulerAngles, t,Time.deltaTime);
            //Debug.Log("Run here?!!??");
        }
    }
}
