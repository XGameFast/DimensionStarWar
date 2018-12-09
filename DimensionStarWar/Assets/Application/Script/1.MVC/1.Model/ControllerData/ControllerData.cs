using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControllerData {
    public UIBasic2 getm_Menu
    {
        get 
        {
            return m_Menu;
        }
    }

    protected BaseController baseController;
    protected UIBasic2 m_Menu;
    public bool isWait = false;

    public virtual void BuildData(BaseController _baseController)
    {
        baseController = _baseController;
    }

    public virtual void SetWaitState(bool _state)
    {
        isWait = _state;
    }

    public virtual void BuildMenu(string menuname)
    {
        if(m_Menu == null)
        {
            m_Menu = AndaUIManager.Instance.PopingMenu2<UIBasic2>(menuname);
            m_Menu.InitMenu(baseController);
        }else
        {
            m_Menu.gameObject.SetTargetActiveOnce(true);
        }
    }

    public virtual void RemoveMenu()
    {
        if(m_Menu!=null)
        {
            AndaDataManager.Instance.RecieveItem(m_Menu);
            m_Menu = null;
        }
     
    }
	
}
