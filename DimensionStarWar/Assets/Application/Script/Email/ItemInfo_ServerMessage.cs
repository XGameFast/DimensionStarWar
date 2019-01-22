﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System.Linq;

public class ItemInfo_ServerMessage :  AndaObjectBasic,  IPointerClickHandler{

    public string TitleTxt;
    public string ContentTxt;
    public ServerMessage info;
    public ServerMessageView serverMessageView;

    public Text Title;
    public GameObject Read;
    public GameObject UnRead;
    public GameObject normalImage;
    public GameObject openImage;
    public GameObject openBgImage;

    public List<AndaLocalRewardData> andaLocalRewardDatas;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void SetInfo(ServerMessageView _serverMessageView, ServerMessage _info)
    {
        serverMessageView = _serverMessageView;

        info = _info;
        TitleTxt = info.serverMessageTitle;
        ContentTxt = info.serverMessageText;
        Title.text = TitleTxt;
        if (info.receiveTime == 0)
        {
            Read.SetActive(false);
            UnRead.SetActive(true);
        }
        else {
            Read.SetActive(true);
            UnRead.SetActive(false);
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        Debug.Log("打开面板");
        if (serverMessageView.selectServerItem == this)
            return;
        if (!Read.activeSelf)
        {
            Read.SetActive(true);
            UnRead.SetActive(false);
            serverMessageView.messageCout.text = (Convert.ToInt32(serverMessageView.messageCout.text) - 1).ToString();
            info.receiveTime = ConvertTool.GetTimestamp();
            AndaMessageManager.Instance.SaveData();
        }
        normalImage.SetActive(false);
        openImage.SetActive(true);
        openBgImage.SetActive(true);
        serverMessageView.content.text = ContentTxt;
        //关闭上一个选中的面板
        serverMessageView.CloseOtherItem();
        serverMessageView.selectServerItem = this;
        //关闭其他面板

        if (info.receiveAwardsTime == 0)
        {
            serverMessageView.confirmButton.transform.GetChild(0).GetComponent<Text>().text = "领取";
        }
        else {
            serverMessageView.confirmButton.transform.GetChild(0).GetComponent<Text>().text = "查看";
        }

        if (andaLocalRewardDatas != null)
            return;

        serverMessageView.confirmButton.SetActive(false);
        andaLocalRewardDatas = new List<AndaLocalRewardData>();
        if (info.objectList != null || info.objectList.Count != 0)
        {
            serverMessageView.confirmButton.SetActive(true);

            foreach (var m in info.objectList)
            {
                if (m.type == 1)
                {
                    var item = andaLocalRewardDatas.FirstOrDefault(o => o.objID == m.id);
                    if (item != null)
                        item.objCount+= m.count;
                    else
                        andaLocalRewardDatas.Add(new AndaLocalRewardData()
                        {
                            objCount = m.count,
                            objID = m.id,
                        });
                }
                else if (m.type == 2)
                {

                }
                else if (m.type == 3)
                {
                   
                }
            }
        }
    }




    public void CloseContent()
    {
        normalImage.SetActive(true);
        openImage.SetActive(false);
        openBgImage.SetActive(false);
    }

}