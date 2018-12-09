using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeManager : MonoBehaviour
{
    private void Awake()
    {
        AndaDataManager.Instance.timeManager = this;
        //InitValue();
    }
    #region 清理计时器
    /// <summary>
    /// 打扫卫生的时间列表 
    /// 第一个 INT = 怪兽的游标
    /// 第二个 INT = 时间
    /// </summary>
    private Dictionary<int, int> monsterCleanTimeDic;
    private bool isRunningCleanTime = false;
    /// <summary>
    /// 增加宠物的清理完成时间 的记录
    /// </summary>
    /// <param name="monsterIndex">Monster index.</param>
    /// <param name="finishUnixTime">Finish unix time.</param>
    public void AddCleanTime(int monsterIndex, int finishUnixTime)
    {
        if (monsterCleanTimeDic == null) monsterCleanTimeDic = new Dictionary<int, int>();
        monsterCleanTimeDic.Add(monsterIndex, finishUnixTime);
        if (!isRunningCleanTime)
        { 
            isRunningCleanTime = true;
            StartCoroutine(WaitForCheckCleanTime());
        }
    }
    private IEnumerator WaitForCheckCleanTime()
    {
        while(monsterCleanTimeDic.Count!=0)
        {
            int key = -1;
            Dictionary<int, int> tmpDic = monsterCleanTimeDic;
            foreach (var go in tmpDic)
            {
                if (AndaGameExtension.GetCurrentUnixTime() >= go.Value)
                {
                    key = go.Key;
                    AndaDataManager.Instance.CallServer_FinishClean(go.Key);
                    //有一个完成了直接Break。再来一遍。
                    break;
                }
            }
            if (key != -1)
            {
                monsterCleanTimeDic.Remove(key);
            }
            yield return null;
        }
        isRunningCleanTime = false;
    }

    #endregion
    #region 探险计时器
    private Dictionary<int, int> treasureTimeDic;
    private bool isRunningTreasureTime=false;
    public void AddTreasureTime(int monsterIndex, int finishTime)
    {
        if (treasureTimeDic == null) treasureTimeDic = new Dictionary<int, int>();
        treasureTimeDic.Add(monsterIndex, finishTime);
        if (!isRunningTreasureTime)
        {
            isRunningTreasureTime = true;
            StartCoroutine(ExcuteTreasureTime());
        }
    }
    private IEnumerator ExcuteTreasureTime()
    {
        while (treasureTimeDic.Count != 0)
        {
            int key = -1;
            Dictionary<int, int> tmpDic = treasureTimeDic;
            foreach (var go in tmpDic)
            {
                if (AndaGameExtension.GetCurrentUnixTime() >= go.Value)
                {
                    key = go.Key;
                    //AndaDataManager.Instance.CallServer_FinishClean(go.Key);
                    //有一个完成了直接Break。再来一遍。
                    break;
                }
            }
            if (key != -1)
            {
                treasureTimeDic.Remove(key);
            }
            yield return null;
        }
        isRunningTreasureTime = false;
    }
    #endregion
    #region 体力恢复计时器
    private Dictionary<int, int> recoveryTimeDic;
    private bool isRunningRecoveryTime = false;
    public void AddRecoveryTime(int monsterIndex, int finishTime)
    {
        if (recoveryTimeDic == null) recoveryTimeDic = new Dictionary<int, int>();
        recoveryTimeDic.Add(monsterIndex, finishTime);
        if (!isRunningRecoveryTime)
        {
            isRunningRecoveryTime = true;
            StartCoroutine(ExcuteRecoveryTime());
        }
    }
    private IEnumerator ExcuteRecoveryTime()
    {
        while (recoveryTimeDic.Count != 0)
        {
            int key = -1;
            Dictionary<int, int> tmpDic = recoveryTimeDic;
            foreach (var go in tmpDic)
            {
                if (AndaGameExtension.GetCurrentUnixTime() >= go.Value)
                {
                    key = go.Key;
                   // AndaDataManager.Instance.CallServer_FinishClean(go.Key);
                    //有一个完成了直接Break。再来一遍。
                    break;
                }
            }
            if (key != -1)
            {
                recoveryTimeDic.Remove(key);
            }
            yield return null;
        }
        isRunningRecoveryTime = false;
    }
    #endregion

    public string GetCleanLessTimeStr(int monsterIndex)
    {
        int lessTime = monsterCleanTimeDic[monsterIndex] - AndaGameExtension.GetCurrentUnixTime();
        return lessTime.UnixCovertToTime();
    }
    public string GetTreasureLessTimeStr(int monsterIndex)
    {
        int lessTime = treasureTimeDic[monsterIndex] - AndaGameExtension.GetCurrentUnixTime();
        return lessTime.UnixCovertToTime();
    }
    public string GetRecoveryLessTimeStr(int monsterIndex)
    {
        int lessTime = recoveryTimeDic[monsterIndex] - AndaGameExtension.GetCurrentUnixTime();
        return lessTime.UnixCovertToTime();
    }
}
