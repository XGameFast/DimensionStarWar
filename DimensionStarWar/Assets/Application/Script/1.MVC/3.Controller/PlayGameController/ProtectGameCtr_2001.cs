using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProtectGameCtr_2001 : ProtectGameCtr_Basic {
    public ProtectGameData_2001 data;

    #region 开始
    public override void StartCtr()
    {
        base.StartCtr();
        AndaARManager.Instance.SetNeedFixedScale(true);
        BuilData();
        data.BuildMenu(ONAME.ProtectGameView2001);
        OpenAR();
    }

    #endregion

    #region 结束

    public override void EndCtr()
    {
        data.Clear();
        AndaARManager.Instance.SetNeedFixedScale(false);
        AndaARManager.Instance.StopAR();
        base.EndCtr();
    }

    #endregion


    #region 打开AR

    private void OpenAR()
    {
        AndaARManager.Instance.StartAR(FinishBuildAR);
    }

    private void FinishBuildAR()
    {
        BuildBoss();
        BuildMineMonster();
    }

    #endregion 

    private void BuilData()
    {
        if(data == null)
        {
            data = new ProtectGameData_2001();
            protectGameData_Basic = data;
        }
        data.BuildData(this);
    }

    private void BuildBoss()
    {
        //构建Boss
        data.BuildBoss();
        data.getProtectGameView2001.BuildTipsbossItem();
        data.getProtectGameView2001.OpenEnemyMonsterPowerBar(true);
        data.getProtectGameView2001.UpdateEnmeyMonsterPower(data.getBoss2001.bossData.getCurrentPower,data.getBoss2001.bossData.getMaxPower);
       
    }

    private void BuildMineMonster()
    {
        JIRVIS.Instance.BuildMonsterBtnList(AndaDataManager.Instance.GetUserPlayerMonstesrList(), SelectMonster);
        JIRVIS.Instance.PlayTips("请从左边列表中选取您的星宿进行战斗");
    }

    private void SelectMonster(PlayerMonsterAttribute pma)
    {
        JIRVIS.Instance.CloseTips();
        data.SetCurrentMonster(pma);
        data.BuildMonster();
        data.getProtectGameView2001.OpenShangchangBtn(data.getCurrentMineMonsterData.mosterPower > 0);
        data.getProtectGameView2001.OpenMineMonsterPowerBar(true);
        data.getProtectGameView2001.UpdateMineMonsterPower(data.getCurrentMineMonsterData.mosterPower,data.getCurrentMineMonster.currentMonsterMaxPower);
    }

    public void StartGame()
    {
        ARMonsterSceneDataManager.Instance.aRWorld.OpenFightFocus();
        JIRVIS.Instance.RemoveCurrentBtnList();
        data.getCurrentMineMonster.SetControllerState(true);
        InvokeSetMonsterToEnemy();
    }

    public void EndGame()
    {
        data.getCurrentMineMonster.SetControllerState(false);
        data.getBoss2001.bossData.SetBossActive(false);
        Invoke("InvokOutGame" ,3f);
    }

    public void InvokOutGame()
    {
        parentCtr.UploadSkillData();
    }

    //告诉boss 这只是 他的敌人
    private void InvokeSetMonsterToEnemy()
    {
        data.getBoss2001.bossData.SetEnemy(data.getCurrentMineMonster);
    }

    public void ListenToMonsterPower(int curPower, bool isPlayer)
    {
        ARMonsterSceneDataManager.Instance.aRWorld.CloseFightFocus();
        //玩家的血量为0 ，代表输了
        data.isWin = isPlayer ? false : true;
        if (isPlayer)//玩家死了
        {
            JIRVIS.Instance.PlayTips("蜜汁操作，6666, 微笑微笑微笑");

#if UNITY_EDITOR
            Debug.Log("Boss 赢了 很开心");
#endif
        }
        else //boss死了
        {
            JIRVIS.Instance.PlayTips("神级操作，很棒！");

#if UNITY_EDITOR
            Debug.Log("玩家很开心啊");
#endif
        }

        EndGame();
    }

    public void Update()
    {
        if(data.getProtectGameView2001!=null)
        {
            data.getProtectGameView2001.OnUpdate();
            if(data.getBoss2001!=null && data.getProtectGameView2001.enmeyMonsterPowerBar.gameObject.activeSelf)
            {
                if(data.getBoss2001.bossData.getBossIsActive)
                {

                    data.getProtectGameView2001.UpdateEnmeyPowerBarPose(data.getBoss2001.selfPostion + Vector3.up*2.5f);
                }
                else
                {
                    data.getProtectGameView2001.OpenEnemyMonsterPowerBar(false);
                }
            }
        }
    }


}
