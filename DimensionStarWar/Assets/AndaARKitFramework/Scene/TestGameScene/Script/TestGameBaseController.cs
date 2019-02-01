using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEngine.UI;

public class TestGameBaseController : MonoBehaviour {

    public enum SelectMonsterID
    {
        //昴宿 = 1001,
        //翼宿 = 1003,
        毕宿 = 1004,
        柳宿 = 1005,
        氐宿 = 1006,
        角宿 = 1007,
       // 女宿 = 1008,
       // 牛宿 = 1009,
        亢宿 = 1010,
        尾宿 = 1011,
    }
    public enum NormallAttackID
    {
        //翼宿的普通攻击 = 10003,
        毕宿的普通攻击 = 10004,
        柳宿的普通攻击 = 10005,
        氐宿的普通攻击 = 10006,
        角宿的普通攻击 = 10007,
       // 女宿的普通攻击 = 10008,
       // 牛宿的普通攻击 = 10009,
        亢宿的普通攻击 = 10010,
        尾宿的普通攻击 = 10011,
    }

    public enum DefenseSkillID
    {
        //翼宿的防御技能 = 11003,
        毕宿的防御攻击 = 11004,
        柳宿的防御技能 = 11005,
        氐宿的防御技能 = 11006,
        角宿的防御技能 = 11007,
        // 女宿的防御技能 = 10008,
        // 牛宿的防御技能 = 10009,
        亢宿的防御技能 = 11010,
        尾宿的防御技能 = 11011,
    }
    public enum SpecialSkillID
    {
        //翼宿的特殊技能 = 12003,
        毕宿的特殊攻击 = 12004,
        柳宿的特殊攻击 = 12005,
        氐宿的特殊攻击 = 12006,
        角宿的特殊攻击 = 12007,
        //女宿的特殊技能 = 12008,
        //牛宿的特殊技能 = 12009,
        亢宿的特殊技能 = 12010,
        尾宿的特殊技能 = 12011,
    }


    [SerializeField]//必须要加
    public bool showSecneConfiger = false;

    [SerializeField]//必须要加
    public bool showEditorMonsterPower = false;
    [SerializeField]//必须要加
    public bool showEditorNormalSkill = false;
    [SerializeField]//必须要加
    public bool showEditorDefenseSkill = false;
    [SerializeField]//必须要加
    public bool showEditorSpecialSkill = false;
    [SerializeField]//必须要加
    public bool showEnemyMonsterState = false;

    [SerializeField]//必须要加
    public bool mine_showEditorNormalSkill = false;
    [SerializeField]//必须要加
    public bool mine_showEditorDefenseSkill = false;
    [SerializeField]//必须要加
    public bool mine_showEditorSpecialSkill = false;





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
    public SelectMonsterID _selectMonsterID = SelectMonsterID.毕宿;


    [HideInInspector][SerializeField]
    public SelectMonsterID _selectEnemyID = SelectMonsterID.毕宿;



    [HideInInspector]
    [SerializeField]
    public int enmeyMaxPower = 600;

    [HideInInspector][SerializeField]
    public int enemyCurrentPower = 600 ;

    [HideInInspector]
    [SerializeField]
    public int mineMaxPower;

    [HideInInspector]
    [SerializeField]
    public int mineCurrentPower;


    [HideInInspector][SerializeField]
    public NormallAttackID enemyNormalSkill = NormallAttackID.毕宿的普通攻击;
    [HideInInspector][SerializeField]
    public DefenseSkillID enemyDefenseSkill = DefenseSkillID.毕宿的防御攻击;
    [HideInInspector][SerializeField]
    public SpecialSkillID enemySpecialSkill = SpecialSkillID.毕宿的特殊攻击;


    #region 敌方星宿的技能配置

    [HideInInspector]
    [SerializeField]//必须要加
    public int normalSkillMaxPower = 0;
    [HideInInspector]
    [SerializeField]//必须要加
    public int defenseSkillMaxPower = 0;
    [HideInInspector]
    [SerializeField]//必须要加
    public int speciallSkillMaxPower = 0;


    [HideInInspector]
    [SerializeField]
    public bool useCustomNormalSkillPower = false;
    [HideInInspector]
    [SerializeField]
    public int normalSkillPower = 20;
    [HideInInspector]
    [SerializeField]
    public bool useCustomSkillArchievemntLimit = false;
    [HideInInspector]
    [SerializeField]
    public int normalSkillLevelCount = 0;
    [HideInInspector]
    [SerializeField]
    public Vector2Int[] normalSkilArchiRangelValue;






