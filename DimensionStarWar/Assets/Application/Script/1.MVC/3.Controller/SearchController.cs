using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class SearchController : BaseController
{

    public SearchData Data;
    public List<SearchObjectItem> searchObjectItems 
    {
        get {return Data.searchObjectItems;}
    }

    public override void StartController()
    {
        base.StartController();
        ARMonsterSceneDataManager.Instance.OpenGameLight(true);
        ARMonsterSceneDataManager.Instance.SetUsedCamera(ARMonsterSceneDataManager.Instance.mainCamera);

        BuildData();
        BuildMenu();
        OpenAR();
       
    }

    public override void EndController()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        Data.InitValue();
        StopAR();
        UnregisterFingerEvent();
        ARMonsterSceneDataManager.Instance.RemoveDimensionSpace(null);
        base.EndController();
    }
    public override void OnUpdate()
    {
        base.OnUpdate();
        if(canFinger)
        {

            FingerEvent.OnUpdate();
        }

        if(Data.getIsScanning)
        {
            if(Time.time - Data.getStartTime > Data.getCurDetectAttribute.scannDuration)
            {
                UnregisterFingerEvent();
                Data.SetScanning(false);
                if(Data.getDetecLevel!=2)//前2种探测 游戏结束如搜索物品部位空，会上传
                {
                    if (Data.getTmpPickupItems != null && Data.getTmpPickupItems.Count != 0)
                    {
                        if (Data.getDetecLevel != 2)
                        {
                            FinishScanWhileUploadInformation(Data.getTmpPickupItems);
                        }
                    }
                    else
                    {
                        BuildJirvisFunBtn();
                        JIRVIS.Instance.PlayTips("好可惜，啥都没得到，再来一次八");
                    }
                }else //第三种 如果探索结束了，还没有停止这里的活动，说明没有发现这里的星宿。如果发现了。不回执行这里的代码
                {
                    BuildJirvisFunBtn();
                    JIRVIS.Instance.PlayTips("好可惜，啥都没得到，再来一次八");
                }
                EndScanner();
            }
            else
            {

                if(Data.getDetecLevel!=2)//只有前2种探测器会扫描物件
                {
                    float t = Data.getCurDetectAttribute.scannDuration - (Time.time - Data.getStartTime);
                    Data.searchMenu.UpdateTime(t);
                    Scanning();
                }else
                {
                    float t = Data.getCurDetectAttribute.scannDuration - (Time.time - Data.getStartTime);
                    Data.searchMenu.UpdateTime(t);
                }
               
            }
           
        }

    }

    public void UnregisterFingerEvent()
    {
        canFinger=false;
        FingerEvent.clickSelectItemEvent -= Click;
    }

    public void RegisterFingerEvent()
    {
        canFinger= true;
        FingerEvent.clickSelectItemEvent += Click;
    }
    public void Click(Transform tra)
    {
        for (int i = 0; i < searchObjectItems.Count; i++)
        {
            if (tra == searchObjectItems[i].transform)
            {
                //searchObjectItems[i].Click();
                ClickPickUpItem(searchObjectItems[i]);
            }
        }
    }
   
    //构建背包  JIRVIS功能按钮
    private void BuildJirvisFunBtn()
    {
        if(AndaDataManager.Instance.PlayerHasMonster())
        {
            List<JIRVISFuncBtnStruct> btnStructs = new List<JIRVISFuncBtnStruct>()
            {
                new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.Search01 , clickCallBack =  ReSearche1 },
                new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.Search02 , clickCallBack =  ReSearche2 },
                new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.Search03 , clickCallBack =  ReSearche3 },

            };

            JIRVISFuncBtnStruct backStep = new JIRVISFuncBtnStruct
            {
                btnName = "",
                btnIconKey = ONAME.BackStep,
                clickCallBack = ClickBackToBuildDimensionController
            };

            btnStructs.Add(backStep);

            JIRVIS.Instance.BuildFunctionBtn(btnStructs, FinishBuildJIRVISBtn);

        }else
        {
            List<JIRVISFuncBtnStruct> btnStructs = new List<JIRVISFuncBtnStruct>()
            {
               // new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.Search01 , clickCallBack =  ReSearche1 },
               // new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.Search02 , clickCallBack =  ReSearche2 },
                new JIRVISFuncBtnStruct { btnName = "" , btnIconKey = ONAME.Search03 , clickCallBack =  ReSearche3 },

            };

            JIRVISFuncBtnStruct backStep = new JIRVISFuncBtnStruct
            {
                btnName = "",
                btnIconKey = ONAME.BackStep,
                clickCallBack = ClickBackToBuildDimensionController
            };

            btnStructs.Add(backStep);

            JIRVIS.Instance.BuildFunctionBtn(btnStructs, FinishBuildJIRVISBtn);
        }

       

        JIRVIS.Instance.PlayTips("请从右边的探测器列表种选择一个探测器，来一起发现奇妙的次元世界八");

    }
    private void ReSearche1()
    {
        JIRVIS.Instance.PlayTips("探测器X,这是初代探测器，技术相对较为落后，但依然探测出一些物品");
        ReadyScanner(42020);
    }
    private void ReSearche2()
    {
        JIRVIS.Instance.PlayTips("探测器XS,是初代探测器的中期改款，性价比很高，能探测出一些稀有物品");
        ReadyScanner(42021);
    }
    private void ReSearche3()
    {
        JIRVIS.Instance.PlayTips("探测器T,技术全面升级，可以探测星宿的位置，带有星宿方位指示，同时也有几率发现非常稀有的物品，但价格昂贵，慎重考虑");
        ReadyScanner(42022);
    }

   
    #region 准备探测 ， 向服务器请求获取探索的物件
    private void ReadyScanner(int ID)
    {
        if(AndaDataManager.Instance.UseDetectProp(ID) !=-1)
        {
            //JIRVIS.Instance.PlayTips("附近有隐藏的次元盒，里面会有一项不到的物品。");
            JIRVIS.Instance.RemoveCurrentBtnList();
            Data.SetCurrentDetecAttribute(ID);
            #region 向服务器调取扫描物件
            AndaDataManager.Instance.CallServerApplyMatchWithObject(ID, "2", 0, 0, CallBackSeTData);
            #endregion
        }
        else
        {
            //JIRVIS.Instance.OpenBtnBar();
            JIRVIS.Instance.PlayTips("该探测器数量不太够哦 ,可以前往商店购买，目前小星序正在学习一键购买功能。嘻嘻");
        }
       
    }
    #endregion

    #region 接收到了物件 ,开始探测
    public void CallBackSeTData(List<SearchObject> downData)
    {
        if (downData == null) return;

        Data.searchObjects = downData;
        foreach (var m in Data.searchObjects)
        {
            SearchObjectItem searchObjectItem = AndaDataManager.Instance.InstantiateOtherObj<SearchObjectItem>("SearchObjectItem");
            int itemType = AndaDataManager.Instance.GetObjectGroupID(m.objectID);
            if(itemType == 1000)//宠物需要隐藏物体
            {
                searchObjectItem.gameObject.SetActive(false);
            }else
            {
                searchObjectItem.gameObject.SetActive(true);
            }
            searchObjectItem.SetID(m.objectID);
            searchObjectItem.SetObjectInfo(m);
            searchObjectItem.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
            searchObjectItem.transform.localPosition = new Vector3(Convert.ToSingle(m.x), 0, Convert.ToSingle(m.z));
            //存储有哪些物品生成了
            Data.AddSearchItem(searchObjectItem);
        }
        AndaDataManager.Instance.ReducePlayerConsumableList(Data.getCurDetectAttribute.detectID);
        StartScanner();
    }
    #endregion

    #region 开始探测
    private void StartScanner()
    {
        if(Data.getDetecLevel == 2)
        {
            JIRVIS.Instance.PlayTips("请根据全息毕宿指示器的指示，来发现隐秘在您周围的其他星宿哦。");

        }
        else
        {
            JIRVIS.Instance.PlayTips("请向四周看看，扫描发现物品，点击拾取，来获取的神秘礼品哦");
        }
      
        Data.SetScanning(true);
        Data.SetStartTime();
        Data.ClearTmpPickupItems();
        RegisterFingerEvent();
        Data.searchMenu.OpenScannerBoard(Data.getDetecLevel , Data.searchObjectItems);
        Data.searchMenu.SetLineSpeed(Data.getCurDetectAttribute.scannSpeed);
    }
    #endregion

    #region 探测中
    private void Scanning()
    {
        int count = searchObjectItems.Count;
        for(int i = 0; i < count; i ++)
        {
            Vector2 pose = ARMonsterSceneDataManager.Instance.mainCamera.WorldToScreenPoint(searchObjectItems[i].selfPostion);
            Vector2 linePose = ARMonsterSceneDataManager.Instance.UICamera.WorldToScreenPoint(Data.searchMenu.scannerLine.transform.position);

            float dis = Mathf.Abs(pose.y - linePose.y);//  Vector2.Distance(pose, linePose);
           // Debug.Log("dis" + dis);


            if (dis < 300f)
            {
                /*if (searchObjectItems[i].GetComponent<BoxCollider>().enabled == false)
                {
                    searchObjectItems[i].GetComponent<BoxCollider>().enabled = true;
                }*/
                float t = (300f - dis) / 300f;
                searchObjectItems[i].SetAlpah(t);
            }else
            {
                /*if(searchObjectItems[i].GetComponent<BoxCollider>().enabled == true)
                {
                    searchObjectItems[i].GetComponent<BoxCollider>().enabled =false;
                }*/
                searchObjectItems[i].SetAlpah(0);
            }

        }
    }
    #endregion

    #region 结束探测

    private void EndScanner()
    {
        UnregisterFingerEvent();
        Data.SetScanning(false);
        Data.searchMenu.CloseScannerBoard(Data.getDetecLevel);
        Data.ClearSearchObj();
        Data.ClearTmpPickupItems();
        Data.ClearSearchMonsterObj();
    }
    #endregion

    #region 完成探测 向服务器核对信息
    public void FinishScanWhileUploadInformation(List<SearchObject> searchObjects)
    {
        List<BattelResult> battelResults = new List<BattelResult>();//填充数据 没啥用
        AndaDataManager.Instance.CallServerUploadGameWithObjectResult(2, 1, battelResults, searchObjects, CallBackResData);
    }
    #endregion

    #region 数据核对完成 ，并发放奖励

    public void CallBackResData(bool success)
    {
        if (success)
        {
            JIRVIS.Instance.CheckNormalReward(ClickCloseRewardBar);
            AndaDataManager.Instance.RecieveItem(Data.searchObjectItem);
            Data.searchObjectItem = null;
        }
        else
        {
            BuildJirvisFunBtn();
            AndaDataManager.Instance.RecieveItem(Data.searchObjectItem);
            Data.searchObjectItem = null;
            JIRVIS.Instance.PlayTips("与次元空间的通讯好像有点问题");
        }
    }

    #endregion

    #region 玩家已经发现宠物了

    public void PlayerFoundMonster()
    {
        Data.SetScanning(false);//停止扫描
        Data.searchMenu.CloseScannerBoard(Data.getDetecLevel);
        Data.searchMenu.scannerBoard.SetTargetActiveOnce(false);
        //找到宠物ID并构建
        MonsterBasic monsterBasic = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(Data.searchObjects[0].objectID.ToString());
        monsterBasic.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        monsterBasic.transform.localPosition = Data.searchObjectItems[0].transform.localPosition;
        monsterBasic.transform.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(monsterBasic.selfPostion);
        Data.AddSearchMonsterItem(monsterBasic);
        //玩家还没有宠物，意味着第一次，那么不会让玩家选择
        if (AndaDataManager.Instance.userData.userMonsterList.Count == 0)
        {
            //玩家同意捕捉
            PlayerComfirmCatchMonster();
        }
        else
        {
            //让玩家选择是否要捕捉
            JIRVIS.Instance.PlayTipsForchoose("发现星宿，是否立刻捕捉",OTYPE.TipsType.chooseTips, "好的" ,"放弃" , PlayerComfirmCatchMonster , PlayerGiveupCatchMonster);
        }
    }

    #endregion

     

    #region 玩家选择了要捕捉
    private void PlayerComfirmCatchMonster()
    {
        JIRVIS.Instance.CloseTips();
        //调出玩家精神链接按钮
        JIRVIS.Instance.PlayTips("慢慢的靠近，将瞄准器对准星宿，发射出精神印记,与星宿建立精神链接！连接成功他将成为你的忠实伙伴");
        Data.BuildPlayerPowerLinkBar(Data.searchObjects[0].value, CatchResult);
    }
    #endregion

    #region 玩家放弃了捕捉
    private void PlayerGiveupCatchMonster()
    {
        JIRVIS.Instance.CloseTips();
        BuildJirvisFunBtn();
        JIRVIS.Instance.PlayTips("明智的选择");
        EndScanner();//结束扫描
    }
    #endregion

    #region 捕捉结果

    private void CatchResult(bool result)
    {
        if(result)//捕捉成功
        {

            Data.catchSuccess = true;
            Data.RemovePlayerPowerLink();
            FinishScanWhileUploadInformation(Data.searchObjects);
            EndScanner();//结束扫描



        }else //捕捉失败
        {
            Data.catchSuccess = false;
            //逃跑 
            Data.getCurMonster.MonsterFadeOut();

            StartCoroutine(ExcuteEndScanner());
        }
    }

    #endregion

    #region 退出Controller

    #endregion

    private IEnumerator ExcuteEndScanner()
    {
        yield return new WaitForSeconds(3f);
        if(Data.catchSuccess)yield break;
        InvokeEndScanner();
    }

    private void InvokeEndScanner()
    {
        Data.RemovePlayerPowerLink();

        EndScanner();//结束扫描
        BuildJirvisFunBtn();
        //调进这里，说明捕捉失败，并且宠物逃跑了
        //Data.getCurMonster
    }

    private void ClickBackToBuildDimensionController()
    {
        JIRVIS.Instance.CloseTips();
        callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
    }

    public void ScanTimesUp()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
    }
    private void FinishBuildJIRVISBtn()
    {
        Debug.Log("JIRVIS Said: oh, i was finihed build function btn ，have fun :) ");
    }


   
   

    private void ClickCloseRewardBar()
    {
        if(Data.getDetecLevel == 2)
        {
            if (!AndaDataManager.Instance.PlayerHasStronghold())
            {
                JIRVIS.Instance.PlayTipsForchoose("恭喜结交了新伙伴，星宿是星域中灵物，需要放置在占星庭中进行培育,现在让我们看看怎么建立占星庭八", OTYPE.TipsType.onlyOneChooseTips, "那走吧", "" , ClickBackToBuildDimensionController);
            }else
            {
                BuildJirvisFunBtn();
            }
        }else
        {
            BuildJirvisFunBtn();
        }
       
        //RegisterFingerEvent();//恢复操作
    }

    public void ClickPickUpItem(SearchObjectItem searchObjectItem)
    {
        if(searchObjectItem == null)
        {
            JIRVIS.Instance.OpenBtnBar();
            return;
        }
        Data.searchObjectItem = searchObjectItem;
        int idType = AndaDataManager.Instance.GetObjectGroupID(searchObjectItem.searchObject.objectID);
        Data.isPickMonster = false;

        Data.AddtionTmpPickupItems(searchObjectItem.searchObject);
        searchObjectItem.gameObject.SetTargetActiveOnce(false);

       /* if (idType == 1000)//pick monster
        {
            Data.isPickMonster = true;

            //
            UpData(new List<SearchObject>() {
                searchObjectItem.searchObject,
            });
            AndaDataManager.Instance.RecieveItem(searchObjectItem);
            searchObjectItem = null;

        }
        else if(idType == 40000) //pick consuamble
        {
            Data.isPickMonster = false;
            if (searchObjectItem == null)
                return;
           
            Data.AddtionTmpPickupItems(searchObjectItem.searchObject);
            searchObjectItem.gameObject.SetTargetActiveOnce(false);
        }*/
    }

   

    private void OpenAR()
    {
         ARMonsterSceneDataManager.Instance.aRWorld.ClosebackgroundVV();
        AndaARManager.Instance.StartAR(FinishBuildAR);
    }

    private void StopAR()
    {
        ARMonsterSceneDataManager.Instance.OpenGameLight(false);
        AndaARManager.Instance.StopAR(ARMonsterSceneDataManager.Instance.CloseMainCamera);
    }
    private void FinishBuildAR()
    {
        //关闭AR视频图像
        // AndaARManager.Instance.OpenARVideo(false);

        BuildJirvisFunBtn();
        Data.searchMenu.ReSearch();
        JIRVISDeterminScreenObject();
    }

    private void JIRVISDeterminScreenObject()
    {
        //构建场景内容
        
    }
    public void BuildData()
    {
        if (Data == null)
        {
            Data = new SearchData();
            Data.BuildData(this);
        }
        //初始化
        Data.InitValue();
    }
    public  void BuildMenu()
    {
        Data.BuildMenu(ONAME.SearchMenu);
    }
}
