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

      

       // callbackFinishController(ONAME.FISHCONTROLLER);
     //   return ;


       
        //
        BuildLoginCtrData();
        loginCtrData.BuildMenu(ONAME.LoginMenu2);


        loginCtrData.GetLoginMenu.PreloadUserAccountAndPassword();

        ARMonsterSceneDataManager.Instance.aRWorld.OpenLoginMenuBackground(true);
        Invoke("InvokeFadeInMenu" ,1.65f);

        AndaObjectBasic andaObjectBasic = AndaDataManager.Instance.InstantiateOtherObj("GameLogo");
        andaObjectBasic.SetInto(AndaUIManager.Instance.canvasRoot);

    }

    private void InvokeFadeInMenu()
    {
        loginCtrData.getm_Menu.FadeIn();
    }

    private void BuildLoginCtrData()
    {
        if(loginCtrData == null)
        {
            loginCtrData = new LoginCtrData();
        }

        loginCtrData.BuildData(this);
    }

    public override void EndController()
    {
      
        if(loginCtrData != null)
        loginCtrData.getm_Menu.OnDispawn();
        ARMonsterSceneDataManager.Instance.aRWorld.OpenLoginMenuBackground(false);
        base.EndController();
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
                callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
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
    
}
