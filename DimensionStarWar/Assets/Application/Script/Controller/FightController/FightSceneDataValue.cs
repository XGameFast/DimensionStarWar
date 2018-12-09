using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class FightSceneDataValue
{

    /*
     * Dev :AndaChen 
     * Date: 2018.5.2
     * 
     * 战斗模块的的数据脚本。
     * 这个处理记录战斗过程的数据
     */

    private GameFightTypeValue enemyFightTypeValue;
    private GameFightTypeValue playerFightTypeValue;

    private FightGameController ft_ctr;
    private List<PlayerMonsterAttribute> enemyMonsterDataList;
    private List<PlayerMonsterAttribute> playerMonsterDataList;
    private MonsterBasic currentEnemyObj;
    private MonsterBasic currentPlayerObj;

    private List<MonsterBasic> enmeyMonsterObjList;
    private List<MonsterBasic> playerMonsterObjList;

    private int userIndex;
    private bool isGaming = false;

    #region 快速获取数据
    public OTYPE.GameFightType getEnemySHFightType
    {
       get { return enemyFightTypeValue.fightType; }
    }
    public OTYPE.WolrdType getEnemySHWoldType
    {
        get { return enemyFightTypeValue.wolrdType; }
    }
    public StrongholdBaseAttribution getEnemySHInfo
    {
        get { return enemyFightTypeValue.sba; }
    }
    

    public List<int> getEnemySHMonsterIndexList
    {
        get { return enemyFightTypeValue.sba.fightMonsterListIndex; }
    }
    public StrongholdBaseAttribution getPlayerSHInfo
    {
        get { return playerFightTypeValue.sba; }
    }
    public List<int> getPlayerSHMonsterIndexList
    {
        get { return playerFightTypeValue.sba.fightMonsterListIndex; }
    }

    public bool IsGaming
    {
        get { return isGaming; }
    }

    public MonsterBasic getPlayerM_Obj
    {
        get { return currentPlayerObj; }
    }
    public MonsterBasic getEnmeyM_Obj
    {
        get { return currentEnemyObj; }
    }

    #endregion

    public void BuildData(FightGameController _ftCtr, GameFightTypeValue _enemyFightTypeVlaue,GameFightTypeValue _playerFightTypeValue)
    {
        StartInitValue();
        ft_ctr = _ftCtr;
        enemyFightTypeValue = _enemyFightTypeVlaue;
        playerFightTypeValue = _playerFightTypeValue;

        //构建我方玩家怪兽数据
        BuildMonsterData(true);
        //构建地方军玩家怪兽数据
        BuildMonsterData(false);
    }

    public void SetIsGaming(bool _isGaming)
    {
        isGaming = _isGaming;
    }

    /// <summary>
    /// 最开始清理一遍
    /// </summary>
    public void StartInitValue()
    {
        InitValue();
    }
    public void ClearData()
    {
        InitValue();

    }
    /// <summary>
    /// 初始化数据
    /// </summary>
    private void InitValue()
    {

        enemyFightTypeValue = new GameFightTypeValue();
        playerFightTypeValue = new GameFightTypeValue();
        InitMonsterData(ref playerMonsterDataList);
        InitMonsterData(ref enemyMonsterDataList);
        InitMonsterObjData(ref playerMonsterObjList);
        InitMonsterObjData(ref enmeyMonsterObjList);
    }

    

    #region 初始化 细节

    private void InitMonsterData(ref List<PlayerMonsterAttribute> monsterdataList)
    {
        if (monsterdataList == null)
            monsterdataList = new List<PlayerMonsterAttribute>();
        else
            monsterdataList.Clear();
    }
    private void InitMonsterObjData(ref List<MonsterBasic> monsterObjList)
    {
        if (monsterObjList == null)
            monsterObjList = new List<MonsterBasic>();
        else
        {
            foreach (var go in monsterObjList)
                go.DestroyByAndaDataManager();
        }
    }

    #endregion

    #region 对怪兽进行一些调整

    public void SetMonsterNormalSkin(bool isPlayer)
    {
        if (isPlayer)
        {
            currentPlayerObj.SkinNormal();
        }
        else
        {
            currentEnemyObj.SkinNormal();
        }
    }

    public void SetDiplayMonsterInformationBar(bool isPlayer)
    {
        if (isPlayer)
        {
            currentPlayerObj.monsterInfo.BuildFightInfoBar();
        }
        else
        {
            currentEnemyObj.monsterInfo.BuildFightInfoBar();
        }
    }

    #endregion


    #region 添加怪兽数据


    private void BuildMonsterData(bool isPlayer)
    {
        AddMonsterDataList(isPlayer);
    }
    public void AddMonsterDataList(bool isPlayer)
    {
        if (isPlayer)
        {
            playerMonsterDataList.AddRange(GetMonsterDataList(isPlayer));
        }
        else
        {
            enemyMonsterDataList.AddRange(GetMonsterDataList(isPlayer));
        }
    }
    public void AddMonsterObj(MonsterBasic obj , bool isPlayer)
    {

        if (isPlayer)
        {
            playerMonsterObjList.Add(obj);
        }
        else
        {
            enmeyMonsterObjList.Add(obj);
        }
    }
    
    public void SetCurrentMonster(int selectIndex ,bool isPlayer)
    {
        PlayerMonsterAttribute pma = GetMonsterData(selectIndex, isPlayer);
        MonsterBasic mb = GetNextMonster(pma,isPlayer);
        if (isPlayer)
        {
            currentPlayerObj = mb;
            ARMonsterSceneDataManager.Instance.currentSceneMonster = currentPlayerObj;
        }
        else currentEnemyObj = mb;
    }
    public void SetCurrentMonsterDisplay(bool isPlayer , bool isDisplay)
    {
        if (isPlayer)
        {
            if (currentPlayerObj == null) return;
            currentPlayerObj.SetTargetActiveOnce(isDisplay);
           
        }
        else
        {
            if (currentEnemyObj == null) return;
            currentEnemyObj.SetTargetActiveOnce(isDisplay);
        }
    }

    public void SetCurrentMonsterActive(bool isPlayer ,bool isActive)
    {
        if (isPlayer)
        {
            if (currentPlayerObj == null) return;
            currentPlayerObj.SetControllerState(isActive);
        }
        else
        {
            if (currentEnemyObj == null) return;
            currentEnemyObj.SetControllerState(isActive);
        }
    }

    public void SetCurrentMonsterConsuambleStrength(bool isPlayer)
    {
        if (isPlayer)
        {
            if (currentPlayerObj == null) return;
            currentPlayerObj.ControllerConsumeStrength();
        }
        else
        {
            if (currentEnemyObj == null) return;
            currentEnemyObj.ControllerConsumeStrength();
        }
    }

    #endregion

    #region 跟新数据
    public void UpdateMonsterPosition(bool isPlayer)
    {
        if (isPlayer)
        {
            currentPlayerObj.selfPostion = GetSetPoint(isPlayer);
        }
        else
        {
            //currentEnemyObj.transform.forward = ARMonsterSceneDataManager.Instance.
            currentEnemyObj.selfPostion = GetSetPoint(isPlayer);
        }
    }
    #endregion

    #region 获取数据
    public PlayerMonsterAttribute GetMonsterData(int selectIndex , bool isPlayer)
    {
        if (isPlayer)
        {
            return playerMonsterDataList[selectIndex];
        }
        else
        {
            return enemyMonsterDataList[selectIndex];
        } 
    }



    public MonsterBasic GetNextMonster(PlayerMonsterAttribute pma, bool isPlyer)
    {
        bool needBuild = !CheckMonsterIsBuild(pma, isPlyer);// 这个返回的是判断是否已经建立该据点，所以需要 反一下，已经建立的 needBuild = FALSE, 否则 needbuild = true
        if (needBuild) return BuildMonster(pma,isPlyer);
        else return GetMonsterObj(pma, isPlyer);
    }

    public List<PlayerMonsterAttribute> GetMonsterDataList(bool isPlayaer)
    {
        List<PlayerMonsterAttribute> list = new List<PlayerMonsterAttribute>();
        if (isPlayaer)
        {
            foreach (var go in getPlayerSHMonsterIndexList)
            {
                list.Add(AndaDataManager.Instance.GetPlayerMonsterAttribute(go,getPlayerSHInfo.hostIndex, getPlayerSHInfo.hostType));
            }
        }
        else
        {
            foreach (var go in getEnemySHMonsterIndexList)
            {
                list.Add(AndaDataManager.Instance.GetPlayerMonsterAttribute(go,getEnemySHInfo.hostIndex, getEnemySHInfo.hostType));
            }
        }
        return list;
    }

    public MonsterBasic GetCurMonsterObj(bool isPlayer)
    {
        if (isPlayer)
        {
            return currentPlayerObj? currentPlayerObj:null;
        }
        else
        {
            return currentEnemyObj ? currentEnemyObj : null;
        }
    }
    
    #endregion


    #region 计算一些数据
    public Vector3 GetSetPoint(bool isPlayer)
    {
        if (isPlayer)
        {
            return ARMonsterSceneDataManager.Instance.GetCameraForwardPoint(1.5f);
        }
        else
        {
            return ARMonsterSceneDataManager.Instance.GetCameraForwardPoint(4f);
        }
    }

    public bool CheckMonsterIsBuild(PlayerMonsterAttribute pma, bool isPlayer)
    {
        return GetMonsterObj(pma, isPlayer) != null ? true : false;
    }

    public MonsterBasic GetMonsterObj(PlayerMonsterAttribute pma, bool isPlayer)
    {
        if (isPlayer)
        {
            return playerMonsterObjList.FirstOrDefault(s => s.monsterDataValue.pma == pma);
        }
        else
        {
            return enmeyMonsterObjList.FirstOrDefault(s => s.monsterDataValue.pma == pma);
        }
    }
    private MonsterBasic BuildMonster(PlayerMonsterAttribute pma,bool isPlayer)
    {
        MonsterBasic mb = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(pma.monsterID.ToString());
        mb.SetInto(ft_ctr.arWorld.transform);
        mb.DownloadMonsterValue(pma, OTYPE.MonsterStateType.fight);
        AddMonsterObj(mb,isPlayer);
        return mb;
    }
    public bool CheckMonsterCanPlay(int selectIndex,bool isPlayer)
    {
        //PlayerMonsterAttribute pma = GetMonsterData(selectIndex, isPlayer);
        return false;
    }

    public int CheckMonsterLive(bool isPlayer)
    {
        if (isPlayer)
        {
            for (int i = 0; i < playerMonsterObjList.Count; i++)
            {
                if (!playerMonsterObjList[i].isDead)
                {
                    return i;
                }
            }
        }
        else
        {
            for (int i = 0; i < enmeyMonsterObjList.Count; i++)
            {
                if (!enmeyMonsterObjList[i].isDead)
                {
                    return i;
                }
            }
        }
        return -1;
    }

    #endregion
}
