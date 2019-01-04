using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CameraTransitions;
public class  ARWorld : AndaObjectBasic
{
    public float arworldScalePercent;

    /*
     * 场景管理
     * 
     * 各个场景间的切换。已场景物体的控制权 都经过这里
     * 
     * 【一】打开次元空间。打开次元空间有多种效果。
     * 1.空间传送效果，抖动，（真实空间与虚拟空间之间的的转换）
     * 2.次元传送效果，扭曲。（虚拟空间与虚拟空间之间的转换）
     * 
     */

    //？？？？
    //在编辑器模式下使用
    public GameObject CameraFwdPoint;//主摄像头前面的点；
    public GameObject loginMenuBackground;
    public GameObject GamegroundPlaneInEditor;
    public GameObject astrologBackground;
    public GameObject preloadScene;
    public GameObject loginScene;
    public FightScene fightScene;
    public GameObject ground;
    public DissolveEnvironment astrologyScene;
    public DissolveEnvironment dimensionScene;
    public DissolveEnvironment interstellarScene;
    public CameraTransitionsAssistant cta;
    public GameObject handBookScene;

    public Camera mainCamera;
    public Camera vrCamera;
    public Room dimensionRoom;
    public GameObject translatePoint;

    public Texture2D text2d;//
    public GameObject skyBoxCamera;


    public CanvasGroup canvasGroup;
    public GameObject blurItem;

    public HologramScreenEffect hologramScreenEffect;

    private System.Action callback_finishLoadBackground;
    public GameObject arKitShadow;

    public GameObject screenEffectPoint;

    public GameObject focuse ;

    public GameObject uiWebView;

    private void Start()
    {
        WebManager.Instance.webUIObj = uiWebView;
        ARMonsterSceneDataManager.Instance.aRWorld = this;
    }

    public void OpenFightFocus()
    {
        focuse.gameObject.SetTargetActiveOnce(true);
    }
    public void CloseFightFocus()
    {

        focuse.gameObject.SetTargetActiveOnce(false);
    }

    public void OpenARKiteShadow(bool isOpen)
    {
        if(arKitShadow!=null)
        {
            arKitShadow.SetTargetActiveOnce(isOpen);
        }
    }

    public void OpenLoginMenuBackground(bool isOpen)
    {
        if(isOpen)
        {
            if(loginMenuBackground.activeSelf)return;
            loginMenuBackground.SetTargetActiveOnce(true);
        }else
        {
            if(!loginMenuBackground.activeSelf)return;
            loginMenuBackground.SetTargetActiveOnce(false);
        }
    }


    public void OpenTestGameGround(bool state)
    {
        GamegroundPlaneInEditor.gameObject.SetActive(state);
    }

    public void OpenHologarmScreen()
    {
        if(hologramScreenEffect!=null)
        {
            hologramScreenEffect.gameObject.SetTargetActiveOnce(true);
            hologramScreenEffect.OpenEffect(); 
        }
       
    }
    public void CloseHologarmScreen()
    {
        hologramScreenEffect.gameObject.SetTargetActiveOnce(false);
    }

   

    public void OpenGameCamera()
    {
        ARMonsterSceneDataManager.Instance.mainCamera.gameObject.SetActive(true);
    }
    public void CloseGameCamera()
    {
        ARMonsterSceneDataManager.Instance.mainCamera.gameObject.SetActive(false);
    }
    public void OpenMapCamera()
    {
        ARMonsterSceneDataManager.Instance.MapCamera.gameObject.SetActive(true);
    }

    public void CloseMapCamera()
    {
        ARMonsterSceneDataManager.Instance.MapCamera.gameObject.SetActive(false);
    }

    public void OpenBlur()
    {
        if(blurItem!=null)
        {
            blurItem.gameObject.SetTargetActiveOnce(true);
            blurItem.GetComponent<Animator>().Play("FadeIn");
        }
      
    }
    public void CloseBlur()
    {
        if(blurItem!=null)
        {
            blurItem.gameObject.SetTargetActiveOnce(false);
        }
      
    }

