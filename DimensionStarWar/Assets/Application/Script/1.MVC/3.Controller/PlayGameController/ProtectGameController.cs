using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProtectGameController : BaseController {

    private ProtectGameCtrData data;

    #region 开始

    public override void StartController()
    {
        base.StartController();
        BuildData();
        CheckMode();
    }

    #endregion

    #region 结束
    public override void EndController()
    {
        base.EndController();

        data.getProtectGameCtr_Basic.EndCtr();

        data.Clear();
    }
    #endregion

    private void BuildData()
    {
        if(data == null)data =new ProtectGameCtrData();
        data.BuildData(this);
    }

    #region 打开AR

    private void OpenAR()
    {

    }

    private void FinishSetAR()
    {

    }
    #endregion 

    #region 根据boss 生成 模式

    private void CheckMode()
    {
        switch(JIRVIS.Instance.jIRVISData.getCurProtectStrongholdAttr.statueID)
        {
            case 2000:
                break;
            case 2001:
                data.BuildMode_2001();
                data.getProtectGameCtr_Basic.StartCtr();
                break;
            case 2002:
                break;
        }
    }

    #endregion

    #region 上传游戏数据

    public void UploadSkillData()
    {
        data.isWin = data.getProtectGameCtr_Basic.protectGameData_Basic.isWin;
        List<BattelResult> battelResults = new List<BattelResult>();
        BattelResult battelResult = new BattelResult();
        PlayerMonsterAttribute pma = data.getProtectGameCtr_Basic.protectGameData_Basic.currentMonsterData;
        MonsterBasic monsterBasic = data.getProtectGameCtr_Basic.protectGameData_Basic.currentMonsterItem;
        battelResult.monsterId = pma.monsterID;
        battelResult.monsterIndex = pma.monsterIndex;
        battelResult.currentPower = monsterBasic.monsterDataValue.monsterCurrentPower;
        battelResult.maxPower = pma.monsterMaxPower + 50;// + data.getEnemyMonster.monsterDataValue.monsterMaxPower;
        battelResult.skills = new List<BattelSkill>();
        int useSkillcount = monsterBasic.monsterDataValue.monsterUseSkillValueList.Count;
        for (int i = 0; i < useSkillcount; i++)
        {
            MonsterUseSkillValue monsterUseSkillValue = monsterBasic.monsterDataValue.monsterUseSkillValueList[i];
            BattelSkill battelSkill = new BattelSkill
            {
                skillId = monsterUseSkillValue.skillID,
                skillIndex = monsterUseSkillValue.skillIndex,
                value = AndaDataManager.Instance.CucalSkillArchievementValue(monsterUseSkillValue.value,
                                                                             monsterUseSkillValue.skillType,
                                                                             true),
            };

            battelResult.skills.Add(battelSkill);
        }
        battelResults.Add(battelResult);

        string json = LitJson.JsonMapper.ToJson(battelResults);
        //Debug.Log("json:" + json);


        AndaDataManager.Instance.CallServerUploadProtectGameResult(JIRVIS.Instance.jIRVISData.currentPlayGameType, data.isWin ? 1 : 2, battelResults, CallbackFinishUploadGameresult);

    }


    #endregion

    private void CallbackFinishUploadGameresult(List<RewardData> rewardDatas)
    {
        if (rewardDatas!=null)
        {
            StartCoroutine(InvockReadReward(rewardDatas));
        }
        else
        {

            JIRVIS.Instance.PlayTips("遭遇星域盗贼，您的奖励被中途劫断，下次要小心哦");
            Invoke("InvovkOutGame" ,2f);
        }
    }

    private void InvovkOutGame()
    {
        callbackFinishController(ONAME.MAPCONCTROLLER);
    }


    private SingleRewardBar singleRewardBar;

    private IEnumerator InvockReadReward(List<RewardData> rewardDatas)
    {
        yield return new WaitForSeconds(3f);
        if(singleRewardBar!=null)
        {
           AndaDataManager.Instance.RecieveItem(singleRewardBar);
        }
    
        singleRewardBar = AndaDataManager.Instance.InstantiateMenu<SingleRewardBar>(ONAME.SingleRewardBar);
        singleRewardBar.SetInto(AndaUIManager.Instance.canvasRoot);
        singleRewardBar.ClickCloseBar = CloseRewardBar;
        singleRewardBar.SetInfo(rewardDatas);
    }

    private void CloseRewardBar()
    {
        singleRewardBar = null;
        InvovkOutGame();
    }

}
