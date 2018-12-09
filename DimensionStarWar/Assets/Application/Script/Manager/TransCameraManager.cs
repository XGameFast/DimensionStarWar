using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TransCameraManager {



    /*
     * 这是一个单例，有需要时都可以调用
     * 这是相机过长运动的管理脚本。想要实现各种运动，只需写好子类，并暴露出接口，由这里作为入口调用。
     */

    private static TransCameraManager _instance = null;
    public static TransCameraManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new TransCameraManager();
            }
            return _instance;
        }
    }
    public OTYPE.SceneTranslationType currentTranslateCameraType;
    public void SetCurrentTranslateType(OTYPE.WolrdType lastSceneWorldType , OTYPE.WolrdType curSceneType)
    {
        
        if (lastSceneWorldType == OTYPE.WolrdType.none)
        {
            currentTranslateCameraType = OTYPE.SceneTranslationType.Galitch;
            return;
        }

        //真实到虚拟 和 虚拟到 真实相机 抖动

        //虚拟到虚拟 相机为 虚影 残影

        if (lastSceneWorldType == OTYPE.WolrdType.Reality && curSceneType == OTYPE.WolrdType.Virtual)
        {
            currentTranslateCameraType = OTYPE.SceneTranslationType.Galitch;
        }
        else
        if (lastSceneWorldType == OTYPE.WolrdType.Virtual && curSceneType == OTYPE.WolrdType.Virtual)
        {
            currentTranslateCameraType = OTYPE.SceneTranslationType.LinearBlur;
        }
        else
        if (lastSceneWorldType == OTYPE.WolrdType.Virtual && curSceneType == OTYPE.WolrdType.Reality)
        {
            currentTranslateCameraType = OTYPE.SceneTranslationType.Galitch;
        }
    }

    

}
