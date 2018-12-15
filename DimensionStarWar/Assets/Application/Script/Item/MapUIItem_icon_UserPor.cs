using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class MapUIItem_icon_UserPor : AndaObjectBasic
{
    public Image porImg;

    public override void OnSpawn()
    {
        base.OnSpawn();
        AndaDataManager.Instance.GetPlayerPorImg(SetUserImg);
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
}