    public void OpenBackgroundVV(System.Action callbcak =null)
    {
      
        callback_finishLoadBackground = callbcak;
        StartCoroutine(Openbackground());
        if(callbcak!=null)
        {
            callbcak();
        }

    }

    private IEnumerator Openbackground()
    {
        float t = 0;
        canvasGroup.gameObject.SetTargetActiveOnce(true);
        while(t < 1 )
        {
            t+=Time.deltaTime;
            canvasGroup.alpha = Mathf.Lerp(0,1,t);
            yield return null;
        }

        if(callback_finishLoadBackground!=null)callback_finishLoadBackground();
    }
    public void ClosebackgroundVV(System.Action callback_finishOpen =null)
    {
        canvasGroup.gameObject.SetTargetActiveOnce(false);
        if(callback_finishOpen!=null)
        {
            callback_finishOpen();
        }

        callback_finishLoadBackground = callback_finishOpen;
        StartCoroutine(Closebackground());
    }


    public void OpenAstrologyBackground()
    {
        astrologBackground.SetTargetActiveOnce(true);
    }

    public void CloseAtrologyBackground()
    {
        astrologBackground.SetTargetActiveOnce(false);
    }


    private IEnumerator Closebackground()
    {
        float t = 0;
        while(t < 1 )
        {
            t+=Time.deltaTime;
            canvasGroup.alpha = Mathf.Lerp(1,0,t);
            yield return null;
        }
        canvasGroup.gameObject.SetTargetActiveOnce(false);
        if(callback_finishLoadBackground!=null) callback_finishLoadBackground();
    }


    public void SetCameraToBlackBackGround()
    {
        //ARMonsterSceneDataManager.Instance.uar.SetBlackBackGround();
        //  ARMonsterSceneDataManager.Instance.uar.enabled = false;
        skyBoxCamera.SetTargetActiveOnce(true);
    }
    public void SetCameraToReadworldTexture()
    {
        //ARMonsterSceneDataManager.Instance.uar.SetRealWorldTexture();
        skyBoxCamera.SetTargetActiveOnce(false);
        //  ARMonsterSceneDataManager.Instance.uar.enabled = true;
    }

    public void OpenTranlatePoint(bool isOpen)
    {
        translatePoint.SetTargetActiveOnce(isOpen);
    }

    public void OpenPreloadScene(bool isOpen)
    {
        preloadScene.SetTargetActiveOnce(isOpen);
    }
    public void OpenGround(bool isOpen)
    {
        if (isOpen)
        {
            if (!ground.activeSelf) ground.SetActive(true);

        }
        else
        {
            if (ground.activeSelf) ground.SetActive(false);
        }
    }
    public void OpenLoginScene(bool isOpen)
    {
        loginScene.SetActive(isOpen);
    }

    public void OpenHanbookScene(bool isOpen)
    {
        handBookScene.SetTargetActiveOnce(isOpen);
    }
    public void SetHandbookScenePosition()
    {
        handBookScene.transform.position = ARMonsterSceneDataManager.Instance.GetCameraPostionWithARWorldY();
    }

    #region 打开/关闭占星庭
    public void OpenAstrologyScene(bool isOpen)
    {
        astrologyScene.gameObject.SetTargetActiveOnce(isOpen);
        return;
        if (isOpen)
        {
            astrologyScene.gameObject.SetTargetActiveOnce(isOpen);
            //StartCoroutine(OpeningAstrologyScene());
        }
        else
        {
            //StartCoroutine(ClosingAstrologyScene());
        }
    }
    #endregion

