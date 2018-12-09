using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PackageData : ControllerData
{

    #region 全局
    public int getCurOpenType
    {
        get {return curOpenType ;}
    }



    #endregion

    #region 局部变量
    private PackageController packageController;
    private PackageMenu packageMenu;

    // type = 0消耗品
    private int curOpenType = -1;
    #endregion


    //初始化数据
    public void InitValue()
    {
        if(packageMenu!=null) 
        {
            AndaDataManager.Instance.RecieveItem(packageMenu);
            m_Menu = null;
        }

        curOpenType =-1;
    }
 
    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        packageController = baseController as PackageController;
        InitValue();
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        packageMenu = getm_Menu as PackageMenu;
    }

    public void BuildConsumableItem()
    {
        List<LD_Objs> lD_Objs = AndaDataManager.Instance.userData.localData_objs;
        packageMenu.BuildConsumableItem(lD_Objs);
    }



    public void SetCurOpenType(int _type)
    {
        curOpenType =  _type;
    }
   
}
