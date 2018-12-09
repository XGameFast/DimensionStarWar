using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BuildPlayerTower : AndaObjectBasic {

    public GameObject medalPoint;
    public TextMesh playerNickName;
    public TextMesh strongholdNickName;
    public Renderer CircleRender;
    public int getStronholdType
    {
        get  {return playerStrongholdAttribute.hostType ;}
    }


    public int getHostIndex
    {
        get {return playerStrongholdAttribute.hostIndex ;}
    }


    public int getStrongholdIndex
    {
        get {return playerStrongholdAttribute.strongholdIndex ;}
    }

    public int getStrongholdMonsterCount
    {
        get {return playerStrongholdAttribute.monsterCount;}
    }

     

    public PlayerStrongholdAttribute playerStrongholdAttribute;

    private TowerMonster1002 medal;

    public override void OnDispawn()
    {

        if(medal!=null)
        {
            AndaDataManager.Instance.RecieveItem(medal);
            medal = null;
        }

        playerStrongholdAttribute = null;

        base.OnDispawn();
    }


    public void SetInfo(PlayerStrongholdAttribute _playerStrongholdAttribute )
    {
        playerNickName.text = _playerStrongholdAttribute.hostNickName;
        strongholdNickName.text = _playerStrongholdAttribute.strongholdNickName;
        playerStrongholdAttribute = _playerStrongholdAttribute;
        medal = AndaDataManager.Instance.GetMedalItemEasy(playerStrongholdAttribute.medalLevel , playerStrongholdAttribute.statueID);
        medal.SetInto(medalPoint.transform);
        medal.gameObject.SetLayer(ONAME.LayerDeafualt);
        medal.animator.Play("FadeIn");
    }

    public void UpdateMedalFaceToMapCamera90()
    {
        medalPoint.transform.eulerAngles = new Vector3(-90, 180, 0);
    }

    public void UpdateMedalFaceToMapCamera50()
    {
        Vector3 fwd = ARMonsterSceneDataManager.Instance.MapCamera.transform.position - medalPoint.transform.position;
       // Quaternion quaternion = Quaternion.Euler(fwd);
       // Vector3 euluer = quaternion.eulerAngles;
       // euluer.x = -50;
        medalPoint.transform.forward = fwd;
        // medal.transform.LookAt(ARMonsterSceneDataManager.Instance.MapCamera.transform);
    }

    /// <summary>
    /// 0 = yellow 1 = white , 2 =gray;
    /// </summary>
    /// <param name="type">Type.</param>
    public void SetCircleColore(int type)
    {
        switch(type)
        {
            case 0:
                CircleRender.material.SetColor("_Color", Color.yellow);
                break;
            case 1:
                CircleRender.material.SetColor("_Color", Color.white);
                break;
            case 2:
                Color color = new Color { r = 0.09f, g = 0.09f, b = 0.09f, a = 1 };
                CircleRender.material.SetColor("_Color", color);
                break;
        }
    }
}
