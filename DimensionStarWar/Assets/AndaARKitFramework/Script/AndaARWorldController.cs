using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.iOS;
using GoogleARCoreInternal;
public class AndaARWorldController : MonoBehaviour
{

	/*
     * 重新整合过的AR平面识别过程的教程
     * 暴露4个接口
     * 1.开始识别
     * 2.结束识别
     * 3.重新识别
     * 
     * 识别完成后，玩家可以对焦识别平面，有一个读条过程，读条完成就会就调用回掉函数
     * 在读条的过程中如果产生较大的变动，就会重新进入识别
     */

    public ARScannerData aRScannerData;
    public ARScannerMenu aRScannerMenu;
	public GameObject planePrefab;
	public AndaARCameraManager andaARCameraManager;
    public AndaARCoreManager andaARCoreManager;
    public VirtulARManager virtulARManager;

	public AndaARAnchorManager andaARAnchorManager;
	public AndaARPlaneRecognise andaARPlaneRecognise;

    //test
    public TestStartAR testStartAR;

    private System.Action<Vector3, Quaternion,bool> FinishSetARAnchorPose;
	private System.Action ResetARAnchorPose;
    private bool isUpdateRecognize=false;


    public void BuildARController()
    {
        andaARPlaneRecognise.aRWorldController = this;
        BuildARScannerData();
        aRScannerData.BuildMenu();
    }

    private void BuildARScannerData()
    {
        if(aRScannerData == null)
        {
            aRScannerData = new ARScannerData(); 
        }
        aRScannerData.BuildData(this);
    }



    public void StartAR(System.Action<Vector3 , Quaternion ,bool> callback, System.Action callbcakRestARWorld=null)
	{
        
		FinishSetARAnchorPose = callback;
		
        ResetARAnchorPose = callbcakRestARWorld;

        EnableSession();
        //检查是否要调出提示面板
        CheckUserSettingWithARTips();
	}

    private void EnableSession()
    {
        //构建各家AR平台的管理器
        BuildARManager();
        //以下属于应用层的交互 ，这里作为 架构一部分
#if UNITY_EDITOR
        //构建调用ARKit检测平面
        BuildAndaARAnchorManager();
        //模拟添加一个 平面锚点
        testStartAR.AddGeratorPlane();
#endif
    }

    private void InvokeStartRecognise()
    {
        if(JIRVIS.Instance.jIRVISData.isSupportAR)
        {
            StartRecognise();
        }
        else
        {
            testStartAR.SetVirtualARPlane(false);
            virtulARManager.OpenVirtualMenu(testStartAR.ChangeVirtualPlanePose, StartRecognise);
        }
    }

    


    public void StopAR(System.Action callback)
    {

        isUpdateRecognize=false;
        if(JIRVIS.Instance.jIRVISData.isSupportAR)
        {
#if !UNITY_EDITOR && UNITY_ANDROID
                    andaARCoreManager.CloseARCore();
#elif !UNITY_EDITOR && UNITY_IOS
                    andaARCameraManager.CloseARKitSession();
        StopARAnchor();
#else
            andaARCameraManager.CloseARKitSession();
            StopARAnchor();
#endif
            andaARPlaneRecognise.gameObject.SetActive(false);
        }else
        {
            virtulARManager.CloseVirtualARSession();
        }

        if(callback!=null) callback();
    }



	public void StartRecognise()
    {
        isUpdateRecognize = true;
        ARMonsterSceneDataManager.Instance.aRWorld.SetTargetActiveOnce(false);
        BuildAndaARPlaneRecognise();
	}

    public void RequestRecogniseResult(Vector3 pose, Quaternion rote,bool isResetPose)
	{
        isUpdateRecognize = false;
        FinishSetARAnchorPose(pose, rote,isResetPose);
        #if UNITY_EDITOR
        andaARAnchorManager.HidenPlane();
        #endif
	}

    private void RecieveDataItem()
    {
        aRScannerData.InvokeRecieveItem();
    }


