using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class ARMonsterMainController : BaseController {
    /*
     * By :AndaChen 2018.2.26
     * ARMonsterMainController 管理着 应用层所有的 控制器脚本 
     * 同时还提供了一个ARMonsterSceneDataManager 用于管理 整个场景中的数据
     *
     */

    //public AndaARKitGeneratPlaneController andaARkitGeneratPlaneController;

    public bool isTestLoadlocalData = false;
    public bool isClearConfigData =false;
    public OTYPE.WolrdType lastSceneWorldType = OTYPE.WolrdType.none;
    public OTYPE.WolrdType currentSceneWorldType = OTYPE.WolrdType.none;
    public ARMonsterMainData arMonsterMainData;
    public AndaARWorldController andaARWorldController;
    public AndaARCameraManager andaARCameraManager;
    public DeviceCheckTool deviceCheckTool;
    public ARWorld arword;
    public BaseController currentCtrl
    {
        get { return arMonsterMainData.currentController; }
    }

    private void Awake()
    {
        //return;
        AndaARManager.Instance.SetController(andaARWorldController,andaARCameraManager);
        ARMonsterSceneDataManager.Instance.aRMonsterMainController = this;
        ARMonsterSceneDataManager.Instance.aRWorld = arword;
    }

    private void Start()
    {

        JIRVIS.Instance.aRMonsterMainController =this;

       /* if(JIRVIS.Instance.jIRVISData.isSupportAR)
        {
            AndaARManager.Instance.BuildARController();
        }*/
        AndaARManager.Instance.BuildARController();
        //构建数据
        BuildAndaMainData();

        //arWorld.OpenBackgroundVV(FinishOpenbackground);
       
        //arWorld.OpenBlur();

        //Debug.Log("IDTYpe" + AndaDataManager.Instance.GetObjTypeID(42055));

        FinishOpenbackground();

        //测试用
        //TestManager.Instance.isTestLoadinglocalData = isTestLoadlocalData;
        //TestManager.Instance.isClearConfig = isClearConfigData;
        JIRVIS.Instance.jIRVISData.isSupportAR = deviceCheckTool.CheckDevice();
        Invoke("InvokeDEbug" , 3f);
    }

    private void InvokeDEbug()
    {
        if (JIRVIS.Instance.jIRVISData.isSupportAR)
        {
           // JIRVIS.Instance.PlayTips("SupportAR");
            Debug.Log("SupportAR");
        }
        else
        {
            Debug.Log("UnSupportAR");
            // JIRVIS.Instance.PlayTips("UnSupportAR");
        }
    }


    private void FinishOpenbackground()
    {
        //切换到登录控制器
        SwitchController(ONAME.CHECKCONFIGCONTROLLER);
    }


    private void BuildAndaMainData()
    {
        if (arMonsterMainData == null)
        {
            arMonsterMainData = new ARMonsterMainData(this, CallBackFinishController);
        }
    }


    
    #region Excute
   
    private void SwitchController(string controllerName)
    {
        //关闭当前的控制器
        arMonsterMainData.CloseCurrentController();
        //切换当前控制器
        arMonsterMainData.SwitchCurrentController(controllerName);

        //运镜
        //TransCameraManager.Instance.SetCurrentTranslateType(arMonsterMainData.lastSceneWorldType,arMonsterMainData.currentSceneWorldType);
        
    }

    public void EnterStarmap()
    {
        
    }

    public void EnterStarspace()
    {
        SwitchController(ONAME.MAPCONCTROLLER);
    }

    public void EnterTravl()
    {
        JIRVIS.Instance.PlayTips("技术局正在抓紧修稳定传送门，不久后您将可以自由穿梭星域进行探索");   
    }

    public void EnterAstrology()
    {
        
    }

    public void EnterPackage()
    {
        SwitchController(ONAME.PACKAGECONTROLLER);
    }

    public void EnterMall()
    {
        SwitchController(ONAME.MALLCONTROLLER);
    }
    
    //进入空间识别
    public void EnterRecognize()
    {
        
    }

    public void EnterLaterCtr()
    {
        SwitchController(arMonsterMainData.getLastControllerName);
    }

    #endregion
  
    #region CallBack
    
    private void CallBackFinishController(string ToController)
    {
        SwitchController(ToController);
    }
    #endregion

    /// <summary>
    /// 所有场景控制器 的Update由此调起
    /// </summary>
    private void Update()
    {

        if (currentCtrl!= null && currentCtrl.gameObject.activeSelf)
        {
            currentCtrl.OnUpdate();
        }

        if(Input.GetMouseButtonDown(0))
        {
            AndaObjectBasic andaObjectBasic = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("MouseClickEffect");
            andaObjectBasic.SetInto(AndaUIManager.Instance.canvasRoot);
            andaObjectBasic.transform.localScale = Vector3.one * 600;
            Vector2 _pos = Vector2.one;
            RectTransformUtility.ScreenPointToLocalPointInRectangle( AndaUIManager.Instance.canvas.transform as RectTransform,
                                                        Input.mousePosition, AndaUIManager.Instance.canvas.worldCamera, out _pos);
            andaObjectBasic.transform.localPosition = _pos;
            
        }
    }
}
