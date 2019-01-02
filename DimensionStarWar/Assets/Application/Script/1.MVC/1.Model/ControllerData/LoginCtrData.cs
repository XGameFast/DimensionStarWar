using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoginCtrData : ControllerData {

    public LoginMenu2 GetLoginMenu
    {
        get {return loginMenu ;}
    }
    private LoginController loginController;
    private LoginMenu2 loginMenu ;
    private JIRVISContent_StartVideo jiRVISContent_StartVideo;
    /// <summary>
    /// 当前登陆的状态 0=失败，1=正在登陆，2=成功
    /// </summary>
    public int curLoginState = 0;

    public void InitValue()
    {
        RemoveMenu();
        loginMenu = null;
        curLoginState = 0;
    }

    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        loginController = baseController as LoginController;
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        loginMenu = m_Menu as LoginMenu2;
    }

    public void BuildJIRVISContent_StartVideo(System.Action callback)
    {
        if(jiRVISContent_StartVideo == null)
        {
            jiRVISContent_StartVideo = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_StartVideo>(ONAME.JIRVISContent_StartVideo);
            jiRVISContent_StartVideo.SetInto(JIRVIS.Instance.jIRVISData.getJIRVISBar.videoPoint);
            jiRVISContent_StartVideo.SetPlay(callback);
        }
    }

    public void RemoveJIRVISContent_StartVideo()
    {
        if(jiRVISContent_StartVideo!=null)
        {
            AndaDataManager.Instance.RecieveItem(jiRVISContent_StartVideo);
        }
    }

}
