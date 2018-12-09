using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BuildTmpTower : AndaObjectBasic {

    public GameObject medalPoint;
    private TowerMonster1002 medalObj;
    public Renderer circleRender;
    public GameObject circle;
    public override void OnSpawn()
    {
        base.OnSpawn();
        BuildMedal();
    }

    private void BuildMedal()
    {
        if(medalObj!=null)
        {
            AndaDataManager.Instance.RecieveItem(medalObj);
        }
      
        medalObj = AndaDataManager.Instance.GetMedalItemEasy(0,-1);
        medalObj.SetInto(medalPoint.transform);
        medalObj.gameObject.SetLayer(ONAME.LayerDeafualt);
        medalObj.SetAlpha(0.5f);
        medalObj.animator.Play("FadeIn");
    }

    private void Update()
    {
        Vector3 forward = ARMonsterSceneDataManager.Instance.MapCamera.transform.forward;
        forward. y = 0;
        transform.position = ARMonsterSceneDataManager.Instance.GetMapCameraForwardWithSelfY(selfPostion) + forward*100;
        transform.forward = ARMonsterSceneDataManager.Instance.FaceToMapCameraWithSelfY(selfPostion);
    }

    private int colorIndex;

    public void DisplayCircleColor(int _colorIndex)
    {
        if(_colorIndex == colorIndex)return;
        switch(_colorIndex)
        {
            case 0:
                circleRender.material.SetColor("_Color" , Color.green);
                break;
            case 1:
                circleRender.material.SetColor("_Color" , Color.red);
                break;
        }
        colorIndex =_colorIndex;
    }

    public void CloseCircle()
    {
        circleRender.material.SetColor("_Color", Color.white);
    }

    public void OpenCircle()
    {
        circleRender.material.SetColor("_Color", Color.white);
    }
}
