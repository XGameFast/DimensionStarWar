using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.iOS;

public class AndaARCameraManager : MonoBehaviour {

    public AndaARKitSession andaARKitSession;
    public Camera ARKitCamera;

    public void OpenARKitSession()
    {
        ARKitCamera.gameObject.SetTargetActiveOnce(true);
        ARMonsterSceneDataManager.Instance.ARCamera = ARKitCamera;
        andaARKitSession.m_camera = ARKitCamera;
        andaARKitSession.gameObject.SetTargetActiveOnce(true);
        andaARKitSession.StartScannerPlane();
    }

    public void CloseARKitSession()
    {
        andaARKitSession.EndScannerPlane();
        andaARKitSession.gameObject.SetTargetActiveOnce(false);

        ARKitCamera.gameObject.SetTargetActiveOnce(false);
    }




}
