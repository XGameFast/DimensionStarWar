using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FightGameController : BaseController {

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

    private FightSceneDataValue fightDataValue;
    private FightGameInterface fightGameInterface;
    private FightGameEventCenter fightGameEventCenter;

    public override void StartController()
    {
        base.StartController();
        BuildComponment();
        BuildDataValue();
        
        SetGameScene();
    }

    public override void EndController()
    {
        base.EndController();
        ClearData();
        ClearCompoment();
    }

    private void ClearCompoment()
    {
        
    }

    /// <summary>
    /// 构建基础组件
    /// </summary>
    private void BuildComponment()
    {
        fightDataValue = new FightSceneDataValue();
        fightGameInterface = new FightGameInterface();
        fightGameEventCenter = new FightGameEventCenter();
    }
    /// <summary>
    /// 构建数据
    /// </summary>
    private void BuildDataValue()
    {
        fightDataValue.BuildData(this ,ARMonsterSceneDataManager.Instance.currentEnemySHTypeValue,
            ARMonsterSceneDataManager.Instance.currentPlayerSHTypeValue);
        fightGameInterface.BuildData(this, fightMenu);
        fightGameEventCenter.BuildData(this);
    }

    private void ClearData()
    {
        fightDataValue.ClearData();
        fightGameEventCenter.ClearData();
    }

    /// <summary>
    /// 根据战斗模式，进行场景构建
    /// </summary>
    private void SetGameScene()
    {
        switch (fightDataValue.getEnemySHFightType)
        {
            case OTYPE.GameFightType.chanllenge:
                break;
            case OTYPE.GameFightType.protect:
                arWorld.SetCameraToReadworldTexture();
                break;
        }
        arWorld.SetMainCameraTrans(false, OTYPE.SceneTranslationType.Galitch,FinishBuildGameScene,false);
    }
    /// <summary>
    /// 构建挑战模式场景
    /// </summary>
    private void BuildChanllengeGameScene()
    {

    }

    /// <summary>
    /// 构建据点保卫场景
    /// </summary>
    private void BuildProtectGameScene()
    {

    }

    private void OpenWorldType(OTYPE.WolrdType wolrdType)
    {
        //arWorld.SetWorld(wolrdType, FinishBuildGameScene);
    }

    /// <summary>
    /// 战斗场景已经构建完成了
    /// </summary>
    private void FinishBuildGameScene(bool isFinish)
    {
        //构建敌方单位
        StartBuildEnemy();
        //构建我方单位
        StartBuildPlayerMonster();
        //怪兽怪兽选择面板
        SetPlayerMonsterSeleectBar();

        StartGame();
    }

    private void StartGame()
    {
        fightDataValue.SetIsGaming(true);
        
        fightDataValue.SetCurrentMonsterActive(true,true);
        fightDataValue.SetCurrentMonsterActive(false, true);
    }
    private void GameOver()
    {
        Debug.Log("GameOver");
        callbackFinishController(ONAME.MAPCONCTROLLER);
    }

    private void SetPlayerMonsterSeleectBar()
    {
        fightGameInterface.BuildMonsterListIcon(fightDataValue.GetMonsterDataList(true));
    }

    private void StartBuildEnemy()
    {
        SelectMonster(0, false);
        
    }
    private void StartBuildPlayerMonster()
    {
        SelectMonster(0, true);
    }
    #region 功能

    public void SelectMonster(int selecltIndex, bool isPlayer)
    {
        //
        if (!fightDataValue.CheckMonsterCanPlay(selecltIndex, isPlayer))
        {
            Debug.Log("怪兽体力过低，不能上场");
            return;
        }
        //关闭当前的英雄
        fightDataValue.SetCurrentMonsterDisplay(isPlayer,false);
        fightDataValue.SetCurrentMonsterActive(isPlayer, false);
        fightDataValue.SetCurrentMonster(selecltIndex, isPlayer);
        fightDataValue.UpdateMonsterPosition(isPlayer);
        fightDataValue.SetCurrentMonsterDisplay(isPlayer, true);
        //激活
        fightDataValue.SetCurrentMonsterActive(isPlayer, fightDataValue.IsGaming);
        //设置皮肤
        fightDataValue.SetMonsterNormalSkin(isPlayer);
        //每次上场都会消耗体力
        fightDataValue.SetCurrentMonsterConsuambleStrength(isPlayer);
        //显示怪兽的数据
        fightDataValue.SetDiplayMonsterInformationBar(isPlayer);

        fightGameEventCenter.BuildMonsterEvent(fightDataValue.GetCurMonsterObj(isPlayer));
        //---如果是玩家，则设置技能面板
        if (isPlayer)
        {
            fightGameInterface.SwitchSetMonsterSkill(fightDataValue.getPlayerM_Obj);
        }
    }
    
    #endregion


    #region 数据分析
    public void MonsterDeathEvent(bool isPlayer)
    {
        int selectIndex = fightDataValue.CheckMonsterLive(isPlayer);
        if (selectIndex == -1)
        {
            //GameOver();
            Invoke("GameOver", 5);
        }
        else
        {
            SelectMonster(selectIndex, isPlayer);
        } 
    }

    #endregion

    public override void OnUpdate()
    {
        base.OnUpdate();
        if (fightGameInterface != null)
        {
            fightGameInterface.OnUpdate();
        }
    }
}
