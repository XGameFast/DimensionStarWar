/*
 * Dev:Anda Chen
 * Update:2018.3.21
 * 
 * 战斗控制器 是用于在战斗的中 管理 玩家和NPC的交互的的控制器脚本
 * 还需要配合 ARMonsterSceneDataManager 单例脚本 来快速获取一些场景中的数据，
 * 整体的游戏开始，游戏结算，加载玩家 加载敌人 都在控制器内完成。并且会监听NPC 和玩家的一些事件消息。
 * 控制战斗中的UI显示等等
 */


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class FightController : BaseController
{

    /*
     * 战斗逻辑控制器
     * 用于根据传入的战斗类型标签。建立相对应的战斗方案
     * 
     * 方案一：据点保卫（保卫商家据点）
     * 
     * 方案二：据点挑战（挑战玩家据点）
     * 
     * 共同点：根据传入的据点信息，构建怪兽。 玩家选择可以上场的怪兽
     * 
     * 区别： 据点保卫战，是在正式环境中进行战斗。据点挑战是在虚拟空间中机型战斗。
     * 
     * 步骤：
     * 【1】等待场景构建完成
     * 【2】加载敌方单位模型
     * 【3】轮到玩家选择怪兽上场
     * 根据据点挑战的信息，来选择上场的数量
     * 【4】选择完毕，开始进入倒计时读条
     * 【5】开始游戏
     * 【6】游戏结束
     * 
     * 场上宠物的战斗信息 由 "FightEventController"监听，并发布消息
     * 
     * 当前整个控制只负责 玩家的交互操作。数据内容处理 ， "FightDataValueController"处理
     * 
     */


    public FightMenu fightMenu;

    public FightSceneDataValue dataValue;


    [HideInInspector]
    public MonsterBasic m_monster;
    [HideInInspector]
    public MonsterBasic e_Monster;
    
    private MonsterBasic winner;
    private MonsterBasic loser;

    private AndaObjectBasic tmpSelectMonster;
    //int 玩家的ID，所有玩家使用技能的情况
    private Dictionary<int, List<MonsterFightData>> monster_info_dic;

    private int playerIndex;
    private int enemyIndex;
    
    private SkillBar currentSkillBar;

    private FightResultBar fightResultBar;

    private FightTypeValue currentFightTypeValue;

    private bool isSetPlayerMonster;

    private List<PlayerMonsterAttribute> tmpPlayerMonsterList;
    private PlayerMonsterAttribute currentPlayerMonsterAttribute;
    private int canPlayMonsterCount;
    private Arrow01 selectPlayerMonsterArrow;
   // private GameTypeTips gameTypeTips;
    #region 快速获取逻辑条件
    
    #endregion

    #region 开始控制器 和初始化部分

    public override void StartController()
    {
        base.StartController();
        BuildFightSceneDataValue();
        OpenFightScene(true);
        AnalysisFightValue();
        ResetDimensionWorld();
    }

    private void BuildFightSceneDataValue()
    {
        dataValue = new FightSceneDataValue();
        //dataValue.BuildData(this,ARMonsterSceneDataManager);
    }

    /// <summary>
    /// 分析战斗类型标签。建立相对应的战斗方案
    /// </summary>
    private void AnalysisFightValue()
    {
        currentFightTypeValue = ARMonsterSceneDataManager.Instance.currentFightTypeValue;
    }
    //打开战斗场景。加载出来的人物都进入这个场景
    public void OpenFightScene(bool isOpen)
    {
        arWorld.OpenFightScene(isOpen);
    }
    //重置虚拟场景 ,关闭
    public void ResetDimensionWorld()
    {
        arWorld.SetMainCameraTrans(false, OTYPE.SceneTranslationType.Galitch, FinishDimensionScene);
    }
    /// <summary>
    /// 等待场景构建完成，如果是调整模式
    /// 会先再次构建场景， 
    /// </summary>
    /// <param name="isOpen"></param>
    private void FinishDimensionScene(bool isOpen)
    {
        if (!isOpen)//关闭完成
        {
            if (currentFightTypeValue.fightType == MonsterGameData.FightType.challenge)
            {
                BuildOtherPlayerDimensionScene();
                return;
            }
        }
        StartChallengeGame();
    }

    /// <summary>
    /// 如果是挑战模式的会构建其他玩家的虚拟空间
    /// </summary>
    private void BuildOtherPlayerDimensionScene()
    {
        arWorld.SetRoom((PlayerStrongholdAttribute)currentFightTypeValue.sba);
        arWorld.SetMainCameraTrans(true, OTYPE.SceneTranslationType.Galitch, FinishDimensionScene);
    }



    private void StartChallengeGame()
    {
        playerIndex = AndaDataManager.Instance.userData.userIndex;
        canPlayMonsterCount = currentFightTypeValue.sba.storngholdFightype;
        StartCoroutine(WaitTimer());
    }


    #region 数据初始化
    public override void InitValue()
    {
        base.InitValue();
        tmpPlayerMonsterList = new List<PlayerMonsterAttribute>();
        InitMonsterInfoDictionary();
    }



    private void InitMonsterInfoDictionary()
    {
        if (monster_info_dic == null)
        {
            monster_info_dic = new Dictionary<int, List<MonsterFightData>>();
        }
        else
        {
            //r如果不为空，就清除所以怪兽数据
            AndaDataManager.Instance.DestoryAllPool(OTYPE.ObjectsIDType.monster);
            //恢复库
            monster_info_dic.Clear();
        }
    }
    #endregion

    
   
    

   
    private IEnumerator WaitTimer()
    {
        yield return new WaitForSeconds(3f);
        BuildEnemyMonster();

        yield return new WaitForSeconds(3f);
        SetSlideInformation();
    }


    #endregion

    #region 游戏逻辑部分操作
   /* private void BuildGameTips()
    {
        if (gameTypeTips == null)
        {
            gameTypeTips = AndaUIManager.Instance.PopingMenu<GameTypeTips>(MonsterGameData.GameTipsObj);
            gameTypeTips.DidplayAlpha(0.3f);
        }
        gameTypeTips.SetFollowPoint(ARMonsterSceneDataManager.Instance.GetCameraForwardPoint(3f));
        int count = currentFightTypeValue.sba.storngholdFightype;
        string content = "";
        switch (currentFightTypeValue.fightType)
        {
            case MonsterGameData.FightType.protect:
                content = "据点保卫战\n" + count + "v" + count;
                break;
            case MonsterGameData.FightType.challenge:
                content = "道馆挑战\n" + count + "v" + count;
                break;
        }
        gameTypeTips.SetValue(content);
    }*/
    //加载完怪兽后 开始倒计时

    private void StartGameCountdown()
    {
        //gameTypeTips.SetFollowPoint(ARMonsterSceneDataManager.Instance.GetCameraForwardPoint(3f));

        StartCoroutine(WaitCownDown());
    }
    private IEnumerator WaitCownDown()
    {
        int timerLimit = 3;
        while (timerLimit > 0)
        {
          //  gameTypeTips.SetValue(timerLimit.ToString());
            yield return new WaitForSeconds(1f);
            timerLimit -= 1;

        }

       // gameTypeTips.CloseAlpha();

        Debug.Log("开始游戏！！！");
        // m_monster.playerMonster.StartEngine();
        e_Monster.enmeyMonster.StartEngine();

        m_monster.playerMonster.StartEngine();
        
       /* if (m_monster != null)
        {
            BuildMonsterListenerEvent((EnemyFightController)e_Monster.enmeyMonster, m_monster);
        }*/
    }
    #endregion

    #region 与界面之间的联系 和操作
    public void BuildFightMenuValue()
    {
        fightMenu.DidplayAlpha();
        fightMenu.InitMenu();
    }

    #endregion

    #region 构建 玩家怪兽 和 NPC怪兽，及该收数据存储

    
    public void BuildMonster(MonsterBasic monsterBasic ,PlayerMonsterAttribute pma)
    {
        monsterBasic.MonsterDeadEvent = ListerMonsterDeadEvent;
        monsterBasic.gameObject.SetActive(false);

        MonsterFightData mfd = new MonsterFightData { pma = pma, monsterBasic = monsterBasic };

        AddMonsterToDictionry(playerIndex, mfd);

    }

    private void BuildPlayerMonster()
    {
       

    }

    private void BuildEnemyMonster()
    {
        enemyIndex = currentFightTypeValue.sba.hostIndex;
        List<int> monsterIndex = currentFightTypeValue.sba.fightMonsterListIndex;
        foreach (var go in monsterIndex)
        {
            PlayerMonsterAttribute pma = AndaDataManager.Instance.GetPlayerMonsterAttribute( go,currentFightTypeValue.sba.hostIndex,currentFightTypeValue.sba.hostType);
            var dir = -(ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(arWorld.transform.position)).normalized;
            var pos = arWorld.transform.position + dir * 5f;
            MonsterBasic monsterbasic = BuildObj(pma.monsterID.ToString(), pos);
            monsterbasic.MonsterDeadEvent = ListerMonsterDeadEvent;
            monsterbasic.gameObject.SetActive(false);
            MonsterFightData mfd = new MonsterFightData {pma = pma,  monsterBasic = monsterbasic };

            AddMonsterToDictionry(enemyIndex, mfd);
            ARMonsterSceneDataManager.Instance.enemyList.Add(monsterbasic);
        }
        EnemySelectMonster(0);
    }

    private void BuildPlayerMongserIconList(List<int> monsterIDList)
    {
        //fightMenu.BuildMonseterIconsList(monsterIDList);
    }
    private void StopCurrentMonster(bool isPlayer)
    {
        if (isPlayer)
        {
            if (m_monster == null) return;
            m_monster.playerMonster.EndEngine();
            m_monster.gameObject.SetActive(false);
        }
        else
        {
            if (e_Monster == null) return;
            e_Monster.playerMonster.EndEngine();
            e_Monster.gameObject.SetActive(false);
        }
    }
    public void PlayerSelectMonster(int listIndex )
    {
        SeletcCurrentMonster(listIndex, playerIndex);
    }
    public void EnemySelectMonster(int listIndex)
    {
        SeletcCurrentMonster(listIndex, enemyIndex);
    }
    public void SeletcCurrentMonster(int listIndex/*这是这个数组的1 2 3 4 游标*/ , int playerIndex)
    {
        bool isPlayer = AndaDataManager.Instance.CheckIsPlayer(playerIndex);
        PlayerMonsterAttribute pma = monster_info_dic[playerIndex][listIndex].pma;
        int monsterID = pma.monsterID;
        int monsterIndex = pma.monsterIndex;

        if (monster_info_dic[playerIndex][listIndex].monsterBasic.monsterDataValue != null)
        {
            /*if (monster_info_dic[playerIndex][listIndex].monsterBasic.currentMonsterStrength < 50)
            {
                Debug.Log("无法上场");
                return;
            }*/
        }
        StopCurrentMonster(isPlayer);

        MonsterBasic tmpMonsterBasic = monster_info_dic[playerIndex][listIndex].monsterBasic;
        //----
        if (tmpMonsterBasic.monsterDataValue == null)
        {
            tmpMonsterBasic.DownloadMonsterValue( pma, OTYPE.MonsterStateType.fight);
            tmpMonsterBasic.ReFadein();
        }
        else
        {
            tmpMonsterBasic.ReFadein();
        }
        tmpMonsterBasic.gameObject.SetActive(true);

        BuildMonsterInformationBar(tmpMonsterBasic);

        if (isPlayer)
        {
            BuildMonsterListenerEvent((EnemyFightController)e_Monster.enmeyMonster, tmpMonsterBasic);
          
            m_monster = tmpMonsterBasic;
            ARMonsterSceneDataManager.Instance.currentSceneMonster = m_monster;
           
            BuildSkillBar();

        }
        else
        {
           
            e_Monster = tmpMonsterBasic;
           
            ARMonsterSceneDataManager.Instance.currentEnemy = e_Monster;
        }
        
    }

    private void BuildMonsterInformationBar(MonsterBasic _monsterBasic)
    {
        _monsterBasic.monsterInfo.BuildFightInfoBar();
    }
    private void BuildSkillBar()
    {
        if (currentSkillBar == null)
        {
            currentSkillBar = AndaUIManager.Instance.PopingMenu<SkillBar>("SkillBar");

            currentSkillBar.BuildPlayerSkillList(m_monster.monsterDataValue.playerSkillAttributeList);
        } else
        {
            currentSkillBar.CloseAlpha();
            currentSkillBar.ResetValue(m_monster.monsterDataValue.playerSkillAttributeList);
        }

        currentSkillBar.UpdatePlayerCurrentSkillIndex(m_monster.getCurrentSkillIndex, m_monster.currentSkillCDLoadTime, m_monster.currentSkillCDLimit);

        currentSkillBar.UpdateLoadSkillTime(m_monster.currentSkillCDLoadTime, true, "");


        m_monster.MonsterUseSkill = currentSkillBar.UpdateLoadSkillTime;
        m_monster.MonsterChangeSkill = currentSkillBar.UpdatePlayerCurrentSkillIndex;

        currentSkillBar.DidplayAlpha();
    }

    public MonsterBasic BuildObj(string targetName, Vector3 position)
    {
        var target = (MonsterBasic)AndaDataManager.Instance.InstantiateMonster(targetName);
        target.transform.SetParent(arWorld.transform);
        target.selfPostion = position;
        target.transform.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(target.selfPostion);
        return target;
    }

    private void BuildMonsterListenerEvent(EnemyFightController enemyFightController, MonsterBasic playerMonster)
    {
        //构建一些。敌人需要监听玩家动向的事件
        playerMonster.MonsterUseSkillEvent = enemyFightController.ListenerPlayerMonsterUseSkill;
    }


    private void AddMonsterToDictionry(int index, MonsterFightData monsterInfomation)
    {
        if (monster_info_dic.ContainsKey(index))
        {
            monster_info_dic[index].Add(monsterInfomation);

        }
        else
        {
            List<MonsterFightData> mi = new List<MonsterFightData>();
            mi.Add(monsterInfomation);
            monster_info_dic.Add(index, mi);

        }
    }

    private void BuildTempPlayerMonster(PlayerMonsterAttribute playerMonsterAttribute)
    {
        if (m_monster != null) AndaDataManager.Instance.DestoryObj(m_monster);

        m_monster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(playerMonsterAttribute.monsterID.ToString());

        m_monster.DownloadMonsterValue( playerMonsterAttribute ,OTYPE.MonsterStateType.fight);

        m_monster.monsterInfo.BuildRecoveryInfoBar();

        m_monster.SkinNormal();

        m_monster.SetInto(arWorld.transform);

       // m_monster.transform.position =   ;
    }

    private void SetSlideInformation()
    {
        tmpPlayerMonsterList.AddRange(AndaDataManager.Instance.userData.userMonsterList);
        int count = tmpPlayerMonsterList.Count;
        isSetPlayerMonster = true;
        SetSlidInfomation(count);
    }

    private void SetSlidInfomation(int count)
    {
        ARMonsterSceneDataManager.Instance.SetHorizonSlideInformaztion(count, ListenerSlideEvent,true/*监听点击事件*/);
    }
    
    private void SetSelectMonster()
    {
        //ARMonsterSceneDataManager.Instance.SlideHorizon();
    }

    private void ChangeSelectPlayerMonster(int value , int limit)
    {
        currentPlayerMonsterAttribute = tmpPlayerMonsterList[value];
        BuildTempPlayerMonster(currentPlayerMonsterAttribute);
        CheckArrow(limit);
    }
    private void CheckArrow(int limit)
    {
        if (selectPlayerMonsterArrow == null)
        {
            AndaObjectBasic aob = AndaDataManager.Instance.InstantiateOtherObj(MonsterGameData.arrow01);
            selectPlayerMonsterArrow = aob.GetComponent<Arrow01>();
        }
        selectPlayerMonsterArrow.transform.position = m_monster.transform.position;
        switch (limit)
        {
            case -1:
                selectPlayerMonsterArrow.OpenLeftArrow(false);
                break;
            case 0:
                selectPlayerMonsterArrow.OpenLeftArrow(true);
                selectPlayerMonsterArrow.OpenRightArrow(true);
                break;
            case 1:
                selectPlayerMonsterArrow.OpenRightArrow(false);
                break;
        }
    }
    private void SureAboutCurrentMonster()
    {
        BuildMonster(m_monster, currentPlayerMonsterAttribute);
        m_monster = null;//选完置空
        tmpPlayerMonsterList.Remove(currentPlayerMonsterAttribute);
        if (CheckIsSelectOver())
        {
            //不能再选啦.开始游戏喽
            if (selectPlayerMonsterArrow != null)
            {
                AndaDataManager.Instance.DestoryObj(selectPlayerMonsterArrow);
            }
            isSetPlayerMonster = false;
            StartGameCountdown();
            PlayerSelectMonster(0);
            Debug.Log("不能再选啦.开始游戏喽");
        }
        else //还可以选，那就继续
        {
            SetSlidInfomation(tmpPlayerMonsterList.Count);
            Debug.Log("还可以选，那就继续选");
        }
    }

    private bool CheckIsSelectOver()
    {
        if (tmpPlayerMonsterList.Count == 0) return true;
        if (monster_info_dic[playerIndex].Count >= canPlayMonsterCount) return true;
        return false;
    }

    #endregion

    #region 与界面的交互
    public void PauseGame(float value)
    {
        Time.timeScale = value;
    }
    #endregion

    //
    #region 与游戏结算相关
    //让玩家去到指定的地点
    public void LetWinnerGotoPoint()
    {
        var targetPoint = loser.transform.position;
        float moveSpeed = winner.monsterDataValue.moveSpeed;
        if (winner.SetState((int)OTYPE.MonsterActiveStateType.move))
        {
            winner.PlayAnimationState();
        }
        winner.ControllerMoveToTargetPoint(winner.selfPostion, targetPoint , moveSpeed);

        float timer = Vector3.Distance(targetPoint, winner.selfPostion) / moveSpeed;

        UploadUseSkillInfomation();

        StartCoroutine(WaitForAfewTime(timer));

        DestroyMonsterAndSkillUI();
    }
    //弹出结算结果
    private IEnumerator PopGameOverResultBar()
    {
        fightResultBar = AndaUIManager.Instance.PopingMenu<FightResultBar>("FightResultBar");
        yield return StartCoroutine(fightResultBar.SetValue(winner.monsterUseSkillValueList, winner.center.transform));

        AndaDataManager.Instance.DestoryObj(fightResultBar);

        //test
        BackToInterstellarScene();
    }

    

    private void UploadUseSkillInfomation()
    {
        AndaDataManager.Instance.UploadMonsterFightValue(winner.monsterUseSkillValueList, BackFightResult);
        //还需要上传体力
    }

    


    private void DestroyMonsterAndSkillUI()
    {
        AndaDataManager.Instance.DestoryObj(currentSkillBar);
    }

    //本应该等到赢家走到指定的点，但是为了不出现意外，所以先计算指定的点的距离根据速度
    //算出时间，然后在时间内弹出结算结果
    private IEnumerator WaitForAfewTime(float waitTimer)
    {
        Debug.Log("timer" + waitTimer);
        yield return new WaitForSeconds(waitTimer);
        StartCoroutine(PopGameOverResultBar());
    }
    
    private void CheckGameIsOver()
    {
        bool playerLive = false;
        bool enemyLive = false;
        foreach (var go in monster_info_dic[playerIndex])
        {
            if (!go.monsterBasic.currentMonsterwasDead )
            {
                playerLive = true;
                break;
            }
        }

        foreach (var go in monster_info_dic[enemyIndex])
        {
            if (!go.monsterBasic.currentMonsterwasDead)
            {
                enemyLive = true;
                break;
            }
        }
        if (playerLive == enemyLive == true)
        {
            Debug.Log("FightController:没有团灭");
            return;
        }

        Debug.Log("FightController:团灭了");

        winner = playerLive ? m_monster : e_Monster;

        loser = playerLive ? e_Monster : m_monster;

        winner.ControllerStopEngine();

        LetWinnerGotoPoint();
    }


    #endregion;

    #region 监听

    public void ListerMonsterDeadEvent(int index,bool isPlayer)
    {
        CheckGameIsOver();
    }
    
    public void BackToInterstellarScene()
    {
        InitValue();
        callbackFinishController(ONAME.MAPCONCTROLLER);
    }

    public void BackFightResult()
    {
        InitValue();
        callbackFinishController(ONAME.MAPCONCTROLLER);
    }

    public void ListenerSlideEvent(int value ,int limit)
    {
        if (value == -1)
        {
            SureAboutCurrentMonster();
        }
        else
        {
            ChangeSelectPlayerMonster(value, limit);
        }
    }
   #endregion



    public override void OnUpdate()
    {
        if (fightMenu != null)
        {
            fightMenu.OnUpdate();
        }
        //-----------------
        if (isSetPlayerMonster)
        {
            SetSelectMonster();
        }

        base.OnUpdate();
     
    }
}

public class MonsterFightData
{
    public PlayerMonsterAttribute pma { get; set; }
    public MonsterBasic monsterBasic { get; set; }
}