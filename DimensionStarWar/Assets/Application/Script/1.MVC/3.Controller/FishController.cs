using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FishController : BaseController {
  
    private FishCtrData data;

    public override void StartController()
    {
        base.StartController();
        BuildData();
        data.BuildMenu(ONAME.FishMenu);
        BuildAR();
    }

    public override void EndController()
    {
        base.EndController();
    }


    #region 执行
    private void BuildData()
    {
        if(data == null)
        {
            data = new FishCtrData();
        }
        data.BuildData(this);
    }
    private void BuildAR()
    {
        data.getFishMenu.OpenScanBar(true);
        AndaARManager.Instance.StartAR(FinishBuildAR);
        ARMonsterSceneDataManager.Instance.aRWorld.CloseBlur();
        ARMonsterSceneDataManager.Instance.aRWorld.ClosebackgroundVV();
    }

    #endregion
    #region 逻辑
    #endregion

    #region 回调
    private void FinishBuildAR()
    {
        JIRVIS.Instance.PlayTips("欢迎来到次元空间,请先四周看看" ,false);

        AndaObjectBasic andaObjectBasic =  AndaDataManager.Instance.InstantiateMonster<MonsterBasic>("1003");
        andaObjectBasic.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);

    }
    #endregion

}
