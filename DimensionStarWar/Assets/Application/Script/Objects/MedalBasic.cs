using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MedalBasic : AndaObjectBasic {

    public TextMesh medalNickName;
    public TextMesh medalDate;

    public Renderer renderers;
    public Transform topSide;
    public Transform botSide;
    public GameObject medelInformationText;

    public bool isOpenSkin=false;
    private float loadSkinValue = 0f;


    public override void OnDispawn()
    {
        isOpenSkin=false;
        loadSkinValue = 0;
        medelInformationText.gameObject.SetTargetActiveOnce(false);
        base.OnDispawn();
    }

    public void SetInfo(string medalnickName, string creatDate)
    {
        medalNickName.text = medalnickName;
        medalDate.text = creatDate;
    }

    public override void SkinHologarmInUI()
    {
        base.SkinHologarmInUI();
        if(isOpenSkin)return;
        isOpenSkin = true;
        SetHologarmInitValueInUI();
        StartCoroutine(LoadSkinHologarm());
    }

    //[开始全息皮肤加载]
    public override void SkinHologarm(bool needGrowup = true)
    {
        base.SkinHologarm(needGrowup);
        if(isOpenSkin)return;
        isOpenSkin = true;
        SetHologarmInitValue();

        StartCoroutine(LoadSkinHologarm());
    }
    //[设置全息皮肤需要的初始值]
    private void SetHologarmInitValue()
    {
        float height = Mathf.Abs(topSide.position.y - botSide.position.y) ;// Vector3.Distance(towerTop.position,towerBot.position);

        foreach(var go in renderers.materials)
        {
            go.SetVector("_Center",selfVec4);
            go.SetFloat("_Height",height);
        }

    }

    private void SetHologarmInitValueInUI()
    {
        Vector3 center = transform.position.UGUIPointTo3DUICameraPoint();
        Vector3 top = topSide.position.UGUIPointTo3DUICameraPoint();
        Vector3 bot = botSide.position.UGUIPointTo3DUICameraPoint();
        float height = Mathf.Abs(top.y  - bot.y);
        Vector4 vector4 = new Vector4(center.x,center.y,center.z,0); 

        foreach(var go in renderers.materials)
        {
            go.SetVector("_Center",selfVec4);
            go.SetFloat("_Height",height);
        }

    }
 
    private IEnumerator LoadSkinHologarm()
    { 
        while(isOpenSkin && isActive)
        {
            if(!isActive) yield break;
            if(loadSkinValue >= 1) break;
            loadSkinValue += Time.deltaTime;
            loadSkinValue = Mathf.Clamp01(loadSkinValue);
            foreach(var go in renderers.materials)
            {
                go.SetFloat("_HologarmGrowup" , loadSkinValue);
               
            }

            yield return null;
        }

      //  effect.gameObject.SetTargetActiveOnce(true);

        medelInformationText.gameObject.SetTargetActiveOnce(true);
    }


    public override void CloseHologarm()
    {
        base.CloseHologarm();
        if(!isOpenSkin)return;
        isOpenSkin=false;
        StartCoroutine(Excutehologarm());
    }

    private IEnumerator Excutehologarm()
    {
       // effect.SetTargetActiveOnce(false);
        while(!isOpenSkin && isActive)
        {
            if(!isActive) yield break;
            if(loadSkinValue<=0)break;
            loadSkinValue -= Time.deltaTime;
            loadSkinValue = Mathf.Clamp01(loadSkinValue);
            foreach(var go in renderers.materials)
            {
                go.SetFloat("_HologarmGrowup" , loadSkinValue);

            }
            yield return null;
        }
        AndaDataManager.Instance.RecieveItem(this);
    }

}
