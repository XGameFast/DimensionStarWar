using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1002 : MonsterBasic
{

    public List<Renderer> rendener01;
    public Material[] normalMat;
    public Material[] holoMat;


    private int skinType = -1;
    private AndaObjectBasic skingrowUpEffect ;
    private Transform skingrowUpEffectChild;

    public override void OnDispawn()
    {

        if(skingrowUpEffect!=null)
        {
            AndaDataManager.Instance.RecieveItem(skingrowUpEffect);
            skingrowUpEffect = null;
            skingrowUpEffectChild = null;
            skinType = -1;
        }

        base.OnDispawn();
    }


    #region 设置皮肤数据

    public override void SetSkinType(int _type)
    {
        if(skinType == _type)return;
        switch(skinType)
        {
            case 0:
                rendener01[0].material = normalMat[0];
                break;
            case 1:
                rendener01[0].material = holoMat[0];

                break;
            case 2:
                rendener01[0].material = skinStoneMaterias;
                break;
        }
        skinType = _type;
        base.SetSkinType(_type);
    }

    public override void SetSkinInformation(bool isUI = false)
    {
        Vector4 _Center = new Vector4();
        float  _Height = 0;

        if(isUI)
        {
            Vector3 centerPose = transform.position.UGUIPointTo3DUICameraPoint();
            Vector3 topPose = top.position.UGUIPointTo3DUICameraPoint();
            Vector3 botPose = bot.position.UGUIPointTo3DUICameraPoint();
            _Center = new Vector4(centerPose.x,centerPose.y,centerPose.z,0);
            _Height = Mathf.Abs(topPose.y - botPose.y);
        }else
        {
            _Center = new Vector4(selfPosX,selfPosY,selfPosZ,0);
            _Height = Mathf.Abs(top.position.y - bot.position.y);
        }

        rendener01[0].material.SetVector("_Center",_Center);
        rendener01[0].material.SetFloat("_Height" ,_Height);
        base.SetSkinInformation(isUI);
    }

    public override void LoadSkinStoneValue(float _value)
    {
        rendener01[0].material.SetFloat("_HologarmGrowup" ,_value);
        base.LoadSkinStoneValue(_value);
    }

    #endregion

    public override void SkinStone(bool isUI = false)
    {
        base.SkinStone(isUI);
        if(skinType == 2) return; 
        SetSkinType(2);
        SetSkinInformation(isUI);
        StartCoroutine(LoadStone());
    }

    public override void SkinNormal()
    {
        base.SkinNormal();
        if(skinType == 0)return;
        SetSkinType(0);
    }

    public override void SkinHologarm(bool isUI = false)
    {
        base.SkinHologarm(isUI);
        if(skinType == 1)return;
        SetSkinType(1);
        StartCoroutine(LoadHologram());
    }

    private IEnumerator LoadHologram()
    {
        float value = 0;
        while(value<1)
        {
            value += Time.deltaTime;
            LoadSkinStoneValue(value);
            yield return null;
        }
        SkingrowUp();
    }

    public override void SkingrowUp()
    {
        base.SkingrowUp();
        StartCoroutine(Loadgrowup());
    }

    public override void SkingrowUp(float _value)
    {
        base.SkingrowUp(_value);
    }

    private IEnumerator Loadgrowup()
    {
        float value = 0;
        while(value <1)
        {
            value += Time.deltaTime;
            rendener01[0].material.SetFloat("_Skingrowup" ,value);
            yield return null;
        }
        SkinNormal();
    }

    private IEnumerator LoadStone()
    {
        float value = 0;
        while(value <1)
        {
            value += Time.deltaTime;
            LoadSkinStoneValue(value);
            yield return null;
        }
    }

}