    #region 打开/关闭次元空间
    /// <summary>
    /// 对相机进行运镜处理
    /// </summary>
    /// <param name="isOpen"></param>
    /// <param name="type"></param>
    /// <param name="finishCallBack"></param>
    /// <param name="isNeedSetDimensionScene"></param>
    public void SetMainCameraTrans(bool isOpen, OTYPE.SceneTranslationType type, System.Action<bool> finishCallBack, bool isNeedSetDimensionScene = true)
    {

        if (!isNeedSetDimensionScene)
        {
            StartCoroutine(GoneDimensionWorld(type, finishCallBack, isNeedSetDimensionScene));
            return;
        }

        if (isOpen)
        {

            if (!dimensionScene.gameObject.activeSelf)
            {
                StartCoroutine(GoneDimensionWorld(type, finishCallBack, isNeedSetDimensionScene));
            }
            else
            {
                finishCallBack(true);
            }
        }
        else
        {
            if (dimensionScene.gameObject.activeSelf)
            {
                StartCoroutine(BackToRealityWordl(type, finishCallBack, isNeedSetDimensionScene));
            }
            else
            {
                finishCallBack(false);
            }
        }
    }

    #endregion
    #region 打开/关闭星图
    public void OpenInterstellarScene(bool isOpen)
    {
        interstellarScene.gameObject.SetActive(isOpen);
        /*if (isOpen)
        {
            interstellarScene.gameObject.SetActive(true);
            StartCoroutine(OpeningInterstellaScene());
        }
        else
        {
            StartCoroutine(ClosingInterstellaScene());
        }*/
    }
    #endregion
    public void OpenFightScene(bool isOpen)
    {
        fightScene.gameObject.SetActive(isOpen);
    }

    private IEnumerator BackToRealityWordl(OTYPE.SceneTranslationType tranlateType, System.Action<bool> finishCallBack, bool needCloseScene)
    {
        //dimensionScene.dissolveStartPoint = transform.position;
        //让虚拟世界消失
        //ARMonsterSceneDataManager.Instance.uar.ClickDisplay();
        //虚拟场景消失
        vrCamera.CopyFrom(mainCamera);
        //  float value = dimensionScene.dissolveThreshold;

        switch (tranlateType)
        {
            case OTYPE.SceneTranslationType.Galitch:
                cta.transitionEffect = CameraTransitionEffects.Glitch;
                cta.glitchParams.strength = 5;
                cta.transitionTime = 3;
                break;
            case OTYPE.SceneTranslationType.LinearBlur:
                cta.transitionEffect = CameraTransitionEffects.LinearBlur;
                cta.linearBlurParams.intensity = 0.4f;
                cta.transitionTime = 0.5f;
                break;
        }

        float loadTime = Time.time;
        float timeLimit = cta.transitionTime + 0.1f;
        cta.ExecuteTransition();
        while (Time.time - loadTime < timeLimit)
        {
            //value += Time.deltaTime * 0.2f;
            //dimensionScene.Load(value);
            if (Time.time - loadTime > timeLimit / 2)
            {
                //如果需要关闭，则会关闭虚拟场
                if (needCloseScene)
                    dimensionScene.gameObject.SetActive(false);
            }
            yield return null;
        }
        vrCamera.gameObject.SetActive(false);
        // dimensionScene.dissolveThreshold = 1;

        mainCamera.gameObject.SetActive(true);
        finishCallBack(false);
    }
    private IEnumerator GoneDimensionWorld(OTYPE.SceneTranslationType tranlateType, System.Action<bool> finishCallBack, bool needOpenScene)
    {
        //dimensionScene.dissolveStartPoint = transform.position;
        vrCamera.CopyFrom(mainCamera);
        //加载虚拟场景
        // float value = dimensionScene.dissolveThreshold;
        switch (tranlateType)
        {
            case OTYPE.SceneTranslationType.Galitch:
                cta.transitionEffect = CameraTransitionEffects.Glitch;
                cta.glitchParams.strength = 8;
                cta.transitionTime = 4;
                break;
            case OTYPE.SceneTranslationType.LinearBlur:
                cta.transitionEffect = CameraTransitionEffects.LinearBlur;
                cta.linearBlurParams.intensity = 0.4f;
                cta.transitionTime = 0.5f;
                break;
        }
        float loadTime = Time.time;
        float timeLimit = cta.transitionTime + 0.1f;
        cta.ExecuteTransition();
        while (Time.time - loadTime < timeLimit)
        {
            if (Time.time - loadTime > timeLimit / 2)
            {
                if (needOpenScene)
                    dimensionScene.gameObject.SetActive(true);
            }
            yield return null;
        }
        vrCamera.gameObject.SetActive(false);
        //dimensionScene.dissolveThreshold = 0;
        mainCamera.gameObject.SetActive(true);

        // dimensionScene.gameObject.SetActive(true);
        finishCallBack(true);
    }

