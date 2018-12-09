using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShootingTrainingController : BaseController
{
    private ShootingTrainingData data;


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
        ARMonsterSceneDataManager.Instance.OpenGameLight(false);
        StopAR();
        data.InitValue();
        //ARMonsterSceneDataManager.Instance.RemoveDimensionSpace(null);
        base.EndController();
    }

    #region 逻辑





    #endregion

    #region 执行

    private void BuildData()
    {
        if (data == null)
        {
            data = new ShootingTrainingData();
            data.BuildData(this);
        }
        data.InitValue();
        //构建该据点的宠物数据
        data.SetStrongholdMonsters();

        


    }

    private void BuildMenu()
    {
        data.BuildMenu(ONAME.ShootingTrainingMenu);
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
        data.getShootingTrainingView.OpenComfirmBtn(true);
        //怪兽模型
        data.BuildTmpMonster(pma);
        //显示怪兽图标按钮；
        //data.getShootingTrainingView.BuildSelectMonsterBtn(CallbackSureAboutThisMonster);
        //打开召唤按钮
    }


    private void JIRVISDeterminScreenMonster()
    {
        //构建宠物列表，= 1 ,那就不构建列表了，直接构建宠物
        if (data.getPlayerMonsters.Count <= 0) return;
        if (data.getPlayerMonsters.Count == 1)
        {
            //直接默认第一个
            SelectMonster(data.getPlayerMonsters[0]);

        }
        else
        {

            BuildJIRVISPlayerMonsterBtn();
            CallbackComfirmMonsterOfJIRVISRecommend();
        }
    }

    //开始倒计时
    private void CountDown()
    {
        data.getShootingTrainingView.StartCountDown(CallbackCountDown);
    }

    //延时执行 
    private void BuildEnemy()
    {
        SetEnemy();
        Invoke("CountDown", 1f);
    }

    private void SetEnemy()
    {
        data.BuildShootTarget();
    }

    private void SwitchEnemyMonster()
    {
        SetEnemy();
        data.PlayMineMonster();
        data.BuildShootTarget();
    }

  
  
    private void SelectMineMonster()
    {

    }

    #region 开始游戏
    private void StartGame()
    {
        data.PlayMineMonster();
        data.SetStartGame(true);
        
       //data.BuildMonsterSkillBoard(SwitchMineMonsterSkill, NormalAttack, SelectUserConsumable);
        ARMonsterSceneDataManager.Instance.aRWorld.OpenHologarmScreen();
    }
    #endregion

    #region 游戏结束

    private void GameOver()
    {

        UploadSkillData();

        AndaDataManager.Instance.PlayBackgroundAudio(false);
        data.SetStopMonster();
        //data.getMonsterSkillBoard.ActiveBoard(false);
        data.SetStartGame(false);
    }

    #endregion

    #region OutGame


    private void InvovkOutGame()
    {
       
        OutAstrology();
    }

    private void OutAstrology()
    {
        callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
    }


    private void UploadSkillData()
    {
        List<BattelResult> battelResults = new List<BattelResult>();
        BattelResult battelResult = new BattelResult();
        battelResult.monsterId = data.getMineMonster.monsterDataValue.pma.monsterID;
        battelResult.monsterIndex = data.getMineMonster.monsterDataValue.pma.monsterIndex;
        battelResult.skills = new List<BattelSkill>();
        int useSkillcount = data.getMineMonster.monsterDataValue.monsterUseSkillValueList.Count;
        battelResult.skills = data.battelSkills;
        battelResults.Add(battelResult);
        string json = LitJson.JsonMapper.ToJson(battelResults);
        //Debug.Log("json:" + json);
        AndaDataManager.Instance.CallServerUploadGameResult(3, 1, battelResults, CallbackFinishUploadGameresult);

    }

    #endregion

    #endregion

    #region CallBack 回调
    private void MonsterArrivalPoint()
    {
        data.getMineMonster.ControllerToRotateBodyByPoint(ARMonsterSceneDataManager.Instance.GetCameraPositionWihtSelfY(data.getMineMonster.selfPosY));
        data.getMineMonster.animator.Play("happy00");
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
            //data.getShootingTrainingView.UnregisterMonsterBtn();
            //data.getShootingTrainingView.CloseSelectMonsterBtn();
        }

    }

    public void ClickComfirmThisMonster()
    {
        data.BuildSelfMonster();
        data.getShootingTrainingView.OpenComfirmBtn(false);
        data.SetCurrentMineMonsterData();
        Invoke("BuildEnemy", 3f);
    }

    //倒计时结束
    private void CallbackCountDown()
    {
        StartGame();
    }

    //战斗结束信息上传后回调
    private void CallbackFinishUploadGameresult(bool isSuccess)
    {
        if (isSuccess)
        {
            Debug.Log("游戏结束,等待跳转！");
            LetPlaysersMonsterGotoCenter();
        }
        else
        {
            Debug.Log("上传失败");
        }
    }

    private void LetPlaysersMonsterGotoCenter()
    {
        Invoke("InvovkOutGame", 5f);
    }
    private void CallbackbuildFinishDimensionSpace()
    {
        //关闭AR视频图像
        // AndaARManager.Instance.OpenARVideo(false);

        JIRVISDeterminScreenMonster();
    }


    #endregion


    #region Listener

    //监听各方战斗宠物的意志力，如果场上所有宠物的意志力都为0的情况下，那么就结束比赛
    private void ListenMonsterPower(int mosterIndex, bool isPlayer)
    {
        GameOver();
    }


    #endregion


    public override void OnUpdate()
    {
        base.OnUpdate();
        if (data.getIsStartGame)
        {
            if (data.shootTime == 0)
            {
                GameOver();
            }
            //HologramCameraManager.Instance.DisplayViewportRangeObjecstInformaiton();     
          //  data.hitPoint = ARMonsterSceneDataManager.Instance.FightRayHit();
        }
    }

}
