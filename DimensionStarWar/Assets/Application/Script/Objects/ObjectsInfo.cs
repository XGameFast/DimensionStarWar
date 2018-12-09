using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectsInfo {
    /*
     * 用于显示物体的数据
     */
    public AndaObjectBasic self;
    protected List<AndaObjectBasic> itemList;
    protected  View_FollowObject followBoard;
    public virtual void DownloadMessage(AndaObjectBasic obj)
    {
        self = obj;
        InitValue();
    }



    public virtual void InitValue()
    {
        if (itemList == null) itemList = new List<AndaObjectBasic>();
        else itemList.DestroyListByAndaData();
        followBoard.DestroyByAndaDataManager();
    }

    public void Close()
    {
        InitValue();
    }

    public virtual void Dispawn()
    {
        InitValue();
    }
    public virtual void Hide()
    {
        if (followBoard != null)
        {
            followBoard.ExcutePause();
            followBoard.gameObject.SetTargetActiveOnce(false);
        }
    }
    public virtual void Display()
    {
        if (followBoard != null)
        {
            followBoard.ExcuteConsume();
            followBoard.gameObject.SetTargetActiveOnce(true);
        }
    }


    
    /// <summary>
    /// 构建跟随的底座
    /// </summary>
    protected void BuildFollowTargetBoard()
    {
        if (followBoard == null)
        {
            followBoard = AndaUIManager.Instance.PopFollowTargetUI();
            followBoard.SetEqualFollow(self.topPoint);
            followBoard.DidplayAlpha();
        }
    }
    public void OnUpdate()
    {
        if (followBoard != null)
        {
            followBoard.OnUpdate();
        }
    }
}
