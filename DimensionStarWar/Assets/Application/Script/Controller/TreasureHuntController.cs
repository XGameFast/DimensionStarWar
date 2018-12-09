using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;
public class TreasureHuntController : BaseController {

    private const int TreasureBoxID = 21000;
    private const string ArrowName = "Arrow00";
    private const string TreasureBox = "TreasureBox";
    private const string FindingTipsEffect = "FindingTipsEffect";
    private const string tips1 = "点击屏幕让小怪兽出动帮你寻找";
    private const string tips2 = "点击屏幕让小怪兽帮你显现物品";
    private const string tips3 = "点击屏幕让小怪兽帮你收取，如果不需要切换攻击技能，催化它!";
    private const string tips4 = "您摧毁了一个物件，您是认真的吗";

    private const float treasurePositionRange = 5;

    private Vector3 treasuerPosition;
    private AndaObjectBasic treasureBoxObj;
    private AndaObjectBasic arrowObj;
    private float triggerLoadTime;
    private List<int> treasureIDList;
    private bool isFoundTreasure = false;
    private bool isFoundTreasureRange = false;
    private bool needBuildTresure = false;
    private MonsterBasic _mMonster = null;


    public TreasureMenu treasureMenu;
    private MonsterBasic m_Monster
    {
        get
        {
            if (_mMonster == null)
            {
                _mMonster = ARMonsterSceneDataManager.Instance.currentSceneMonster;
            }
            return _mMonster;
        }
    }
    public override void StartController()
    {
        base.StartController();
      
        arWorld.SetMainCameraTrans(false,OTYPE.SceneTranslationType.Galitch, FinishDimensionScene);
       

        
    }
    private void FinishDimensionScene(bool isOpen)
    {//setTres

        treasureMenu.InitMenu();
        treasureMenu.DidplayAlpha();
        BuildMyMonster(1, 1, 1000);
        ResetTreasurePostion();
    }

    public override void EndController()
    {
        base.EndController();
    }

    public override void InitValue()
    {
        base.InitValue();
        isFoundTreasure = false;
        treasuerPosition = new Vector3();
        treasureIDList = new List<int>();
       if (m_Monster != null)
        {
            AndaDataManager.Instance.DestoryObj(m_Monster);
           
        }
        triggerLoadTime = 0;
    }
   



    public void OpenTreasureHunScene()
    {

    }

    private void ResetTreasurePostion()
    {
        isFoundTreasureRange = false;
        isFoundTreasure = false;
        if (m_Monster != null)
        {
            ((TreasureMonster)m_Monster.playerMonster).StartPlayerControll();
        }
        CallSeverGetTreasureInfomation();
    }


    public void BuildMyMonster(int userIndex, int monsterIndex, int monsterID)
    {
        if (m_Monster == null)
        {
          
            AndaObjectBasic aob = AndaDataManager.Instance.InstantiateMonster("1000");
            aob.transform.SetParent(arWorld.transform);
            aob.transform.position = arWorld.transform.position;

            MonsterBasic mb = (MonsterBasic)aob;
            mb.MonsetBuiledSkill = treasureMenu.skillbar.BuildPlayerSkillList;
            mb.MonsterChangeSkill = treasureMenu.skillbar.UpdatePlayerCurrentSkillIndex;
            mb.MonsterUseSkill = treasureMenu.skillbar.UpdateLoadSkillTime;

            mb.MonsterHaeBeenHit = treasureMenu.monsterInformaionBar.UpdateBlood;
            mb.MonsetCosumeEnergy = treasureMenu.monsterInformaionBar.UpdateEnergy;

            //mb.DownloadMonsterValue(userIndex, monsterID, monsterIndex /*临时给个1*/, MonsterState.PlayType.treasure);
            ARMonsterSceneDataManager.Instance.currentSceneMonster = mb;
            ((TreasureMonster)mb.playerMonster).MonsterFindTargetPoint = SureAboutTreasurePoint;
        }
        treasureMenu.monsterInformaionBar.SetFollowTarget(m_Monster.transform);
    }

    //向服务器要宝藏数据
    private void CallSeverGetTreasureInfomation()
    {
        AndaDataManager.Instance.GetTreasureHurnResult(ListenerTreasureInfomation);
    }
    //构建宝藏位置
    private void BuildTreasurePosition()
    {
        Vector2 p = Random.insideUnitCircle * 5f;
        Vector2 pos =  p.normalized * (3.25f+ p.magnitude);
        Vector3 pos2 = arWorld.transform.position + new Vector3(pos.x,0, pos.y);
        treasuerPosition = pos2;
        BuildTreasure(treasuerPosition);
    }
    //设置宝藏位置和初始化
    private void BuildTreasure(Vector3 pos)
    {
        if (treasureBoxObj == null)
        {
            treasureBoxObj = AndaDataManager.Instance.InstantiateOtherObj(TreasureBox);
        } else
        {
            Debug.Log("物件不为空啊");
        }
        TreasureBox tb = treasureBoxObj.GetComponent<TreasureBox>();
        tb.HasBeenFoundEvent = FoundTreaure;
        tb.HasBeenPickUpEvent = PickUpTreasure;
        tb.HasBeenDestroyEvent = GiveUpTreasure;

        tb.DownloadValue(TreasureBoxID,true);
        treasureBoxObj.transform.position = pos;


    }


