using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MallController : BaseController
{

    // Use this for initialization
    public MallMenuData mallMenuData;


    public void ShowMallDetail(CD_MallDetail info)
    {
        Debug.Log(info.objectID);
        mallMenuData.ShowMallDetail(info);
    }

    public override void StartController()
    {
        base.StartController();
        base.worldType = OTYPE.WolrdType.Virtual;

        BuildMenuData();
        mallMenuData.BuildMenu(ONAME.MallMenu);
        mallMenuData.getm_Menu.FadeIn();
        //设置当前据点的数据
        BuildJirvisFunBtn();
    }

    public override void EndController()
    {
        mallMenuData.InitValue();

        base.EndController();
    }


    //构建占星庭的数据
    private void BuildMenuData()
    {
        if (mallMenuData == null)
        {
            mallMenuData = new MallMenuData();

        }
        mallMenuData.BuildData(this);
    }

    //构建背包  JIRVIS功能按钮
    private void BuildJirvisFunBtn()
    {
        List<JIRVISFuncBtnStruct> btnStructs = new List<JIRVISFuncBtnStruct>()
        {
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.consumableIcon , clickCallBack =  ShowConsumable },
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.dimensionDoorIcon , clickCallBack =  Showcsm },
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.strongholdDrawingIcon , clickCallBack =  Showtz },
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.currencyIcon , clickCallBack =  Showhb },
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.unknowObj , clickCallBack =  Showxwj },
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.luckyObjIcon , clickCallBack =  Showxyw },
            new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.detectIcon , clickCallBack =  Showtcq },
        };

        JIRVISFuncBtnStruct backStep = new JIRVISFuncBtnStruct
        {
            btnName = "",
            btnIconKey = ONAME.BackStep,
            clickCallBack = ClickBackToBuildDimensionController
        };

        btnStructs.Add(backStep);

        JIRVIS.Instance.BuildFunctionBtn(btnStructs, FinishBuildJIRVISBtn);

        JIRVIS.Instance.ClickDeafultBtn();
    }
    

    private void ShowConsumable()
    {
        if (mallMenuData.getCurOpenType == 1|| mallMenuData.getCurOpenType==0) return;
        mallMenuData.SetCurOpenType(1);
        mallMenuData.BuildTypeObject();
    }
    private void Showcsm()
    {
        if (mallMenuData.getCurOpenType == 2) return;
        mallMenuData.SetCurOpenType(2);
        mallMenuData.BuildTypeObject();
    }
    private void Showtz()
    {
        if (mallMenuData.getCurOpenType ==3) return;
        mallMenuData.SetCurOpenType(3);
        mallMenuData.BuildTypeObject();
    }
    private void Showtcq()
    {
        if (mallMenuData.getCurOpenType == 4) return;
        mallMenuData.SetCurOpenType(4);
        mallMenuData.BuildTypeObject();
    }
    private void Showhb()
    {
        if (mallMenuData.getCurOpenType == 5) return;
        mallMenuData.SetCurOpenType(5);
        mallMenuData.BuildTypeObject();
    }
    private void Showxwj()
    {
        if (mallMenuData.getCurOpenType == 6) return;
        mallMenuData.SetCurOpenType(6);
        mallMenuData.BuildTypeObject();
    }
    private void Showxyw()
    {
        if (mallMenuData.getCurOpenType == 7) return;
        mallMenuData.SetCurOpenType(7);
        mallMenuData.BuildTypeObject();
    }

    private void FinishBuildJIRVISBtn()
    {
        Debug.Log("JIRVIS Said: oh, i was finihed build function btn ，have fun :) ");
    }

    private void ClickBackToBuildDimensionController()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
    }
}
