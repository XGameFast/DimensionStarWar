using UnityEngine;
using GoogleARCore;
public class AndaARCoreManager : MonoBehaviour
{
    public Camera arCoreCamera;
    public ARCoreSession aRCoreSession;


    public void OpenARCore()
    {
        if(arCoreCamera == null)
        {
            Debug.LogError("JIRVIS: ARCore Camera is null");
        }
        arCoreCamera.gameObject.SetTargetActiveOnce(true);
        ARMonsterSceneDataManager.Instance.ARCamera = arCoreCamera;
        aRCoreSession.gameObject.SetTargetActiveOnce(true);
    }

    public void CloseARCore()
    {
        aRCoreSession.gameObject.SetActive(false);
        arCoreCamera.gameObject.SetActive(false);
    }

}