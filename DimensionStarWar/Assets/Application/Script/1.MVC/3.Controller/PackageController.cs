using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PackageController : BaseController {

	// Use this for initialization
    public PackageData packageData;

    public override void StartController()
    {
        base.StartController();
        base.worldType = OTYPE.WolrdType.Virtual;

        BuildPackageData();
        packageData.BuildMenu(ONAME.PackageMenu);
        packageData.getm_Menu.FadeIn();
        //设置当前据点的数据
        BuildJirvisFunBtn();
    }

    public override void EndController()
    {
        packageData.InitValue();
        
        base.EndController();
    }


    //构建占星庭的数据
    private void BuildPackageData()
    {
        if (packageData == null)
        {
            packageData = new PackageData();

        }
        packageData.BuildData(this);
    }

    //构建背包  JIRVIS功能按钮
    private void BuildJirvisFunBtn()
    {
        List<JIRVISFuncBtnStruct> btnStructs = new List<JIRVISFuncBtnStruct>()
        {
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.consumableIcon , clickCallBack =  ShowConsumable },
        };
     
        JIRVISFuncBtnStruct backStep = new JIRVISFuncBtnStruct
        {
            btnName = "", btnIconKey = ONAME.BackStep, clickCallBack = ClickBackToBuildDimensionController
        };

        btnStructs.Add(backStep);

        JIRVIS.Instance.BuildFunctionBtn(btnStructs, FinishBuildJIRVISBtn);

        JIRVIS.Instance.ClickDeafultBtn();
    }
    private void FinishBuildJIRVISBtn()
    {
        Debug.Log("JIRVIS Said: oh, i was finihed build function btn ，have fun :) ");
    }

    private void ShowConsumable()
    {
        if(packageData.getCurOpenType == 0)return;

        packageData.SetCurOpenType(0);
        packageData.BuildConsumableItem();
    }
     

    private void ClickBackToBuildDimensionController()
    {
        callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
    }
}
