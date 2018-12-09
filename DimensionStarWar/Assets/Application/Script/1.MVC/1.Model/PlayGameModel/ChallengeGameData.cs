using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChallengeGameData : ControllerData {


    public bool getIsStartGame
    {
        get {return isStartChallengeGame; }
    }

    public MonsterBasic getMineMonster
    {
        get {return currentMine ;}
    }
    public PlayerMonsterAttribute getCurMineMonsterData 
    {
        get {return curMineMonsterData ;}
    }
    public MonsterBasic getEnemyMonster
    {
        get {return currentEnermy ;}
    }
    public PlayerMonsterAttribute getCurEnemyMonsterData
    {
        get {return curEnemyMonsterData ;}
    }

    public List<PlayerMonsterAttribute> getPlayerMonsters
    {
        get {return currentStrongholdMonsters ;}
    }

    public List<PlayerMonsterAttribute> getEnenyMonsters
    {
        get {return curEnemyMonsters ;}
    }

    public StrongholdBaseAttribution getCurEnemystrongholdAttr
    {
        get {return curEnemyStrongholdAttribute ;}
    }

    public ChallengeGameView getChallengeGameView
    {
        get {return challengeGameView ;}
    }

    public MonsterBasic getTmpMonster
    {
        get { return tmpMonster ;}
    }
    public MonsterSkillBoard getMonsterSkillBoard
    {
        get {return monsterSkillBoard ;}
    }

    public Vector3 hitPoint;
    public int curEnemyMonsterIndex;//当前地方宠物叫到第几支宠物了

    private ChanllengeGameController chanllengeGameController ;
    private ChallengeGameView challengeGameView;
    private MonsterSkillBoard monsterSkillBoard;
    private List<PlayerMonsterAttribute> currentStrongholdMonsters;
    private List<PlayerMonsterAttribute> curEnemyMonsters;
    private MonsterBasic tmpMonster;
    private MonsterBasic currentEnermy;
    private MonsterBasic currentMine;
    private StrongholdBaseAttribution curEnemyStrongholdAttribute;
   
    private PlayerMonsterAttribute curEnemyMonsterData;
    private PlayerMonsterAttribute curMineMonsterData;
    private PlayerMonsterAttribute tmpCurMineMonsterdata;

    private List<LD_Objs> playerConsumablelist ;
    private bool isStartChallengeGame=false;
    public int  winner = -1;
   
    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        chanllengeGameController = _baseController as ChanllengeGameController;

    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        challengeGameView = m_Menu as ChallengeGameView;
        challengeGameView.FadeIn();
    }

    public void InitValue()
    {
        currentStrongholdMonsters = null;
        winner = -1;
        curEnemyMonsterIndex = 0;
        if(m_Menu!=null)  { AndaDataManager.Instance.RecieveItem(m_Menu); m_Menu= null; }
        if (challengeGameView != null) { AndaDataManager.Instance.RecieveItem(challengeGameView); challengeGameView = null; }
        if (tmpMonster != null)
        {
            AndaDataManager.Instance.RecieveItem(tmpMonster);
            tmpMonster = null;
        }
        if(currentMine !=null) { 
            AndaDataManager.Instance.RecieveItem(currentMine);  currentMine=null; 
        }
        if(currentEnermy!=null) {
            AndaDataManager.Instance.RecieveItem(currentEnermy); currentEnermy = null;}
        if(curEnemyMonsters!=null)curEnemyMonsters.Clear();
        if(currentStrongholdMonsters!=null)currentStrongholdMonsters.Clear();
        if(monsterSkillBoard!=null) { AndaDataManager.Instance.RecieveItem(monsterSkillBoard); monsterSkillBoard = null;}
        if(curEnemyStrongholdAttribute!=null)curEnemyStrongholdAttribute =null;
        if(curEnemyMonsterData!=null)curEnemyMonsterData =null;
        if(curMineMonsterData!=null)curEnemyMonsterData =null;
        if(tmpCurMineMonsterdata!=null)tmpCurMineMonsterdata = null;
        if(playerConsumablelist!=null)playerConsumablelist.Clear();
        isStartChallengeGame=false;
        
    }


    #region Build,Set
    public void BuildMonsterSkillBoard(System.Action<int> _callbackSelectSkill, System.Action _callbackAttack, System.Action<int> _callbackSelectConsumable)
    {
        /*if(monsterSkillBoard == null) monsterSkillBoard =AndaUIManager.Instance.PopingMenu2<MonsterSkillBoard>(ONAME.MonsterSkillBoard);
        monsterSkillBoard.FadeIn();
        playerConsumablelist = AndaDataManager.Instance.GetPlayerPackageConsumableList();
        //构建数据，并且设置回调
        monsterSkillBoard.BuildMonsterSkill(currentMine.monsterDataValue.playerSkillAttributeList,playerConsumablelist,_callbackSelectSkill,_callbackAttack,_callbackSelectConsumable);
        currentMine.MonsterHaeBeenHit += monsterSkillBoard.UpdateMonsterPower;
        monsterSkillBoard.ActiveBoard(true);*/
    }

    public void BuildTmpMonster(PlayerMonsterAttribute pma)
    {
        if(tmpMonster!=null)
        {
            AndaDataManager.Instance.RecieveItem(tmpMonster);
        }
        tmpCurMineMonsterdata = pma;
        tmpMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(pma.monsterID.ToString());
        ARMonsterSceneDataManager.Instance.currentSceneMonster = tmpMonster;
        //tmpMonster.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        //tmpMonster.SetScalePercent(1f);
        tmpMonster.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        //tmpMonster.transform.position = ARMonsterSceneDataManager.Instance.GetCameraForwardFixPoint();
        tmpMonster.transform.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(tmpMonster.selfPostion);
        tmpMonster.isPlayer = true;
        //tmpMonster.gameObject.SetLayer(ONAME.LayerDeafualt);
    }

    public void BuildEnermyMonster()
    {
        if(currentEnermy!=null)AndaDataManager.Instance.RecieveItem(currentEnermy);
        SetEnemeyMonsterdata(curEnemyMonsters[curEnemyMonsterIndex]);
        currentEnermy =  AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(curEnemyMonsterData.monsterID.ToString());
        currentEnermy.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        Vector3 fwd = ARMonsterSceneDataManager.Instance.arCameraForward;
        fwd.y = 0 ;
        currentEnermy.transform.position = currentMine.transform.position + fwd.normalized * 7f * ARMonsterSceneDataManager.Instance.getARWorldScale;// ARMonsterSceneDataManager.Instance.GetCameraForwardPoint(20);
        currentEnermy.transform.forward = currentMine.transform.position -  currentEnermy.transform.position;
        currentEnermy.isPlayer = false;
        currentEnermy.MonsterHaeBeenHit += challengeGameView.UpdateEnmeyMonsterPower;
        //建造生长
        //tmpMonster.SkinHologarm();

        //currentEnermy.gameObject.SetLayer(ONAME.LayerDeafualt);
        //
        ARMonsterSceneDataManager.Instance.sceneObjects.Add(currentEnermy);
    }


    private void BuildEnemyMonsterPowerbar()
    {
        currentEnermy.BuildPowerBar();
        currentEnermy.SetPowerBar(curEnemyMonsterData.monsterMaxPower,curEnemyMonsterData.monsterMaxPower);
    }

    public void BuildSelfMonster()
    {
        if(currentMine!=null)AndaDataManager.Instance.RecieveItem(currentMine);
        currentMine = tmpMonster;
        currentMine.MonsterHaeBeenHit += challengeGameView.UpdateMineMonsterPower;
        //currentMine.animator.Play("magic00");

        tmpMonster = null;
        //ARMonsterSceneDataManager.Instance.sceneObjects.Add(currentEnermy);
    }

    public void SetStrongholdMonsters()
    {
        int strongholdIndex = JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex;
        currentStrongholdMonsters = AndaDataManager.Instance.GetPlayerMonsterAttributeBelongThisStronghold(strongholdIndex);
    }

    public void SetEnemeyStrongholdAttribute(StrongholdBaseAttribution enemyStrongholdAttribute)
    {
        curEnemyStrongholdAttribute = enemyStrongholdAttribute;
    }

    public void SetEnemeyMonsterdata(PlayerMonsterAttribute _playerMonsterAttribute)
    {
        curEnemyMonsterData = _playerMonsterAttribute;
    }

    public void SetEnemyMonsterListData(List<PlayerMonsterAttribute> _playerMonsterAttributes)
    {
        if(curEnemyMonsters == null)curEnemyMonsters= new List<PlayerMonsterAttribute>();
        curEnemyMonsters = _playerMonsterAttributes;
    }

    public void SetCurrentMineMonsterData()
    {
        curMineMonsterData = tmpCurMineMonsterdata;
    }

    public void SetStartGame(bool isStart)
    {
        AndaDataManager.Instance.PlayBackgroundAudio(true);
        isStartChallengeGame = isStart;
        currentMine.SetControllerState(true);
        currentEnermy.SetControllerState(true);
    }

    public void SetStopMonster()
    {
        currentMine.SetControllerState(false);
        currentEnermy.SetControllerState(false);
    }

    public void PlayMineMonster()
    {
        currentMine.DownloadMonsterValue(curMineMonsterData,OTYPE.MonsterStateType.fight);

        currentMine.ControllerToRotateBodyByPoint(currentEnermy.transform.position,0.5f);
    }

    public void PlayEnemyMonster()
    {
        currentEnermy.DownloadMonsterValue(curEnemyMonsterData,OTYPE.MonsterStateType.fight);
        BuildEnemyMonsterPowerbar();
    }

    #endregion

    #region Get

    //筛选出等级最高的宠物
    public PlayerMonsterAttribute GetBestMonster()
    {
        int count = currentStrongholdMonsters.Count;
        PlayerMonsterAttribute playerMonsterAttribute = currentStrongholdMonsters[0];
        for (int i = 1; i < count; i++)
        {
            if(currentStrongholdMonsters[i].monsterLevel> playerMonsterAttribute.monsterLevel)
            {
                playerMonsterAttribute = currentStrongholdMonsters[i];
            }
        }
        return playerMonsterAttribute;
    }
    #endregion

}
