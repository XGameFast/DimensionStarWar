using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class TowerBase : AndaObjectBasic {

    public Animator animator;
    //【这2个点用于计算高度】
    public Transform towerTop;
    public Transform towerBot;
    public Renderer towerRangeRenderer;
    public Renderer towerBoardRenderer;
    public Transform monsterPoint;
    public Material[] materials;
    public GameObject effect;
    public TowerData data;

    public int getStrongholdIndex
    {
        get {return data.getStrongholdIndex ;}
    }
    public int getStrongholdHostIndex
    {
        get {return data.getStrongholdHostIndex ;}
    }
    public int getStrongholdMonsterCount
    {
        get {return data.getStrongholdMonsterCount ;}
    }
    public int getStrongholdStatusID
    {
        get {return data.getStrongholdBaseAttribution.statueID ;}
    }
    public int getStronholdType
    {
        get {return data.getStrongholdBaseAttribution.hostType ;}
    }
    public float getBaseRangeRadius { get {return data.getStrongholdBaseRangeRadius ;}}
    public float getProtectRangeRadius {get {return data.getProtectRangeRadius ;}}
    #region 执行

    public override void OnSpawn()
    {
        base.OnSpawn();
    }

    public override void OnDispawn()
    { 
        isFollowCamera =false;
        if(data!=null)
        {
            data.InitData();
        }
       
        StopActive();
        base.OnDispawn();
    }
   
    #endregion

    #region 构建数据
    public virtual void SetInfo(StrongholdBaseAttribution _baseAtrribute)
    {
        BuildTowerData(_baseAtrribute);
        data.BuildMonster();
        data.SetRange();
        data.SetRangeBaseColor(towerRangeRenderer.material.color);
    }

    private void BuildTowerData( StrongholdBaseAttribution _baseAttribute)
    {
        data = new TowerData();
        data.BuildData(this ,_baseAttribute);
    }

    #endregion
    #region 操作范围圈的 打开/关闭

    public virtual void OpenRangeCircle()
    {
        towerRangeRenderer.transform.parent.gameObject.SetTargetActiveOnce(true);
    }

    public virtual void CloseRangeCircle()
    {
        towerRangeRenderer.transform.parent.gameObject.SetTargetActiveOnce(false);
    }

    #endregion
    #region 设置范围圈的颜色
   

    public void SetColorToRed()
    {
        if(towerRangeRenderer.material.color == Color.red)return;
        data.SetRangeBaseColor(towerRangeRenderer.material.color);  
        towerRangeRenderer.material.SetColor("_Color",Color.red);
    }

    public void SetColorToSelfColor()
    {
        if( towerRangeRenderer.material.color  == data.getBaseRangeCircleColor)return;
        towerRangeRenderer.material.color = data.getBaseRangeCircleColor;
    }

    public void SetrangeColor(bool canSet)
    {
        if(canSet)
        {
            SetColorToSelfColor();
        }else
        {
            SetColorToRed();
        }

    }

    #endregion

    #region 设置材质皮肤

    public override void SetSkinType(int _type)
    {
        if(data.getSkinType == _type)return;
        switch(_type)
        {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
        }
        data.SetSkinType(_type);
        base.SetSkinType(_type);
    }

    public void UpdateTowerSkin(bool isUI)
    {
        data.SetSkinState(false);
        SkinStone(isUI);
    }

    public override void SkinStone(bool isUI = false)
    {
        if(data.getIsOpenSkin)return;
        base.SkinStone(isUI);
     
        data.SetSkinState(true);
        SetSkinInformation(isUI);
        StartCoroutine(ExcuteLoadSkinStone());
    }

    public override void CloseSkinStone()
    {
        base.CloseSkinStone();
        if(!data.getIsOpenSkin)return;
        data.SetSkinState(false);
        StartCoroutine(ExcuteCloseStoneSkin());
    }

    public override void CloseSkinStone(float _value)
    {
        base.CloseSkinStone(_value);
        if(!data.getIsLoadSKin)return;
        LoadSkinStoneValue(_value);
        if(_value.Equals(0))data.SetLoadingState(false);
    }


    //[给皮肤设置信息]
    public override void SetSkinInformation(bool isUI = false)
    {
        if(isUI )
        { 
            /*if(gameObject.layer != LayerMask.NameToLayer(ONAME.LayerUI)) gameObject.SetLayer(ONAME.LayerUI);
            Vector3 center = transform.position.UGUIPointTo3DUICameraPoint();
            Vector3 top = data.getCurMonster.GetTopPose(data.getStrongholdBaseAttribution.strongholdLevel).position.UGUIPointTo3DUICameraPoint();
            Vector3 bot = towerBot.position.UGUIPointTo3DUICameraPoint();
            float height = Mathf.Abs(top.y  - bot.y);
            Vector4 vector4 = new Vector4(center.x,center.y,center.z,0); 
            towerBoardRenderer.material.SetVector("_Center",vector4);
            towerBoardRenderer.material.SetFloat("_Height",height);
            data.getCurMonster.SetSkinCenterInfo(vector4,height);*/

            if(gameObject.layer != LayerMask.NameToLayer(ONAME.LayerUI)) gameObject.SetLayer(ONAME.LayerUI);
            float height = Mathf.Abs(data.getCurMonster.GetTopPose(data.getStrongholdBaseAttribution.strongholdLevel).position.y - towerBot.position.y) ;// Vector3.Distance(towerTop.position,towerBot.position);
            towerBoardRenderer.material.SetVector("_Center",selfVec4);
            towerBoardRenderer.material.SetFloat("_Height",height);
            data.getCurMonster.SetSkinCenterInfo(selfVec4,height);

        }else
        {

            if(gameObject.layer != LayerMask.NameToLayer(ONAME.LayerDeafualt)) gameObject.SetLayer(ONAME.LayerDeafualt);
            float height = Mathf.Abs(data.getCurMonster.GetTopPose(data.getStrongholdBaseAttribution.strongholdLevel).position.y - towerBot.position.y) ;// Vector3.Distance(towerTop.position,towerBot.position);
            towerBoardRenderer.material.SetVector("_Center",selfVec4);
            towerBoardRenderer.material.SetFloat("_Height",height);
            data.getCurMonster.SetSkinCenterInfo(selfVec4,height);
        }
        base.SetSkinInformation(isUI);
    }


    #endregion
    #region 执行皮肤加载 和关闭


    private IEnumerator ExcuteLoadSkinStone()
    { 
        float loadSkinValue = data.getLoadingSkinVluae;
        while(data.getIsOpenSkin && isActive)
        {
            //if(!isActive) yield break;
            if(loadSkinValue >= 1) break;
            loadSkinValue += Time.deltaTime;
            loadSkinValue = Mathf.Clamp01(loadSkinValue);
            LoadSkinStoneValue(loadSkinValue);
            yield return null;
        }
        effect.gameObject.SetTargetActiveOnce(true);
    }


    private IEnumerator ExcuteCloseStoneSkin()
    {
        effect.SetTargetActiveOnce(false);
        float loadSkinValue = data.getLoadingSkinVluae;
        while(!data.getIsOpenSkin && isActive)
        {
            if(!isActive) yield break;
            if(loadSkinValue<=0)break;
            loadSkinValue -= Time.deltaTime;
            loadSkinValue = Mathf.Clamp01(loadSkinValue);
            LoadSkinStoneValue(loadSkinValue);
            yield return null;
        }
        AndaDataManager.Instance.RecieveItem(this);
    }

    public override void LoadSkinStoneValue(float _value)
    {
        //Debug.Log("Value" + _value);
        towerBoardRenderer.material.SetFloat("_HologarmGrowup" , _value);
        data.getCurMonster.SetSkinGrowupValue(_value);//.material.SetFloat("_HologarmGrowup" , _value);
        base.LoadSkinStoneValue(_value);
    }


    #endregion

    private Vector3 lookAtCameraPosition;
    private bool isFollowCamera =false;
    public void PlayFadeIn()
    {
        animator.Play("FadeIn");
    }

    public void LookAtCamera(bool followState)
    {
        isFollowCamera = followState;
    }

    private void InvokeLookAtCamera(Transform target)
    {
      //  transform.LookAt(lookAtCameraPosition);
    }

    public void Update()
    {
        if(isFollowCamera)
        {
            Vector3 targetPoint = ARMonsterSceneDataManager.Instance.MapCamera.transform.position;
            transform.forward = -(new Vector3(targetPoint.x, transform.position.y , targetPoint.z) - selfPostion);
        }
    }

    public void OpenPlayerInfoBar(bool isOpen)
    {
        if(data.getPlayerScreenInfo == null)
        {
            data.BuildPlayerInfobar();
        }

        Vector3 vector3 =-(ARMonsterSceneDataManager.Instance.MapCamera.transform.position - towerTop.transform.position);
        vector3.y = 0;
        towerTop.transform.forward = vector3;
        data.getPlayerScreenInfo.OpenBar(isOpen);
    }


}
