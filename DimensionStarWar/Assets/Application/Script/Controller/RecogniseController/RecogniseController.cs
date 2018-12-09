using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.iOS;
public class RecogniseController : BaseController {
    public AndaARWorldController andaARWorldController;

    private AndaObjectBasic worldPoint;
    public override void StartController()
    {
        base.StartController();
        BuildAndaARKit();
    }
    private void BuildAndaARKit()
    {
        JIRVIS.Instance.PlayTips(OTYPE.Tipscontent.recognise);
        //andaARWorldController.StartAR(SetARWorld, RestARWorld);
    }

    private void SetARWorld(Vector3 pose, Quaternion rote)
    {
        //
        Debug.Log("AndaSaid: set ARWorld success");
        //worldPoint = AndaDataManager.Instance.InstantiateOtherObj("DimensionRoom");
        //worldPoint.transform.position = pose;
        //worldPoint.transform.rotation = rote;
        arWorld.transform.position = pose;
        //arWorld.transform.rotation = rote;
        //ARMonsterSceneDataManager.Instance.arWolrdCenterPosition = pose;
        //UnityARSessionNativeInterface.GetARSessionNativeInterface().SetWorldOrigin(arWorld.transform);
        //callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
    }
    
    private void RestARWorld()
    {
        worldPoint.DestroyByAndaDataManager();
    }
    
}