    //保持监听玩家与宝藏的位置
    private void CheckPlayerWithTreasureDirectionAndDistance()
    {
        //if (!m_Monster.isMoving) return;
        Vector3 cameraPos = ARMonsterSceneDataManager.Instance.GetCameraPositionWihtSelfY(treasuerPosition.y);
        var withTreasureDir = treasuerPosition - m_Monster.selfPostion;

        var angle = Vector3.Angle(ARMonsterSceneDataManager.Instance.arCameraForward, withTreasureDir);

        var distance = Vector3.Distance(cameraPos, treasuerPosition);
        Vector3 screenPos = Camera.main.WorldToScreenPoint(withTreasureDir);
        if (distance < treasurePositionRange && ARMonsterSceneDataManager.Instance.mainCamera.transform.IsInFront(treasuerPosition) )
        {
            FoundTreasureRange();
        }
        else
        {
            TriggerTips(angle, distance);
        }
    }
    
    //反馈
    private void TriggerTips(float angle, float distance)
    {
        float value = 1;
        if (angle < 90)
        {
            float dir = angle / 90;
            if (dir > 0.75) dir = 0.75f;
            else if (dir < 0.25) dir = 0.25f;

            float dis = distance / 10;

            if (dis > 0.75f) dis = 0.75f;
            else if (dis < 0.25) dis = 0.25f;

            value = dis + dir;
            
            //Debug.Log("v" + value);
            if (Time.time - triggerLoadTime > value)
            {
                var t = AndaDataManager.Instance.InstantiateOtherObj(FindingTipsEffect);
                t.transform.position = m_Monster.transform.position;
                AndaAudioManager.Instance.PlayTreasureTipsSounds();
                triggerLoadTime = Time.time;
            }

        }
    }

    //确定了宝贝的范围
    private void FoundTreasureRange()
    {
        isFoundTreasureRange = true;
        SetTipsContent(tips1);
    }
    //让宠物自主寻找
    private void LetMonsterGotoFindTreasure()
    {
       ((TreasureMonster)m_Monster.playerMonster).AutoFindTarget(treasuerPosition);
    }
    //宠物已经确立定宝藏的位置
    private void SureAboutTreasurePoint(bool isFound)
    {
        if (isFound)
        {
            SetTipsContent(tips2);
            BuildArrow();
        }
    }
    //构建宝藏位置的箭头
    private void BuildArrow()
    {
        arrowObj = AndaDataManager.Instance.InstantiateOtherObj(ArrowName);
        arrowObj.transform.position = treasuerPosition;

        arrowObj.transform.forward = ARMonsterSceneDataManager.Instance.GetCameraPositionWihtSelfY(arrowObj.selfPosY) - arrowObj.selfPostion;
    }

    //宝藏显现
    private void FoundTreaure()
    {
        DestroyArrow();
        SetTipsContent(tips3);
    }
    //设置提示内容
    private void SetTipsContent(string content)
    {
        treasureMenu.SetTipsContent(content);
        treasureMenu.ClickOpenTips();
    }
    //消除箭头
    private void DestroyArrow()
    {
        if (arrowObj != null)
        {
            AndaDataManager.Instance.DestoryObj(arrowObj);
        }
    }



    
   
    
    private Vector2 startDragPosition;
    public override void OnUpdate()
    {
        base.OnUpdate();

        if (treasureBoxObj != null && !isFoundTreasureRange)
        {
            CheckPlayerWithTreasureDirectionAndDistance();
        }
        
        if (isFoundTreasureRange && Input.GetMouseButtonDown(0) && !isFoundTreasure)
        {
            LetMonsterGotoFindTreasure();
            isFoundTreasure = true;
        }
        
        //更新界面
        if (treasureMenu != null)
        {
            treasureMenu.OnUpdate();
        }
    }


    #region ClickEvent

    //返回占星庭
    private void ClickTreasureToAsrologyScene()
    {

    }
    #endregion

    #region 监听事件
    private void PickUpTreasure()
    {
        //Debug.Log("Anda:获取一个物件");

        SetTipsContent("获取一个物件");
        //---重新获取一个
        ResetTreasurePostion();
    }

    //放弃宝藏
    private void GiveUpTreasure()
    {
        DestroyArrow();
        SetTipsContent(tips4);
        //Debug.Log("Anda:放弃了一个物件");

        ResetTreasurePostion();
    }

    //更新玩家本地额数据
    private void UpdateUserLocalData()
    {

    }
    //监听从服务器拿到的数据
    private void ListenerTreasureInfomation(NetworkReturnData _networkReturnData)
    {
        List<int> objID = JsonMapper.ToObject<List<int>>(_networkReturnData.content);
        BuildTreasurePosition();
     
    }

    //监听是否宝藏是否已经入玩家 的数据库
    private void ListernerTreasureSetUp(NetworkReturnData _networkReturnData)
    {

    }
    #endregion

}
