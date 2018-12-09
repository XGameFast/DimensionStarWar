using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.iOS;
public class AndaARKitSession : MonoBehaviour {


    public Camera m_camera;
    private UnityARSessionNativeInterface m_session;
    private Material savedClearMaterial;

    [Header("AR Config Options")]
    public UnityARAlignment startAlignment = UnityARAlignment.UnityARAlignmentGravity;
    public UnityARPlaneDetection planeDetection = UnityARPlaneDetection.Horizontal;
    public ARReferenceImagesSet detectionImages = null;
    public bool getPointCloud = true;
    public bool enableLightEstimation = false;
    public bool enableAutoFocus = false;
    private bool sessionStarted = false;
    private ARKitWorldTrackingSessionConfiguration config;
    private UnityARVideo _unityARVideo = null;
    public UnityARVideo unityARVideo
    {
        get {
            if (_unityARVideo == null)
            {
                _unityARVideo = m_camera.GetComponent<UnityARVideo>();
            }
            return _unityARVideo;
        }
    }

    void Awake()
    {
        if (m_camera == null)
        {
            Debug.Log("Anda Said: AndaARCameraManager m_camera is null ");
            return;
        }

        m_session = UnityARSessionNativeInterface.GetARSessionNativeInterface();

        Application.targetFrameRate = 60;

        config = new ARKitWorldTrackingSessionConfiguration();
        config.planeDetection = planeDetection;
        config.alignment = startAlignment;
        config.getPointCloudData = getPointCloud;
        config.enableLightEstimation = enableLightEstimation;
        config.enableAutoFocus = enableAutoFocus;

        if (detectionImages != null)
        {
            config.arResourceGroupName = detectionImages.resourceGroupName;
        }
    }

    public void StartScannerPlane()
    {
        if (m_session != null)
        {
            //UnityARSessionRunOption runOption = UnityARSessionRunOption.ARSessionRunOptionRemoveExistingAnchors | UnityARSessionRunOption.ARSessionRunOptionResetTracking;
            UnityARSessionRunOption runOptions = UnityARSessionRunOption.ARSessionRunOptionRemoveExistingAnchors | UnityARSessionRunOption.ARSessionRunOptionResetTracking;
            m_session.RunWithConfigAndOptions(config, runOptions);// (config, runOption);
            UnityARSessionNativeInterface.ARFrameUpdatedEvent += FirstFrameUpdate;
        }
    }

    public void EndScannerPlane()
    {
        if (m_session != null)
        {
            m_session.Pause();

        }

        sessionStarted = false;
    }

    public void OnDisable()
    {

    }


    void FirstFrameUpdate(UnityARCamera cam)
    {
        sessionStarted = true;
        UnityARSessionNativeInterface.ARFrameUpdatedEvent -= FirstFrameUpdate;
    }

    public void SetCamera(Camera newCamera)
    {
        if (m_camera != null)
        {
            UnityARVideo oldARVideo = m_camera.gameObject.GetComponent<UnityARVideo>();
            if (oldARVideo != null)
            {
                savedClearMaterial = oldARVideo.m_ClearMaterial;
                Destroy(oldARVideo);
            }
        }
        SetupNewCamera(newCamera);
    }

    private void SetupNewCamera(Camera newCamera)
    {
        m_camera = newCamera;

        if (m_camera != null)
        {
            UnityARVideo unityARVideo = m_camera.gameObject.GetComponent<UnityARVideo>();
            if (unityARVideo != null)
            {
                savedClearMaterial = unityARVideo.m_ClearMaterial;
                Destroy(unityARVideo);
            }
            unityARVideo = m_camera.gameObject.AddComponent<UnityARVideo>();
            unityARVideo.m_ClearMaterial = savedClearMaterial;
        }
    }

    // Update is called once per frame


    void Update()
    {
        if (m_camera != null && sessionStarted)
        {
            // JUST WORKS!
            Matrix4x4 matrix = m_session.GetCameraPose();
            m_camera.transform.localPosition = UnityARMatrixOps.GetPosition(matrix);
            m_camera.transform.localRotation = UnityARMatrixOps.GetRotation(matrix);
            m_camera.projectionMatrix = m_session.GetCameraProjection();

            //Debug.Log(matrix);
        }
    }

}
