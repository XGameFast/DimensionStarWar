using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;
using System.Linq;

public class AndaMessageManager {

    public System.Action BackCallUpdatePlayerCoupon;

    private static AndaMessageManager _instance = null;
    public static AndaMessageManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new AndaMessageManager();
            }
            return _instance;
        }
    }

    public ServerMessageView serverMessageView;

    public List<ServerMessage> SMMData;

    public void GetServerMessage()
    {
        AndaDataManager.Instance.GetServerMessage(SevrerMessageBack);
    }
    public void SevrerMessageBack(ServerMessageRequest res)
    {
        Debug.Log("获取消息");
        if (res.code == "200")
        {
            if (res.serverMessageList != null && res.serverMessageList.Count > 0)
            {
                for (int i = 0; i < res.serverMessageList.Count; i++)
                {

                    res.serverMessageList[i].receiveTime = 0;
                    if (res.serverMessageList[i].objectList!=null&&res.serverMessageList[i].objectList.Count > 0)
                    {
                        for (int j = 0; j < res.serverMessageList[i].objectList.Count; j++)
                        {
                            switch (res.serverMessageList[i].objectList[j].type)
                            {
                                //物品
                                case 1:
                                    //Debug.Log(LitJson.JsonMapper.ToJson(res.serverMessageList[i].objectList[i].sD_Pag4U));
                                    //res.serverMessageList[i].objectList[i].item;


                                    break;
                                //宠物
                                case 2:
                                    //Debug.Log(LitJson.JsonMapper.ToJson(res.serverMessageList[i].objectList[i].monsterGrowUpAttribute));
                                    //res.serverMessageList[i].objectList[i].item ;
                                    break;
                                //优惠卷
                                case 3:
                                    //Debug.Log();
                                    var playerCoupon = res.serverMessageList[i].objectList[i].playerCoupon;
                                    var item = AndaPlayerCouponManager.Instance.PlayerCouponData.FirstOrDefault(o => o.playerCouponIndex == playerCoupon.playerCouponIndex);
                                    item.status = playerCoupon.status;
                                    if (BackCallUpdatePlayerCoupon != null)
                                        BackCallUpdatePlayerCoupon();
                                    //res.serverMessageList[i].objectList[i].item;
                                    break;
                                default:
                                    break;
                            }
                        }
                    }
                }
                serverMessageView.AddContentPanel(res.serverMessageList);
                GetSMMData().AddRange(res.serverMessageList);
            
                serverMessageView.messageCout.text = GetSMMData().Count(o => o.receiveTime == 0).ToString();
                //消息列表更新
                var json = JsonMapper.ToJson(SMMData);
                Debug.Log(json);
                PlayerPrefs.SetString("ServerMessage", json);
            }
        }
    }

    public void GetServerMessageAward()
    {
        AndaDataManager.Instance.GetServerMessageAwards(GetServerMessageAwardBack, serverMessageView.selectServerItem.info.serverMessageIndex);
    }

    public void GetServerMessageAwardBack(ServerMessageAwardsRequest res)
    {
        var datalist = new List<AndaLocalRewardData>();

        serverMessageView.selectServerItem.info.receiveAwardsTime = res.serverMessage.receiveAwardsTime;
        AndaMessageManager.Instance.SaveData();
        //物品展示
        if (res.sD_Pag4Us != null)
        {
            foreach (var m in res.sD_Pag4Us)
            {
                AndaDataManager.Instance.UpdateUserConsumableItemForADD(new SD_Pag4U()
                {
                    hostIndex = res.serverMessage.hostIndex,
                    objectCount = m.addCount,
                    objectID = m.objectId,
                    objectIndex = m.objectIndex,
                    objectValue = 0
                });
                datalist.Add(new AndaLocalRewardData()
                {
                    objCount = m.addCount,
                    objID = m.objectId,
                });
            }
            JIRVIS.Instance.jIRVISData.SetNormalRewardList(datalist);
            JIRVIS.Instance.CheckNormalReward();
        }
    }
    public List<ServerMessage> GetSMMData()
    {
        if (SMMData == null || SMMData.Count==0)
        {
            var josn = PlayerPrefs.GetString("ServerMessage");
            if (josn == "")
                SMMData = new List<ServerMessage>();
            else
            {
            
                if (AndaDataManager.Instance.userData != null)
                    SMMData = LitJson.JsonMapper.ToObject<List<ServerMessage>>(josn).Where(o => o.hostIndex == AndaDataManager.Instance.userData.userIndex).ToList();
            }
        }
        return SMMData;
    }
    public void SaveData()
    {
        if (SMMData == null)
            return;
        var json = JsonMapper.ToJson(SMMData);
        Debug.Log("保存"+ json);
        PlayerPrefs.SetString("ServerMessage", json);
    }
    //清除历史
    public void ClearHistory()
    {
        if (SMMData == null)
            SMMData = new List<ServerMessage>();
        else
            SMMData.Clear();
        var json = JsonMapper.ToJson(SMMData);
        PlayerPrefs.SetString("ServerMessage", json);
    }
}
