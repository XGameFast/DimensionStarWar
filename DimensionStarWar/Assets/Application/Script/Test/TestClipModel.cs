using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestClipModel : MonoBehaviour {

    public Renderer _renderer;
    public UIPanel uIScrollBar;
    public Transform btnlistTrans;
    private Material mat;
    private void Start()
    {
        mat = _renderer.material;
        SetPosition();
    }

    private void SetPosition()
    {
        //将 NGUI的世界坐标转换到屏幕坐标
        Vector3 tmp = new Vector3(1000, btnlistTrans.position.y, 0);
        Vector3 screenPose = UICamera.mainCamera.WorldToScreenPoint(tmp);

        Vector3 centerPose = UICamera.mainCamera.ScreenToWorldPoint(screenPose);

        Debug.Log("screenPose" + screenPose);



        mat.SetFloat("_center", centerPose.y);

        screenPose.y += uIScrollBar.GetViewSize().y / 2;

        Vector3 realWorldPose = UICamera.mainCamera.ScreenToWorldPoint(screenPose);
        
        mat.SetFloat("_radius", realWorldPose.y);
//
    }
}
