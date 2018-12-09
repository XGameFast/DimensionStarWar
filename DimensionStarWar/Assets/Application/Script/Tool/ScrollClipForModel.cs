using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScrollClipForModel : MonoBehaviour {

    public Renderer[] _renderer;
    public UIPanel scrollPanel;
    public Transform btnlistTrans;
    private Material[] mats;
    private void Start()
    {
        if (scrollPanel == null)
        {
            scrollPanel = transform.GetComponentInParent<UIPanel>();
        }
        mats = new Material[_renderer.Length];
        for(int i =0; i < mats.Length;i++)
        {
            mats[i] = _renderer[i].material;
            SetPosition(mats[i]);
        }
    }

    private void SetPosition(Material mat)
    {
        //将 NGUI的世界坐标转换到屏幕坐标
        Vector3 tmp = new Vector3(1000, btnlistTrans.position.y, 0);
        Vector3 screenPose = UICamera.mainCamera.WorldToScreenPoint(tmp);

        Vector3 centerPose = UICamera.mainCamera.ScreenToWorldPoint(screenPose);

        Debug.Log("screenPose" + screenPose);



        mat.SetFloat("_center", centerPose.y);

        screenPose.y += scrollPanel.GetViewSize().y / 2;

        Vector3 realWorldPose = UICamera.mainCamera.ScreenToWorldPoint(screenPose);

        mat.SetFloat("_radius", realWorldPose.y);
        //
    }
}
