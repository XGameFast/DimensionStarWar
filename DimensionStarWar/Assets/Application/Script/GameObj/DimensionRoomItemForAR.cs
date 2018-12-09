using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class DimensionRoomItemForAR : AndaObjectBasic {

    public Slider strongholdExpSlider;
    public Text strongholdExpText;
    public GameObject medalPoint;
    private PlayerStrongholdAttribute playerStrongholdAttribute;
    private TowerMonster1002 towerMonster1002 ;

    public override void OnDispawn()
    {
    
        if(towerMonster1002!=null)
        {
            AndaDataManager.Instance.RecieveItem(towerMonster1002);
        }

        playerStrongholdAttribute = null;

        base.OnDispawn();
    }

    public void FadeIn()
    {
        if(towerMonster1002!=null)
        {
            towerMonster1002.animator.Play("FadeIn");
        }
    }


    public void SetInfo(PlayerStrongholdAttribute _playerStrongholdAttribute)
    {
        playerStrongholdAttribute = _playerStrongholdAttribute;
        BuildMedal();
        SetdExp();
    }

    private void BuildMedal()
    {
        towerMonster1002 = AndaDataManager.Instance.InstantiateTower<TowerMonster1002>("20000");
        Material medalBody = AndaDataManager.Instance.GetMedalMaterial("20000_"+playerStrongholdAttribute.strongholdLevel);
        Material medalTexture = AndaDataManager.Instance.GetMedalMaterial(playerStrongholdAttribute.statueID.ToString());
        towerMonster1002.SetMonsterMaterial(medalTexture,medalBody);
        towerMonster1002.SetAlpha(1);
        towerMonster1002.SetInto(medalPoint.transform);
        towerMonster1002.gameObject.SetLayer(ONAME.LayerDeafualt);
    }

    public void SetdExp()
    {
        StartCoroutine(ReadExp());
    }

    private IEnumerator ReadExp()
    {
        float t =  0;
        while(t < 1)
        {
            t += Time.deltaTime;
            strongholdExpText.text = (t * playerStrongholdAttribute.strongholdGloryValue).ToString();
            strongholdExpSlider.value = t;
            yield return null;
        }

        strongholdExpText.text = playerStrongholdAttribute.strongholdGloryValue.ToString();

    }
}