	public void RestartRecognise()
	{
        if(ResetARAnchorPose!=null)
        {
            ResetARAnchorPose();
            #if UNITY_EDITOR
		    andaARAnchorManager.DisplayPlane();
		    #endif 

            StartRecognise();
        }
     

    }

	public void ClearARData()
	{

	}
    public void UpdateScreenItemPose(Vector3 _vector3,Quaternion _rotation)
    {
        //aRScannerData.UpdatePoseItem(_vector3,_rotation);
    }

	private void Update()
	{
        if(isUpdateRecognize)
        {
            Debug.Log("持续更新检测平面");
            UpdateAndaARPlaneRecognise();
        }
       
	}


    #region JIRVIS给出演示视频

    private void CheckUserSettingWithARTips()
    {
        if(JIRVIS.Instance.jIRVISData.GetSettingDataWithARTipsSkip)
        {
            Invoke("InvokeStartRecognise",0.1f);
        }
        else
        {
            JIRVIS.Instance.OpenJIRVISARTipsEditorBar();
            JIRVIS.Instance.PlayTipsForchoose("请四处走走，寻找一个水平面，让我更好的构建次元世界", OTYPE.TipsType.onlyOneChooseTips,"明白了","" , CloseARGuideTips);
        }
    }

    private void CloseARGuideTips()
    {
        Invoke("InvokeStartRecognise", 0.1f);
        JIRVIS.Instance.CloseTips();
        JIRVIS.Instance.CloseJIRVISARTipsEditorBar();
    }

    #endregion

	private void BuildARManager()
	{


        if(JIRVIS.Instance.jIRVISData.isSupportAR)
        {

#if !UNITY_EDITOR && UNITY_ANDROID
                    if(andaARCoreManager!=null)
        {
            andaARCoreManager.OpenARCore();
        }
#elif !UNITY_EDITOR && UNITY_IOS
                    if (andaARCameraManager != null)
        {
           andaARCameraManager.OpenARKitSession();

            //打开相机
        OpenARVideo();
        }
        else
        {
            Debug.Log("Anda Said: andaARCameraManager is null ");
        }
#elif UNITY_EDITOR
            if (andaARCameraManager != null)
            {
                andaARCameraManager.OpenARKitSession();
            }
            else
            {
                Debug.Log("Anda Said: andaARCameraManager is null ");
            }
#endif

        }
        else
        {
            virtulARManager.OpenVirtualARSession();

        }

	}

	private void OpenARVideo()
	{

     #if !UNITY_EDITOR && UNITY_IOS

        if (andaARCameraManager != null)
        {
           andaARCameraManager.andaARKitSession.unityARVideo.enabled = true;
        }
        else
        {
            Debug.Log("Anda Said: andaARCameraManager is null");
        }

        #endif

	}

	private void UpdateAndaARCameraManager()
	{
		/*if (andaARCameraManager != null)
		{
			andaARCameraManager.OnUpdate();
		}
		else
		{
			Debug.Log("Anda Said: andaARCameraManager is null ");
		}*/
	}





	private void BuildAndaARAnchorManager()
	{
		if (andaARAnchorManager == null)
		{
			andaARAnchorManager = new AndaARAnchorManager(planePrefab);
        }
        andaARAnchorManager.Register();
	}

    public void StopARAnchor()
    {
        if(andaARAnchorManager == null)return;
        andaARAnchorManager.HidenPlane();
        andaARAnchorManager.UnsubscribeEvents();
    }



	private void BuildAndaARPlaneRecognise()
	{
		if (andaARPlaneRecognise != null)
		{
            andaARPlaneRecognise.gameObject.SetActive(true);
            andaARPlaneRecognise.StartRecognise(RequestRecogniseResult, RestartRecognise);
		}
		else
		{
			Debug.Log("Anda Said: andaARPlaneRecognise is null ");
		}
	}

	private void UpdateAndaARPlaneRecognise()
	{
		if (andaARPlaneRecognise != null)
		{
			andaARPlaneRecognise.OnUpdate();
		}
	}

}

