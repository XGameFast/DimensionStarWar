using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class LoginMenu2 : UIBasic2 {

    public Animator GetEICodeBarAnimator;
    public InputField inputAccount;
    public InputField inputPassword;
    public Button loginButton;
    public Button SendCodeButton;
    public Slider fingerCheck;
    private bool isPressDown = false;
    private LoginController loginController;

    public GameObject sendCodeImage;
    public GameObject sendCodeTimeChange;

    private float sendTime = 0f;
    private int curType = 0;

    public GameObject phoneLoginBtn;
    public GameObject wechatLoginBtn;
    public GameObject qqLoginBtn;
    public GameObject replayStartVideoBtn;
    public GameObject jumpVideoBtn;

    public override void OnDispawn()
    {
        base.OnDispawn();
        isPressDown = false;
    }
    public override void OnSpawn()
    {
        base.OnSpawn();
        baseGroup.alpha = 1;
    }

    public void PreloadUserAccountAndPassword()
    {
        if(JIRVIS.Instance.jIRVISData.isRebacktoLoginMenu)
        {

        }else
        {
            string lastLogin = PlayerPrefs.GetString(ONAME.LastLogin);
            if (lastLogin == "")
            {

            }
            else
            {
                switch (lastLogin)
                {
                    case "Wechat":
                        WXLogin();
                        break;
                    case "QQ":
                        QQLogin();
                        break;
                    case "Phone":
                        string phoneAccount = "15728004898";//PlayerPrefs.GetString("DefualtPhoneAccount");
                        string phoneSecret = "000000";//PlayerPrefs.GetString("DefualtPhoneSerect");
                        AndaDataManager.Instance.RealLogin(loginController.PhoneLoginResult, phoneAccount, phoneSecret);
                        break;
                }
            }
        }
       
    }

    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);

        //JIRVIS.Instance.PlayTipsForchoose("你是否已经拥有关联账号？？？",OTYPE.TipsType.chooseTips,"已经关联","去关联" );

        loginController = _baseController as LoginController;

        JIRVIS.Instance.PlayTips(OTYPE.Tipscontent.welcometologinmenu);

        //BuildButtonOnpressEvent();
        Invoke("InvokeFadeIn" , 1f);
    }

    private void InvokeFadeIn()
    {
        GetComponent<Animator>().Play("FadeIn");
    }

    private void BuildButtonOnpressEvent()
    {
        EventTriggerListener.Get(loginButton.gameObject).onDown = OnPressDown;
    }


    public void OnPressDown(GameObject btn)
    {
        if (!loginButton.interactable) return;
        isPressDown = true;

        //不可操作了
        inputAccount.interactable = false;
        inputPassword.interactable = false;
        loginButton.interactable = false;

        //发起登陆事件
        loginController.ClickToLogin(inputAccount.text, inputPassword.text);
    }

    public void SendSmsCode()
    {
        sendTime = 60f;
        sendCodeImage.SetActive(false);
        sendCodeTimeChange.SetActive(true);
        SendCodeButton.enabled = false;


        //SendCodeButton.gameObject.SetActive(false);
        //SendSmsCodeCallBack(true);
        loginController.SendCode(SendSmsCodeCallBack, inputAccount.text);
    }


   
    public void OpenGetEICodeBar()
    {
        curType = 2;
        inputAccount.contentType =  InputField.ContentType.IntegerNumber;
        inputAccount.characterLimit = 11;
        inputPassword.contentType = InputField.ContentType.IntegerNumber;
        inputPassword.characterLimit = 6;

        if (!GetEICodeBarAnimator.gameObject.activeSelf)
        {
            GetEICodeBarAnimator.gameObject.SetTargetActiveOnce(true);
            GetEICodeBarAnimator.Play("FadeIn");
        }
    }



    public void SendSmsCodeCallBack(bool sendOk)
    {
        if (!sendOk)
        {
            //SendCodeButton.gameObject.SetActive(true);
            JIRVIS.Instance.PlayTips("短信发送失败，请检查手机号！");
        }
        else {
            StartCoroutine(SendSmsButton());
            JIRVIS.Instance.PlayTips("短信已发送，请注意查收！");
        }
    }

    private IEnumerator SendSmsButton()
    {
        while (sendTime > 0f)
        {
            sendTime -= Time.deltaTime;
            sendCodeTimeChange.GetComponent<Text>().text ="请查收("+ sendTime.FloatToInt().ToString() + "s)";
            yield return null;
        }
        sendCodeImage.SetActive(true);
        sendCodeTimeChange.SetActive(false);
        SendCodeButton.enabled = true; 
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        PlayCheckFingerprint();
    }

    /// <summary>
    /// 这里模拟了一下指纹验证，当用户按下按钮得时候，会向服务器发送登陆消息，此时本地会读条，当本地读完一圈的时候，便跟登陆控制器对接一边。如果控制器恢复已经登陆成功了。那么就停止模拟验证。如果没有登陆成功。则继续模拟登陆。每转一圈跟控制器沟通一遍
    /// </summary>
    private void PlayCheckFingerprint()
    {
        if (!isPressDown) return;
        fingerCheck.value += Time.deltaTime * 2f;
        if (fingerCheck.value >= 1)
        {
            isPressDown = false;
            FinishCheck();
        }
    }


    private void FinishCheck()
    {
        loginController.CheckLoginSuccess(RequstResult);
    }

    private void RequstResult(int loginState)
    {
        switch (loginState)
        {
            case 0:
                LoginFaild();
                break;
            case 1:
                Loging();
                break;
            case 2:
                LoginSuccess();
                break;
        }

    }

    private void LoginFaild()
    {
        isPressDown = false;

        //恢复可操作
        inputAccount.interactable = true;
        inputPassword.interactable = true;
        loginButton.interactable = true;

        JIRVIS.Instance.PlayTips(OTYPE.Tipscontent.loginfaild);

    }
    private void Loging()
    {
        isPressDown = true;
        fingerCheck.value = 0;
    }
    private void LoginSuccess()
    {
        fingerCheck.value = 1;
        isPressDown = false;
        inputAccount.interactable = true;
        inputPassword.interactable = true;
        loginButton.interactable = true;
    }

    public void QQLogin()
    {

        /*inputAccount.contentType = InputField.ContentType.IntegerNumber;
        inputAccount.characterLimit = 11;
        inputPassword.contentType = InputField.ContentType.IntegerNumber;
        inputAccount.characterLimit = 6;
*/

        curType = 0;
        if (GetEICodeBarAnimator.gameObject.activeSelf)
        {
            GetEICodeBarAnimator.gameObject.SetTargetActiveOnce(false);
            GetEICodeBarAnimator.Play("Empty");
        }

        // Debug.Log(1);
#if UNITY_IPHONE


#elif UNITY_ANDROID

        AndroidJavaClass jc = new AndroidJavaClass("com.unity3d.player.UnityPlayer");

        AndroidJavaObject jo = jc.GetStatic<AndroidJavaObject>("currentActivity");

        jo.Call("QQlogin");

#endif
    }

    public void QQCallBack(string code)
    {

        isPressDown = true;
        AndaDataManager.Instance.QQLogin(loginController.QQLoginResult, code);
    }



    
    public void WXLogin()
    {
        curType = 1;

        if (GetEICodeBarAnimator.gameObject.activeSelf)
        {
            GetEICodeBarAnimator.gameObject.SetTargetActiveOnce(false);
            GetEICodeBarAnimator.Play("Empty");
        }


       // Debug.Log(1);
#if UNITY_IPHONE

        AndaGameExtension._WechatLogin();

        //loginController.WecahtLoginCallback("001fIMSF103d980FUtRF1p9bTF1fIMSG");


#elif UNITY_ANDROID

        AndroidJavaClass jc = new AndroidJavaClass("com.unity3d.player.UnityPlayer");

        AndroidJavaObject jo = jc.GetStatic<AndroidJavaObject>("currentActivity");

        jo.Call("WechatLogin");

#endif
    }


    public void OnResp(string code)
    {
        //登录
        isPressDown = true;
        AndaDataManager.Instance.WeChatLogin(loginController.WexinLoginResult, code);
    }



    public void ChangeEICode()
    {
        if (curType == 2)
        {
            if (inputPassword.text.Length >= 6)
            {
                AndaDataManager.Instance.PhoneLogin(loginController.PhoneLoginResult, inputAccount.text, inputPassword.text);

            }
            else
            {
                JIRVIS.Instance.PlayTips("请输入正确的验证码");
            }
        }

    }

    public void ClickRePlayStartVideo()
    {
        GetComponent<Animator>().Play("FadeOut");
        ARMonsterSceneDataManager.Instance.mainCamera.GetComponent<CameraGlory>().SetLimit(Vector2.zero,new Vector2(-0.3f,0.3f));
        ARMonsterSceneDataManager.Instance.aRWorld.OpenStartVideo(true);
        ARMonsterSceneDataManager.Instance.aRWorld.OpenLoginMenuBackground(false);
        //phoneLoginBtn.gameObject.SetTargetActiveOnce(false);
       //wechatLoginBtn.gameObject.SetTargetActiveOnce(false);
       //qqLoginBtn.gameObject.SetTargetActiveOnce(false);
        replayStartVideoBtn.gameObject.SetTargetActiveOnce(false);
        jumpVideoBtn.gameObject.SetTargetActiveOnce(true);

        StartCoroutine(WaitForStartVideo());
    }

    public void ResetLoginMenu()
    {
        GetComponent<Animator>().Play("FadeIn");
        ARMonsterSceneDataManager.Instance.mainCamera.GetComponent<CameraGlory>().SetLimit(Vector2.zero, new Vector2(-0.5f, 0.5f));
        ARMonsterSceneDataManager.Instance.aRWorld.OpenLoginMenuBackground(true);
        replayStartVideoBtn.gameObject.SetTargetActiveOnce(true);
        jumpVideoBtn.gameObject.SetTargetActiveOnce(false);
        Debug.Log(">?????");
    }

    public void ClickJump()
    {
       ARMonsterSceneDataManager.Instance.aRWorld.OpenStartVideo(false);
    }

    private IEnumerator WaitForStartVideo()
    {
        yield return new WaitForSeconds(1f);
        while(ARMonsterSceneDataManager.Instance.aRWorld.startVideo.isPlaying)
        {
            yield return null;
        }

        ResetLoginMenu();
    }

}
