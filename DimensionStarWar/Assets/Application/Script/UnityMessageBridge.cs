using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class UnityMessageBridge : MonoBehaviour {

    public LoginController loginController;
    public CheckConfigController checkConfigController;


    public void SetUserDeviceToken(string token)
    {
        //PlayerPrefs.SetString(ONAME.uuid , uuid);
        PlayerPrefs.SetString(ONAME.deviceToken,token);
        checkConfigController.FinishRegisterNoti();
    }

    public void ReciveWechatLogin(string code)
    {
        Debug.Log("Code" + code);
        loginController.WecahtLoginCallback(code);
    }
}
