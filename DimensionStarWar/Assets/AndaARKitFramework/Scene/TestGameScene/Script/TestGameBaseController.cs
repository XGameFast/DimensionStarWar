using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEngine.UI;

public class TestGameBaseController : MonoBehaviour {

    public enum SelectMonsterID
    {
        昴宿 = 1001,
        翼宿 = 1003,
        毕宿 = 1004,
        柳宿 = 1005,
        氐宿 = 1006,
        角宿 = 1007,
        女宿 = 1008,
        牛宿 = 1009,
        亢宿 = 1010,
        尾宿 = 1011,
    }
    public enum NormallAttackID
    {
        翼宿的普通攻击 = 10003,
        柳宿的普通攻击 = 10005,
        亢宿的普通攻击 = 10010,
    }

    public enum DefenseSkillID
    {
        翼宿的防御技能 = 11003,
        柳宿的防御技能 = 11005,
        亢宿的防御技能 = 11010,

    }
    public enum SpecialSkillID
    {
        翼宿的特殊技能 = 12003,
        柳宿的特殊攻击 = 12005,
        亢宿的特殊技能 = 12010,
    }

    [HideInInspector]
    [SerializeField]
    public Text enemyPower ;
    [HideInInspector]
    [SerializeField]
    public Text minePower;

    [HideInInspector]
    [SerializeField]
    public Text enemyMakePower;
    [HideInInspector]
    [SerializeField]
    public Text mineMakePower;

    public Slider mineMonsterPowerSlider;

    public Slider enemyMonsterPowerSlider;

    [HideInInspector][SerializeField]
    public SelectMonsterID _selectMonsterID = SelectMonsterID.昴宿;


    [HideInInspector][SerializeField]
    public SelectMonsterID _selectEnemyID = SelectMonsterID.亢宿;
    [HideInInspector][SerializeField]
    public int enmeyMaxPower = 600 ;
    [HideInInspector][SerializeField]
    public NormallAttackID enemyNormalSkill = NormallAttackID.亢宿的普通攻击;
    [HideInInspector][SerializeField]
    public DefenseSkillID enemyDefenseSkill = DefenseSkillID.亢宿的防御技能;
    [HideInInspector][SerializeField]
    public SpecialSkillID enemySpecialSkill = SpecialSkillID.翼宿的特殊技能;

    [HideInInspector]
    [SerializeField]
    public bool useCustomSkillArchievemntLimit = false;
    [HideInInspector]
    [SerializeField]
    public int normalSkillLevelCount = 0;
    [HideInInspector]
    [SerializeField]
    public int[] normalSkilArchiRangelValue;


    [HideInInspector]
    [SerializeField]
    public bool useCustomNormalSkillArchi = false;
    [HideInInspector][SerializeField]
    public int enemyNormalSkillArchievment = 10;
    [HideInInspector]
    [SerializeField]
    public bool useCustomDefenseSkillArchi = false;
    [HideInInspector][SerializeField]
    public int enemyDefenseArchievment = 10;
    [HideInInspector]
    [SerializeField]
    public bool useCustomSpecialSkillArchi = false;
    [HideInInspector][SerializeField]
    public int enemySpecialSkillArchievment =10;

    [HideInInspector]
    [SerializeField]
    public bool allowThink = true;
    [HideInInspector]
    [SerializeField]
    public bool allowNormallAttack = true;
    [HideInInspector]
    [SerializeField]
    public bool allowDefense = true;
    [HideInInspector]
    [SerializeField]
    public bool allowSpecialSkill = true;
    [HideInInspector]
    [SerializeField]
    public bool allowMove = true;
    [HideInInspector]
    [SerializeField]
    public bool allowMineMonsterPlayBati = false;

    [SerializeField]
    public bool allowEnemyMonsterPlayBati = false;


    [HideInInspector][SerializeField]
    public Camera GameCamera;

    [HideInInspector][SerializeField]
    public Camera UICamera;

    [HideInInspector][SerializeField]
    public Transform ARWorldTrans;

    [HideInInspector][SerializeField]
    public int playerStrongholdIndex;


    [HideInInspector]
    [SerializeField]
    public int tmpMonsterPower;


