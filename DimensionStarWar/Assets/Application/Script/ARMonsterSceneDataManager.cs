using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.iOS;   
public class ARMonsterSceneDataManager
{
    private static ARMonsterSceneDataManager _instance = null;
    public static ARMonsterSceneDataManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new ARMonsterSceneDataManager();
            }
            return _instance;
        }
    }
    public ARMonsterMainController aRMonsterMainController;
    public OTYPE.SceneTranslationType currentTranslateCameraType;
    #region 获取AR相机

    public GameObject UILight{get;set;}
    public GameObject MapLight{get;set;}
    public GameObject GameLight{get;set;}

    public void SetGameLight(GameObject gameLight)
    {
      //  GameLight =  gameLight;
      //  gameLightStartPoint = gameLight.transform.position;
      //  gameLightStarRotation = gameLight.transform.rotation;
    }


    public Camera mainCamera { get ; set ; }
    public void SetMainCamera(Camera c)
    {
        mainCamera = c;
        mainCameraStartpoint = mainCamera.transform.position;
        mainCameraStartRotation= mainCamera.transform.rotation;
    }



    public Camera ARCamera{get;set;}
    public Camera UICamera{get;set;}
    public Camera UI3DCamera{get;set;}
    public Transform frontCameraPoint {get;set;}
    public Camera MapCamera{get;set;}
    public UnityARVideo uar { get { return ARCamera.GetComponent<UnityARVideo> (); } }
    public UnityARCameraNearFar unityARCameraNearFar {get {return ARCamera.GetComponent<UnityARCameraNearFar>() ;}}
    private Camera _getUsedCamera = null;
    public Camera GetUsedCamera ;


    public void SetUsedCamera(Camera camera )
    {
        GetUsedCamera = camera;
    }

    public bool IsUICamera()
    {
        if(GetUsedCamera == UICamera)
        {
            return true;
        }else
        {
            return false;
        }
    }



    public Vector3 arCameraPosition
    {
        get { return mainCamera.transform.position;}
    }
    public Vector3 arCameraForward
    {
        get { return mainCamera.transform.forward; }
    }
    public Vector3 currentMonsterFaceToCamera
    {
        get { return new Vector3(arCameraPosition.x, currentSceneMonster.transform.position.y, arCameraPosition.z) - currentSceneMonster.transform.position; }
    }
    public ARWorld aRWorld;
    public float getARWorldScale
    {
        get 
        {
            return aRWorld.arworldScalePercent;
        }
    }
    public GameWorld gameWorld;
    public FightTypeValue currentFightTypeValue;
    public GameFightTypeValue currentEnemySHTypeValue;
    public GameFightTypeValue currentPlayerSHTypeValue;

    public void OpenGameLight( bool _isOpen)
    {
        GameLight.SetTargetActiveOnce(_isOpen);
    }

    public Vector3 GetCameraPostionWithARWorldY()
    {
        return new Vector3(arCameraPosition.x, arWolrdCenterPosition.y, arCameraPosition.z);
    }

    public Vector3 GetMapCameraPositionWithGamewroldY()
    {
        return new Vector3(MapCamera.transform.position.x, 0 , MapCamera.transform.position.z);
    }

    public Vector3 FaceToCameraWithSeflY(Vector3 selfPose)
    {
        return GetCameraPositionWihtSelfY(selfPose.y) - selfPose;
    }

    public Vector3 GetCameraPositionWihtSelfY(float selfY)
    {
        return new Vector3(arCameraPosition.x, selfY, arCameraPosition.z);
    }

    public Vector3 GetCameraLookForward(Vector3 yourPose)
    {

        Vector3 cPos = new Vector3(ARCamera.transform.position.x,aRWorld.transform.position.y , ARCamera.transform.position.z);
        Vector3 dir = yourPose - cPos;
        return dir.normalized;
    }

    public Vector3 FaceToMapCameraWithSelfY(Vector3 selfPose)
    {
        return GetMapCameraForwardWithSelfY(selfPose) -  selfPose;
    }

    public Vector3 GetMapCameraForwardWithSelfY(Vector3 selfPose)
    {
        return new Vector3(MapCamera.transform.position.x, selfPose.y , MapCamera.transform.position.z);
    }

    public Vector3 GetPlayerPositionWithSelfY(float targetY)
    {
        return new Vector3(currentSceneMonster.selfPosX, targetY, currentSceneMonster.selfPosZ);
    }

    public Vector3 GetPositionWithARWorldY(Vector3 pos)
    {
        return new Vector3(pos.x, arWolrdCenterPosition.y,pos.z);
    }

    public Vector3 arWolrdCenterPosition
    {
        get {return aRWorld.selfPostion ;}
    }

    public ObjectBasic SortNearMonsterObjects(AndaObjectBasic target)
    {
        if (!CheckConsumableObjListNotEmpty()) return null;
        int biggestIndex = 0;
        float distance = Vector3.Distance(GetPositionWithARWorldY(consumableList[0].selfPostion), target.selfPostion);
        for (int i = 1; i < consumableList.Count; i++)
        {
            float dis = Vector3.Distance(GetPositionWithARWorldY(consumableList[i].selfPostion), target.selfPostion);
            if (dis < distance)
            {
                biggestIndex = i;
                distance = dis;
            }
        }
        return consumableList[biggestIndex];
    }
    #endregion
    
    /// <summary>
    ///  当前场景中的怪兽,玩家的怪兽
    ///  </summary>
    public MonsterBasic currentSceneMonster;
    /// <summary>
    /// 当前的敌人
    /// </summary>
    public MonsterBasic currentEnemy;
    /// <summary>
    /// 敌人列表，
    /// </summary>
    public List<MonsterBasic> enemyList = new List<MonsterBasic>();
    public List<ObjectBasic> consumableList = new List<ObjectBasic>();

    //当前场景中所有动态生成的物件
    public List<AndaObjectBasic> sceneObjects = new List<AndaObjectBasic>(); //

    public Vector3 mainCameraStartpoint;
    public Quaternion mainCameraStartRotation;

    public Vector3 gameLightStartPoint;
    public Quaternion gameLightStarRotation;
    #region ControlCamera
    public void OpenUI3DCamera()
    {
        UI3DCamera.gameObject.SetTargetActiveOnce(true);
    }
    public void CloseUI3DCamera()
    {
        UI3DCamera.gameObject.SetTargetActiveOnce(false);
    }

    public void OpenMainCamera()
    {
        if(mainCamera!=null)
        {
            mainCamera.gameObject.SetTargetActiveOnce(true);
            OpenGameLight(true);
        }
    }

    public void CloseMainCamera()
    {

        if(mainCamera!=null)
        {
            mainCamera.gameObject.SetTargetActiveOnce(false);
            OpenGameLight(false);
        }
    }

    public void SetMainCameraInitPose()
    {
        mainCamera.transform.position = mainCameraStartpoint;
        mainCamera.transform.rotation = mainCameraStartRotation;
    }

    public void SetGameLightInitPose()
    {
       // GameLight.transform.position =  gameLightStartPoint;
       // GameLight.transform.rotation = gameLightStarRotation;
    }

    #endregion


    public MonsterBasic playerLookAtTarget;
    public void InitData()
    {
        currentSceneMonster = null;
    }

    public void HitEvent(MonsterBasic from ,MonsterBasic to , float value)
    {

    }

    public bool CheckConsumableObjListNotEmpty()
    {
        return consumableList != null && consumableList.Count != 0;
    }
    /// <summary>
    /// 获取当前摄像机的方向上，指定距离的位置，在地面上
    /// </summary>
    /// <param name="distance"></param>
    /// <returns></returns>
    public Vector3 GetCameraForwardPoint(float distance , float height = 0)
    {
        Vector3 v3 = new Vector3(arCameraPosition.x, arWolrdCenterPosition.y + height, arCameraPosition.z);
        Vector3 vF3 = new Vector3(arCameraForward.x, 0, arCameraForward.z);
        Vector3 targetPoint = v3 + vF3 * distance * aRWorld.transform.localScale.x;
        return targetPoint;
    }

    public Vector3 GetCameraForwardFixPoint()
    {
        Vector3 v3 = new Vector3(arCameraPosition.x, arWolrdCenterPosition.y, arCameraPosition.z);
        Vector3 vF3 = new Vector3(arCameraForward.x, 0, arCameraForward.z);
        Vector3 targetPoint = v3 + vF3 * 1 * aRWorld.transform.localScale.x;
        return targetPoint;
    }

    public Vector3 GetCameraForwardFixPoint(float distance)
    {
        Vector3 v3 = new Vector3(arCameraPosition.x, arWolrdCenterPosition.y, arCameraPosition.z);
        Vector3 vF3 = new Vector3(arCameraForward.x, 0, arCameraForward.z);
        Vector3 targetPoint = v3 + vF3 * distance * aRWorld.transform.localScale.x;
        return targetPoint;
    }

    public Vector3 GetCameraFowardHegihtPoint(float height)
    {
        Vector3 vF3 = new Vector3(arCameraForward.x, arCameraForward.y+ height, arCameraForward.z);
        return vF3;
    }

    public Vector3 GetMainCameraForwardYZero()
    {
        Vector3 forward = new Vector3(mainCamera.transform.forward.x,0 ,mainCamera.transform.forward.z);
        return forward;
    }

    private LayerMask lastLayerMask;
    private RaycastHit hit;
    public void SetLayerMask(LayerMask layerMask)
    {
        if (layerMask == lastLayerMask) return;
        Debug.Log("LayerName" + LayerMask.LayerToName(layerMask));
        lastLayerMask = layerMask;
    }

    public Vector3 HitPoint()
    {
        if (Physics.Raycast(arCameraPosition, arCameraForward, out hit, 500, lastLayerMask))
        {
            return hit.point;
        }
        return Vector3.zero;
    }

    public Vector3 HitGround()
    {
        if (Physics.Raycast(arCameraPosition, arCameraForward, out hit, 500, 1<<LayerMask.NameToLayer("Ground")))
        {
            return hit.point;
        }
        return Vector3.zero;
    }


    public Vector3 Hitmappoint()
    {
        if (Physics.Raycast(MapCamera.transform.position,MapCamera.transform.forward, out hit,100 , 1<< LayerMask.NameToLayer("Mapground")))
        {
            return hit.point;
        }
        return Vector3.one*1000;
    }

    public Transform AutoHitTargetGameObject()
    {
        //Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        if (Physics.Raycast(arCameraPosition, arCameraForward, out hit, 500, 1<< lastLayerMask))
        {
            Debug.Log("hit target");
            //Debug.DrawLine(ray.origin, hit.point);
            return hit.transform;
        }
        Debug.Log(" hit null");
        return null;
    }


    //战斗时 调用的hit
    public Vector3 FightRayHit()
    {
        if (Physics.Raycast(mainCamera.transform.position, mainCamera.transform.forward, out hit, 500, 1 << LayerMask.NameToLayer("Monster") | 1 << LayerMask.NameToLayer("Wall")| 1 << LayerMask.NameToLayer("Objects")| 1 << LayerMask.NameToLayer("Skill")| 1 << LayerMask.NameToLayer("Boss")))
        {
            return hit.point;;
        }
        return Vector3.zero;// mainCamera.transform.position+ mainCamera.transform.forward.normalized * 30;
    }

    public Vector3 MoveRayHit()
    {
        if (Physics.Raycast(mainCamera.transform.position, mainCamera.transform.forward, out hit, 500, 1 << LayerMask.NameToLayer("Ground")))
        {
            return hit.point; 
        }else
        {
            return GetCameraForwardFixPoint(2f);
        }
    }



    public Transform MapSceneRayHitItem()
    {
        if (Physics.Raycast(MapCamera.transform.position, MapCamera.transform.forward, out hit, 500))
        {
            if(hit.transform.tag == ONAME.TowerTag)
            {
                return hit.transform;
            }else
            {
                return null;
            }
           
        }
        return null;
    }


    #region 构建横向滑动事件
    /// <summary>
    /// 第一个Int是当前的游标，第二个Int是否为边界 -1 左边边界，0不是边界。1 = 右边边界
    /// </summary>
    private System.Action<int,int> slideCallBack;
    private int currentHorSlideIndex;
    private int currenetHorSlideCout;
    private int horLimit;
    private bool isRegisterClickEvent;
    public void SetHorizonSlideInformaztion(int _slideCount,System.Action<int,int>callBack,bool isRegisterClick = false )
    {
        slideCallBack = callBack ;
        currenetHorSlideCout = _slideCount;
        currentHorSlideIndex = 0;
        horLimit = -1;
        isRegisterClickEvent = isRegisterClick;
        slideCallBack(0, horLimit);
    }

    #endregion
    #region 构建竖向滑动事件
    //第一个Int 是指当前的游标， 第二个Int是边界， -1是上面的边界， 0不是边界，1 是下面的边界 第三个 是 速度
    private System.Action<int,int,float> slideVerticalCallBak;
    private int currentVertslideIndex;
    private int currenetVertsSlideCount;
    private int vecticalLimit;
    private bool needRegisterClickEvent;
    private int regiseterVerticalSlideType;
    private float slideTimer;
    /// <summary>
    /// 竖向滑动
    /// </summary>
    /// <param name="_count">可以滑动数量</param>
    /// <param name="callBack">回调</param>
    /// <param name="_needRegisterClick">是否可以点击</param>
    /// <param name="_regiseterVerticalSlideType">只执行向上 或向下 或全部执行</param>
    public void SetVerticalSlideInformation(int _count,System.Action<int,int,float> callBack ,bool _needRegisterClick =false , int _regiseterVerticalSlideType = 2)
    {
        slideVerticalCallBak = callBack;
        currenetVertsSlideCount = _count;
        currentVertslideIndex = 0;
        vecticalLimit = -1;
        needRegisterClickEvent = _needRegisterClick;
        regiseterVerticalSlideType = _regiseterVerticalSlideType;
    }
    public void SlideVertical()
    {
       
    }
    #endregion


    #region 注册玩家点击事件 ,不包含界面的点击

    private System.Action<AndaObjectBasic> CallbackClickEvent;
    private Camera targetCamera;
    private RaycastHit clickHit;
    private Ray clickRay;
   
    public void ClickEvent(System.Action<AndaObjectBasic> callbcak_clickevent,OTYPE.CameraType cameraType,string layerName)
    {
        CallbackClickEvent = callbcak_clickevent;


        switch(cameraType)
        {
            case OTYPE.CameraType.ARCamera:
                targetCamera = ARCamera;
                break;
            
            case OTYPE.CameraType.GameCamera:
                targetCamera = mainCamera;
                break;
            
            case OTYPE.CameraType.UI3DCamera:
                targetCamera = UI3DCamera;
                break;
        }
        //------ ----
        clickRay = targetCamera.ScreenPointToRay(Input.mousePosition);

        if(Physics.Raycast(clickRay,out clickHit, 1000))
        {
            Debug.Log(clickHit);
            if(clickHit.transform !=null)
            {
                CallbackClickEvent(clickHit.transform.GetComponent<AndaObjectBasic>());
            }
        }
    }



    #endregion


    #region 图鉴相机
    public void OpenHandBookCamera()
    {

    }

    #endregion

    #region 次元空间
    public DimensionRoom ardimensionRoom;

    public DimensionSpace dimensionSpace;


    public void BuildDimensionSpace(System.Action callback)
    {
        if(dimensionSpace == null)
        {
            //dimensionSpace = AndaDataManager.Instance.InstantiateOtherObj<DimensionSpace>(ONAME.DimensionSpace);
           // dimensionSpace.transform.SetInto(aRWorld.transform);
          //  dimensionSpace.BuildSpace(arWolrdCenterPosition ,callback);
        }
    }

    public void RemoveDimensionSpace(System.Action callback)
    {
        //if(dimensionSpace == null)return;
       // dimensionSpace.RemoveSpace(callback);
       // dimensionSpace = null;
    }
    #endregion
}
public class FightTypeValue
{
    public StrongholdBaseAttribution sba { get; set; }
    public MonsterGameData.FightType fightType { get; set; }
}

public class GameFightTypeValue
{
    public StrongholdBaseAttribution sba { get; set; }
    public OTYPE.GameFightType fightType { get; set; }
    public OTYPE.WolrdType wolrdType { get; set; }
}
