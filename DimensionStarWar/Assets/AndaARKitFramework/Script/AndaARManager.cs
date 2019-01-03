using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaARManager  {

    private static AndaARManager _instance;
    public static AndaARManager Instance
    {
        get
        {
            if(_instance == null)
            {
                _instance = new AndaARManager();
            }

            return _instance;
        }
    }

    public AndaARWorldController andaARWorldController;
    public AndaARCameraManager andaARCameraManager;

    private System.Action FinishRegconize;
    private System.Action FinishCloseRegconize;

    public bool isSetARPose;
    public bool isFixed=false;
    public void SetController(AndaARWorldController _andaARWorldController ,AndaARCameraManager _andaARCameraManager)
    {
        andaARWorldController = _andaARWorldController;
        andaARCameraManager = _andaARCameraManager;
    }

    public void BuildARController()
    {
        andaARWorldController.BuildARController();
    }

    public void StartAR(System.Action callback)
    {
        JIRVIS.Instance.PlayTips("请四处走走，寻找一个水平面，让我更好的构建次元世界!",false);

        andaARWorldController.StartAR(FinishSetARanchorpont);
        //ARMonsterSceneDataManager.Instance.UI3DCamera.gameObject.SetTargetActiveOnce(false);
        //OpenARVideo(true);
        //ARMonsterSceneDataManager.Instance.ARCamera.gameObject.SetTargetActiveOnce(true);
        ARMonsterSceneDataManager.Instance.mainCamera.gameObject.SetTargetActiveOnce(true);
        FinishRegconize = callback;
      
    }

    public void OpenARVideo(bool isOpen)
    {
        ARMonsterSceneDataManager.Instance.uar.enabled=isOpen;
        ARMonsterSceneDataManager.Instance.unityARCameraNearFar.enabled=isOpen;
    }

    public void SetItemtoScannerScreen(int id)
    {
        andaARWorldController.aRScannerData.BuildScannerItem(id);
    }

    public void SetItemToScreenPoint(Transform _item )
    {
        
    }

    public void StopAR(System.Action callback=null)
    {
        if(isSetARPose)
        {
            ARMonsterSceneDataManager.Instance.aRWorld.OpenARKiteShadow(false);
            FinishCloseRegconize = callback;
            andaARWorldController.StopAR(callback);
            isSetARPose =false;
        }else
        {
            if(callback!=null)
            {
                callback();
            }
        }
            
        //ARMonsterSceneDataManager.Instance.UI3DCamera.gameObject.SetTargetActiveOnce(true);

      
    }

    private void FinishSetARanchorpont(Vector3 pose,Quaternion rose , bool isRestPose)
    {
        ARMonsterSceneDataManager.Instance.aRWorld.SetTargetActiveOnce(true);

        ARMonsterSceneDataManager.Instance.aRWorld.transform.position = pose;


       // ARMonsterSceneDataManager.Instance.GameLight.transform.forward = ARMonsterSceneDataManager.Instance.mainCamera.transform.forward;

        float distance = Vector3.Distance(pose,ARMonsterSceneDataManager.Instance.arCameraPosition);

        float scale =  Mathf.Clamp01(distance);



        if(!isFixed)
        {
            if (scale < 0.5f) scale *= 0.4f;
            else scale *= 0.85f;
        }else
        {
            scale = 1;
        }
      


        ARMonsterSceneDataManager.Instance.aRWorld.transform.localScale =  Vector3.one * scale;

        ARMonsterSceneDataManager.Instance.aRWorld.OpenARKiteShadow(true);

        ARMonsterSceneDataManager.Instance.aRWorld.arworldScalePercent = scale;


#if UNITY_EDITOR
        //ARMonsterSceneDataManager.Instance.aRWorld.OpenTestGameGround(true);
#endif


        isSetARPose = true;
    
        //如果不是重置的位置的事件，则要向控制器发送构建AR世界完成的消息
        if(!isRestPose)
        {
            FinishRegconize();
        }
    }


    public void SetNeedFixedScale(bool _isFixed)
    {
        isFixed = _isFixed;
    }


}