    public void SetWorld(OTYPE.WolrdType _worldType, System.Action callBack)
    {
        switch (_worldType)
        {
            case OTYPE.WolrdType.Reality:
                // OpenDimensionWorld
                break;
            case OTYPE.WolrdType.Virtual:
                break;
        }
    }


    #region 加载观星庭中的物件
    private IEnumerator OpeningAstrologyScene()
    {
        astrologyScene.dissolveStartPoint = transform.position;
        float value = astrologyScene.dissolveThreshold;
        while (value > 0)
        {
            value -= Time.deltaTime * 0.2f;
            astrologyScene.Load(value);
            yield return null;
        }
        astrologyScene.dissolveThreshold = 0;
    }
    private IEnumerator ClosingAstrologyScene()
    {
        astrologyScene.dissolveStartPoint = transform.position;
        //虚拟场景消失
        float value = astrologyScene.dissolveThreshold;
        while (value < 1)
        {
            value += Time.deltaTime * 0.2f;
            astrologyScene.Load(value);
            yield return null;
        }
        astrologyScene.gameObject.SetActive(false);
        astrologyScene.dissolveThreshold = 1;
    }

    #endregion

    #region 加载地图里的东西
    public IEnumerator OpeningInterstellaScene()
    {
        interstellarScene.dissolveStartPoint = transform.position;
        float value = interstellarScene.dissolveThreshold;
        while (value > 0)
        {
            value -= Time.deltaTime * 0.2f;
            interstellarScene.Load(value);
            yield return null;
        }
        interstellarScene.dissolveThreshold = 0;
    }
    public IEnumerator ClosingInterstellaScene()
    {
        interstellarScene.dissolveStartPoint = transform.position;
        //虚拟场景消失
        float value = interstellarScene.dissolveThreshold;
        while (value < 1)
        {
            value += Time.deltaTime * 0.2f;
            interstellarScene.Load(value);
            yield return null;
        }
        interstellarScene.gameObject.SetActive(false);
        interstellarScene.dissolveThreshold = 1;
    }
    #endregion

    #region 加载房间里的设施

    public void SetRoom(PlayerStrongholdAttribute strongholdBaseAttribution)
    {
        dimensionRoom.SetValue(strongholdBaseAttribution);
    }

    public void SetMonsterToRoomShowcase(Transform monster)
    {
        dimensionRoom.SetMonsterToShowCase(monster);
    }
    public void SetExpBallToBallShowCase(Transform expBall)
    {
        dimensionRoom.SetMonsterToShowCase(expBall);
    }



    #endregion



    #region 构建次元空间

    public void BuildDimensionRoom(System.Action callback)
    {
        if (ARMonsterSceneDataManager.Instance.ardimensionRoom == null)
        {
            ARMonsterSceneDataManager.Instance.ardimensionRoom = AndaDataManager.Instance.InstantiateOtherObj<DimensionRoom>(ONAME.DimensionRoom);
            ARMonsterSceneDataManager.Instance.ardimensionRoom.SetInto(this.transform);
        }

        ARMonsterSceneDataManager.Instance.ardimensionRoom.StartBuildDimensionRoom(callback);
    }

    #endregion


    #region 拆掉次元空间
    public void RemoveDimensionRoom(System.Action callback)
    {
        if(ARMonsterSceneDataManager.Instance.ardimensionRoom!=null)
        {
            ARMonsterSceneDataManager.Instance.ardimensionRoom.DestroyDimensionRoom(callback);
        }
    }
    #endregion
}
