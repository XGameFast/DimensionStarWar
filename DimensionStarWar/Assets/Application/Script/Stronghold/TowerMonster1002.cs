using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TowerMonster1002 : TowerMonster {
    public Renderer monsterRender;

    public TextMesh medalName;
    public TextMesh medalType;
    public TextMesh medalCreatTime;
    public override void SetMonsterMaterial(Material materialTexture  ,Material medalBody)
    {
        
        medalbody.material = medalBody;
        medalTexture.material = materialTexture;
        //medalTexture.material.color = medalBody.color;
       
    }

    public void SetMedalName(string _medalName)
    {
        medalName.text = _medalName;
    }

    public void SetMedalInfo(int medalLevel,int _medalCreatTime)
    {
        string _medalType = AndaDataManager.Instance.GetMedalTypeName(medalLevel);
        medalType.text = _medalType;
        medalType.GetComponent<Renderer>().material.SetColor("_Color" , AndaGameExtension.GetLevelColor(medalLevel));
        medalCreatTime.text = AndaGameExtension.GetDateString(_medalCreatTime);
    }

    public override void SetSkinGrowupValue(float value)
    {
        foreach(var go in monsterRender.materials)
        {
            go.SetFloat("_HologarmGrowup" , value);
        }
    }

    public override void SetSkinCenterInfo( Vector4 vector4, float height)
    {
        
        foreach(var go in monsterRender.materials)
        {
            go.SetVector("_Center",selfVec4);
            go.SetFloat("_Height",height);
        }
    }

    public override void SetAlpha(float alpha)
    {
        base.SetAlpha(alpha);
        medalbody.material.SetFloat("_Alpha" , alpha);
        if(medalTexture!=null)
        {
            medalTexture.material.SetFloat("_Alpha" , alpha);
        }
     
    }
}