    [HideInInspector]
    [SerializeField]
    public bool useCustomDefnseSkillPower = false;
    [HideInInspector]
    [SerializeField]
    public int denfseSkillPower = 20;
    [HideInInspector]
    [SerializeField]
    public bool useDefenseSkillArchievemntLimit = false;
    [HideInInspector]
    [SerializeField]
    public int defenseSkillLevelCount = 0;
    [HideInInspector]
    [SerializeField]
    public Vector2Int[] defenseSkilArchiRangelValue;

    [HideInInspector]
    [SerializeField]
    public bool useCustomSpecialSkillPower = false;
    [HideInInspector]
    [SerializeField]
    public int specialSkillPower = 20;
    [HideInInspector]
    [SerializeField]
    public bool useSpecialSkillArchievemntLimit = false;
    [HideInInspector]
    [SerializeField]
    public int specialSkillLevelCount = 0;
    [HideInInspector]
    [SerializeField]
    public Vector2Int[] specialSkilArchiRangelValue;


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

    #endregion

    #region 我方星宿的技能配置

    [HideInInspector]
    [SerializeField]//必须要加
    public int mine_normalSkillMaxPower = 0;
    [HideInInspector]
    [SerializeField]//必须要加
    public int mine_defenseSkillMaxPower = 0;
    [HideInInspector]
    [SerializeField]//必须要加
    public int mine_speciallSkillMaxPower = 0;


    [HideInInspector]
    [SerializeField]
    public bool mine_useCustomNormalSkillPower = false;
    [HideInInspector]
    [SerializeField]
    public int mine_normalSkillPower = 20;
    [HideInInspector]
    [SerializeField]
    public bool mine_useCustomNormalSkillArchievemntLimit = false;
    [HideInInspector]
    [SerializeField]
    public int mine_normalSkillLevelCount = 0;
    [HideInInspector]
    [SerializeField]
    public Vector2Int[] mine_normalSkilArchiRangelValue;


    [HideInInspector]
    [SerializeField]
    public bool mine_useCustomDefnseSkillPower = false;
    [HideInInspector]
    [SerializeField]
    public int mine_denfseSkillPower = 20;
    [HideInInspector]
    [SerializeField]
    public bool mine_useDefenseSkillArchievemntLimit = false;
    [HideInInspector]
    [SerializeField]
    public int mine_defenseSkillLevelCount = 0;
    [HideInInspector]
    [SerializeField]
    public Vector2Int[] mine_defenseSkilArchiRangelValue;

    [HideInInspector]
    [SerializeField]
    public bool mine_useCustomSpecialSkillPower = false;
    [HideInInspector]
    [SerializeField]
    public int mine_specialSkillPower = 20;
    [HideInInspector]
    [SerializeField]
    public bool mine_useSpecialSkillArchievemntLimit = false;
    [HideInInspector]
    [SerializeField]
    public int mine_specialSkillLevelCount = 0;
    [HideInInspector]
    [SerializeField]
    public Vector2Int[] mine_specialSkilArchiRangelValue;

    [HideInInspector]
    [SerializeField]
    public bool mine_useCustomNormalSkillArchi = false;
    [HideInInspector]
    [SerializeField]
    public int mine_NormalSkillArchievment = 10;
    [HideInInspector]
    [SerializeField]
    public bool mine_useCustomDefenseSkillArchi = false;
    [HideInInspector]
    [SerializeField]
    public int mine_DefenseArchievment = 10;
    [HideInInspector]
    [SerializeField]
    public bool mine_useCustomSpecialSkillArchi = false;
    [HideInInspector]
    [SerializeField]
    public int mine_SpecialSkillArchievment = 10;

    #endregion

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

    public Transform enemyPoint;
    public Transform minePiont;

    private PlayerMonsterAttribute curMineMonsterAttr;
    private PlayerMonsterAttribute curEnemyMonsterAttr;
    protected MonsterBasic curMineMonster;
    public MonsterBasic enemy;
    private bool isStartGame;

    private bool isBuildMonster = false;
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
        curMineMonsterAttr.mosterPower = mineCurrentPower == 0? curMineMonsterAttr.mosterPower : mineCurrentPower;
        curMineMonsterAttr.monsterMaxPower = mineCurrentPower == 0 ? curMineMonsterAttr.mosterPower : mineCurrentPower;
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
        if(isBuildMonster)return;
        isBuildMonster = true;
        BuildMineMonsterAttribute();
        curMineMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(curMineMonsterAttr.monsterID.ToString());
        curMineMonster.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        curMineMonster.SetScalePercent(1f);
        curMineMonster.SetInto(minePiont);
       //curMineMonster.transform.position = ARMonsterSceneDataManager.Instance.GetCameraForwardFixPoint(4f);
        curMineMonster.transform.forward =   ARMonsterSceneDataManager.Instance.GetMainCameraForwardYZero();
        curMineMonster.isPlayer=true;
        curMineMonster.UsedSkillAttackedTarget += ListerMineMonsterUseSkillPower;
        curMineMonster.MonsterHaeBeenHit += UpdateMineMonsterPower;
        curMineMonster.MonsterDeadEvent += ListenrMonsterDeath;
     
