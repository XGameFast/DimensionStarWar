using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
public class VirtulARSession : MonoBehaviour {

    private Gyroscope gyro;
    private bool gyroSupported;
    private Quaternion rotFix;
     
    [SerializeField]
    private Transform gameWorld;
    private float startY;

    private bool isStartVirtualAR;
    public UnityEvent OnGyroIsNotSupported;

    private void StartCheck()
    {
        gyroSupported = SystemInfo.supportsGyroscope;
        gyro = Input.gyro;
    
    }

    public void CloseVirtualARSession()
    {
        if (gyroSupported)
        {
            gyro.enabled = false;
            transform.parent.transform.rotation = Quaternion.Euler(90f, 180f, 0f);
            rotFix = new Quaternion(0f, 0f, 1f, 0f);
            isStartVirtualAR =false;
        }
    }

    public void OpenVirtualARSession()
    {
        if(!gyroSupported)
        {
            StartCheck();
        }

        if(gyroSupported)
        {

            gyro.enabled = true;
            transform.parent.transform.rotation = Quaternion.Euler(90f, 180f, 0f);
            rotFix = new Quaternion(0f, 0f, 1f, 0f);
            isStartVirtualAR =true;
        }

    }

    public void Update()
    {
        if(isStartVirtualAR && gameObject.activeSelf)
        {
            transform.localRotation = gyro.attitude * rotFix;
        }
    }
}
