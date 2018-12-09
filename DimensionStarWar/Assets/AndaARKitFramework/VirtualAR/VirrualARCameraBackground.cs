using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR;
using UnityEngine.UI;
public class VirrualARCameraBackground : MonoBehaviour {

    private RawImage image;
    private WebCamTexture cam;
    private AspectRatioFitter arf;

    public void OnEnable()
    {
        if(arf == null)
        {
            arf = GetComponent<AspectRatioFitter>();
        }

        if(image == null)
        {
            image = GetComponent<RawImage>();
        }

        if(cam == null)
        {
            cam = new WebCamTexture(Screen.width, Screen.height);
            image.texture = cam;
        }

        cam.Play();
    }

    public void OnDisable()
    {
        StopWebCamTexture();
    }

    // Update is called once per frame
    void Update()
    {
        if(!gameObject.activeSelf)return;
        if (cam.width < 100)
        {
            return;
        }

        float cwNeeded = -cam.videoRotationAngle;
        if (cam.videoVerticallyMirrored)
        {
            cwNeeded += 180f;
        }

        image.rectTransform.localEulerAngles = new Vector3(0f, 0f, cwNeeded);

        float videoRatio = (float)cam.width / (float)cam.height;
        arf.aspectRatio = videoRatio;

        if (cam.videoVerticallyMirrored)
        {

            image.uvRect = new Rect(1, 0, -1, 1);
        }
        else
            image.uvRect = new Rect(0, 0, 1, 1);

    }

    public void StopWebCamTexture()
    {
        cam.Stop();
    }

    void OnDestroy()
    {
        StopWebCamTexture();
    }
}
