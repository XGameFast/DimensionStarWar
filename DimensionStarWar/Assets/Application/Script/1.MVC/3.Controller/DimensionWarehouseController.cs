using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DimensionWarehouseController : BaseController {

    private DimensionWarehouseData data;

    public override void StartController()
    {
        base.StartController();
        BuildData();
        BuildMenu();
        data.getDimensionwarehouse.BuildMonsterItem();
        data.getDimensionwarehouse.BuildConsumbaleItem();
        data.getDimensionwarehouse.FadeIn();
        InvokeBuildJIRVISBtn();
    }

    public override void EndController()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        base.EndController();
    }

    public void BuildData()
    {
        if(data == null)
        {
            data = new DimensionWarehouseData();
        }

        data.BuildData(this);
    }

    public void BuildMenu()
    {
        if(data!=null)
        {
            data.BuildMenu(ONAME.DimensionWarehouseMenu);
        }
    }

    private void InvokeBuildJIRVISBtn()
    {
        Invoke("BuildJIRVISBaseBtn" , 1f);
    }

    #region 执行

    private void OutDimensionWareController()
    { 
        data.ClearData();
        //有可能打开了物件信息面板， 或者 角色编辑面板
        JIRVIS.Instance.CloseEditorBarForItemInformation();
        JIRVIS.Instance.CloseEditorBarForMonsterChangeNameOrBelongStorngholdIndex();
        callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);

    }

    #endregion


    #region 小星序按钮

    private void BuildJIRVISBaseBtn()
    {
        List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>
        {
            new JIRVISFuncBtnStruct
            {
                 btnName = "" , btnIconKey = ONAME.BackStep , clickCallBack= OutDimensionWareController
            }
        };

        JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);
    }



    #endregion
}
