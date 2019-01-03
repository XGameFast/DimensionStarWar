using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProtectGameView_2001 : UIBasic2 {

    public ChallegeMonsterPowerBar mineMonsterPowerBar;
    public ChallegeMonsterPowerBar enmeyMonsterPowerBar;
    public GameObject shangchangBtn;
    private ProtectGameCtr_2001 pgc2001;
    private System.Action callbackClickComfirm;

    private TipsItemPoint tipsItemPoint;
    public override void OnDispawn()
    {
        if(tipsItemPoint != null)
        {
            AndaDataManager.Instance.RecieveItem(tipsItemPoint);
            tipsItemPoint = null;
        }

        OpenMineMonsterPowerBar(false);
        OpenEnemyMonsterPowerBar(false);
        base.OnDispawn();
    }

    public void SetCtr(ProtectGameCtr_Basic ctr)
    {
        pgc2001 = (ProtectGameCtr_2001)ctr;
    }

    public void SetCtrCallBack(System.Action callback)
    {
        callbackClickComfirm = callback;
    }

    public void BuildTipsbossItem()
    {
        Debug.Log("RunHereTimes?????");
        if(tipsItemPoint!=null)AndaDataManager.Instance.RecieveItem(tipsItemPoint);
        tipsItemPoint = AndaDataManager.Instance.InstantiateMenu<TipsItemPoint>(ONAME.TipsItemPoint);
        tipsItemPoint.transform.SetInto(transform);
        tipsItemPoint.SetCamera(ARMonsterSceneDataManager.Instance.mainCamera);
        tipsItemPoint.SetImg(AndaDataManager.Instance.GetMonsterIconSprite("2001"));
    }

    #region 上场按钮

    public void OpenShangchangBtn(bool isOpen)
    {
        shangchangBtn.gameObject.SetTargetActiveOnce(isOpen);
    }

    public void ClickConfirm()
    {
        callbackClickComfirm();
        OpenShangchangBtn(false);//上场按钮关闭
    }

    #endregion

    #region 关于血条

    public void UpdateMineMonsterPower(int curPower, int max)
    {
        mineMonsterPowerBar.UpdatePowerSingleValue(curPower, max);
    }

    public void UpdateEnmeyMonsterPower(int cur, int max)
    {
        enmeyMonsterPowerBar.UpdatePowerSingleValue(cur, max);
    }

    public void UpdateEnmeyPowerBarPose(Vector3 pose)
    {
        Vector2 vector2 = ARMonsterSceneDataManager.Instance.mainCamera.WorldToScreenPoint(pose);
        Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(vector2.x,vector2.y,90));
        enmeyMonsterPowerBar.transform.position = p;
    }

    public void OpenMineMonsterPowerBar(bool isOpen)
    {
        if (isOpen)
        {
            mineMonsterPowerBar.FadeIn();
        }
        else
        {
            mineMonsterPowerBar.FadeOut();
        }
    }

    public void OpenEnemyMonsterPowerBar(bool isOpen)
    {
        if (isOpen)
        {
            enmeyMonsterPowerBar.FadeIn();
        }
        else
        {
            enmeyMonsterPowerBar.FadeOut();
        }
    }

    #endregion


    public override void OnUpdate()
    {
        base.OnUpdate();
        if(tipsItemPoint!=null && pgc2001.data.getBoss2001!=null)
        {
            tipsItemPoint.Follow(pgc2001.data.getBoss2001.selfPostion);
        }
    }
}
