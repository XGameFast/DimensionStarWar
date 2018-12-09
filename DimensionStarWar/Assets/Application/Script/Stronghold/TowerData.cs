using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TowerData {


    public float getProtectRangeRadius { get {return protectRangeRadius ; }}
    public float getStrongholdBaseRangeRadius { get {return protectBaseRangeRadius ;}}
    public float getLoadingSkinVluae {get { return loadSkinValue ; }}
    public bool getIsLoadSKin { get { return isLoadSkin ; }}
    public bool getIsOpenSkin { get {return isOpenSkin ;}}
    public Color getBaseRangeCircleColor { get { return baseRangeCircleColor ;}}
    public TowerMonster getCurMonster { get {return curMonster;}}
    public PlayerScreenInfoBar getPlayerScreenInfo { get {return playerScreenInfoBar ;}}
    public int getStrongholdIndex {get { return baseAttribution.strongholdIndex ;}}
    public int getStrongholdHostIndex {get {return baseAttribution.hostIndex ;}}
    public int getStrongholdMonsterCount {get {return baseAttribution.monsterCount ;}}
    public StrongholdBaseAttribution getStrongholdBaseAttribution {get {return baseAttribution ;}}
    public int getSkinType {get {return curSkinType ; }}
    private TowerMonster curMonster;
    private TowerBase curTowerBase;
    private StrongholdBaseAttribution baseAttribution;
    private float protectRangeRadius;
    private float protectBaseRangeRadius;
    private float loadSkinValue = 0f;
    private bool isLoadSkin = false;
    private bool isOpenSkin=false;
    private Color baseRangeCircleColor;
    private PlayerScreenInfoBar playerScreenInfoBar;
    private int curSkinType;
    public void BuildData(TowerBase _towerbase , StrongholdBaseAttribution _baseAttribution)
    {
        InitData();
        curTowerBase = _towerbase;
        baseAttribution = _baseAttribution;
    }

    public void InitData()
    {
        if(curMonster != null)
        { 
            AndaDataManager.Instance.RecieveItem(curMonster);
            curMonster =null;
        }

        baseAttribution = null;
        curTowerBase = null;
        loadSkinValue = 0;
        isLoadSkin =false;
        isOpenSkin =false;
    }

    public void BuildMonster()
    {

        //curTowerBase.materials[0] = AndaDataManager.Instance.GetMaterial();
        if(curMonster == null)
        {
            curMonster = AndaDataManager.Instance.GetMedalItemEasy(baseAttribution.strongholdLevel,baseAttribution.statueID);
            curMonster.SetAlpha(1f);
            curMonster.SetInto(curTowerBase.monsterPoint);
            curMonster.gameObject.SetLayer(LayerMask.LayerToName(curTowerBase.gameObject.layer));
        }else
        {
            AndaDataManager.Instance.RecieveItem(curMonster);
        }
    }

    public void SetMedalAlpha(float alpha)
    {
        if(curMonster!=null)
        {
            curMonster.SetAlpha(alpha);
        }
    }

    public void BuildPlayerInfobar()
    {
        playerScreenInfoBar = AndaDataManager.Instance.InstantiateMenu<PlayerScreenInfoBar>(ONAME.PlayerScreenInfoBar);
        playerScreenInfoBar.SetInto(curTowerBase.towerTop.transform);
        playerScreenInfoBar.SetScalePercent(3f);
        playerScreenInfoBar.SetInfo(baseAttribution.hostNickName,baseAttribution.hostLevel,"尽管来挑战把。没在怕的");
    }

    #region 设置数据

    public void SetSkinType(int skinType)
    {
        curSkinType = skinType;
    }

    public void SetSkinState(bool _isOpenSkin) //现在是打开皮肤还是关闭皮肤
    {
        isOpenSkin = _isOpenSkin;
    }

    public void SetLoadingState(bool _isLoading)
    {
        isLoadSkin = _isLoading;
    }

    public void SetSkinloadingValue(float _value)
    {
        loadSkinValue = _value;
    }

    public void SetRange()
    {
        float baseRange = curTowerBase.realityScale.x * curTowerBase.scalePercent;

        protectBaseRangeRadius = baseRange / 2;

        float protectRange = baseRange * baseAttribution.protectRange;

        protectRangeRadius = protectRange/2;

        curTowerBase.towerRangeRenderer.transform.parent.localScale  =  Vector3.one * baseAttribution.protectRange;
    }

    public void SetRangeBaseColor(Color _color)
    {
        baseRangeCircleColor = _color;
    }
    #endregion
}
