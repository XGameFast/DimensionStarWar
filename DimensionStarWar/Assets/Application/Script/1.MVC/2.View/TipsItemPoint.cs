using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class TipsItemPoint : AndaObjectBasic {

    private Camera targetCamera;

    public Transform boardArrow;

    public Image img;

    public void SetCamera(Camera c)
    {
        targetCamera =  c;
    }

    public void SetImg(Sprite sp)
    {
        img.sprite = sp;
    }

    public void Follow(Vector3 target)
    {

        if(target.IsInFrontOfCamera(targetCamera))
        {
            Vector2 v2 = targetCamera.WorldToScreenPoint(target);
            if (v2.x >= 0 && v2.x <= Screen.width && v2.y >= 0 && v2.y <= Screen.height)
            {
                gameObject.SetTargetActiveOnce(false);
                return;
            }
            gameObject.SetTargetActiveOnce(true);
            Vector2 tmp = v2;
            if (tmp.x < 0) tmp.x = 0;
            if (tmp.x > Screen.width) tmp.x = Screen.width;
            if (tmp.y < 0) tmp.y = 0;
            if (tmp.y > Screen.height) tmp.y = Screen.height;
            Vector3 w3 = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(tmp.x, tmp.y, 90));
            transform.position = w3;


            Vector2 dir = v2 - tmp;

            boardArrow.up = -dir;

            img.transform.up = Vector2.up;

        }
        else
        {
            Vector2 v2 = targetCamera.WorldToScreenPoint(target);
            gameObject.SetTargetActiveOnce(true);
            Vector2 tmp = v2;
            if (tmp.x < Screen.width/2) tmp.x = Screen.width;
            if (tmp.x >= Screen.width/2) tmp.x =0;
            if (tmp.y < Screen.height/2) tmp.y = Screen.height;
            if (tmp.y >= Screen.height/2) tmp.y =0;
            Vector3 w3 = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(tmp.x, tmp.y, 90));
            transform.position = w3;
            Vector2 dir = v2 - tmp;
            boardArrow.up = -dir;
            img.transform.up = Vector2.up;
        }




        //--
       // Vector2 dir = v2 - tmp;
       // boardArrow.right = new Vector3(0,0, dir.y);

       // img.transform.right = Vector3.up;

    }


}