    public Transform enemyPoint;
    public Transform minePiont;

    private PlayerMonsterAttribute curMineMonsterAttr;
    private PlayerMonsterAttribute curEnemyMonsterAttr;
    protected MonsterBasic curMineMonster;
    public MonsterBasic enemy;
    private bool isStartGame;
    private Vector3 hitTarget;
    public void Start()
    {
        //ARMonsterSceneDataManager.Instance.ARCamera = ARCamera;
        //ARMonsterSceneDataManager.Instance.currentEnemy = enemy;
        ARMonsterSceneDataManager.Instance.UICamera = UICamera;
        ARMonsterSceneDataManager.Instance.mainCamera = GameCamera;
        ARMonsterSceneDataManager.Instance.aRWorld = ARWorldTrans.GetComponent<ARWorld>();
        ARMonsterSceneDataManager.Instance.aRWorld.arworldScalePercent = 1;
        ARMonsterSceneDataManager.Instance.SetUsedCamera(GameCamera);
    }


    public virtual void BuildMineMonsterAttribute()
    {
         
        curMineMonsterAttr = AndaDataManager.Instance.userData.userMonsterList.FirstOrDefault(s=>s.monsterID == (int)_selectMonsterID);
        curMineMonsterAttr.mosterPower = tmpMonsterPower == 0? curMineMonsterAttr.mosterPower : tmpMonsterPower;
        curMineMonsterAttr.monsterMaxPower = tmpMonsterPower == 0 ? curMineMonsterAttr.mosterPower : tmpMonsterPower;
    }

    public virtual void BuildEnemyMonsterAttribute()
    {
       // curEnemyMonsterAttr = ConvertTool.ConvertToPlayerMonsterAttribute(MonsterGameData.otherPlayerList[0].monsterList.FirstOrDefault(s=>s.monsterID == enemyMonsterIDs));

    }

    public virtual void ClickStartGame()
    {
        Invoke("InvokeStart",1f);
    }

    public virtual void RestartGame()
    {
        InvokeStart();
    }

    private void InvokeStart()
    {
        BuildPlayerControl();
        isStartGame =true;
    }

    public virtual void ClickBuildMonster()
    {
        BuildMineMonsterAttribute();
        curMineMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(curMineMonsterAttr.monsterID.ToString());
        curMineMonster.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        curMineMonster.SetScalePercent(1f);
        curMineMonster.SetInto(minePiont);
       //curMineMonster.transform.position = ARMonsterSceneDataManager.Instance.GetCameraForwardFixPoint(4f);
        curMineMonster.transform.forward =   ARMonsterSceneDataManager.Instance.GetMainCameraForwardYZero();
        curMineMonster.isPlayer=true;
        curMineMonster.UsedSkillAttackedTarget += ListerEnmeyUseSkillPower;
        curMineMonster.MonsterHaeBeenHit += UpdateMineMonsterPower;
        curMineMonster.MonsterDeadEvent += ListenrMonsterDeath;
        // curMineMonster.MonsetCosumeEnergy += CallBackUpdateMineMonsterEP;
        // curMineMonster.gameObject.SetLayer(ONAME.LayerDeafualt);
        ARMonsterSceneDataManager.Instance.currentSceneMonster = curMineMonster;

        curMineMonster.DownloadMonsterValue(curMineMonsterAttr, OTYPE.MonsterStateType.fight);

        curMineMonster.bati = allowMineMonsterPlayBati;

        BuildEnemy();
    }





