using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseController : MonoBehaviour {

    public System.Action<string> callbackFinishController;
    public OTYPE.WolrdType worldType;
    public ARWorld arWorld;//this mean is arworldController;
    public UIBasic m_MenuBasic;

    protected bool canFinger =false;
    public virtual void StartController()
    {
        InitValue();
    }
    public virtual void InitValue()
    {

    }
    public virtual void EndController()
    {

    }

    public virtual void OnUpdate()
    {

    }

    protected void OpenMmenu()
    {
        if (m_MenuBasic != null)
        {
            m_MenuBasic.gameObject.SetTargetActiveOnce(true);
            m_MenuBasic.DidplayAlpha();
            m_MenuBasic.PlayeAniFadeIn();
        }

    }

    protected void CloseMmenu()
    {
        if (m_MenuBasic != null)
        {
            m_MenuBasic.CloseAlpha();
            m_MenuBasic.PlayAniFadeOut();
        }
    }

   
}
