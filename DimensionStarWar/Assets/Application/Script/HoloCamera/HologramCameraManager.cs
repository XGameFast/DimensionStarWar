using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HologramCameraManager  {

    private static HologramCameraManager _instance;

    public static HologramCameraManager Instance
    {
        get
        {
            if(_instance == null)
            {
                _instance =  BuildHologarmCameraManager();
            }
            return _instance;
        }
    }

    public HologarmCameraData data;

    private static HologramCameraManager BuildHologarmCameraManager()
    {
        HologramCameraManager hologramCameraManager = new HologramCameraManager();
        hologramCameraManager.data = new HologarmCameraData();
        hologramCameraManager.data.BuildMenu();
        return hologramCameraManager;
    }

    //显示视窗范围内的物件的信息
    public void DisplayViewportRangeObjecstInformaiton()
    {
        foreach(var go in ARMonsterSceneDataManager.Instance.sceneObjects)
        {
            if(go.transform.position.IsInScreenViewport(ARMonsterSceneDataManager.Instance.mainCamera))
            {
                if(data.CheckHasThisObject(go))
                {
                    data.UpdateHologarmInfoItemposition(go);
                }else
                {
                    data.BuildHologarmInfoItem(go);
                }

            }else
            {
                data.RemoveHologarmInfoItem(go);
            }
        }
    }
    //显示摄像机中心发出的射线 对焦的物件的信息
    public void DisplayCameraCenterRayObjectInformation()
    {
        //---
    }

}