    public virtual void BuildEnemy()
    {
        MonsterGrowUpAttribute enemyGrowupAttribute = new MonsterGrowUpAttribute
        {
            monsterID = (int)_selectEnemyID ,monsterIndex = 22 ,monsterNickName = "NPC SAMA", rareTypeGrowup =0,
            monsterMaxPower = enmeyMaxPower,monsterCurrentPower = enmeyMaxPower,
            monsterSkillIDList = new List<SkillGrowupAttribute>
            {
                new SkillGrowupAttribute
                {
                    skillID = (int)enemyNormalSkill,skillIndex =1,skillAchievementValue = enemyNormalSkillArchievment,skillNickName = "粒子炮"
                },
                new SkillGrowupAttribute
                {
                    skillID = (int)enemyDefenseSkill,skillIndex =3,skillAchievementValue = enemyDefenseArchievment, skillNickName = "卷土重来"
                },
                new SkillGrowupAttribute
                {
                    skillID = (int)enemySpecialSkill,skillIndex =4,skillAchievementValue = enemySpecialSkillArchievment, skillNickName = "卷土重来2"
                }
            }
        };
   
        curEnemyMonsterAttr = ConvertTool.ConvertToPlayerMonsterAttribute(enemyGrowupAttribute);
        enemy  = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(curEnemyMonsterAttr.monsterID.ToString());
        enemy.isPlayer = false;
       
        enemy.MonsterHaeBeenHit+=UpdateEnemeyMonsterPower;
        enemy.MonsterDeadEvent += ListenrMonsterDeath;
        enemy.UsedSkillAttackedTarget += ListerEnmeyUseSkillPower;
        enemy.transform.SetInto(enemyPoint);
        enemy.DownloadMonsterValue(curEnemyMonsterAttr, OTYPE.MonsterStateType.fight);



        enemy.enmeyMonster.allowThink = allowThink;
       // Debug.Log("allowMove" + allowThink);
        enemy.enmeyMonster.allowNormalAttack = allowNormallAttack;
      //  Debug.Log("allowMove" + allowNormallAttack);
        enemy.enmeyMonster.allowDefnse = allowDefense;
      //  Debug.Log("allowMove" + allowDefense);
        enemy.enmeyMonster.allowBigAttack = allowSpecialSkill;
      //  Debug.Log("allowMove" + allowSpecialSkill);
        enemy.enmeyMonster.allowMove = allowMove;
        //  Debug.Log("allowMove" + allowMove);

        enemy.bati = allowEnemyMonsterPlayBati;
    }

    public virtual void BuildPlayerControl()
    {
       
       


       


        curMineMonster.SetControllerState(true);
        enemy.SetControllerState(true);
 
        //FingerEvent.HoriDrag += CallBackDragEvent;
        //FingerEvent.clickEvent +=CallBackAttack;
    }

    public void CallBackAttack()
    {
        /*if(curMineMonster!=null)
        {
            Debug.Log("Attack!!");
            curMineMonster.ControlChangeSkillFixSkill(0);
            curMineMonster.ControllerToAttak(hitTarget);
        }*/
    }

    public void CallBackDragEvent(int dir)
    {

       /*if (dir == -1)
            dir = 1;
        else if (dir == 1)
            dir = 2;
        //向 右 格挡，向左 技能
        //dir = dir == 0 ? 1 : 2;
        // 格挡 转为 1， 技能转为2
        curMineMonster.ControlChangeSkillFixSkill(dir);
        curMineMonster.ControllerToAttak(hitTarget);
        //强制切回 普通攻击
        curMineMonster.ControlChangeSkillFixSkill(0);*/
    }

    private void Update()
    {
        if(!isStartGame)return;
        OnUpdate();
        //FingerEvent.OnUpdate();
        //hitTarget = ARMonsterSceneDataManager.Instance.FightRayHit();
      
    }

    protected virtual void OnUpdate()
    {
        
    }


    public void UpdateMineMonsterPower(int cur, int max)
    {
        float per = (float)cur/max;
        mineMonsterPowerSlider.value = per;
        minePower.text = cur.ToString();
    }

    public void UpdateEnemeyMonsterPower(int cur,int max)
    {
        float per = (float)cur/max;
        enemyMonsterPowerSlider.value = per;
        enemyPower.text = cur.ToString();
    }

    public void ListerEnmeyUseSkillPower(int _makePower)
    {
        enemyMakePower.text = _makePower.ToString();
    }

    public void ListerMineMonsterUseSkillPower(int _makePower)
    {
        mineMakePower.text = _makePower.ToString();
    }

 
    public void ListenrMonsterDeath(int index,  bool isPlayer)
    {
        curMineMonster.SetControllerState(false);
        enemy.SetControllerState(false);
    }


}
