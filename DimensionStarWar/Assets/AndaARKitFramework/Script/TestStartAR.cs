using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.iOS;
using UnityEngine.XR.iOS.Utils;
public class TestStartAR : MonoBehaviour {

    public AndaARWorldController andaARWorldController;

    public GameObject testPlane;

    
	private void Start()
	{
		//andaARWorldController.StartARCamera(TestSetARWorldReq,TestResetARWorldReq);
#if UNITY_EDITOR
		

        //Invoke("InvokExcute", 1);
#endif
	}

    private void InvokExcute()
    {
        AddGeratorPlane();
    }

    public void SetVirtualARPlane(bool isStand)
    {
        testPlane.gameObject.SetActive(true);
    }

    public void ChangeVirtualPlanePose(float v)
    {
        Vector3 pose = ARMonsterSceneDataManager.Instance.ARCamera.transform.position;
        pose.y += v;
        testPlane.transform.position = pose;
    }


    public void AddGeratorPlane()
    {

#if UNITY_EDITOR
        if (andaARWorldController != null)
        {
            if(andaARWorldController.andaARAnchorManager.planeAnchorMap.ContainsKey("Anda"))
            {
                //andaARWorldController.andaARAnchorManager.planeAnchorMap["Anda"].gameObject.SetActive(true);
                testPlane.gameObject.SetActive(true);
                Debug.Log("Is there init???");
                return;
            }

            Debug.Log("Is there 22222222222222???");
            //GameObject _testPlane = testPlane;// .gameObject.SetActive(true);
            testPlane.gameObject.SetActive(true);
            testPlane.gameObject.name = "AndaTestPlane";
            Vector3 v = andaARWorldController.andaARCameraManager.andaARKitSession.m_camera.transform.position;
            v.y -=0.3f;
            v.z -= 0.25f;
            testPlane.transform.position = v;
            ARPlaneAnchorGameObject aRPlaneAnchorGameObject = new ARPlaneAnchorGameObject();
            aRPlaneAnchorGameObject.gameObject = testPlane;
            andaARWorldController.andaARAnchorManager.planeAnchorMap.Add("Anda", aRPlaneAnchorGameObject);
            //andaARWorldController.andaARCameraManager.andaARKitSession.m_camera.transform.position = new Vector3(v.x+0.4f,v.y+1.6f,v.z+0.8f);
            andaARWorldController.andaARCameraManager.andaARKitSession.m_camera.transform.LookAt(v);
        }
        else
        {
            Debug.Log("Anda Said: TestStartAR andaARWorldController is null");
        }
#endif
    }




	private void TestSetARWorldReq()
	{
		Debug.Log("SetFinish");
	}

	public void TestResetARWorldReq()
	{
		Debug.Log("ResetARWorld");
	}
}
