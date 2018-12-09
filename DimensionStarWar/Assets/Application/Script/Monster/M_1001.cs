using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1001 : MonsterBasic {

    //[renderer  0 = wuqi的renderer ， 1 = 金属手的renderer， 2 = 身体本带， 3 = 身体]
    public Renderer[] bodyRenderer;
    //[normal_skin 0 =  武器部分的的材质球 ， 1 = 身体部分的材质球]

    public Material[] normalSkin;
    public Material[] hologarmSkin;
    private int curSkinType = -1;
    private AndaObjectBasic skingrowUpEffect ;
    private Transform skingrowUpEffectChild;


    #region 设置皮肤

    //[打开基础皮肤]
    public override void SkinNormal()
    {
        //普通皮肤
        base.SkinNormal();
        if (curSkinType == 0) return;
        SetSkinType(0);
    }

    //----------------------------------------
    //[雕像皮肤]
    public override void SkinStone(bool isUI)
    {
        //石头皮肤
        if(curSkinType == 2)return;
        base.SkinStone(isUI);
        SetSkinType(2);
        SetSkinInformation(isUI);
        StartCoroutine(LoadSkinStone());
    }

    //[关闭雕像皮肤]
    public override void CloseSkinStone()
    {
        if(curSkinType!=2)return;
        base.CloseSkinStone();
        StartCoroutine(CloseSkinstone());
    }

    //----------------------------------------
    //[成长皮肤]
    public override void SkinHologarm(bool isUI = false)
    {
        if(curSkinType == 1)return;
        base.SkinHologarm(isUI);
        SetSkinType(1);
        SetSkinInformation(isUI);
        StartCoroutine(LoadHologram());
    }

   

    #endregion


    #region 执行皮肤加载




    private IEnumerator LoadHologram()
    {
        float value = 0;
        while(value < 1)
        {
            value += Time.deltaTime;
            SetDissvo(value);
            yield return null;
        }
        SkingrowUp();
    }

    public override void SkingrowUp()
    {
        base.SkingrowUp();
        StartCoroutine(LoadGrowup());
    }

    private IEnumerator LoadGrowup()
    {
        float value = 0;
        while(value < 1)
        {
            value += Time.deltaTime;
            SetGrowup(value);
            yield return null;
        }
        SkinNormal();
    }

    private IEnumerator CloseSkinstone()
    {
        float value =1;
        while(value < 1)
        {
            value += Time.deltaTime;
            SetDissvo(value);
            yield return null;
        }
    }


    private IEnumerator LoadSkinStone()
    {
        float value = 0;
        while(value < 1)
        {
            value += Time.deltaTime;
            SetDissvo(value);
            yield return null;
        }
    }

    public override void LoadSkinStoneValue(float _value)
    {
        SetDissvo(_value);
        base.LoadSkinStoneValue(_value);
    }


    private void SetDissvo(float i)
    {
        foreach(var go in bodyRenderer[0].materials)
        {
            go.SetFloat("_HologarmGrowup" , i);
        }
        bodyRenderer[1].material.SetFloat("_HologarmGrowup" , i);
        bodyRenderer[2].material.SetFloat("_HologarmGrowup" , i);
        bodyRenderer[3].material.SetFloat("_HologarmGrowup" , i);
    }

    private void SetGrowup(float i)
    {
        foreach(var go in bodyRenderer[0].materials)
        {
            go.SetFloat("_Skingrowup" , i);
        }
        bodyRenderer[1].material.SetFloat("_Skingrowup" , i);
        bodyRenderer[2].material.SetFloat("_Skingrowup" , i);
        bodyRenderer[3].material.SetFloat("_Skingrowup" , i);
    }

    public override void SetSkinInformation(bool isUI = false)
    {
        Vector4 vector4  = new Vector4();
        float height = 0;
        if(isUI)
        {
            Vector3 centerPose = transform.position.UGUIPointTo3DUICameraPoint();
            Vector3 topPose = top.position.UGUIPointTo3DUICameraPoint();
            Vector3 botPose = bot.position.UGUIPointTo3DUICameraPoint();
            height = Mathf.Abs(topPose.y - botPose.y);
            vector4 = new Vector4(centerPose.x,centerPose.y,centerPose.z,0);
        }else
        {
            height = Mathf.Abs(top.position.y - bot.position.y);
            vector4 = new Vector4(selfPosX,selfPosY,selfPosZ,0);
        }

        foreach(var go in bodyRenderer[0].materials)
        {
            go.SetVector("_Center" , vector4);
            go.SetFloat("_Height" , height);
        }
        //
        bodyRenderer[1].material.SetVector("_Center" , vector4);
        bodyRenderer[2].material.SetVector("_Center" , vector4);
        bodyRenderer[3].material.SetVector("_Center" , vector4);
        //
        bodyRenderer[1].material.SetFloat("_Height" , height );
        bodyRenderer[2].material.SetFloat("_Height" , height );
        bodyRenderer[3].material.SetFloat("_Height" , height );
        base.SetSkinInformation(isUI);
    }


    public override void SetSkinType(int _type)
    {
        if(curSkinType == _type)return;
        switch(_type)
        {
            case 0:
                if(bodyRenderer[1].material == normalSkin[0])return;
                bodyRenderer[0].materials = new Material[] {normalSkin[0],normalSkin[0]};
                bodyRenderer[1].material = normalSkin[0];
                bodyRenderer[2].material = normalSkin[1];
                bodyRenderer[3].material = normalSkin[1];
                break;
            case 1:
                if(bodyRenderer[1].material == hologarmSkin[0])return;
                bodyRenderer[0].materials = new Material[] {hologarmSkin[0],hologarmSkin[0]};
                bodyRenderer[1].material = hologarmSkin[0];
                bodyRenderer[2].material = hologarmSkin[1];
                bodyRenderer[3].material = hologarmSkin[1];
                break;
            case 2:
                if(bodyRenderer[1].material == skinStoneMaterias)return;
                bodyRenderer[0].materials = new Material[] {skinStoneMaterias,skinStoneMaterias};
                bodyRenderer[1].material = skinStoneMaterias;
                bodyRenderer[2].material = skinStoneMaterias;
                bodyRenderer[3].material = skinStoneMaterias;
                break;
        }
        curSkinType = _type;
        base.SetSkinType(_type);
    }
    #endregion








}
