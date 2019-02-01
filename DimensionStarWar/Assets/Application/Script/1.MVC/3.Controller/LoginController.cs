using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;
public class LoginController : BaseController {
 
    public LoginCtrData loginCtrData;
    public bool isTestLoadLocalData = false;
    public override void StartController()
    {
        base.StartController();
        BuildLoginCtrData();
        loginCtrData.BuildMenu(ONAME.LoginMenu2);
        loginCtrData.GetLoginMenu.PreloadUserAccountAndPassword();
    }
    public override void EndController()
    {
        ARMonsterSceneDataManager.Instance.aRWorld.OpenLoginMenuBackground(false);
        loginCtrData.InitValue();
        base.EndController();
    }

    private void InvokeFadeInMenu()
    {
       // loginCtrData.getm_Menu.FadeIn();
    }

    private void BuildLoginCtrData()
    {
        if(loginCtrData == null)
        {
            loginCtrData = new LoginCtrData();
        }

        loginCtrData.BuildData(this);
    }

  
    #region SMSCode
    public void SendCode(System.Action<bool> _callBack,string phone )
    {
        AndaDataManager.Instance.SendSmsCode(_callBack, phone);

    }
    #endregion


    #region Clik
    public void ClickToLogin(string accout,string password)
    {
        if(isTestLoadLocalData)
        {
            PlayerData playerData = LitJson.JsonMapper.ToObject<PlayerData>(PlayerPrefs.GetString("TestToolUserData"));
            AndaDataManager.Instance.SetUserData(playerData);
            callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
            return;
        }

        //正在登陆
        loginCtrData.curLoginState = 1;

        if(TestManager.Instance.isTestLoadinglocalData)
        { 

           // AndaDataManager.Instance.TestLoginOnce(CallBackLogin,accout);
            //AndaDataManager.Instance.TestLogin(CallBackLogin,accout, password);

        }else
        {
            AndaDataManager.Instance.TestLoginOnce(CallBackLogin,accout);
           // Debug.Log("account:" + accout );
           // Debug.Log("password:" + password );
           // AndaDataManager.Instance.PhoneLogin(CallBackLogin, accout, password);
        }
    }

    public void PhoneLogin(string phoneNumber, string eicode)
    {
        AndaDataManager.Instance.PhoneLogin(PhoneLoginResult, phoneNumber, eicode);
    }

    public void PhoneLoginResult(bool isSuccess)
    {
        if(isSuccess)
        {
            PlayerPrefs.SetString("LastLogin", "Phone");
            PlayerPrefs.SetString("DefualtPhoneAccount", loginCtrData.GetLoginMenu.inputAccount.text);
            PlayerPrefs.SetString("DefualtPhoneSerect" , AndaDataManager.Instance.userData.phoneSecret);

            LoginFinish(isSuccess);
        }
    }

    public void WexinLoginResult(bool isSuccess)
    {
        if(isSuccess)
        {
            PlayerPrefs.SetString("LastLogin", "Wechat");
            LoginFinish(isSuccess);
        }
    }

    public void QQLoginResult(bool isSuccess)
    {
        if(isSuccess)
        {
            PlayerPrefs.SetString("LastLogin" ,"QQ");
            LoginFinish(isSuccess);
        }
    }


    public void LoginFinish(bool isLoginSuccess)
    {
        if(!isLoginSuccess)return;
        if (!AndaDataManager.Instance.PlayerHasMonster())//第一次
        {
            callbackFinishController(ONAME.SEARCHCONTROLLER);
        }
        else
        {
            callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
        }
    }


    public void CheckLoginSuccess(System.Action<int> callback_login)
    {
        callback_login(loginCtrData.curLoginState);
        if (loginCtrData.curLoginState == 2)
        {

            PlayerPrefs.SetString("UserAccount", loginCtrData.GetLoginMenu.inputAccount.text);
            PlayerPrefs.SetString("UserPasswords", loginCtrData.GetLoginMenu.inputPassword.text);
            Debug.Log("Anda Said:  LogicSuccess 已经获取玩家数据!");

            if(!AndaDataManager.Instance.PlayerHasMonster())//第一次
            {
                callbackFinishController(ONAME.SEARCHCONTROLLER);
            }
            else
            {
                callbackFinishController(ONAME.MAPCONCTROLLER);
            }

        }
    }
    //
    



    #endregion

    #region CallBack
    public void CallBackLogin(bool isLogin)
    {
        Debug.Log(isLogin);

        //AndaGameExtension._ShowAndroidToastMessage("012current state is "+ isLogin);
        int state = isLogin? 2 : 0;
        loginCtrData.curLoginState = state;
    }
    #endregion

    private RaycastHit hitInfo;
   
    public override void OnUpdate()
    {
        base.OnUpdate();
        if(loginCtrData!=null)
        {
            if(loginCtrData.getm_Menu!=null && loginCtrData.getm_Menu.isActive)
            {
                loginCtrData.getm_Menu.OnUpdate();
            }
        }
    }

    /// <summary>
    /// 微信登录回调
    /// </summary>
    /// <param name="userAccount">User account.</param>
    /// <param name="userToken">User token.</param>
    /// <param name="userImage">User image.</param>
    public void WecahtLoginCallback(string code)
    {
        AndaDataManager.Instance.WeChatLogin(LoginFinish, code);
    }
    
}
