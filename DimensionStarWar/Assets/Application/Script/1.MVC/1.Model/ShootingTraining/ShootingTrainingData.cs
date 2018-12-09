using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class ShootingTrainingData : ControllerData
{
   
    public MonsterBasic getMineMonster
    {
        get { return currentMine; }
    }
    public PlayerMonsterAttribute getCurMineMonsterData
    {
        get { return curMineMonsterData; }
    }
    public ShootingTrainingView getShootingTrainingView
    {
        get { return ShootingTrainingView; }
    }
    public List<PlayerMonsterAttribute> getPlayerMonsters
    {
        get { return currentStrongholdMonsters; }
    }
    public MonsterSkillBoard getMonsterSkillBoard
    {
        get { return monsterSkillBoard; }
    }
    public bool getIsStartGame
    {
        get { return isStartChallengeGame; }
    }
    public MonsterBasic getTmpMonster
    {
        get { return tmpMonster; }
    }
    //得分
    public float score;

    //射击次数
    public int shootTime=1;

    public Vector3 hitPoint;
    private MonsterBasic currentMine;
    private MonsterBasic tmpMonster;
    private PlayerMonsterAttribute tmpCurMineMonsterdata;
    private ShootingTrainingController ShootingTrainingController;
    private PlayerMonsterAttribute curMineMonsterData;
    private List<PlayerMonsterAttribute> currentStrongholdMonsters;
    private ShootTarget shootTarget;
    private ShootingTrainingView ShootingTrainingView;
    private MonsterSkillBoard monsterSkillBoard;
    private bool isStartChallengeGame = false;

    public List<BattelSkill> battelSkills;

    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        ShootingTrainingController = _baseController as ShootingTrainingController;

    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        ShootingTrainingView = m_Menu as ShootingTrainingView;
        ShootingTrainingView.FadeIn();
    }

    public void InitValue()
    {
        //初始化分数
        score = 0;
        //初始化射击次数
        shootTime = 1;
        if (curMineMonsterData != null) curMineMonsterData = null;
        if (tmpMonster != null) tmpMonster = null;
        if (tmpCurMineMonsterdata != null) tmpCurMineMonsterdata = null;
        if (currentStrongholdMonsters != null) currentStrongholdMonsters.Clear();
        if (battelSkills != null) battelSkills.Clear();
        //if (monsterSkillBoard != null) { AndaDataManager.Instance.RecieveItem(monsterSkillBoard); monsterSkillBoard = null; }
        if (m_Menu != null) { AndaDataManager.Instance.RecieveItem(m_Menu); m_Menu = null; ShootingTrainingView = null; }
        if (currentMine != null) { AndaDataManager.Instance.RecieveItem(currentMine); currentMine = null; }
        if (shootTarget != null) { AndaDataManager.Instance.RecieveItem(shootTarget); shootTarget = null; }
    }


    public void SaveScore(int skillId, int score)
    {
        var skilllist = currentMine.monsterDataValue.playerSkillAttributeList;
        for (int i = 0; i <= skilllist.Count; i++)
        {
            if (skilllist[i].skillID == skillId)
            {
                if (battelSkills == null)
                    battelSkills = new List<BattelSkill>();
                var info = battelSkills.FirstOrDefault(O => O.skillId == skillId);
                if (info == null)
                    battelSkills.Add(new BattelSkill()
                    {
                        skillId = skillId,
                        skillIndex = skilllist[i].skillIndex,
                        value = score,
                    });
                else
                    info.value += score;
                break;
            }
        }
    }

    public void BuildTmpMonster(PlayerMonsterAttribute pma)
    {
        if (tmpMonster != null)
        {
            AndaDataManager.Instance.RecieveItem(tmpMonster);
        }
        tmpCurMineMonsterdata = pma;
        tmpMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(pma.monsterID.ToString());
        ARMonsterSceneDataManager.Instance.currentSceneMonster = tmpMonster;
        tmpMonster.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        tmpMonster.transform.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(tmpMonster.selfPostion);
        tmpMonster.isPlayer = true;
        //tmpMonster.gameObject.SetLayer(ONAME.LayerDeafualt);
    }

    //创建射击靶子
    public void BuildShootTarget()
    {
        //必须在现有宠物的情况下生产靶子
        if (currentMine == null)
            return;
        //创造靶子
        GameObject newItem = Resources.Load<GameObject>("gjp/shoottarget");
        newItem = newItem.Clone();
        newItem.SetTargetActiveOnce(false);
        shootTarget = newItem.GetComponent<ShootTarget>();
        shootTarget.data = this;
        shootTarget.InitValue();
    }
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
    //生成需要射击的宠物
    public void BuildSelfMonster()
    {
        if (currentMine != null) AndaDataManager.Instance.RecieveItem(currentMine);
        currentMine = tmpMonster;
        tmpMonster = null;
    }

    public void SetStartGame(bool isStart)
    {

        isStartChallengeGame = isStart;
       
       
    }
    public void SetStopMonster()
    {
        currentMine.SetControllerState(false);
    }
    public void PlayMineMonster()
    {
        currentMine.DownloadMonsterValue(curMineMonsterData, OTYPE.MonsterStateType.fight);

        currentMine.SetControllerState(true);
    }

    public void SetStrongholdMonsters()
    {
        int strongholdIndex = JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex;
        currentStrongholdMonsters = AndaDataManager.Instance.GetPlayerMonsterAttributeBelongThisStronghold(strongholdIndex);
    }
    public void SetCurrentMineMonsterData()
    {
        curMineMonsterData = tmpCurMineMonsterdata;
    }

    #region Get

    //筛选出等级最高的宠物
    public PlayerMonsterAttribute GetBestMonster()
    {
        int count = currentStrongholdMonsters.Count;
        PlayerMonsterAttribute playerMonsterAttribute = currentStrongholdMonsters[0];
        for (int i = 1; i < count; i++)
        {
            if (currentStrongholdMonsters[i].monsterLevel > playerMonsterAttribute.monsterLevel)
            {
                playerMonsterAttribute = currentStrongholdMonsters[i];
            }
        }
        return playerMonsterAttribute;
    }
    #endregion

}
