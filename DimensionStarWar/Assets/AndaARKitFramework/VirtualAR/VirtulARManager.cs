using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class VirtulARManager : MonoBehaviour {

    public VirtulARSession virtulARSession ;

    public Camera virtualARCamera;
    public GameObject arBackground;
    public void OpenVirtualARSession()
    {
        ARMonsterSceneDataManager.Instance.ARCamera = virtualARCamera;
        ARMonsterSceneDataManager.Instance.ARCamera.gameObject.SetTargetActiveOnce(true);
        arBackground.gameObject.SetTargetActiveOnce(true);
        virtulARSession.OpenVirtualARSession();
    }

    public void CloseVirtualARSession()
    {
        ARMonsterSceneDataManager.Instance.ARCamera.gameObject.SetTargetActiveOnce(false);
        arBackground.gameObject.SetTargetActiveOnce(false); 
        virtulARSession.CloseVirtualARSession();
    }

    public void OpenVirtualMenu(System.Action<float> _callbackSliderValue , System.Action callbackStartReconize)
    {
      
        VirtualARSetMenu virtualARSet = AndaUIManager.Instance.PopingMenu2<VirtualARSetMenu>("VirtualARSetMenu");
        virtualARSet.FadeIn();
        virtualARSet.SetInfo(_callbackSliderValue , callbackStartReconize);
    }

}
