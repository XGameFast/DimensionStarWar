using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class MapUIItem_icon_UserPor : AndaObjectBasic
{
    public Image porImg;

    private Vector3 worldPose;
    private MapController mapController;
    private float baseScaleDistance = 1800;

    public override void OnSpawn()
    {
        base.OnSpawn();
        AndaDataManager.Instance.GetPlayerPorImg(SetUserImg);
    }

    public void SetInfo(Vector3 _pose,MapController _mapcontroller)
    {
        worldPose =_pose;
        mapController = _mapcontroller;
    }

    private void SetUserImg(Sprite sp)
    {
        porImg.sprite = sp;
    }

    public void UpdatePose(Vector3 p)
    {
        transform.position = p;
    }

    public void UpdateScale(float v)
    {
        transform.localScale = Vector3.one * v;
    }

    public void Update()
    {
        if (mapController != null)
        {
            Vector2 vector2 = mapController.data.GetCurCamera.WorldToScreenPoint(worldPose);
            Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
            UpdatePose(p);
            float scale = baseScaleDistance / Vector3.Distance(worldPose, mapController.data.GetCurCamera.transform.position);
            scale = (float)Mathf.Clamp(scale, 0.3f, 2.5f);
            UpdateScale(scale);
        }
    }
}
