using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class BuildDimensionRoomController : BaseController {

    public bool isTestLoadLocalData;

    public BuildDimensionRoomData data;

    private bool isPause =false;

    #region 执行

    public override void StartController()
    {
        base.StartController();
        ARMonsterSceneDataManager.Instance.SetUsedCamera(ARMonsterSceneDataManager.Instance.mainCamera);
        //构建数据
        BuildData();
        //获取完整的玩家据点数据
        data.BuildPlayerStrongholdAttributeData();
        //设置一下默认的据点为第一个，这样就不怕第一次进来没有数据了
        //data.SetCurSelectItemIndex(0);
        //构建菜单
        data.BuildMenu(ONAME.BuildDimensionRoomMenu);
       
        if(AndaDataManager.Instance.userData.userStrongholdList.Count == 0)
        {
            ARMonsterSceneDataManager.Instance.aRWorld.OpenBackgroundVV();
            data.getDimensionMenu.OpenBackgroundStroyBar(true);
            return;
        }

      
        //DimensionRoom实例化
        StartBuildDimensionRoomItemForVV();
    
    }

    public override void EndController()
    {
        base.EndController();
        UnregisterFingerEvent();
        //FingerEvent.slierForX-=SliderHori;
        data.InitValue();
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        if(!isPause) FingerEvent.OnUpdate();
    }

    private void BuildData()
    {
        if (data == null)
        {
            data = new BuildDimensionRoomData();
            data.BuildData(this);
        }
    }



     
    #endregion

    #region 打开 和 关闭 jirvis面板上的 我的据点
    private void OpenJIRVISStrongholdBtnForMine()
    {
        JIRVIS.Instance.BuildDimensionRoomBtnList(data.getPlayerSHAData, ClickJIRVISDimensionBtn);
       
    }


    private void CloseJIRVISStrongholdBtnForMine()
    {
        BuildJIRVISBtnForDimensionroom();
    }

    #endregion

    #region 切换 AR he VV 模式

    //[进入界面一开始的时候调用的]
    private void StartBuildDimensionRoomItemForVV()
    {

        ARMonsterSceneDataManager.Instance.aRWorld.OpenBackgroundVV();
        data.BuildDimension_RoomInfoBarForVV(CallbackEnterAstrologyScene,ClickAddStrongholdButton,FinishDragCallback);
     


        Invoke("InvokJump",0.5f);

        Invoke("InvokBuildJIRVISBtn",1.5f);
    
    }


    private void InvokJump()
    {
        if (JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex != -1)
        {
            PlayerStrongholdAttribute playerStronghold = data.getPlayerSHAData.FirstOrDefault(s => s.strongholdIndex == JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex);
            int index = data.getPlayerSHAData.IndexOf(playerStronghold);
            data.SetCurSelectRoomItemIndex(index);
        }

        StartCoroutine(ExcuteJumpToStrongholdBarItem(data.getCurSelectItemIndex));
    }

    private void InvokBuildJIRVISBtn()
    {
        //构建JIRVIS
        BuildJIRVISBtnForDimensionroom();
    }


    #region 切换到AR
    private void ClickChangetoARType()
    {

       
        ARMonsterSceneDataManager.Instance.aRWorld.ClosebackgroundVV();

        JIRVIS.Instance.RemoveCurrentBtnList();

        data.getCurInfoBar.FadeOut();

        data.getm_Menu.FadeOut(InvockExcuteARMode);

        //切换到AR的时候，先等AR识别完成，在构建Item
        AndaARManager.Instance.StartAR(FinishSetARPoint);

        //Invoke("InvockExcuteARMode" , 1f);
    }

    private void InvockExcuteARMode()
    {
        //[记录一下在VV模式下的Item游标]
        data.vvModelLastSelectItemIndex = data.getCurSelectItemIndex;
        //如果是刚切换到AR，那么把VV模式下的Item印在屏幕上
        data.BuildTmpMedal();

        AndaARManager.Instance.andaARWorldController.aRScannerMenu.SetItemToMedalPoint(data.getTmpMedal.transform);

        //先回收物件
        //data.RecieveItemForVV();

        JIRVIS.Instance.ChooseGameDisplayType(OTYPE.GameDisplayType.AR);

    }

    private void FinishSetARPoint()
    {
        //把原先的AR按钮替换成VV按钮

        data.getTmpMedal.UpdateItemScreentoARWordPoint(Vector3.zero);

        //等待 物件 平滑移动到ARWorld的位置 ,然后执行构建物件

        Invoke("InvokSetDimensionItemForAR" ,1f);

    }

    private void InvokSetDimensionItemForAR()
    {

        AndaGameExtension.ImpactFeedbackStyleLight();

        BuildJIRVISBtnForDimensionroom();

        data.RecieveTmpMedal();//回收tmpmedal

        data.BuildDimensionRoomItemForAR();
    }
    #endregion

    #region 切换到 VV

    //[点击了JIRVIS上的VVItem]
    private void ClickChangetoVVType()
    {
        JIRVIS.Instance.CloseBtnBar();

        AndaARManager.Instance.StopAR(ARMonsterSceneDataManager.Instance.CloseMainCamera);

        ARMonsterSceneDataManager.Instance.SetMainCameraInitPose();
        ARMonsterSceneDataManager.Instance.SetGameLightInitPose();

        data.RecieveItemForAR();//把AR部分的移除掉

        ARMonsterSceneDataManager.Instance.aRWorld.OpenBackgroundVV();

        //等待界面平滑进入结束，开始构建物件
        data.getm_Menu.FadeIn(InvokeSelectItem);

        //data.SetCurSelectItemIndex(data.getCurSelectItemIndex);

        //data.getDimensionMenu.FadeInofVVItem();

        JIRVIS.Instance.ChooseGameDisplayType(OTYPE.GameDisplayType.VV);


    }

    private void InvokeSelectItem()
    {
        BuildJIRVISBtnForDimensionroom();

        StartCoroutine(ExcuteJumpToStrongholdBarItem(data.getCurSelectItemIndex , data.vvModelLastSelectItemIndex));

        //JumpToStrongholdBarItem(data.getCurSelectItemIndex);
    }

    #endregion


    #endregion

    #region 点击 跳转据点信息
    //点击了按钮 , 
    private void ClickJIRVISDimensionBtn(int strongholdIndex)
    {
        // 需要把 strongholdIndex 转为 list里的游标
        int _index = data.GetSelectItemIndexInlist(strongholdIndex);
        if(data.getCurSelectItemIndex == _index)return;
        JumpToStrongholdBarItem(_index);
    }


    private void JumpToStrongholdBarItem(int itemIndex)
    {
        if(data.getCurSelectItemIndex == itemIndex) return;
        StartCoroutine(ExcuteJumpToStrongholdBarItem(itemIndex));
    }

    private IEnumerator ExcuteJumpToStrongholdBarItem(int targetIndex , int vvModeTmpSelectItemIndex = -1)
    {

        float t = 0.35f;
        //float roundTimes = 0;
        int tmpIndex = vvModeTmpSelectItemIndex ==-1? data.getCurSelectItemIndex : vvModeTmpSelectItemIndex;
        if(targetIndex > tmpIndex) //下一个
        {
            while(tmpIndex <= targetIndex)
            {
                t -= t*0.5f;
                data.getDimensionMenu.infoItems[tmpIndex].RotateAngle(-1, tmpIndex == targetIndex);
                tmpIndex+=1;
                yield return new WaitForSeconds(t );
                //roundTimes += 1;
                // roundTimes = Mathf.Clamp(roundTimes , 0,3);
                //t -= t*0.3f;
            }



        }else if(targetIndex < tmpIndex) //上一个
        {
            while(tmpIndex >= targetIndex)
            {
                t -= t*0.5f;
                data.getDimensionMenu.infoItems[tmpIndex].RotateAngle(1,tmpIndex == targetIndex);
                tmpIndex-=1;
                yield return new WaitForSeconds(t );
                // roundTimes += 1;
                // roundTimes = Mathf.Clamp(roundTimes , 0,3);
            }


        }

        yield return new WaitForSeconds(0.5f);
        SwitchRoomItem(targetIndex);
    }

    private void FinishDragCallback(int _dir , int _index)
    {

        if(dragEvent.ContainsKey(_index))
        {
            dragEvent[_index] = true;
        }

        foreach(var go in dragEvent.Values)
        {
            if(!go)return;
        }
        dir = 0 ;
        SwitchRoomItem(data.getCurSelectItemIndex + _dir);
        Debug.Log("Anda:curSelectIndex" + data.getCurSelectItemIndex);
    }

    private void SwitchRoomItem(int index)
    {
        data.SetCurSelectRoomItemIndex(index);

        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.VV)
        {
            if(index >= data.getDimensionMenu.infoItems.Count)return;
            data.ShowCurrentItemOnlyInfo();//.PlayInfo(data.ShowCurrentItem().GetComponent<BuildDimensionMenu_RoomInfoBar>());
            CheckAutoJumpScene();
        }
        else if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.AR )
        {
            data.BuildDimensionRoomItemForAR();
        }
    }
    #endregion

    private void CheckAutoJumpScene()
    {
        Invoke("EndBuildStrongholdList", 1.5f);
    }
    private void EndBuildStrongholdList()
    {
        if (JIRVIS.Instance.jIRVISData.IsAutoEnterAstroloy)
        {
            StartBuildAstrology();
            //注册手指滑动事件
            PauseFingEvent(false);
        }
        else
        {
            if(JIRVIS.Instance.jIRVISData.isAutoEnterTargetScene != -1)
            {
                switch (JIRVIS.Instance.jIRVISData.isAutoEnterTargetScene)
                {
                    case 0:
                        break;
                    case 1:
                        JIRVIS.Instance.jIRVISData.isAutoEnterTargetScene = -1;
                        EnterStarmap();
                        break;
                    case 2:
                        break;
                }

               
            }
           
        }
       

    }


    #region 注册 手指滑动 事件
    public void PauseFingEvent(bool _isPause)
    {
        if(_isPause)
        {
            UnregisterFingerEvent();

        }else
        {
            RegisterFingerEvent();
        }

        isPause = _isPause;
    }

    private void RegisterFingerEvent()
    {
        /*FingerEvent.slierForX += SliderHori;
        FingerEvent.clickSelectItemEvent += TouchItem;
        */
        data.getm_Menu.FadeIn();
    }

    private void UnregisterFingerEvent()
    {
        /*FingerEvent.slierForX -= SliderHori;
        FingerEvent.clickSelectItemEvent -= TouchItem;
        */
        if(data.getm_Menu!=null)
        {
            data.getm_Menu.FadeOut(null);
        }
      
    }
    #endregion

    #region 点击打开进入 和 退出 占星庭

    //由占星庭列表进入的
    private void StartBuildAstrology()
    {
        if(JIRVIS.Instance.jIRVISData.IsAutoEnterAstroloy) JIRVIS.Instance.jIRVISData.IsAutoEnterAstroloy =false;
        //因为要构建游戏场景，所以需要打开游戏主相机
        //ARMonsterSceneDataManager.Instance.mainCamera.gameObject.SetTargetActiveOnce(true);
        ARMonsterSceneDataManager.Instance.OpenMainCamera();
        ARMonsterSceneDataManager.Instance.OpenGameLight(true);//ture = 打开场景灯光
        //关闭背景
        ARMonsterSceneDataManager.Instance.aRWorld.ClosebackgroundVV();
        //移除jirvis的功能按钮
        JIRVIS.Instance.RemoveCurrentBtnList();
        //让本菜单淡出
       // data.getm_Menu.FadeOut();
        data.getDimensionMenu.OpenItemGroup(false);

        BuildAtrologyData();
    }

    private void BuildAtrologyData()
    {
        

        //构建宠物列表
        data.BuildMonsterList();

        data.isInAstrolog = true; 

        BuildAstrology();
    }

    private void BuildAstrology()
    {
        if(JIRVIS.Instance.isARType)
        {
            ChangeToAstrologyForAR();
        }else
        {
            ChangeToAstrologyForVV();
        }
    }

    private void ChangeToAstrologyForAR()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        data.RecieveMonsterItem();
        data.getDimensionSpace.FadeOut(data.RecieveDimensionSpace);
        AndaARManager.Instance.StartAR(EnterAstrology);
    }

    private void ChangeToAstrologyForVV()
    {
        data.RecieveMonsterItem();

        AndaARManager.Instance.StopAR();

        ARMonsterSceneDataManager.Instance.SetMainCameraInitPose();
        ARMonsterSceneDataManager.Instance.SetGameLightInitPose();
        //[把占星庭的场景打开]
        data.BuildDimensionRoomSpace();
        //淡出结束后会进入占星庭
        data.getDimensionSpace.FadeIn(EnterAstrology);
    }

    private void BuildJIRVISBtnForAstrology()
    {
        if(JIRVIS.Instance.isARType)
        {
            //需要jirvis 构建出 宠物列表
            BuildJIRVISBtnForARAstrology();
        }else
        {
            //需要jirvis 构建出 宠物列表
            BuildJIRVISBtnForVVAstrology();
        }
    }

    private void EnterAstrology()
    {
        BuildJIRVISBtnForAstrology();

        //在展现宠物之前，先判断一个，当前据点是否有宠物
        if(CheckThisDimensionRoomHasMonster())
        {
            //展现宠物
            SetMonster();
        }else
        {
            List<PlayerMonsterAttribute> playerMonsterAttributes = AndaDataManager.Instance.GetUserFreesMonster();
            if(playerMonsterAttributes.Count == 0)
            {
                JIRVIS.Instance.PlayTipsForchoose("当前占星庭没有星宿并且没有闲置的星宿,赶紧去捕捉八" , OTYPE.TipsType.chooseTips, "那我们走八" , "继续停留" , OutAstrologyGotoSearchController, StayAstrology);

            }else
            {
                ClickJIRVISOpenFreeMonsters();
                JIRVIS.Instance.PlayTips("当前占星庭没有星宠，请选择一只星宿放入占星庭" ,false);
            }
        }


    }

    private void StayAstrology()
    {
        JIRVIS.Instance.OpenBtnBar();
        JIRVIS.Instance.CloseTips();
    }

    private void OutAstrologyGotoSearchController()
    {
        OutAstrology();
        Invoke("InvokGotoSearcontroller" , 1.25f);
    }

    private void InvokGotoSearcontroller()
    {
        CallBackEnterSearch();
    }



    private void OutAstrology()
    {
        JIRVIS.Instance.CloseTips();

        data.getDimensionMenu.CloseMonsterInfo();

        data.getDimensionMenu.OpenItemGroup(true);
        //
        data.RecieveMonsterItem();
        //dimenspace淡出后，顺便把物件给消除掉
        data.getDimensionSpace.FadeOut(data.RecieveDimensionSpace);
       // data.getm_Menu.FadeIn();
       
        data.getCurInfoBar.PlayItemOutAstrology();
        //背景退出后，顺便摄像机关掉
        ARMonsterSceneDataManager.Instance.aRWorld.OpenBackgroundVV(ARMonsterSceneDataManager.Instance.CloseMainCamera);
       
        BuildJIRVISBtnForDimensionroom();
        data.isInAstrolog = false;

        CheckAutoJumpScene();
    }

   // private void E


    #region 构建宠物

    private void SetMonster()
    {
        data.RecieveMonsterItem();//先回收前面的Monster
        //data.BuildMonsterFadeInEffect();
        Invoke("InvokeSetMonster" , 0.5f);
    }

    private void InvokeSetMonster()
    {
        data.InvockBuildMonsterItem();

        data.getDimensionMenu.DisplayMonsterInfo(data.getCurMonsterAttribute);

        PauseFingEvent(false);

    }

    #endregion

    #endregion


    #region 构建jirvis的功能按钮
    private void BuildJIRVISBtnForVVAstrology()
    {
        List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>()
        {
            new JIRVISFuncBtnStruct { btnName = "backup" , btnIconKey = ONAME.BackStep ,clickCallBack = CallBackClickJIRVISOutAstrology}
        };

        JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);

        int thisShMonsterCount = AndaDataManager.Instance.GetMonsterCountBelongThisStronghold(data.getCurStrongholdAtrrobute.strongholdIndex);

        if (thisShMonsterCount <=0)
        {

        }else
        {
            List<JIRVISFuncBtnStruct> addditon = new List<JIRVISFuncBtnStruct>
            {
                new JIRVISFuncBtnStruct { btnName = "AR" , btnIconKey = ONAME.ARIcon , clickCallBack = CallBackClickJIRVISARBtnForAstrology },
                new JIRVISFuncBtnStruct { btnName = "minemonstes" , btnIconKey = ONAME.MonsterIcon , clickCallBack = CallBackClickJIRVISOpenMonsterListBtn ,},
            };

            JIRVIS.Instance.AddFunctionBtns(addditon);

        }
        List<PlayerMonsterAttribute> playerMonsterAttributes = AndaDataManager.Instance.GetUserFreesMonster();
        if(playerMonsterAttributes.Count!=0)
        {
            JIRVIS.Instance.AddFunctionBtn(new JIRVISFuncBtnStruct { btnName = "freeMonsters" , btnIconKey = ONAME.freeMonsters ,clickCallBack = ClickJIRVISOpenFreeMonsters});
        }


        //JIRVIS.Instance.AddFunctionBtn(new JIRVISFuncBtnStruct { btnName = "试炼场", btnIconKey = ONAME.shootingTrainingIcon, clickCallBack = BeginShootingTraning });

        //JIRVIS.Instance.AddFunctionBtn(new JIRVISFuncBtnStruct { btnName = "backup" , btnIconKey = ONAME.BackStep ,clickCallBack = CallBackClickJIRVISOutAstrology});
    }
    private void BeginShootingTraning()
    {
   
        int gameType = JIRVIS.Instance.jIRVISData.currentPlayGameType;
        AndaDataManager.Instance.CallServerApplyMatch("3",
                                                  JIRVIS.Instance.jIRVISData.currentEnemyStrongholdIndex,
                                                  JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex, CallBackFinishAppleMatch);
    }
    private void CallBackFinishAppleMatch(bool Success)
    {
        if (Success)
        {
            JIRVIS.Instance.CloseTips();
           
            data.RecieveMonsterItem();
            data.getDimensionSpace.FadeOut(data.RecieveDimensionSpace);
            callbackFinishController(ONAME.SHOOTINGTRAININGCONTROLLER);
            Debug.Log("成功进入试炼场");
            JIRVIS.Instance.PlayTips("成功进入试炼场");
        }
        else
        {
            JIRVIS.Instance.PlayTips("当前不能游戏，请检查网络");
        }
    }
    private void BuildJIRVISBtnForARAstrology()
    {
        List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>
        {
            new JIRVISFuncBtnStruct { btnName = "VV" , btnIconKey = ONAME.VVIcon , clickCallBack = CallBackClickJIRVISVVBtnForAstrology },
            new JIRVISFuncBtnStruct { btnName = "minemonstes" , btnIconKey = ONAME.MonsterIcon , clickCallBack = CallBackClickJIRVISOpenMonsterListBtn ,},
        };

        JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);

        List<PlayerMonsterAttribute> playerMonsterAttributes = AndaDataManager.Instance.GetUserFreesMonster();
        if(playerMonsterAttributes.Count!=0)
        {
            JIRVIS.Instance.AddFunctionBtn(new JIRVISFuncBtnStruct { btnName = "freeMonsters" , btnIconKey = ONAME.freeMonsters ,clickCallBack = ClickJIRVISOpenFreeMonsters});
        }
    }

    /// <summary>
    /// 打开现在自由的宠物的列表
    /// </summary>
    private void ClickJIRVISOpenFreeMonsters()
    {
        List<PlayerMonsterAttribute> monsterAttributes = AndaDataManager.Instance.GetUserFreesMonster();
        JIRVIS.Instance.BuildMonsterBtnList(monsterAttributes, ClickAddNewMonsterToThisStronghold, null , true, 6 );
    }

    private void ClickCancelSetMonster()
    {
        if(data.getPlayerMonsters.Count!=0)
        {
            //构建 在 观星庭内的列表
            BuildJIRVISBtnForAstrology();   
        }else
        {
            //退出占星庭详情，回到观星庭列表
            OutAstrology();
        }
        //有可能进入了编辑宠物的面板，所以取消设置宠物的时候，要关闭一下面板
        JIRVIS.Instance.CloseEditorBarForMonsterChangeNameOrBelongStorngholdIndex();
    }

    private void ClickAddNewMonsterToThisStronghold(PlayerMonsterAttribute playerMonsterAttribute)
    {
        //JIRVIS.Instance.CloseBtnBar();
        PauseFingEvent(true);

       // JIRVIS.Instance.CloseTips();//先关闭前一条

        JIRVIS.Instance.BuildEditorBarForMonsterChangeNameOrBelongStorngholdIndex(playerMonsterAttribute,data.getCurStrongholdAtrrobute.strongholdIndex, FinishUploadMonsterInfo, GiveUpChangeMonsterInfo);

    }

    #region 放弃编辑宠物名字
    private void GiveUpChangeMonsterInfo()
    {
        JIRVIS.Instance.CloseTips();

        PauseFingEvent(false);
    }

    #endregion
    #region 成功将修改后的宠物信息上传

    private void FinishUploadMonsterInfo()
    {
        data.BuildMonsterList();
        data.getCurStrongholdAtrrobute.currentMonsterCount = data.getPlayerMonsters.Count;

        data.SetCurSelectMonsterItemIndex(data.getPlayerMonsters.Count - 1);

        SetMonster();

        data.getCurInfoBar.capacityValue.text = (int)(data.getPlayerMonsters.Count) + "/" + (data.getCurStrongholdAtrrobute.playerStrongholdCapacity);

        Invoke("InvockCheckNeedAutoToMap" , 1.2f);
    }

    private void InvockCheckNeedAutoToMap()
    {
        if (AndaDataManager.Instance.userData.userMonsterList.Count == 1 && data.getCurStrongholdAtrrobute.currentMonsterCount == 1)
        {
            JIRVIS.Instance.PlayTipsForchoose("现在赶紧前往星域进行探索八", OTYPE.TipsType.onlyOneChooseTips, "那走八", "", AutoGoEnterSmartMap, null);
            JIRVIS.Instance.jIRVISData.getJIRVISBar.tipsForChoose_Contentgroup.alpha = 1;
            JIRVIS.Instance.RemoveCurrentBtnList();
        }
        else
        {
            PauseFingEvent(false);
            BuildJIRVISBtnForAstrology();
        }
    }

    private void AutoGoEnterSmartMap()
    {
        JIRVIS.Instance.jIRVISData.isAutoEnterTargetScene = 1;//地图；
        PauseFingEvent(false);
        OutAstrology();
    }

    #endregion



  






    #endregion

   

    private void BuildJIRVISBtnForDimensionroom()
    {
        List<JIRVISFuncBtnStruct> btnlist = new List<JIRVISFuncBtnStruct>();

        switch(JIRVIS.Instance.jIRVISData.getCurDisplayType)
        {
            case OTYPE.GameDisplayType.AR:
               

                List<JIRVISFuncBtnStruct> tmp = new List<JIRVISFuncBtnStruct>
                {
                    new JIRVISFuncBtnStruct{ btnName = "我的据点" , btnIconKey = ONAME.minePlayerSH, clickCallBack = OpenJIRVISStrongholdBtnForMine },
                    //new JIRVISFuncBtnStruct{ btnName = "星域",btnIconKey = ONAME.StarMapIcon, clickCallBack = JIRVIS.Instance.aRMonsterMainController.EnterStarspace },
                    //new JIRVISFuncBtnStruct{ btnName = "探索",btnIconKey = ONAME.TrvalIcon,   clickCallBack = JIRVIS.Instance.aRMonsterMainController.EnterTravl },
                    //new JIRVISFuncBtnStruct{ btnName = "交易",btnIconKey = ONAME.MallIcon,    clickCallBack = JIRVIS.Instance.aRMonsterMainController.EnterMall },
                    //new JIRVISFuncBtnStruct{ btnName = "次元库",btnIconKey = ONAME.PackIcon,  clickCallBack = JIRVIS.Instance.aRMonsterMainController.EnterPackage },
                    //new JIRVISFuncBtnStruct{ btnName = "添加据点",btnIconKey = ONAME.AddStrongholdIcon,  clickCallBack = ClickAddStrongholdButton },
                };

                btnlist.AddRange(tmp);

                //在AR模式下要显示 VV
                btnlist.Add(new JIRVISFuncBtnStruct { btnName = ONAME.BackStep, btnIconKey = ONAME.BackStep, clickCallBack = ClickChangetoVVType });

                break;
            case OTYPE.GameDisplayType.VV:

               
                //在VV模式下要显示 AR
                //btnlist.Add(new  JIRVISFuncBtnStruct {btnName = ONAME.ARType , btnIconKey = ONAME.ARIcon, clickCallBack = ClickChangetoARType });

                List<JIRVISFuncBtnStruct> tmp2 = new List<JIRVISFuncBtnStruct>
                {
                    new JIRVISFuncBtnStruct{ btnName = "我的据点" , btnIconKey = ONAME.minePlayerSH, btnType = 1 , clickCallBack = OpenJIRVISStrongholdBtnForMine },
                    new JIRVISFuncBtnStruct{ btnName = "星域",btnIconKey = ONAME.MapIcon, clickCallBack = EnterStarmap /*JIRVIS.Instance.aRMonsterMainController.EnterStarspace */},
                    new JIRVISFuncBtnStruct{ btnName = "探索",btnIconKey = ONAME.TrvalIcon,   clickCallBack = CallBackEnterSearch },
                     new JIRVISFuncBtnStruct{ btnName = "商城",btnIconKey = ONAME.MallIcon,  clickCallBack = CallBackEnterMall/*JIRVIS.Instance.aRMonsterMainController.EnterMall*/},
                    new JIRVISFuncBtnStruct{ btnName = "次元库",btnIconKey = ONAME.PackIcon,  clickCallBack = CallBackEnterHandbook/*JIRVIS.Instance.aRMonsterMainController.EnterMall*/},
                    new JIRVISFuncBtnStruct{ btnName = "添加据点",btnIconKey = ONAME.AddStrongholdIcon,  clickCallBack = ClickAddStrongholdButton },
                };

                btnlist.AddRange(tmp2);

                break;
        }
        //构建功能按钮
        JIRVIS.Instance.BuildFunctionBtn(btnlist,FinishBuildFunctionBtn );
    }




    #region 逻辑

    private bool CheckThisDimensionRoomHasMonster()
    { 
        return data.getPlayerMonsters == null || data.getPlayerMonsters.Count == 0? false: true;  
    }

   
 

    #region 切换据点信息的基本滑动逻辑
    private int dir;
    private Dictionary<int,bool> dragEvent = new Dictionary<int, bool>();
    private void SliderHori(float _value , bool _isDown)
    {
        if(data.isInAstrolog)
        {
           SliderChangeMonster(_value,_isDown);
        }else
        {
            SliderChangeDimensionRoom(_value,_isDown);
        }
    }

    private void SliderChangeDimensionRoom(float _value , bool _isDown)
    {
        
        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.AR)
        {
            if(!_isDown)
            {
                dir = _value>0?-1:1;
                if(dir == -1) //上一个 向左滑动
                {
                    if(data.getCurSelectItemIndex > 0)
                    {
                        SwitchRoomItem(data.getCurSelectItemIndex + dir);
                    }

                }else if(dir == 1) //下一个 向右滑动
                {
                    if(data.getCurSelectItemIndex < data.getDimensionMenu.infoItems.Count - 2)
                    {
                        SwitchRoomItem(data.getCurSelectItemIndex + dir);
                    }
                }
            }

        }else
        {
            if(!_isDown && dir!=0) //手指松开之后的
            {

                dragEvent.Clear();
                dragEvent  = new Dictionary<int, bool>
                {
                    {data.getCurSelectItemIndex , false},
                    {data.getCurSelectItemIndex + dir,false}
                };

                if(dir == -1) //上一个
                {
                    if(data.getCurSelectItemIndex > 0)
                        data.getDimensionMenu.infoItems[data.getCurSelectItemIndex+dir].RollAngle(_value , _isDown);
                }else if(dir == 1)
                {
                    if(data.getCurSelectItemIndex < data.getDimensionMenu.infoItems.Count-1)
                    {
                        data.getDimensionMenu.infoItems[data.getCurSelectItemIndex+dir].RollAngle(_value , _isDown);
                    } 
                }

                data.getDimensionMenu.infoItems[data.getCurSelectItemIndex].RollAngle(_value , _isDown);
                return ;
            }

            if(_value > 0) //上一个
            {
                dir = -1;
                if(data.getCurSelectItemIndex > 0)
                {
                    data.getDimensionMenu.infoItems[data.getCurSelectItemIndex+dir].RollAngle(_value , _isDown);
                }

                data.getDimensionMenu.infoItems[data.getCurSelectItemIndex].RollAngle(_value , _isDown);

            }else if(_value < 0) //下一个
            {
                dir = 1;
                if(data.getCurSelectItemIndex < data.getDimensionMenu.infoItems.Count-1)
                {
                    data.getDimensionMenu.infoItems[data.getCurSelectItemIndex+dir].RollAngle(_value , _isDown);
                }
                data.getDimensionMenu.infoItems[data.getCurSelectItemIndex].RollAngle(_value , _isDown);
            }
        }


    }

    private void SliderChangeMonster(float _value , bool _isDown)
    {
        if(Mathf.Abs(_value)< 200)return;
        if(!_isDown && dir!=0)
        {
            int _index = data.getCurSelectMonsterItemIndex;
            if(dir == -1 )
            {
                _index -= 1;
                if(_index < 0)return;
                data.SetCurSelectMonsterItemIndex(_index);
            }else if(dir == 1)
            {
                _index += 1;
                if(_index > data.getCurStrongholdAtrrobute.currentMonsterCount-1)return;
                data.SetCurSelectMonsterItemIndex(_index);
            }
            Debug.Log("_index" + _index);
            SetMonster();
        }

        dir = _value > 0 ? -1:1;
       
    }

    #endregion

    #endregion

    #region 回调


    private void CallBackEnterMall()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        callbackFinishController(ONAME.MALLCONTROLLER);
    }

    private void CallBackEnterHandbook()
    {
        //清楚空间按钮
        JIRVIS.Instance.RemoveCurrentBtnList();

        callbackFinishController(ONAME.DIMENSIONWAREHOUSECONTROLLER);
    }

    //进入探索空间
    private void CallBackEnterSearch()
    {
        //清楚空间按钮
        JIRVIS.Instance.RemoveCurrentBtnList();

        callbackFinishController(ONAME.SEARCHCONTROLLER);
    }


    //【点击进入崭新庭】
    private void CallbackEnterAstrologyScene()
    {  
        JIRVIS.Instance.CloseBtnBar();
        StartBuildAstrology();
    }

    public void ClickAddStrongholdButton()
    {

        if(AndaDataManager.Instance.userData.CheckHasBaseStrogholdDrawing())
        {
            JIRVIS.Instance.RemoveCurrentBtnList();
            //添加建立据点的代办事项。0 = 建立据点的代办事项
            JIRVIS.Instance.SetWaittingexcuteEventForAddStronghold();
            EnterStarmap();
        }else
        {
            JIRVIS.Instance.PlayTips("建造图纸好像不太够！");
        }

       
    }

    public void EnterStarmap()
    {
        JIRVIS.Instance.CloseTips();
        if(isTestLoadLocalData)
        {
            JIRVIS.Instance.PlayTips("次元技术局正在抓紧修复并打通星域传送，推荐暂时先使用探测器");
            return;
        }

        JIRVIS.Instance.RemoveCurrentBtnList();
        if (AndaDataManager.Instance.userData.userStrongholdList.Count != 0)
        {
            data.getDimensionMenu.PlayCurrentItemEnterStarmap(data.getCurSelectItemIndex);
            Invoke("InvockEnterStarmap", 1.2f);
        }
        else
            Invoke("InvockEnterStarmap", 0.5f);

        //callbackFinishController(ONAME.MAPCONCTROLLER);
    }

    private void InvockEnterStarmap()
    {
        //Debug.Log("lastStrongholdIndex" + data.getCurStrongholdAtrrobute.strongholdIndex);
        //JIRVIS.Instance.SetCurrentDimensionroomIndex(data.getCurStrongholdAtrrobute.strongholdIndex);

        //清楚空间按钮
        JIRVIS.Instance.RemoveCurrentBtnList();
        if (data.getDimensionMenu.gameObject.activeSelf)
        {
            data.getDimensionMenu.OpenBackgroundStroyBar(false);
        }

        // Debug.Log("Anda Said: EnterStarmap");

        //JIRVIS.Instance.SetCurrentDimensionroomIndex(data.tmpStrongholdIndex);
        data.InitValue();




        callbackFinishController(ONAME.MAPCONCTROLLER);


    }

    private void OpenMap()
    {
        
    }


    #endregion

    #region 点击回调

    #region 点击了jirvis上的宠物按钮]


    private void TouchItem(Transform _monsterItem)
    {
        if(data.isInAstrolog)
        {
            if(_monsterItem.tag == ONAME.MonsterTag)
            {
                _monsterItem.GetComponent<MonsterBasic>().ControllerToPlayMoodForHudong00();
            }
        }else
        {
            
        }
    }

    private void CallBackClickJIRVISMonsterBtn(PlayerMonsterAttribute pma)
    {
        int _itemIndex = data.getPlayerMonsters.IndexOf(pma);
        data.SetCurSelectMonsterItemIndex(_itemIndex);
        SetMonster();
    }


    private void CallBackClickJIRVISOpenMonsterListBtn()
    {
        JIRVIS.Instance.BuildMonsterBtnList(data.getPlayerMonsters,CallBackClickJIRVISMonsterBtn);
    }

    //[在占星庭界面点了回退按钮，关闭我的宠物列表]
    private void CallBackClickJIRVISCloseMineMonsterListBtn()
    {
        if(JIRVIS.Instance.isARType)
        {
            BuildJIRVISBtnForARAstrology();
        }else
        {
            BuildJIRVISBtnForVVAstrology();
        }
    }

    //[在占星庭 点击 AR ]
    private void CallBackClickJIRVISARBtnForAstrology()
    {
        if (data.getDimensionMenu.buildDimensionMenu_MonsterInforBar.isOpenSkillBar)
        {
            data.getDimensionMenu.buildDimensionMenu_MonsterInforBar.ClickOpneSkillInfo();
        }
      
        JIRVIS.Instance.ChooseGameDisplayType(OTYPE.GameDisplayType.AR);
        BuildAstrology();
    }
    //[在占星庭点击 VV]
    private void CallBackClickJIRVISVVBtnForAstrology()
    {
        JIRVIS.Instance.ChooseGameDisplayType(OTYPE.GameDisplayType.VV);
        BuildAstrology();
    }
    //[在占星庭点击 回到 占星庭列表]
    private void CallBackClickJIRVISOutAstrology()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        OutAstrology();
    }
   


    #endregion

    #endregion

    #region 事件

    private void InAstrologyRoomEvent()
    {
        
    }

    private void OpenMonsterSkillBar()
    {
        data.BuildMonsterSkillBoard();
    }

    #endregion
    private void ClickJIRVISDimensionbtn()
    {
        
    }



    private void FinishBuildFunctionBtn()
    {
        
    }



    #region gjp
    public void DelMonster()
    {
        var info = data.getCurMonsterAttribute;
        if (info.currentStateType ==1)
        {
            JIRVIS.Instance.PlayTips("当前宠物守卫据点中！");
            return;
        }
        if (info.currentStateType == 2)
        {
            JIRVIS.Instance.PlayTips("当前宠物外出搜索中！");
            return;
        }
        AndaDataManager.Instance.CallServerInsertMonsterToStronghold(info.monsterIndex, 0, info.monsterNickName, DelMonsterBack);
    }
    public void DelMonsterBack(bool success)
    {
        if (success)
        {
            var info = data.getCurMonsterAttribute;
            info.belongStrongholdIndex = 0;
            BuildAtrologyData();
            data.BuildPlayerStrongholdAttributeData();
            if (data.getPlayerMonsters.Count == 0)
            {
                data.getDimensionMenu.buildDimensionMenu_MonsterInforBar.gameObject.SetTargetActiveOnce(false);
            }
            data.getCurStrongholdAtrrobute.currentMonsterCount= data.getPlayerMonsters.Count;
            data.getCurInfoBar.capacityValue.text = (int)(data.getPlayerMonsters.Count) + "/" + (data.getCurStrongholdAtrrobute.playerStrongholdCapacity);
        }
        else
        {
            JIRVIS.Instance.PlayTips("操作失败");
        }
    }
    #endregion



























}
