using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StrongholdInformationBar : UIBasic {

    private InfoBarForBusinessStronghold infoBarForBusinessStronghold;
    private InfoBarForPrivateStronghold infoBarForPrivateStronghold;
    private InfobarForSelfStronghold infoBarForSelfStronghold;
    private FollowTargetUI currentFollowTargetUI;
    MonsterGameData.StrongHoldType lastStrongHoldType;
    public GameObject board;
    public override void InitMenu()
    {
        base.InitMenu();
    }
    public override void OnDispawn()
    {

        infoBarForBusinessStronghold.DestroyByAndaDataManager();
        infoBarForPrivateStronghold.DestroyByAndaDataManager();
        infoBarForSelfStronghold.DestroyByAndaDataManager();

        base.OnDispawn();
    }

    #region 对外接口
    public void SetValue(Transform followTarget,StrongholdBaseAttribution strongholdBaseAttribute,MonsterGameData.StrongHoldType strongHoldType)
    {
        SetFollowInfomation(followTarget);

        switch (strongHoldType)
        {
            case MonsterGameData.StrongHoldType.SelfStrongHold:
                
                SetInfoSelfStrongholdData(strongholdBaseAttribute);
                break;
            case MonsterGameData.StrongHoldType.OtherStrongHold:
               
                SetInfoPrivateStrongholdData(strongholdBaseAttribute);
                break;
            case MonsterGameData.StrongHoldType.BusinessStronghold:
              
                SetInfoBusinessStrongholdData(strongholdBaseAttribute);
                break;
        }
       
    }
    
    #endregion



    #region 内部执行

    #region 设置信息
    private void SetFollowInfomation(Transform followTarget)
    {
        BuildFollowTargetUI();
        board.transform.SetParent(currentFollowTargetUI.followUI);
        board.ResetTran();
        currentFollowTargetUI.SetFollowValue(OTYPE.UIActiveType.equls, followTarget);
    }

    private void SetInfoSelfStrongholdData(StrongholdBaseAttribution playStrongholdAttr)
    {
        infoBarForBusinessStronghold.SetTargetActiveOnce(false);
        infoBarForPrivateStronghold.SetTargetActiveOnce(false);

        BuildSelfInfomationBar();
        infoBarForSelfStronghold.SetTargetActiveOnce(true);
        infoBarForSelfStronghold.SetValue(playStrongholdAttr);
    }
    private void SetInfoPrivateStrongholdData(StrongholdBaseAttribution playerStrongholdAttribute)
    {
        infoBarForBusinessStronghold.SetTargetActiveOnce(false);
        infoBarForSelfStronghold.SetTargetActiveOnce(false);
        BuildPrivateInfomaitonBar();
        infoBarForPrivateStronghold.SetTargetActiveOnce(true);
        infoBarForPrivateStronghold.SetValue(playerStrongholdAttribute);
    }
    private void SetInfoBusinessStrongholdData(StrongholdBaseAttribution bussinessStrongholdAttributeConvert)
    {
        infoBarForPrivateStronghold.SetTargetActiveOnce(false);
        infoBarForSelfStronghold.SetTargetActiveOnce(false); 
        BuildBusinessInfomationBar();
        infoBarForBusinessStronghold.SetTargetActiveOnce(true);
        infoBarForBusinessStronghold.SetValue(bussinessStrongholdAttributeConvert);
    }
    #endregion

    #region 构建物件

    private void BuildPrivateInfomaitonBar()
    {
        if (infoBarForPrivateStronghold == null)
        {
            infoBarForPrivateStronghold = AndaUIManager.Instance.PopingMenu<InfoBarForPrivateStronghold>(MonsterGameData.InfoBarForPrivateStornghold);
            infoBarForPrivateStronghold.transform.SetParent(board.transform);
            infoBarForPrivateStronghold.ResetTran();
        }
    }

    private void BuildSelfInfomationBar()
    {
        if (infoBarForSelfStronghold == null)
        {
            infoBarForSelfStronghold = AndaUIManager.Instance.PopingMenu<InfobarForSelfStronghold>(MonsterGameData.InfoBarForSelfStronghold);
            infoBarForSelfStronghold.transform.SetParent(board.transform);
            infoBarForSelfStronghold.ResetTran();
        }
    }

    private void BuildBusinessInfomationBar()
    {
        if (infoBarForBusinessStronghold == null)
        {
            infoBarForBusinessStronghold = AndaUIManager.Instance.PopingMenu<InfoBarForBusinessStronghold>(MonsterGameData.InforBarForBusinessStronghold);
            infoBarForBusinessStronghold.transform.SetParent(board.transform);
            infoBarForBusinessStronghold.ResetTran();
        }
    }

    private void BuildFollowTargetUI()
    {
        if (currentFollowTargetUI == null)
        {
            currentFollowTargetUI = AndaUIManager.Instance.PopingMenu<FollowTargetUI>("FollowTargetUI");
            currentFollowTargetUI.transform.SetParent(transform);
            currentFollowTargetUI.ResetTran();
        }
       
    }
    #endregion

    private void Update()
    {
        if (currentFollowTargetUI != null)
        {
            Debug.Log("update follow ui");
            currentFollowTargetUI.OnUpdate();
        }
    }
    //
    #endregion
}
