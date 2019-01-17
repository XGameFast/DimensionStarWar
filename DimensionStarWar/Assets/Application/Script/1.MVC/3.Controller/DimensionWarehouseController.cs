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
        //data.getDimensionwarehouse.BuildMonsterItem();
       // data.getDimensionwarehouse.BuildConsumbaleItem();
        //data.getDimensionwarehouse.FadeIn();
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
        if(JIRVIS.Instance.isARType)
        {

        }else
        {
            List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>
            {
                new JIRVISFuncBtnStruct{btnName = "关闭" , btnIconKey = ONAME.BackStep , clickCallBack = OutDimensionWareController},
                new JIRVISFuncBtnStruct{btnName = "星宿" , btnIconKey = ONAME.MonsterIcon , clickCallBack =   data.getDimensionwarehouse.BuildMonsterItem },
              //  new JIRVISFuncBtnStruct{btnName = "优惠券" , btnIconKey = ONAME.cardTicket , clickCallBack =   data.getDimensionwarehouse.BuildMonsterItem },
                new JIRVISFuncBtnStruct{btnName = "消耗品" , btnIconKey = ONAME.consumableIcon , clickCallBack =   data.getDimensionwarehouse.BuildCoumsable },
              //  new JIRVISFuncBtnStruct{btnName = "小物件" , btnIconKey = ONAME.unknowObj , clickCallBack =   data.getDimensionwarehouse.BuildMonsterItem },
              //  new JIRVISFuncBtnStruct{btnName = "幸运物" , btnIconKey = ONAME.luckyObjIcon , clickCallBack =   data.getDimensionwarehouse.BuildMonsterItem },
                //new JIRVISFuncBtnStruct{btnName = "" , btnIconKey = ONAME.luckyObjIcon , clickCallBack =   data.getDimensionwarehouse.BuildMonsterItem },
            };

            JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);
        }
      
    }



    #endregion
}
