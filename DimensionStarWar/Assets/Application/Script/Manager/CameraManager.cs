using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class CameraManager : MonoBehaviour {

    public Camera ARKitCamera;
    public Camera ARCoreCamera;
    public Camera GameCamera;
    public Camera UICamera;
    public Camera UI3DCamera;
    public Transform fowardpoint;
    public Camera MapCamera;


    public GameObject UILight;
    public GameObject MapLight;
    public GameObject GameLight;
    private void Awake()
    {
       
        ARMonsterSceneDataManager.Instance.SetMainCamera(GameCamera);
        ARMonsterSceneDataManager.Instance.frontCameraPoint = fowardpoint;
        ARMonsterSceneDataManager.Instance.UICamera = UICamera;
       // ARMonsterSceneDataManager.Instance.UI3DCamera = UI3DCamera;
        ARMonsterSceneDataManager.Instance.MapCamera = MapCamera;
        ARMonsterSceneDataManager.Instance.UILight = UILight;
        ARMonsterSceneDataManager.Instance.MapLight = MapLight;
        ARMonsterSceneDataManager.Instance.SetGameLight(GameLight);
    }



    private void Update()
    {
        if(ARMonsterSceneDataManager.Instance.ARCamera!=null && ARMonsterSceneDataManager.Instance.ARCamera.gameObject.activeSelf)
        {
            GameCamera.transform.position = ARMonsterSceneDataManager.Instance.ARCamera.transform.position;
            GameCamera.transform.rotation = ARMonsterSceneDataManager.Instance.ARCamera.transform.rotation;
        }
    }

}
