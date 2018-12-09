using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoginMenu : UIBasic {


    public LoginController loginController;

    public UI2DSprite rowSprite;

    public UISlider slider;

    public LoginBtn loginBtn;

    private float initRowSpriteScale;

    public UILabel account;
    public UILabel password;

    public override void InitMenu()
    {
        base.InitMenu();
        initRowSpriteScale = 1;
    }
    
    public void ClickLoginBtn()
    {
        loginController.ClickToLogin(account.text,password.text);
      
        loginBtn.Click();
    }     
}
