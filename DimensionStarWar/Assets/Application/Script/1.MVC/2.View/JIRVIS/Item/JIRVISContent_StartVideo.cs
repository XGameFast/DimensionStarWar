using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
using UnityEngine.UI;
public class JIRVISContent_StartVideo : UIBasic2 {

    public string videoPath = "localhost:8080/startvideo.mov";
    public VideoPlayer videoPlayer;
    public Animator animator;
    public Toggle toggle;
    private System.Action CallBackBuildstaronghold;

    public override void OnDispawn()
    {
        videoPlayer.Stop();
        base.OnDispawn();
    }

    public void SetPlay(System.Action action = null)
    {
        videoPlayer.Play();
    }

    private void ClickStartDimensionworld()
    {
        JIRVIS.Instance.CloseTips();
        CallBackBuildstaronghold();   
    }

    public void ClickToggle(bool isSkipTips)
    {
        PlayerPrefs.SetInt("ARScannerTips" , isSkipTips?1:0);
    }
}
