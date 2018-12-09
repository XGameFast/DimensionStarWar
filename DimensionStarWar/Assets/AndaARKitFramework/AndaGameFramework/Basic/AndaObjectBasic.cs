using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class AndaObjectBasic : MonoBehaviour {

    /*代码不能该这2个值*/
    public bool autohide;
    public float lifeLength;
    public bool reusable;


    //在disable的时候 记录一下这个时间，对象池会判断，如果超出30s会自动摧毁
    [HideInInspector]
    public float inactiveTime;

    //当前状态是否可以拿去克隆
    [HideInInspector]
    public bool canClone;
    //物体的高度
    public float topHeight;

    public Vector3 realityScale;

    //缩放比例
    [HideInInspector]
    public float scalePercent = 1;
    [HideInInspector]
    public Transform topPoint;
    [HideInInspector]
    public Transform centerPoint;
    [HideInInspector]
    public Transform botPoint;
    [HideInInspector]
    public Transform leftPoint;
    [HideInInspector]
    public Transform rightPoint;

    protected Rigidbody selfRigidbody;
    protected Collider selfCollider;
    protected bool tmpAutoDestroy;
    protected float tmpWaitTimer;

    [HideInInspector]
    public int index;
    [HideInInspector]
    public OTYPE.ObjectsIDType objType;
    [HideInInspector]
    public string objectID;

    protected bool isLive = false;

    public float initializationScale  = 1;

    /// <summary>
    /// 这个用于对象池判断 该物件是否可以复用，之后物件被回收才会 被设置为FALSE
    /// </summary>
    public bool isActive;
    public AndaObjectBasic selfObj { get { return this; } }
    public GameObject self { get { return this.gameObject; } }
    public Vector3 selfPostion {
        get { return this.transform.position; }
        set { this.transform.position = value; }
    }
    public float selfPosX { get { return selfPostion.x; } }
    public float selfPosY { get { return selfPostion.y; } }
    public float selfPosZ { get { return selfPostion.z; } }
    public Vector3 selfEuler { get { return this.transform.eulerAngles; } }
    public float selfEulerX { get { return selfEuler.x; } }
    public float selfEulerY { get { return selfEuler.y; } }
    public float selfEulerZ { get { return selfEuler.z; } }
    public Vector3 selfScale { get { return this.transform.localScale; } }
    public float selfScaleX { get { return selfScale.x; } }
    public float selfScaleY { get { return selfScale.y; } }
    public float selfScaleZ { get { return selfScale.z; } }
    public Vector4 selfVec4 {get {return new Vector4(selfPosX,selfPosY,selfPosZ,0) ;}}
    

    public Quaternion selfRotation { get { return self.transform.rotation; } }

    public Vector3 selfPosZeroHeight { get
        {
            return new Vector3(selfPosX, ARMonsterSceneDataManager.Instance.arWolrdCenterPosition.y, selfPosZ);
        }
    }
    [HideInInspector]
    public float getObjectHeight {  get { return topHeight * scalePercent ; } }
   
    private ParticleSystem[] particles;

    private void Awake()
    {
        FindPoint();
    }
    private void Start()
    {
        //FindPoint();
    }

    private void OnEnable()
    {
        Display();
    }

    private void OnDisable()
    {
        Hide();
    }
    //隐藏的时候自动调用
    public virtual void Hide()
    {

    }
    //显示的时候自动调用
    public virtual void  Display()
    {

    }

 
    public virtual void OnSpawn()
    {
        canClone = false;
        isActive = true;
        if (selfRigidbody == null)
        {
            selfRigidbody = GetComponent<Rigidbody>();
            selfCollider = GetComponent<Collider>();
        }

        if (selfRigidbody != null)
        {
            selfRigidbody.WakeUp();
            selfCollider.enabled = true;
        }

        Live(true);
        InitValue();
        initializationScale = initializationScale == 0 ? 1 : initializationScale;
        transform.localScale = Vector3.one * initializationScale;
       
        LoadParticals();


        AudtoDestory();
    }


    private void LoadParticals()
    {
        if(particles == null)
        {
            particles = GetComponentsInChildren<ParticleSystem>();
        }
    }

    /// <summary>
    /// 重生，所有数据都初始化
    /// </summary>

    public virtual void Relife()
    {
        
    }


    protected virtual void FindPoint()
    {
        if (topPoint == null)
        {
            topPoint = transform.Find("topPoint");
        }
        if (centerPoint == null)
        {
            centerPoint = transform.Find("centerPoint");
        }
        if (botPoint == null)
        {
            botPoint = transform.Find("botPoint");
        }
        if (leftPoint == null)
        {
            leftPoint = transform.Find("leftPoint");
        }
        if (rightPoint == null)
        {
            rightPoint = transform.Find("rightPoint");
        }

        /*if(topPoint!=null && botPoint!=null)
        {
            float distance = Vector3.Distance(topPoint)
        }*/
     
    }

    public virtual void OnDispawn()
    {
        if (selfRigidbody != null)
        {
            selfRigidbody.Sleep();
            selfCollider.enabled = false;
        }
        //InitValue();
        isScreentoReadlWorld=false;
        canClone=true;
        if(isActive) StopActive();
        inactiveTime = Time.time;
        gameObject.SetActive(false);
    }

    public virtual void StopActive()
    {
        isActive = false;
    }



    public virtual void InitValue()
    {
       
    }

    private void AudtoDestory()
    {
        tmpAutoDestroy = autohide;
        if(tmpAutoDestroy)
        {
            tmpWaitTimer = lifeLength;
            ResetDestory(tmpWaitTimer);
        }
    }
    float startTime;
    private bool isReadDestoryTime=false;
    public void ResetDestory(float timer)
    {
        tmpWaitTimer = timer;
        startTime = Time.time;

        if(!isReadDestoryTime)
        { 
            isReadDestoryTime = true;
            StartCoroutine(WaitForAutoDestory());
        }
    }
    public IEnumerator WaitForAutoDestory()
    {
        while (Time.time - startTime < tmpWaitTimer )
        {
            yield return null;
        }

        AndaDataManager.Instance.RecieveItem(this);
        isReadDestoryTime = false;
    }

    protected void Live(bool _isLive)
    {
        isLive = _isLive;
    }

    public virtual void MonsterFadeIn()
    {
        
    }

    public virtual void MonsterFadeOut()
    {
        
    }

    public virtual void SetSkinType(int _type)
    {
        
    }

    public virtual void SetSkinInformation(bool isUI = false)
    {
        
    }

    public virtual void SkinHologarm(bool isUI = false)
    {
        
    }
    public virtual void SkinHologarmInUI()
    {
        
    }

    public virtual void CloseHologarm()
    {
        
    }


    public virtual void SkinNormal()
    {

    }
    public virtual void SkingrowUp()
    {
        
    }
    public virtual void SkingrowUp(float _value)
    {
        
    }

    public virtual void SkinStone(bool isUI = false)
    {
        
    }

    public virtual void LoadSkinStoneValue(float _value)
    {
        
    }

    public virtual void CloseSkinStone()
    {
        
    }
    public virtual void CloseSkinStone(float _value)
    {
        
    }

    public virtual void SetScalePercent(float _scalePercent)
    {
        scalePercent = _scalePercent;
        transform.localScale *= scalePercent;
        ChangeParticalsScale();
    }

    public virtual void ChangeParticalsScale()
    {
        if(particles ==null)return;
        int count =  particles.Length;
        for(int i = 0 ; i < count; i++)
        {
            particles[i].transform.localScale = Vector3.one;
        }
    }


    private bool isScreentoReadlWorld =false;
    private float excuteTime;
    private Vector3 startPose;
    private Quaternion startRose;
    private Vector3 startScale;



    private Vector3 tmpPose;

    private Vector3 targetPose;
    private Quaternion targetRose;
    private Vector3 targetScale;

    public void UpdateItemScreentoARWordPoint(Vector3 _scale)
    {
        Transform t = ARMonsterSceneDataManager.Instance.aRWorld.transform;
        Quaternion q = Quaternion.LookRotation(ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(t.position));
        UpdateItemScreentoRealworldPoint(t.position, q,_scale);
    }
   
    public void UpdateItemScreentoRealworldPoint(Vector3 _targetPoint,Quaternion _targetRotation , Vector3 _scale)
    {
        if(!isScreentoReadlWorld)//every run once
        {
            isScreentoReadlWorld = true;

            gameObject.SetLayer(ONAME.LayerDeafualt);

            Vector3 screenPose = ARMonsterSceneDataManager.Instance.UICamera.WorldToScreenPoint(transform.position);

            transform.parent = null;
           
            startScale = transform.localScale;

            transform.position = ARMonsterSceneDataManager.Instance.mainCamera.ScreenToWorldPoint(screenPose);

            transform.LookAt(ARMonsterSceneDataManager.Instance.mainCamera.transform);

            excuteTime= 0;

            startPose = transform.position;

            startRose = transform.rotation;

            targetPose = _targetPoint;

            targetRose = _targetRotation;

            targetScale = _scale;//Vector3.one * Mathf.Clamp01(Vector3.Distance(_targetPoint,ARMonsterSceneDataManager.Instance.mainCamera.transform.position));

            StartCoroutine(ExcuteScreentoRealWorld());
        }


    }


    private IEnumerator ExcuteScreentoRealWorld()
    {

        tmpPose = targetPose;

        while(isScreentoReadlWorld && isActive && excuteTime <1)
        {
            excuteTime+=Time.deltaTime;
            excuteTime = Mathf.Clamp01(excuteTime);
            //transform.position = Vector3.Lerp(startPose,targetPose,excuteTime);
            //transform.rotation = Quaternion.Lerp(startRose,targetRose,excuteTime);
            transform.localScale = Vector3.Lerp(startScale,targetScale,excuteTime);
            yield return null;
        }
    }


    public void UpdateWorldToScreenPoint(Vector3 pose)
    {
        transform.GetComponent<RectTransform>().anchoredPosition = pose;
    }
    //与相机的据点，越近的时候，越小
    public void SetVitrulScale()
    {

        float ditance = Vector3.Distance(transform.position,ARMonsterSceneDataManager.Instance.mainCamera.transform.position);

        float s = Mathf.Clamp(ditance,0.2f,1f);

        transform.localScale = Vector3.one *  s ;

       
       // string result = "距离: " + ditance  + " s:" + s + "LocalScale" + transform.localScale;

       // JIRVIS.Instance.PlayTips(result);
    }

}
