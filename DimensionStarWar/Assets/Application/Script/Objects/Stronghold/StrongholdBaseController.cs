using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StrongholdBaseController : AndaObjectBasic {
    /*
     * 据点 控制器 基类
     */
    public StrongholdDataValue strongholdDataValue;
    public StorngholdInfo strongholdInfo;
    protected bool isStartController = false;


    #region 对外接口
    public void DownloadMessage(StrongholdBaseAttribution sba)
    {
        BuildComponment();
        BuildDataValue(sba);
    }

    public virtual void StartController()
    {
        isStartController = true;
    }
    public virtual void EndController()
    {
        isStartController = false;
    }
    #endregion

    public override void InitValue()
    {
        base.InitValue();
        isStartController = false;
    }
    private void BuildComponment()
    {
        if (strongholdDataValue == null) strongholdDataValue = new StrongholdDataValue();
        if (strongholdInfo == null) strongholdInfo = new StorngholdInfo();
        
        strongholdDataValue.DownloadMessage(this);
        strongholdInfo.DownloadMessage(this);
    }

    private void BuildDataValue(StrongholdBaseAttribution sba)
    {
        strongholdDataValue.SetData(sba);
    }
    

    public void Update()
    {
        if (!isStartController) return;
        OnUpdate();
    }

    public virtual void OnUpdate()
    {
        if (strongholdInfo != null)
        {
            strongholdInfo.OnUpdate();
        }
    }

    public override void Display()
    {
        base.Display();
        if (strongholdInfo != null)
        {
            strongholdInfo.Display();
        }
    }

    public override void Hide()
    {
        base.Hide();
        if (strongholdInfo != null)
        {
            strongholdInfo.Hide();
        }
    }
}