        ARMonsterSceneDataManager.Instance.currentSceneMonster = curMineMonster;

        curMineMonster.DownloadMonsterValue(curMineMonsterAttr, OTYPE.MonsterStateType.fight);

        curMineMonster.bati = allowMineMonsterPlayBati;

        //判断是否需要自己的使用自定普通攻击数值
        if(mine_useCustomNormalSkillPower)
        {
            curMineMonster.monsterDataValue.playerSkillAttributeList[1].skillPower = mine_normalSkillPower;
        }else
        {
            if(mine_useCustomNormalSkillArchievemntLimit)
            {
                curMineMonster.monsterDataValue.playerSkillAttributeList[1].skillPower = AndaDataManager.Instance.GetSkillPower(mine_normalSkilArchiRangelValue,mine_NormalSkillArchievment);
            }
        }

        if(mine_useCustomDefnseSkillPower)
        {
            curMineMonster.monsterDataValue.playerSkillAttributeList[0].skillPower = mine_denfseSkillPower;
        }else
        {
            if (mine_useCustomNormalSkillArchievemntLimit)
            {
                curMineMonster.monsterDataValue.playerSkillAttributeList[0].skillPower = AndaDataManager.Instance.GetSkillPower(mine_defenseSkilArchiRangelValue, mine_DefenseArchievment);
            }
        }

        if(mine_useCustomSpecialSkillPower)
        {
            curMineMonster.monsterDataValue.playerSkillAttributeList[2].skillPower = mine_specialSkillPower;
        }else
        {
            if (mine_useSpecialSkillArchievemntLimit)
            {
                curMineMonster.monsterDataValue.playerSkillAttributeList[2].skillPower = AndaDataManager.Instance.GetSkillPower(mine_specialSkilArchiRangelValue, mine_SpecialSkillArchievment);
            }
        }

        BuildEnemy();
    }





    public virtual void BuildEnemy()
    {
        MonsterGrowUpAttribute enemyGrowupAttribute = new MonsterGrowUpAttribute
        {
            monsterID = (int)_selectEnemyID ,monsterIndex = 22 ,monsterNickName = "NPC SAMA", rareTypeGrowup =0,
            monsterMaxPower = enemyCurrentPower,monsterCurrentPower = enemyCurrentPower,
            monsterSkillIDList = new List<SkillGrowupAttribute>
            {
                new SkillGrowupAttribute
                {
                    skillID = 10000+((int)_selectEnemyID - 1000),skillIndex =1,skillAchievementValue = enemyNormalSkillArchievment,skillNickName = "粒子炮"
                },
                new SkillGrowupAttribute
                {
                    skillID = 11000+((int)_selectEnemyID - 1000), skillIndex =3,skillAchievementValue = enemyDefenseArchievment, skillNickName = "卷土重来"
                },
                new SkillGrowupAttribute
                {
                    skillID = 12000+((int)_selectEnemyID - 1000),skillIndex =4,skillAchievementValue = enemySpecialSkillArchievment, skillNickName = "卷土重来2"
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



        //判断是否需要自己的使用自定普通攻击数值
        if (useCustomNormalSkillPower)
        {
            enemy.monsterDataValue.playerSkillAttributeList[1].skillPower = normalSkillPower;
        }
        else
        {
            if (useCustomSkillArchievemntLimit)
            {
                enemy.monsterDataValue.playerSkillAttributeList[1].skillPower = AndaDataManager.Instance.GetSkillPower(normalSkilArchiRangelValue, enemyNormalSkillArchievment);
            }
        }

        if (useCustomDefnseSkillPower)
        {
            enemy.monsterDataValue.playerSkillAttributeList[0].skillPower = denfseSkillPower;
        }
        else
        {
            if (useDefenseSkillArchievemntLimit)
            {
                enemy.monsterDataValue.playerSkillAttributeList[0].skillPower = AndaDataManager.Instance.GetSkillPower(defenseSkilArchiRangelValue, enemyDefenseArchievment);
            }
        }

        if (useCustomSpecialSkillPower)
        {
            enemy.monsterDataValue.playerSkillAttributeList[2].skillPower = specialSkillPower;
        }
        else
        {
            if (useSpecialSkillArchievemntLimit)
            {
                enemy.monsterDataValue.playerSkillAttributeList[2].skillPower = AndaDataManager.Instance.GetSkillPower(specialSkilArchiRangelValue, enemySpecialSkillArchievment);
            }
        }




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
