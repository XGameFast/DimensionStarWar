using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChanllengeGameController : BaseController {

    public ChallengeGameData data;


    public override void StartController()
    {
        base.StartController();
        ARMonsterSceneDataManager.Instance.OpenGameLight(true);
        BuildData();
        BuildMenu();
        OpenAR();
    }

    public override void EndController()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        data.InitValue();
        StopAR();
        ARMonsterSceneDataManager.Instance.aRWorld.CloseFightFocus();
        ARMonsterSceneDataManager.Instance.RemoveDimensionSpace(null);
        //ARMonsterSceneDataManager.Instance.aRWorld.CloseHologarmScreen();
        base.EndController();

    }

    #region 逻辑





    #endregion

    #region 执行

    private void BuildData()
    {
        if (data == null)
        {
            data = new ChallengeGameData();
            data.BuildData(this);
        }
        JIRVIS.Instance.RemoveCurrentBtnList();
        data.InitValue();
        //构建该据点的宠物数据
        data.SetStrongholdMonsters();
        //构建敌人据点的数据
        data.SetEnemeyStrongholdAttribute(JIRVIS.Instance.jIRVISData.getCurChallengeStrongholdAttr);
     
    }

    private void BuildMenu()
    {
      
        data.BuildMenu(ONAME.ChallengeGameMenu);
    }

    private void OpenAR()
    {
        // ARMonsterSceneDataManager.Instance.aRWorld.CloseBlur();

        AndaARManager.Instance.StartAR(CallbackbuildFinishDimensionSpace);
    }

    private void StopAR()
    {
        ARMonsterSceneDataManager.Instance.OpenGameLight(false);
        AndaARManager.Instance.StopAR(ARMonsterSceneDataManager.Instance.CloseMainCamera);
    }




    //构建jirvis宠物按钮
    private void BuildJIRVISPlayerMonsterBtn()
    {
        JIRVIS.Instance.BuildMonsterBtnList(data.getPlayerMonsters, CallbackSelectJIRVISMonsterBtn);
    }

    private void SelectMonster(PlayerMonsterAttribute pma)
    {
        data.getChallengeGameView.OpenComfirmBtn(true);

        data.getChallengeGameView.OpenExpButton(true);
        //怪兽模型
        data.BuildTmpMonster(pma);
        //显示怪兽图标按钮；
        data.getChallengeGameView.BuildSelectMonsterBtn(CallbackSureAboutThisMonster);

        //打开召唤按钮
        data.getChallengeGameView.OpenMineMonsterPowerBar(true);

        data.getChallengeGameView.UpdateMineMonsterPower(pma.mosterPower,pma.monsterMaxPower);

        data.getChallengeGameView.UpdateMonster(pma);
        if (pma.mosterPower <= 0)
        {
            JIRVIS.Instance.PlayTips("星宿意志力为0无法上场，请选择意志力大于0的宠物上场！");
            data.getChallengeGameView.OpenComfirmBtn(false);
        }
        else
        {
            data.getChallengeGameView.OpenComfirmBtn(true);
        }

    }

    //把选择怪兽图标显示出来
    private void OpenSelectMonsterIcon()
    {

    }

    private void JIRVISDeterminScreenMonster()
    {
       
        //构建宠物列表，= 1 ,那就不构建列表了，直接构建宠物
        if (data.getPlayerMonsters.Count <= 0) return;
        if (data.getPlayerMonsters.Count == 1)
        {
            //直接默认第一个
            SelectMonster(data.getPlayerMonsters[0]);

        } else
        {

            BuildJIRVISPlayerMonsterBtn();
            CallbackComfirmMonsterOfJIRVISRecommend();
            //推荐战斗宠物
            //BuildJIRVISRecommendMonsters();
        }
        //构建逃跑按钮
        List<JIRVISFuncBtnStruct> btnStructs = new List<JIRVISFuncBtnStruct>()
        {
           new JIRVISFuncBtnStruct { btnName = "", btnIconKey = ONAME.BackStep, clickCallBack = ReturnMap  },
        };
        JIRVIS.Instance.AddFunctionBtns(btnStructs, FinishBuildJIRVISBtn);
    }

    //开始倒计时
    private void CountDown()
    {
        data.getChallengeGameView.StartCountDown(CallbackCountDown);
    }

    //延时执行 
    private void BuildEnemy()
    {
        data.SetEnemyMonsterListData(JIRVIS.Instance.jIRVISData.getCurEnemys);
        SetEnemy();
        Invoke("CountDown", 1f);


    }

    private void SetEnemy()
    {
        data.BuildEnermyMonster();
    }

    private void SwitchEnemyMonster()
    {
        SetEnemy();
        data.PlayMineMonster();
        data.PlayEnemyMonster();
    }

    private void SwitchMineMonsterSkill(int dir)
    {
        dir = dir == 0 ? 0 : 2;
        if (data.getMineMonster != null)
        {
            data.getMineMonster.ControlChangeSkillFixSkill(dir);
            data.getMineMonster.ControllerToAttak(data.hitPoint);
            data.getMonsterSkillBoard.Scroll(dir);
            Invoke("InvokeSwitchBack", 0.5f);
        }
    }

    private void InvokeSwitchBack()
    {
        data.getMonsterSkillBoard.Scroll(1);
    }

    private void NormalAttack()
    {
        data.getMineMonster.ControlChangeSkillFixSkill(1);
        data.getMineMonster.ControllerToAttak(data.hitPoint);
    }

    private void SelectUserConsumable(int _index)
    {
        Debug.Log("_index" + _index);
    }




    private void UploadSkillData()
    {
        List<BattelResult> battelResults = new List<BattelResult>();
        BattelResult battelResult = new BattelResult();
        battelResult.monsterId = data.getMineMonster.monsterDataValue.pma.monsterID;
        battelResult.monsterIndex = data.getMineMonster.monsterDataValue.pma.monsterIndex;
        battelResult.currentPower = data.getMineMonster.monsterDataValue.monsterCurrentPower;
        battelResult.maxPower = data.getMineMonster.monsterDataValue.monsterMaxPower + data.getEnemyMonster.monsterDataValue.monsterMaxPower;
        battelResult.skills = new List<BattelSkill>();
        int useSkillcount = data.getMineMonster.monsterDataValue.monsterUseSkillValueList.Count;
        for (int i = 0; i < useSkillcount; i++)
        {
            MonsterUseSkillValue monsterUseSkillValue = data.getMineMonster.monsterDataValue.monsterUseSkillValueList[i];
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


        AndaDataManager.Instance.CallServerUploadGameResult(JIRVIS.Instance.jIRVISData.currentPlayGameType, JIRVIS.Instance.jIRVISData.lastChanllengeGameIsWin ? 1 : 2, battelResults, CallbackFinishUploadGameresult);

    }

    private void SelectMineMonster()
    {

    }

    #region 开始游戏
    private void StartGame()
    {
        data.getChallengeGameView.OpenExpButton(false);

        data.getChallengeGameView.OpenMineMonsterPowerBar(true);
        data.getChallengeGameView.OpenEnemyMonsterPowerBar(true);

        ARMonsterSceneDataManager.Instance.aRWorld.OpenFightFocus();
        data.PlayMineMonster();
        data.PlayEnemyMonster();
        data.SetStartGame(true);
        data.BuildMonsterSkillBoard(SwitchMineMonsterSkill, NormalAttack, SelectUserConsumable);
        data.getMineMonster.MonsterDeadEvent += ListenMonsterPower;
        data.getEnemyMonster.MonsterDeadEvent += ListenMonsterPower;
        ARMonsterSceneDataManager.Instance.aRWorld.OpenHologarmScreen();
    }
    #endregion

    #region 游戏结束

    private void GameOver(bool isPlayer)
    {
        if (data.winner != -1)
            return;
        //这个 isplayer 代表是谁死亡， 
        AndaDataManager.Instance.PlayBackgroundAudio(false);
        data.SetStopMonster();
        data.winner = isPlayer ? 0 : 1;
        JIRVIS.Instance.jIRVISData.lastChanllengeGameIsWin = isPlayer == false;
        UploadSkillData();
        //data.getMonsterSkillBoard.ActiveBoard(false);
    }

    #endregion

    #region OutGame

    private void LetPlaysersMonsterGotoCenter()
    {
        if (data.winner == 0)
        {
            data.getEnemyMonster.ControllerToPlayMoodForHappy00();

            // Invoke("InvovkOutGame"  ,5f);
        }
        else
        {
            data.getMineMonster.ControllerToPlayMoodForHappy00();
            //data.getMineMonster.ControllerMoveToTargetPoint(ARMonsterSceneDataManager.Instance.GetCameraForwardFixPoint(3),MonsterArrivalPoint);
        }
        Invoke("InvockReadReward", 3f);
    }

    private void InvockReadReward()
    {
        JIRVISListenerEvent.JIRVISEvent_CloseSecondBar += CloseRewardBar;
        JIRVIS.Instance.CheckReward();
    }

    private void CloseRewardBar()
    {
        JIRVISListenerEvent.JIRVISEvent_CloseSecondBar -= CloseRewardBar;
        InvovkOutGame();
    }

    private void InvovkOutGame()
    {
        data.getChallengeGameView.OpenMineMonsterPowerBar(false);
        callbackFinishController(ONAME.MAPCONCTROLLER);
    }



    #endregion

    #endregion

    #region CallBack 回调
    private void MonsterArrivalPoint()
    {
        data.getMineMonster.ControllerToRotateBodyByPoint(ARMonsterSceneDataManager.Instance.GetCameraPositionWihtSelfY(data.getMineMonster.selfPosY));
        data.getMineMonster.animator.Play("happy00");
        data.getMineMonster.Levelup(data.getCurMineMonsterData.monsterMaxPower + data.getCurEnemyMonsterData.mosterPower);
        Invoke("InvovkOutGame", 5f);
    }

    //识别平面成功 构建菜单
    private void CallbackFinishiSetAR()
    {

        //构建虚拟空间

        // ARMonsterSceneDataManager.Instance.BuildDimensionSpace(CallbackbuildFinishDimensionSpace);

    }

    //通过jirvis选择了宠物
    private void CallbackSelectJIRVISMonsterBtn(PlayerMonsterAttribute pma)
    {
        SelectMonster(pma);
    }
    //同意jirvis推荐的上传的宠物
    private void CallbackComfirmMonsterOfJIRVISRecommend()
    {
        SelectMonster(data.GetBestMonster());
    }
    //长按怪兽图标，并且是怪兽出现以建造生长的方式出现
    public void CallbackSureAboutThisMonster(float value)
    {
        data.getTmpMonster.SkingrowUp(value);
        if (value >= 1)
        {
            data.BuildSelfMonster();
            //buid monster success!
            data.getChallengeGameView.UnregisterMonsterBtn();
            data.getChallengeGameView.CloseSelectMonsterBtn();



        }

    }

    public void ClickComfirmThisMonster()
    {
        data.BuildSelfMonster();
        data.getChallengeGameView.OpenComfirmBtn(false);
        data.SetCurrentMineMonsterData();
        Invoke("BuildEnemy", 3f);
    }




    //倒计时结束
    private void CallbackCountDown()
    {

        StartGame();


        List<JIRVISFuncBtnStruct> btnStructs = new List<JIRVISFuncBtnStruct>()
        {
           new JIRVISFuncBtnStruct { btnName = "", btnIconKey = ONAME.BackStep, clickCallBack = Escape  },
        };

        JIRVIS.Instance.BuildFunctionBtn(btnStructs, FinishBuildJIRVISBtn);
        JIRVIS.Instance.CloseBtnBar();

        JIRVIS.Instance.CloseTips();
        JIRVIS.Instance.PlayTips("尊敬的读星者,如果您遇到战斗无法开始，敌方单位无反应，请退出游戏，关闭后台，重新打开即可。这是已知BUG，正在抓紧修复。请谅解");

        //注册手势事件
        //FingerEvent.HoriDrag+=SwitchMineMonsterSkill;
        //FingerEvent.clickEvent+=NormalAttack;
    }

    private void CallbackFinishUploadGameresult(bool isSuccess)
    {
        if (isSuccess)
        {
            //[领奖]
            LetPlaysersMonsterGotoCenter();
        } else
        {

            JIRVIS.Instance.PlayTips("尊敬的读星者，如果您看到这条提示，奖励物品被中途截断，下次要小心哦");
            InvovkOutGame();
            //UploadSkillData();
        }
    }

    private void CallbackbuildFinishDimensionSpace()
    {
        //关闭AR视频图像
        // AndaARManager.Instance.OpenARVideo(false);


       


        JIRVISDeterminScreenMonster();
    }


    private void ReturnMap()
    {
        callbackFinishController(ONAME.MAPCONCTROLLER);
    }
    private void Escape()
    {
        data.SetStopMonster();
        JIRVIS.Instance.RemoveCurrentBtnList();
        List<BattelResult> battelResults = new List<BattelResult>();
        BattelResult battelResult = new BattelResult();
        battelResult.monsterId = data.getMineMonster.monsterDataValue.pma.monsterID;
        battelResult.monsterIndex = data.getMineMonster.monsterDataValue.pma.monsterIndex;
        battelResult.currentPower = data.getMineMonster.monsterDataValue.monsterCurrentPower;
        battelResult.maxPower = data.getMineMonster.monsterDataValue.monsterMaxPower + data.getEnemyMonster.monsterDataValue.monsterMaxPower;
        battelResult.skills = new List<BattelSkill>();
        int useSkillcount = data.getMineMonster.monsterDataValue.monsterUseSkillValueList.Count;
        for (int i = 0; i < useSkillcount; i++)
        {
            MonsterUseSkillValue monsterUseSkillValue = data.getMineMonster.monsterDataValue.monsterUseSkillValueList[i];
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


        AndaDataManager.Instance.CallServerUploadGameResult(JIRVIS.Instance.jIRVISData.currentPlayGameType,3, battelResults, CallbackFinishUploadGameresult);


        Debug.Log("逃跑喽！");
    }
    private void FinishBuildJIRVISBtn()
    {
        Debug.Log("JIRVIS Said: oh, i was finihed build function btn ，have fun :) ");
    }

    #endregion


    #region Listener

    //监听各方战斗宠物的意志力，如果场上所有宠物的意志力都为0的情况下，那么就结束比赛
    private void ListenMonsterPower(int mosterIndex, bool isPlayer)
    {

        GameOver(isPlayer);
        /*
        if(isPlayer)//死的是玩家的宠物
        {
            data.getMonsterSkillBoard.ActiveBoard(false);
            //先暂停敌人的行为
            data.getEnemyMonster.SetControllerState(false);



        }else//死的是地方宠物
        {
            //暂停我方行为
            data.getMineMonster.SetControllerState(false); 
            if(data.curEnemyMonsterIndex > data.getEnenyMonsters.Count-1)
            {
                data.getMonsterSkillBoard.ActiveBoard(false);
                GameOver();

            }else
            {
                data.curEnemyMonsterIndex += 1;
                SwitchEnemyMonster();
            }

        }*/
    }


    #endregion


    public override void OnUpdate()
    {
        base.OnUpdate();
        if(data.getIsStartGame)
        {
            //HologramCameraManager.Instance.DisplayViewportRangeObjecstInformaiton();     
             data.hitPoint = ARMonsterSceneDataManager.Instance.FightRayHit();
            if(data.getChallengeGameView!=null && data.getEnemyMonster!=null)
            {
                data.getChallengeGameView.UpdateEnmeyPowerBarPose(data.getEnemyMonster.transform.position);
            }

        }
    }
}
