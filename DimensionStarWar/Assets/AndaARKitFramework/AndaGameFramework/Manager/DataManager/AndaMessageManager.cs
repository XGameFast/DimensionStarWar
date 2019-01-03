using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;

public class AndaMessageManager {

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

    public SMManager sMManager;

    public List<ServerMessage> SMMData;

    public void GetServerMessage()
    {
        AndaDataManager.Instance.GetServerMessage(SevrerMessageBack);
    }
    public void SevrerMessageBack(ServerMessageRequest res)
    {
        Debug.Log("获取消息");
        if (res.serverMessageList != null && res.serverMessageList.Count > 0)
        {
            for (int i = 0; i < res.serverMessageList.Count; i++)
            {
                if (res.serverMessageList[i].objectList.Count > 0)
                {
                    
                    switch (res.serverMessageList[i].objectList[i].type)
                    {
                        //物品
                        case 1:
                            Debug.Log(LitJson.JsonMapper.ToJson(res.serverMessageList[i].objectList[i].sD_Pag4U));
                            //res.serverMessageList[i].objectList[i].item;
                            break;
                        //宠物
                        case 2:
                            Debug.Log(LitJson.JsonMapper.ToJson(res.serverMessageList[i].objectList[i].monsterGrowUpAttribute));
                            //res.serverMessageList[i].objectList[i].item ;
                            break;
                        //优惠卷
                        case 3:
                            Debug.Log(LitJson.JsonMapper.ToJson(res.serverMessageList[i].objectList[i].playerCoupon));
                            //res.serverMessageList[i].objectList[i].item ;
                            break;
                        default:
                            break;
                    }
                }
            }
            GetSMMData().AddRange(res.serverMessageList);
            var json = JsonMapper.ToJson(SMMData);
            PlayerPrefs.SetString(ONAME.ServerMessage, json);
        }
    }
    public List<ServerMessage> GetSMMData()
    {
        if (SMMData == null)
        {
            var josn = PlayerPrefs.GetString(ONAME.ServerMessage);
            SMMData = new List<ServerMessage>();
        }
        return SMMData;
    }


}
