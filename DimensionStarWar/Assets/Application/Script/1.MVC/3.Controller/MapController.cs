using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using Mapbox.Unity.Map;
using Mapbox.Unity.Location;
using Mapbox.Geocoding;
using Mapbox.Utils;

public class MapController : BaseController {

   // public BasicMap map;
    private MapCtrData data;
    private Vector2 viewPort = Vector2.zero;
    private Vector2 getViewPort
    {
        get
        {
            if(viewPort == Vector2.zero)
            {
                int x = (Screen.width -525*2) /2;
                int y = Screen.height/2 - x;
                viewPort =new Vector2(x,y); 
            }

            return viewPort;
        }
        
    }

    public override void StartController()
    {
        base.StartController();
        ARMonsterSceneDataManager.Instance.SetUsedCamera(ARMonsterSceneDataManager.Instance.MapCamera);
        ARMonsterSceneDataManager.Instance.OpenGameLight(true);
        BuildData();

        BuildMenu();
        StartCheckDisplayType();

        RegisterControlCamera(true);
        RegisterSelectMapItem(true);
    }



    public override void EndController()
    {
        base.EndController();
        if(data.getCommissionEventContainsBuildstronghold)
        {
            JIRVIS.Instance.RemoveCommisionEventForAddStronghold();
        }
         ARMonsterSceneDataManager.Instance.OpenGameLight(false);
        data.InitData();
        ARMonsterSceneDataManager.Instance.aRWorld.CloseMapCamera();
        AndaMap.Instance.CloseMap();
        JIRVIS.Instance.CloseTips();

        RegisterControlCamera(false);
        RegisterSelectMapItem(false);
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        if(data.isWait)return;
        //[打开了 高层级的面板 底层的触控逻辑将不被执行]
        if(!data.isOpenJirvisChildBar)
        {   
            FingerEvent.OnUpdate();
        }
        MoveCamera();
        RotateCamera();
        ScaleMap();
        UpdatePlayerShUIPose();
        //检查据点是否范围内
        //CheckTowerInRect();
        //只有在 放置据点的时候，回去检测与其他据点的位置
        if (data.getIsForSetTmpStronghold)
        {
            if(data.getOtherStrongholdItem == null || data.getOtherStrongholdItem.Count == 0)
            {
                data.SetBuildStrongholdState(true);

            }else
            {
                int count =  data.getOtherStrongholdItem.Count;
                int count2 = data.getMineStrongholdItem.Count;

                int allcount =count + count2;
                for(int i = 0 ; i < allcount; i++)
                {
                  /*  if(i < count)
                    {
                        if(!CheckSetTmpTowerRange(data.getOtherStrongholdItem[i]))
                        {
                            data.SetBuildStrongholdState(false);
                            data.tmpToweritem.DisplayCircleColor(1);
                            return;
                        }
                    }else
                    {
                        if (!CheckSetTmpTowerRange(data.getMineStrongholdItem[i-count])) 
                        {
                            data.SetBuildStrongholdState(false);
                            data.tmpToweritem.DisplayCircleColor(1);
                            return;
                        }
                    }*/
                }

                data.SetBuildStrongholdState(true);
                data.tmpToweritem.DisplayCircleColor(0);

            }
           
        }

    }


    private void RegisterControlCamera(bool _isRegister)
    {
        /*if(_isRegister)
        {
            if (FingerEvent.doubleFingerRotateEvent!= ControlRotateCamera)
            {
                FingerEvent.doubleFingerRotateEvent += ControlRotateCamera;
            }
           
            if(FingerEvent.singleFingerDragHorizionVertic!= ControlDragMoveCamera)
            {
                FingerEvent.singleFingerDragHorizionVertic += ControlDragMoveCamera;
            }
                //FingerEvent.doubleFingerDragSameDirection += ControlUpDownCamera;
         
        }
        else
        {
            if(FingerEvent.doubleFingerRotateEvent!=null)
            {
                FingerEvent.doubleFingerRotateEvent -= ControlRotateCamera;
            }
            if(FingerEvent.singleFingerDragHorizionVertic!=null)
            {
                FingerEvent.singleFingerDragHorizionVertic -= ControlDragMoveCamera;
            }
           //FingerEvent.doubleFingerDragSameDirection -= ControlUpDownCamera;

        }*/
    }

    private void RegisterSelectMapItem(bool _isRegister)
    {
       /* if(_isRegister)
        {
            if(FingerEvent.clickSelectItemEvent!= CallbackSelectItem)
            {
                FingerEvent.clickSelectItemEvent += CallbackSelectItem;
            }
           
        }else
        {
            if(FingerEvent.clickSelectItemEvent!=null)
            {
                FingerEvent.clickSelectItemEvent -= CallbackSelectItem;
            }
           
        }*/
    }


    private void BuildData()
    {
        if(data == null)
        {
            data = new MapCtrData();
            data.BuildData(this);
        }
    }
    private void BuildMenu()
    {
        data.BuildMenu(ONAME.mapMenu2);
    }

    //开始检测一下是那种显示方式
    private void StartCheckDisplayType()
    {
        data.SetCurCamera();
        if (JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.VV)
        {
            SwitchVVMap();
        }else
        {
            SwitchARMap();
        }
    }
    /// <summary>
    /// Switchs the VVM ap.
    /// </summary>
    private void SwitchVVMap()
    {
        ARMonsterSceneDataManager.Instance.aRWorld.CloseBlur();
        ARMonsterSceneDataManager.Instance.aRWorld.ClosebackgroundVV();
        ARMonsterSceneDataManager.Instance.aRWorld.OpenMapCamera();
        if(data.getCommissionEventContainsBuildstronghold)
        {
            AndaLocaltion.Instance.GetLocationOnce(FinishLocation);
        }
        else
        {
            data.curMineStrongholdAttr = AndaDataManager.Instance.GetStrongholdAtrrWithJIRVISSaveIndexs();
            AndaMap.Instance.andaMapData.SetCurrentMapCenterLatlong(data.curMineStrongholdAttr.strongholdPosition);
            AndaLocaltion.Instance.GetLocationOnce(FinishLocationf2);//也要定位一下
            GetPOIData();
        }
    }

    private void SwitchARMap()
    {
        ARMonsterSceneDataManager.Instance.mainCamera.gameObject.SetActive(true);
        //隐藏map tiles
        AndaMap.Instance.SetTileState(false);
    }







    private void FinishLocationf2(Location location)
    {

    }



    private void FinishLocation(Location location)
    {
        AndaMap.Instance.andaMapData.SetCurrentMapCenterLatlong(new List<double> { location.LatitudeLongitude.x, location.LatitudeLongitude.y});
        GetPOIData();
       
    }

    #region 通过当前位置获取周边数据

    private void GetPOIData()
    {
        List<double> curLatlon = AndaMap.Instance.andaMapData.GetMapCenterLatlon;
        AndaDataManager.Instance.CallServerGetCurrentLocaitonRangeOfOtherData(curLatlon, FinishGetPOIData);
    }

    #endregion

    #region 成功获取周围玩家的POI数据，并且data构建数据 , 构建地图

    // psalist wiht mine and another stronghold , 
    private void FinishGetPOIData(List<PlayerStrongholdAttribute> psalist, List<BusinessStrongholdAttribute> bsalist)
    {
        //开始构建地图
        AndaMap.Instance.BuildMap(null);

        //构建周围的据点数据
        data.SetLocaitonRangeUserData(psalist, bsalist);

        BuildMapItem();

        CheckIsBuildNewStronghold();

        InitCameraPose();
    }

    #endregion



    #region 判断是否是够构建新的占星庭
    private void CheckIsBuildNewStronghold()
    {
        //有代办事件，新建占星庭
        if (data.getCommissionEventContainsBuildstronghold)
        {
            JIRVISAsk_sureAboutSetStrongholdHere();
            data.BuildTmptower();//构建占星庭虚拟体，
            data.SetWaitForSetTmpStronghold(true);

            SetMineStrongholdCircleToWhite();
            SetOtherPlayerStrongholdCircleToWhite();

        }
        else //没有要待办的事件
        {
            JIRVIS.Instance.PlayTips("小星序正在为探测周围的其他玩家的占星庭");
            BuildJIRVISFunctionBtn();//构建导航按钮
        }
    }
    #endregion

    #region 加载地图上的物件 ，

    private void BuildMapItem()
    {
        #region 构建据点
        if (data.getOtherPlayerStrongholdAttribute != null )
        {
             data.BuildAnotherPlayerSHUI();
        }
        if (data.getSeflStrongholdAttribute != null )
        {
            data.BuildMineSHUI();
        }

        if(data.getBussinessStrongholdAttribute !=null  )
        {
            data.BuildAllRangeBussinessStrongholdItems();
        }

        if (data.getCommissionEventContainsBuildstronghold)
        {
            RegisterSelectMapItem(false);
        }
        #region 据点构建完之后，刷新一下朝向
        //UpdateMedalFaceToMapCamera50();
        #endregion


        #endregion
    }

    #endregion

    #region 成功获取区域名（行政区）,编辑占星庭，准备上传

    private void EditorNewStronghold(string info)
    {
        SetMineStrongholdCircleToWhite();
        data.SetWaitForSetTmpStronghold(false);
        data.tmpToweritem.SetTargetActiveOnce(false);
        data.isWait = false;
        data.SetOpenchildBar(true);//对地图的操作禁止
        data.BuildStrongholdEditorBar(info);//打开占星庭编辑面板
        JIRVIS.Instance.CloseBtnBar();
        JIRVISAsk_SureAboutUploadStrongholdData();
    }

    #endregion


    #region 贾维斯 按钮点击 ，点击了切换到AR模式

    private void JIRVISClick_ChangeToARMode()
    {
        JIRVIS.Instance.jIRVISData.SetCurrentDisplayType( OTYPE.GameDisplayType.AR);
        StartCheckDisplayType();
    }

    #endregion

    #region 完成了AR构建

    private void FinishBuildARMode()
    { 
        BuildJIRVISFunctionBtn();
    }

    #endregion

    #region 贾维斯按钮点击 切换到VV模式

    public void JIRVISClikc_ChangeToVVMode()
    {
        JIRVIS.Instance.jIRVISData.SetCurrentDisplayType(OTYPE.GameDisplayType.VV);
        StartCheckDisplayType();
    }
    #endregion


    #region JIRVIS按钮点击，选择我想要的占星庭【切换占星庭】

    //[在贾维斯面板选择我的据点]
    private void CallBackClickJIRVISStorngholdBtn(int strongholdIndex)
    {
        if (!AndaMap.Instance.andaMapData.GetMapCenterVector2d.Equals(AndaLocaltion.Instance.currentLocation.LatitudeLongitude))
        {
            if (data.getCurSelectstrongholdIndex == strongholdIndex) return;
        }
        data.SetCurrentPlayerstrongholdIndex(strongholdIndex);
        PlayerStrongholdAttribute playerStrongholdAttribute = AndaDataManager.Instance.GetPlayerCurrentStrongholdData(strongholdIndex);
        AndaMap.Instance.andaMapData.SetCurrentMapCenterLatlong(playerStrongholdAttribute.strongholdPosition);

        //切换地图中心坐标，需要重新构建POI数据
        GetPOIData();
    }


    #endregion

    #region JIRVIS 按钮点击 回到我当前的定位的位置
    //[获得当前定位]
    public void CallBackClickJIRVISBtnBacktoCurrentLocaiton()
    {
        if(AndaMap.Instance.andaMapData.GetMapCenterVector2d.Equals(AndaLocaltion.Instance.currentLocation.LatitudeLongitude))return ;
       
        //if(AndaMap.Instance.andaMapData.GetMapCenterVector2d == AndaLocaltion.Instance.currentLocation.LatitudeLongitude)return;
        AndaLocaltion.Instance.currentMapLocation = AndaLocaltion.Instance.currentLocation.LatitudeLongitude;
        AndaMap.Instance.andaMapData.SetCurrentMapCenterLatlong(new List<double> { AndaLocaltion.Instance.currentMapLocation.x, AndaLocaltion.Instance.currentMapLocation.y });

        //切换地图中心坐标，需要重新构建POI数据
        GetPOIData();

    }

    #endregion

    #region JIRVIS 构建按钮 1.我的据点，2.3D/2D切换按钮， 3.退出地图

    private void BuildJIRVISFunctionBtn()
    {
        if (data.isOpenJirvisChildBar) return;//如果打开 子导航栏，那么就不执行了
        JIRVIS.Instance.RemoveCurrentBtnList();
        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.VV)
        {
            List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>()
            {
               // new JIRVISFuncBtnStruct { btnName = "AR" , btnIconKey = ONAME.ARIcon ,clickCallBack = JIRVISClick_ChangeToARMode },
                new JIRVISFuncBtnStruct { btnName = "我的据点" , btnIconKey = ONAME.mineStrongholIcon ,clickCallBack = JIRVISBuildMinestrongholdListBtn },
                new JIRVISFuncBtnStruct { btnName = data.getIsMap2D?"3D地图":"2D地图" , btnIconKey = data.getIsMap2D? ONAME.mapAngle3D:ONAME.mapAngle2D ,clickCallBack = ChangeMapAngle },
                new JIRVISFuncBtnStruct { btnName = "回退" , btnIconKey = ONAME.BackStep ,clickCallBack = BackToBuildDimensionRoomController }
            };

            JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);
        }else
        {
            List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>()
            {
                new JIRVISFuncBtnStruct { btnName = "返回" , btnIconKey = ONAME.VVIcon ,clickCallBack = JIRVISClikc_ChangeToVVMode },
                new JIRVISFuncBtnStruct { btnName = "我的据点" , btnIconKey = ONAME.mineStrongholIcon ,clickCallBack = JIRVISBuildMinestrongholdListBtn },
                new JIRVISFuncBtnStruct { btnName = data.getIsMap2D?"3D地图":"2D地图" , btnIconKey = data.getIsMap2D? ONAME.mapAngle3D:ONAME.mapAngle2D ,clickCallBack = ChangeMapAngle },
                new JIRVISFuncBtnStruct { btnName = "回退" , btnIconKey = ONAME.BackStep ,clickCallBack = BackToBuildDimensionRoomController }
            };

            JIRVIS.Instance.BuildFunctionBtn(jIRVISFuncBtnStructs);
        }
       
    }


    #endregion
    #region JIRVIS 构建按钮 我的据点列表按钮
    private void JIRVISBuildMinestrongholdListBtn()
    {
        JIRVIS.Instance.BuildDimensionRoomBtnList(AndaDataManager.Instance.GetPlayerAllStrongholdAttribute(), CallBackClickJIRVISStorngholdBtn);
        List<JIRVISFuncBtnStruct> jIRVISFuncBtnStructs = new List<JIRVISFuncBtnStruct>
        {
            new JIRVISFuncBtnStruct { btnName = "当前位置", btnIconKey = ONAME.MapIcon , clickCallBack =  CallBackClickJIRVISBtnBacktoCurrentLocaiton},
            new JIRVISFuncBtnStruct { btnName = "回退", btnIconKey = ONAME.BackStep , clickCallBack =  BuildJIRVISFunctionBtn }

        };
        JIRVIS.Instance.AddFunctionBtns(jIRVISFuncBtnStructs);
    }
    #endregion


    #region JIRVIS 询问是否确定在这个构建占星庭 确定放弃
    private void JIRVISAsk_sureAboutSetStrongholdHere()
    {
        //玩家有其他据点
        if (AndaDataManager.Instance.PlayerHasStronghold())
        {
            JIRVIS.Instance.PlayTipsForchoose("您可以尝试滑动屏幕，移动占星庭位置，当然您也可以从右边的您已拥有的占星庭列表种选择一个，将您新占星庭建立在其旁边。如果您准备好了，就点击确定，我会立刻安排建立占星庭",
                                              OTYPE.TipsType.chooseTips, "确定", "放弃", ClickComfirmtoSetStronghold, GiveupSetTower, JIRVISBuildMinestrongholdListBtn);

        }
        else//没有其他据点的情况
        {
            JIRVIS.Instance.PlayTipsForchoose("您可以尝试滑动屏幕，移动占星庭徽章，选择一个位置来作为你的根据地。如果您准备好了，就点击确定，我会立刻安排建立占星庭",
                                              OTYPE.TipsType.onlyOneChooseTips, "确定", "", ClickComfirmtoSetStronghold, null);

        }
    }

    #endregion
    #region 玩家的回答，选择在这里构建占星庭

    private void ClickComfirmtoSetStronghold()
    {
        JIRVIS.Instance.CloseTips();
        //可以在这里构建占星庭
        if (data.getBuildstorngholdState)
        {
            data.isWait = true;
            //正在等待放置据点 ，通知数据，不用再去检测与周围的其他据点的距离了
            data.SetWaitForSetTmpStronghold(false);
            //调取区域名（行政区）
            AndaLocaltion.Instance.GetFeartureInfo(EditorNewStronghold);

        }
        else
        {

            JIRVIS.Instance.PlayTips("这里不适合建立占星庭，请重新选址");
            Invoke("JIRVISAsk_sureAboutSetStrongholdHere" , 2f);
            //播放错误的音效
        }
    }
    #endregion
    #region 玩家放弃了构建占星庭

    //放弃放置据点
    private void GiveupSetTower()
    {
        RegisterSelectMapItem(true);
        data.SetOpenchildBar(false);//对地图的允许
        //正在等待放置据点 ， 不等待了
        data.SetWaitForSetTmpStronghold(false);

        JIRVIS.Instance.CloseTips();
        //放弃建立据点
        JIRVIS.Instance.RemoveCommisionEventForAddStronghold();

        data.RecieveTmptowerItem();

        BuildJIRVISFunctionBtn();
    }



    #endregion

    #region JIRVIS 询问是否上传 占星庭编辑后的数据
    private void JIRVISAsk_SureAboutUploadStrongholdData()
    {
        JIRVIS.Instance.PlayTipsForchoose(OTYPE.Tipscontent.checkUploadstronghold, OTYPE.TipsType.chooseTips, "保存", "取消", ClickComfirmUploadstrongholdInfo, ClickCancelSetStronghold);
    }
    #endregion
    #region 玩家选择 上传占星庭编辑数据

    private void ClickComfirmUploadstrongholdInfo()
    {
        if (data.getJIRVISEditorboard_StrongholdholdInfo.medalName.text == "")
        {
            JIRVIS.Instance.PlayTips("据点名称不为空！");
            return;
        }

        data.tmpToweritem.SetTargetActiveOnce(true);
        data.SetOpenchildBar(false);//对地图的操作允许

        //Debug.Log("上传数据成功");
        Vector2d v2d = AndaMap.Instance.ConverGameworldPointToGeopoint(data.tmpToweritem.transform.position);
        Debug.Log("v2d:::::" + v2d);
        AndaDataManager.Instance.CallServerSetPlayerStronghold(
            30000,
            data.getJIRVISEditorboard_StrongholdholdInfo.medalName.text,
            AndaLocaltion.Instance.GetGeocodelocationName(),
            v2d.x,
            v2d.y,
            data.getJIRVISEditorboard_StrongholdholdInfo.selectStuteID,
            CallbackFinishsetStronghold
        );
    }

    #endregion
    #region 玩家选择 放弃上传占星庭数据
    private void ClickCancelSetStronghold()
    {
        data.tmpToweritem.SetTargetActiveOnce(true);
        data.SetOpenchildBar(true);//对地图的操作的禁止
        data.RemoveJIRVISEditorbarForStrongholdInfo();
        JIRVISAsk_sureAboutSetStrongholdHere();
    }
    #endregion


    #region JIRVIS 询问是否立刻进入自己选择的占星庭
    private void JIRVISAskForEnterMineStrongholdNow()
    {
        if(JIRVIS.Instance.jIRVISData.IsAutoEnterAstroloy)
        {
            JIRVIS.Instance.PlayTipsForchoose("现在您可以进入到占星庭据点，在庭内放置星宿", OTYPE.TipsType.onlyOneChooseTips, "立即进入", "", PlayerChooseEntermienStrongholdNow);
            RegisterSelectMapItem(false);
        }
        else
        {
            JIRVIS.Instance.PlayTipsForchoose("这是您自己的据点，是否立刻进入?", OTYPE.TipsType.chooseTips, "立即进入", "路过", PlayerChooseEntermienStrongholdNow, PlayerGiveUpEnterminstrongholdNow);
            RegisterSelectMapItem(false);
        }
      
    }
    #endregion

    #region 玩家的选择，立刻进入
    private void PlayerChooseEntermienStrongholdNow()
    {
        BackToBuildDimensionRoomController();
    }
    #endregion

    #region 玩家的选择 放弃进入 。路过
    private void PlayerGiveUpEnterminstrongholdNow()
    {
        BuildJIRVISFunctionBtn();
        JIRVIS.Instance.CloseTips();
        RegisterSelectMapItem(true);
    }
    #endregion

    #region 玩家对保卫的据点的选择，。 保卫或者不保卫
    private void PlayerChooseToProtectBussinessSH(bool _protect)
    {
        if(_protect)
        {
            JIRVIS.Instance.PlayTips("当前无法直接前往保卫，侵略者过于强大");
            BuildJIRVISFunctionBtn();
        }
        else
        {
            BuildJIRVISFunctionBtn();
            JIRVIS.Instance.PlayTips("放弃保卫据点");
        }
     
    }
    #endregion

  

    #region 服务器回调上传编辑的占星庭数据成功

    private void CallbackFinishsetStronghold(PlayerStrongholdAttribute playerStrongHoldGrowUpAttribute)
    {
        //data.BuildStrongholdForAddition
        data.BuildStrongholdForAddition(playerStrongHoldGrowUpAttribute);
        JIRVIS.Instance.CloseTips();
        data.RemoveJIRVISEditorbarForStrongholdInfo();
        JIRVIS.Instance.RemoveCommisionEventForAddStronghold();
        data.RecieveTmptowerItem();
        data.SetCurrentPlayerstrongholdIndex(AndaDataManager.Instance.userData.userStrongholdList[0].strongholdIndex);

        if (AndaDataManager.Instance.PlayerHasMonster())
        {
            if(AndaDataManager.Instance.userData.userStrongholdList.Count == 1)
            {
                JIRVIS.Instance.jIRVISData.SetCurrentAutoEnterAstroloy(data.getCurSelectstrongholdIndex);
                //提示让玩家点自己刚建的据点看看
                JIRVISAskForEnterMineStrongholdNow();
            }
        }
        else //如果玩家一只宠物都没有，那么先提示玩家去捕捉
        {
            data.SetOpenchildBar(true);//对地图的操作允许
            JIRVIS.Instance.PlayTipsForchoose("前方奖品高能，探测器已经准备完毕，感兴趣就跟我来八", OTYPE.TipsType.chooseTips, "那我们走八", "不感兴趣", ToSearchController, CloseJumpToDetectControllerTips);
        }

       // UpdateMedalFaceToMapCamera50();
        RegisterSelectMapItem(true);

    }

    #endregion

  
    #region 更新相机位置，每次切换据点或者重新定位，相机都会对焦到相应位置

    private void InitCameraPose()
    {
        Vector3 centerPose = AndaMap.Instance.GeoToWorldPoseWithCurrentLatlong();
        Quaternion quaternion = Quaternion.LookRotation(centerPose - ARMonsterSceneDataManager.Instance.GetMapCameraPositionWithGamewroldY());
        Vector3 euler = ARMonsterSceneDataManager.Instance.MapCamera.transform.eulerAngles;
        euler.y = quaternion.eulerAngles.y;
        ARMonsterSceneDataManager.Instance.MapCamera.transform.eulerAngles = euler;
        Vector3 cFwd = ARMonsterSceneDataManager.Instance.MapCamera.transform.forward;
        cFwd.y = 0;
        Vector3 pose = centerPose + (centerPose - cFwd).normalized * 60;
        pose.y = ARMonsterSceneDataManager.Instance.MapCamera.transform.position.y;
        ARMonsterSceneDataManager.Instance.MapCamera.transform.position = pose;
    }

    #endregion

    #region 检查当前位置是否可以放置据点

    public bool CheckSetTmpTowerRange(BuildPlayerTower _playerItemTower)
    {
        float distance = Vector3.Distance(data.tmpToweritem.selfPostion, _playerItemTower.selfPostion);
        return distance > 10;
        /*
        if (distance < 10f)
        {
            data.SetBuildStrongholdState(false);
            data.tmpToweritem.DisplayCircleColor(1);
        }
        else
        {
            data.SetBuildStrongholdState(true);
            data.tmpToweritem.DisplayCircleColor(0);
        }*/
    }


    #endregion

    #region 让其他玩家的据点圈变成灰色

    private void CloseOtherPlayerStrongholdCircle()
    {
       /* int count = data.getOtherStrongholdItem.Count;
        for(int i = 0 ;i <count; i++)
        {
            data.getOtherStrongholdItem[i].SetCircleColore(2);
        }
*/
    }

    #region 让其他玩家的据点圈变成白色
    private void SetOtherPlayerStrongholdCircleToWhite()
    {
        /*int count = data.getOtherStrongholdItem.Count;
        for (int i = 0; i < count; i++)
        {
            data.getOtherStrongholdItem[i].SetCircleColore(1);
        }*/
    }
    #endregion

    #endregion

    #region 让自己的据点的圈变成白色
    private void SetMineStrongholdCircleToWhite()
    {
        /*int count = data.getMineStrongholdItem.Count;
        for (int i = 0; i < count; i++)
        {
            data.getMineStrongholdItem[i].SetCircleColore(0);
        }*/
    }

    #endregion

    #region 点击地图上的据点图标
    public void ClickSelectMapItem(StrongholdBaseAttribution shAttr)
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        switch(shAttr.hostType)
        {
            case 0:
                if (shAttr.hostIndex == AndaDataManager.Instance.userData.userIndex)
                {
                    OpenPlayerStrongholdInformaiton(shAttr);
                }else
                {
                    OpenOtherPlayerStrongholdInformaiton(shAttr);
                }
                    
                break;
            case 1:
                OpenBussinessStrongholdInformation(shAttr);
                break;
            case 2:

                break;
        }
    }
    #endregion

    #region 打开玩家据点信息面板_自己的
    private void OpenPlayerStrongholdInformaiton(StrongholdBaseAttribution _shBase)
    {
        data.SetCurrentPlayerstrongholdIndex(_shBase.strongholdIndex);
        JIRVISAskForEnterMineStrongholdNow();
    }

    #endregion

    #region 打开玩家据点别人的
    private void OpenOtherPlayerStrongholdInformaiton(StrongholdBaseAttribution _shBase)
    {
        JIRVIS.Instance.jIRVISData.SetCurrentChallenggeStronghold((PlayerStrongholdAttribute)_shBase);
        CallSeverGetSelectStrongholdInfomation();
    }
    #endregion

    #region 打开商家据点信息面板
    private void OpenBussinessStrongholdInformation(StrongholdBaseAttribution _shBase)
    {
        if (data.getCommissionEventContainsBuildstronghold) return;
        BusinessStrongholdAttribute bsa = (BusinessStrongholdAttribute)_shBase;
        JIRVIS.Instance.jIRVISData.SetCurrentProtectedStronghold(bsa);
        JIRVIS.Instance.BuildBussinessStrongholdInfomationBar(bsa);
        JIRVIS.Instance.jIRVISData.jIRVISContent_Bussiness.callBackPlayerChoose = PlayerChooseToProtectBussinessSH;
    }

    #endregion
  

    #region 玩家点击了据点
    private void CallbackSelectItem(Transform item)
    {

        /*//先检查一下这个据点有没有宠物
        List<PlayerMonsterAttribute> tmpMonsterList = AndaDataManager.Instance.GetPlayerMonsterAttributeBelongThisStronghold(JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex);
        if (tmpMonsterList == null || tmpMonsterList.Count == 0)
        {
            tmpMonsterList = AndaDataManager.Instance.GetUserFreesMonster();
            if (tmpMonsterList.Count == 0)
            {
                JIRVIS.Instance.PlayTipsForchoose("当前没有可以出战的星宿，我发现有一个地方可以捕捉星宿，请随我而来！", OTYPE.TipsType.chooseTips, "那我们走八", "不感兴趣", ToSearchController, CloseJumpToDetectControllerTips);
                data.SetOpenchildBar(true);//对地图的操作的禁止
                return;
            }
            else
            {
                JIRVIS.Instance.BuildMonsterBtnList(tmpMonsterList, SetMonsterToThisStronghold);
                JIRVIS.Instance.AddFunctionBtn(new JIRVISFuncBtnStruct { btnName = "返回", btnIconKey = ONAME.BackStep, clickCallBack = CloseInsterMonsterTostrongholdEditorBar });
                JIRVIS.Instance.PlayTips("尊敬的读星者请将该星宿加入占星庭，为了+[" + AndaDataManager.Instance.GetPlayerAllStrongholdAttribute()[0].strongholdNickName + "而战！]");
                return;
            }

        }*/

        if (data.getCommissionEventContainsBuildstronghold) return;
        BuildPlayerTower towerBase = item.GetComponent<BuildPlayerTower>();
        if (towerBase != null)
        {
            if (towerBase.getStronholdType == 1)//商家
            {
                JIRVIS.Instance.PlayTips("星域商人正在穿越传送门的途中，即将登陆");

                /* OTYPE.Tipscontent tipscontent = OTYPE.Tipscontent.protectStronghold;
                string content = "是否立刻对" + towerBase.data.getStrongholdBaseAttribution.strongholdNickName + MonsterGameData.GetTipsContent(tipscontent);
                JIRVIS.Instance.jIRVISData.SetCurrentProtectedStronghold((BusinessStrongholdAttribute)towerBase.data.getStrongholdBaseAttribution );
                JIRVIS.Instance.PlayTipsForchoose(content,OTYPE.TipsType.chooseTips, "保卫" ,"瑟瑟发抖" ,CallBackComfirmGame, JIRVIS.Instance.CloseTips);
               */
            }
            else if (towerBase.getStronholdType == 0)//个人
            {
                if (towerBase.getHostIndex == AndaDataManager.Instance.userData.userIndex)
                {
                    data.SetCurrentPlayerstrongholdIndex(towerBase.getStrongholdIndex);
                    JIRVISAskForEnterMineStrongholdNow();
                }
                else
                {
                    JIRVIS.Instance.jIRVISData.SetCurrentChallenggeStronghold((PlayerStrongholdAttribute)towerBase.playerStrongholdAttribute);
                    CallSeverGetSelectStrongholdInfomation();
                }
            }
        }
    }

    #endregion

    #region BUILD




    private void BuildTmpTower()
    {
        data.BuildTmptower();

        BuildJIRVISTipsForAskuserComfirmsetStrongholdhold();
    }



    private void BuildJIRVISTipsForAskuserComfirmsetStrongholdhold()
    {
        JIRVIS.Instance.PlayTipsForchoose(OTYPE.Tipscontent.checkBuildstronghold, OTYPE.TipsType.chooseTips,"确定","放弃放置",ClickComfirmtoSetStronghold,GiveupSetTower);
    }
   
    #endregion


   

    //获取等级最高的据点Index，
    private int CheckRightStrongholdIndex(List<PlayerStrongholdAttribute> _list)
    {
        int tmpLevel = 0;
        int tmpStrongholdIndex = AndaDataManager.Instance.GetPlayerDefaultStrongholdAttr().strongholdIndex;
        foreach(var go in _list)
        {
            if(go.strongholdLevel<=tmpLevel)continue;
            tmpLevel = go.strongholdLevel;
            tmpStrongholdIndex = go.strongholdIndex;
        }
        return tmpStrongholdIndex;
    }


    //玩家同意了jirvis筛选出来的据点
    private void ClickJIRVISComfirmSelectRightSrongholdPoint()
    {
        //那走吧
        CallBackClickJIRVISStorngholdBtn(data.getRightStrongholdIndex);
        JIRVIS.Instance.CloseTips();

    }
    //放弃从JIRVIS推荐的
    private void ClickJIRVISForgetSelectRightStrongholdPoint()
    {
        //获取地理编 ，开始构建 地图上的物件
        ExcuteGetOtherplayerStrongholdData();
    }

   
   


   



    private void CloseJumpToDetectControllerTips()
    {
        data.SetOpenchildBar(false);//对地图的操作允许
        JIRVIS.Instance.CloseTips();
        BuildJIRVISFunctionBtn();
    }

    private void ToSearchController()
    {
        callbackFinishController(ONAME.SEARCHCONTROLLER);
    }

   
    //[获取完数据，开始开始构建地图数据]
    public void FinishGetOtherStrongholdData(List<PlayerStrongholdAttribute> psalist, List<BusinessStrongholdAttribute> bsalist)
    {
        data.SetWaitState(false);

        //为数据负值一下数值 ，并设置据点在地图上的位置
        data.SetLocaitonRangeUserData(psalist,bsalist);
       
        //待执行事件，添加据点
        if(JIRVIS.Instance.jIRVISData.getWaitexcuteEventlist.Contains(0))
        { //正在等待放置据点
            data.SetWaitForSetTmpStronghold(true);

            BuildTmpTower();
          
        }else
        {
           

            BuildMapItem();

            //没有代办事项

            BuildJIRVISFunctionBtn();
        }

       // CheckTowerInRect();


    }
   



    #region [执行]

    private void BackToBuildDimensionRoomController()
    {
        JIRVIS.Instance.RemoveCurrentBtnList();
        callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
    }
    private void ExcuteGetOtherplayerStrongholdData()
    { 
        data.SetWaitState(true);
        data.GetOtherStrongholdListwithCurrentplayerLocation(FinishGetOtherStrongholdData,AndaLocaltion.Instance.getLocationForDoublelist);
    }

    //[测试用 批量插入数据]
    private void TestInsertStrongholdData(Vector3 point)
    {
            Vector3 vector3 = point;
            List<string> ad = new List<string>();
            for(int i =-50 ; i<50 ;i++)
            {
                vector3.x = point.x+ i* Random.Range(5, 16);

                vector3.z = point.z + i* Random.Range(5 , 16);

                Vector3 vector33 = vector3;
                vector33.x *= -1;

                Vector2d vector2d = AndaMap.Instance.ConverGameworldPointToGeopoint(vector3);

                Vector2d vector2d2 = AndaMap.Instance.ConverGameworldPointToGeopoint(vector33);

                string st = vector2d.y +","+vector2d.x;
                string st2 = vector2d2.y + "," + vector2d2.x;

                ad.Add(st);
                ad.Add(st2);

            }
         AndaDataManager.Instance.TestInsertStronghold(ad);
    }

    //[向服务器索要点击的据点数据]
    private void CallSeverGetSelectStrongholdInfomation()
    {
        data.SetWaitState(true);
        AndaDataManager.Instance.CallServerGetFightMonsterForOtherPlayer(JIRVIS.Instance.jIRVISData.currentEnemyStrongholdIndex,CallBackGetStrongholdEnemyData);
       
    }


  
    #endregion

 
   /* public void CallBackSwitchPlayerStronghold()
    {
        switch(JIRVIS.Instance.jIRVISData.getCurDisplayType)
        {
            case OTYPE.GameDisplayType.VV:
                //构建商家据点，
                data.BuildMenuStrongholdItem(0, CallBackFinishBuildItem ,CallBackClickPlayerstrongholdItem);
                break;
            case OTYPE.GameDisplayType.AR:
                break;
        }
    }

    public void CallBackSwithBusineesStronghold()
    {
        switch(JIRVIS.Instance.jIRVISData.getCurDisplayType)
        {
            case OTYPE.GameDisplayType.VV:
                //构建商家据点，
                data.BuildMenuStrongholdItem(1, CallBackFinishBuildItem ,CallBackClickBussinessStrongholdItem);
                break;
            case OTYPE.GameDisplayType.AR:
                break;
        }
    }
*/

    private void CallBackFinishBuildItem ()
    {
        
    }

    private void CallBackClickPlayerstrongholdItem(int _strongholdIndex)
    {
        
    }

    private void CallBackClickBussinessStrongholdItem(int _strongholdIndex)
    {
        Debug.Log("选择了商家据点"+ _strongholdIndex );
    }



   
    


    private void SetMonsterToThisStronghold(PlayerMonsterAttribute tmpMonster)
    { 
        JIRVIS.Instance.BuildEditorBarForMonsterChangeNameOrBelongStorngholdIndex(tmpMonster,JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex , UploadMonsterToThisStrongholdIndex , CancelInsertMonstertoStronghold);
    }

    private void UploadMonsterToThisStrongholdIndex()
    {
        BuildJIRVISFunctionBtn();
        JIRVIS.Instance.PlayTips("现在，您可以再次选择要挑战的据点进行战斗！");
    }

    private void CancelInsertMonstertoStronghold()
    {
        JIRVIS.Instance.PlayTips("请不要乱点");
        BuildJIRVISFunctionBtn();
    }

  

    private void CloseInsterMonsterTostrongholdEditorBar()
    {
        JIRVIS.Instance.CloseEditorBarForMonsterChangeNameOrBelongStorngholdIndex();
        BuildJIRVISFunctionBtn();
    }

    private void CallBackGetStrongholdEnemyData(List<PlayerMonsterAttribute> playerMonsters)
    { 
        if(playerMonsters == null || playerMonsters.Count == 0 )
        {
            BuildJIRVISFunctionBtn();
            JIRVIS.Instance.PlayTips("当前据点无守护宠物，不可挑战");
            data.SetWaitState(false);
        }
        else
        {

            data.SetWaitState(false);
            data.SetOpenchildBar(true);//对地图的操作的禁止
            RegisterControlCamera(false);
            RegisterSelectMapItem(false);
            #region 向JIRVIS 保存要挑战的角色信息
            JIRVIS.Instance.jIRVISData.SetEnemys(playerMonsters);
            #endregion
           
            #region JIRVIS 发出提示，是否要挑战该据点
            OTYPE.Tipscontent tipscontent = OTYPE.Tipscontent.challegeStronghold;
            string content = "是否立刻对[" + AndaGameExtension.ChangeTextColorToYellow(JIRVIS.Instance.jIRVISData.getCurChallengeStrongholdAttr.strongholdNickName) + "]"+ MonsterGameData.GetTipsContent(tipscontent);
            JIRVIS.Instance.PlayTipsForchoose(content, OTYPE.TipsType.chooseTips, "挑战", "不挑战", CallBackComfirmGame, CallCancelChanllenge);
            //[目前就默认挑选第一只]
            data.BuildJIRVISEditor_ChanllengeGameStorngholdInfomationBar((PlayerStrongholdAttribute)JIRVIS.Instance.jIRVISData.getCurChallengeStrongholdAttr, playerMonsters[0]);
            //JIRVIS.Instance.RemoveCurrentBtnList();
            #endregion
        }
       
    }


    //【玩家统一挑战】挑战据点
    private void CallBackComfirmGame()
    {
        JIRVIS.Instance.CloseTips();
        JIRVIS.Instance.jIRVISData.ClearRewardList();
        if (TestManager.Instance.isTestLoadinglocalData)
        {
            AndaDataManager.Instance.TestCallServerGetBlondStrongholdMonsterListData(
                JIRVIS.Instance.jIRVISData.currentEnemyStrongholdIndex,
                CallBackFinishAppleMatch);
        }else
        {
            int gameType = JIRVIS.Instance.jIRVISData.currentPlayGameType;
            AndaDataManager.Instance.CallServerApplyMatch(gameType.ToString(),
                                                      JIRVIS.Instance.jIRVISData.currentEnemyStrongholdIndex,
                                                      JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex,CallBackFinishAppleMatch);
        }
    }
    //【放弃挑战】
    private void CallCancelChanllenge()
    {
        JIRVIS.Instance.CloseTips();
        data.SetOpenchildBar(false);//对地图的操作允许
        RegisterControlCamera(true);
        RegisterSelectMapItem(true);
        BuildJIRVISFunctionBtn();

        data.RemoveJIRVISEditor_ChanllengeGameStorngholdInfomationBar();
    }


    private void CallBackClickProtect()
    {
        JIRVIS.Instance.CloseTips();

    }

    //向服务器申请游戏验证，
    private void CallBackFinishAppleMatch(bool Success)
    {
        if(Success)
        {
            
            JIRVIS.Instance.CloseTips();
            switch(JIRVIS.Instance.jIRVISData.currentPlayGameType)
            {
                case 0://保卫战
                    break;
                case 1://挑战
                    callbackFinishController(ONAME.CHALLENGEGAMECONTROLLER);
                    break;
                case 2://捕捉
                    break;
            }
            Debug.Log("成功进入游戏");
            JIRVIS.Instance.PlayTips("成功进入游戏");
        }else
        {

            BuildJIRVISFunctionBtn();
            JIRVIS.Instance.PlayTips("当前不能游戏，请检查网络");
        }
    }

    private void ControlRotateCamera(Vector3 _rotate)
    {
        //Debug.Log("RotateY" + _rotate.y);
        Vector3 vector3 = data.getMapcamera.eulerAngles;
        vector3.y += _rotate.y;
        data.getMapcamera.eulerAngles = vector3;
    }

    private void ControlUpDownCamera(float _value)
    {
       //Debug.Log("Rotate_value" + _value);
        Vector3 vector3 = data.getMapcamera.eulerAngles;
        float v = Mathf.Clamp(vector3.x + _value, 50f, 90f);
        vector3.x = v;
        data.getMapcamera.eulerAngles = vector3;
    }

    private void ControlDragMoveCamera(Vector2 dragValue)
    {
        Vector3 vector3 = data.getMapcamera.position;
        if(data.getIsMap2D)
        {
            Vector3 fwd = data.getMapcamera.transform.up;
            vector3 += fwd * Time.deltaTime * -dragValue.y;
            vector3 += data.getMapcamera.right * Time.deltaTime * -dragValue.x;
        }
        else
        {
            Vector3 fwd = new Vector3(data.getMapcamera.forward.normalized.x, 0, data.getMapcamera.forward.normalized.z);
            vector3 += fwd * Time.deltaTime * -dragValue.y;
            vector3 += data.getMapcamera.right * Time.deltaTime * -dragValue.x;
           // Debug.Log("dragValue" + dragValue);
        }
        data.getMapcamera.position = vector3;
       // UpdateMedalFaceToMapCamera50();
    }

    private bool isChangeMapAngle =false;
    private float changeAngle;
    private float changeProgress;

    private void ChangeMapAngle()
    {
        JIRVIS.Instance.CloseBtnBar();
        if(data.getIsMap2D)
        {
            ChangeTo3DMap();
        }
        else
        {
            ChangeTo2DMap();
        }
    }

    private void ChangeTo3DMap()
    {
        if(isChangeMapAngle)return;
        isChangeMapAngle=true;
        changeAngle = 50;
        changeProgress = 0;
        StartCoroutine(ExcuteChangeMapAnlge());
        //转换完成
        Invoke("FinishChangeMapTo3D" ,1f);
    }

    private void FinishChangeMapTo3D()
    {
        data.SetMapViewAnlge(false);
        BuildJIRVISFunctionBtn();
       // UpdateMedalFaceToMapCamera50(); 

    }

    private void ChangeTo2DMap()
    {
        if (isChangeMapAngle) return;
        isChangeMapAngle =true;
        changeAngle = 90;
        changeProgress = 0;
        StartCoroutine(ExcuteChangeMapAnlge());
        //转换完成
        Invoke("FinishChangeMapTo2D", 1f);
    }

    private void FinishChangeMapTo2D()
    {
        data.SetMapViewAnlge(true);
        BuildJIRVISFunctionBtn();
      //  UpdateMedalFaceToMapCamera90();
    }


    private IEnumerator ExcuteChangeMapAnlge()
    {
        float offsetAnlge = data.getIsMap2D ? 50 - 90  : 90 - 50;
        float curAngle = data.getMapcamera.transform.eulerAngles.x;
        while(isChangeMapAngle && changeProgress <= 1)
        {
            changeProgress += Time.deltaTime;
            float angle = curAngle +  changeProgress * offsetAnlge;
            Vector3 euler = data.getMapcamera.eulerAngles;
            euler.x = angle;
            euler.y = 0;
            euler.z = 0;
            data.getMapcamera.eulerAngles = euler;
            yield return null;
        }

        isChangeMapAngle=false;
    }

  

   
    private void UpdatemapTileCenterPoint()
    {
        Vector3 forward = data.getMapcamera.forward.normalized;
        forward.y = 0;
        AndaMap.Instance.UpdatemapTileCenterPoint(data.getMapcamera.position + forward * 20);
    }

    private void ControlTmpTowerPosition(Vector3 _centerPosition)
    {
        data.tmpToweritem.transform.position =  _centerPosition;
    }







   
   /*private void UpdateMedalFaceToMapCamera90()
    {
        if(data.getOtherStrongholdItem == null || data.getOtherStrongholdItem.Count==0)return;
        int otherCount = data.getOtherStrongholdItem.Count;
        for(int i = 0; i < otherCount; i++)
        {
            data.getOtherStrongholdItem[i].UpdateMedalFaceToMapCamera90();
        }
        if (data.getMineStrongholdItem == null || data.getMineStrongholdItem.Count == 0) return;
        int mineCount = data.getMineStrongholdItem.Count;
        for(int i = 0 ; i < mineCount; i++)
        {
            data.getMineStrongholdItem[i].UpdateMedalFaceToMapCamera90();
        }
    }
    private void UpdateMedalFaceToMapCamera50()
    {
        if (data.getOtherStrongholdItem == null || data.getOtherStrongholdItem.Count == 0) return;
        int otherCount = data.getOtherStrongholdItem.Count;
        for (int i = 0; i < otherCount; i++)
        {
            data.getOtherStrongholdItem[i].UpdateMedalFaceToMapCamera50();
        }
        if (data.getMineStrongholdItem == null || data.getMineStrongholdItem.Count == 0) return;
        int mineCount = data.getMineStrongholdItem.Count;
        for (int i = 0; i < mineCount; i++)
        {
            data.getMineStrongholdItem[i].UpdateMedalFaceToMapCamera50();
        }
    }*/

    private void UpdatePlayerShUIPose()
    {
        if(data==null)return;

        if(data.GetCurCamera == null)return;

        if(data.getSeflStrongholdAttribute !=null && (data.shDisplayType == 1 || data.shDisplayType == 4))
        {
            int count1 = data.getSeflStrongholdAttribute.Count;
            for (int i = 0; i < count1; i++)
            {
                Vector3 rP = data.getSeflStrongholdAttribute[i].strongholdInMapPosition;
                Vector2 vector2 = data.GetCurCamera.WorldToScreenPoint(rP);
                Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
                data.getMineStrongholdItem[i].UpdatePose(p);
                float scale = 1300f / Vector3.Distance(rP, data.GetCurCamera.transform.position);
                scale = (float)Mathf.Clamp(scale,0.3f, 2.5f);
                data.getMineStrongholdItem[i].UpdateScale(scale);
            }
        }
        if (data.getOtherPlayerStrongholdAttribute != null && (data.shDisplayType == 1 || data.shDisplayType == 4))
        {
            int count1 = data.getOtherPlayerStrongholdAttribute.Count;
            for (int i = 0; i < count1; i++)
            {
                Vector3 rP = data.getOtherPlayerStrongholdAttribute[i].strongholdInMapPosition;
                Vector2 vector2 = data.GetCurCamera.WorldToScreenPoint(rP);
                Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
                data.getOtherStrongholdItem[i].UpdatePose(p);
                float scale = 1300f / Vector3.Distance(rP, data.GetCurCamera.transform.position);
                scale = (float)Mathf.Clamp(scale, 0.3f, 2.5f);
                data.getOtherStrongholdItem[i].UpdateScale(scale);
            }
        }

        if (data.getBussinessStrongholdAttribute != null && (data.shDisplayType == 2 || data.shDisplayType == 4))
        {
            int count1 = data.getBussinessStrongholdAttribute.Count;
            for (int i = 0; i < count1; i++)
            {
                Vector3 rP = data.getBussinessStrongholdAttribute[i].strongholdInMapPosition;
                Vector2 vector2 = data.GetCurCamera.WorldToScreenPoint(rP);
                Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
                data.getBussinesStronghldItem[i].UpdatePose(p);
                float scale = 1300f / Vector3.Distance(rP, data.GetCurCamera.transform.position);
                scale = (float)Mathf.Clamp(scale, 0.3f, 2.5f);
                data.getBussinesStronghldItem[i].UpdateScale(scale);
            }
        }

        /*for (int i = 0; i < count3; i++)
        {
            if (i >= 0 && i < count1)
            {
                Vector2 vector2 = ARMonsterSceneDataManager.Instance.MapCamera.WorldToScreenPoint(data.mine[i].strongholdInMapPosition);
                Vector3 p = UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
                mapCtrlData.getPlayerStrongholdItems[i].transform.position = p;
            }
            else if (i >= count1 && i < count2)
            {
                int t = i - count1;
                Vector2 vector2 = mapCamera.WorldToScreenPoint(mapCtrlData.getMineStrongholdAttrs[t].strongholdInMapPosition);
                Vector3 p = UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
                mapCtrlData.getmineStrongholdItems[t].transform.position = p;
            }
            else if (i >= count2 && i < count3)
            {
                int t = i - count2;
                Vector2 vector2 = mapCamera.WorldToScreenPoint(mapCtrlData.getOtherStrongholdAttrs[t].strongholdInMapPosition);
                Vector3 p = UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
                mapCtrlData.getotherStrongholdItems[t].transform.position = p;
            }


        }*/



    }

    /*public void OnGUI()
    {
        float t = Screen.width / Screen.height;
        float x = Screen.width /5;
        float y = Screen.height * x / Screen.width;
       // return new Vector2(x,y);
       // GUI.Box(new Rect(Screen.width/2 - x/2, Screen.height/2 +x/2, x, y),"ss");
    }*/






    private Vector3 startMousePose;
    private bool isUpdateMouseEuler;
    private bool isUpdateMousePose;


    #region 旋转相机


    static Touch oldTouch1;
    static Touch oldTouch2;

    private void RotateCamera()
    {
        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.AR)return;

#if UNITY_EDITOR
        if (Input.GetMouseButtonDown(1))
        {
            isUpdateMouseEuler = true;
            startMousePose = Input.mousePosition;
        }

        if (Input.GetMouseButton(1))
        {
            if (isUpdateMouseEuler)
            {
                Vector3 delta = Input.mousePosition - startMousePose;
                if (delta.x > 5)
                {
                    Vector3 euler = ARMonsterSceneDataManager.Instance.MapCamera.transform.eulerAngles;
                    euler.y -= Time.deltaTime * 100;
                    //ControlRotateCamera(euler);
                    ARMonsterSceneDataManager.Instance.MapCamera.transform.eulerAngles = euler;
                }
                else if (delta.x < -5)
                {
                    Vector3 euler = ARMonsterSceneDataManager.Instance.MapCamera.transform.eulerAngles;
                    euler.y += Time.deltaTime * 100;
                    ARMonsterSceneDataManager.Instance.MapCamera.transform.eulerAngles = euler;
                    //ControlRotateCamera(euler);
                }

                startMousePose = Input.mousePosition;
            }
        }

        if (Input.GetMouseButtonUp(1))
        {
            isUpdateMouseEuler = false;
        }



#else

        if (Input.touchCount == 2)
        {
            Touch touch1 = Input.GetTouch(0);
            Touch touch2 = Input.GetTouch(1);

            //启用双指，尚未旋转
            if (touch2.phase == TouchPhase.Began)
            {
                oldTouch2 = touch2;
                oldTouch1 = touch1;
                return;
            }
            if (touch1.phase == TouchPhase.Moved || touch2.phase == TouchPhase.Moved)
            {
                Vector2 curVec = touch2.position - touch1.position;
                Vector2 oldVec = oldTouch2.position - oldTouch1.position;
                float angle = Vector2.Angle(oldVec, curVec);
                angle *= Mathf.Sign(Vector3.Cross(oldVec, curVec).z);
                ControlRotateCamera(new Vector3(0, angle, 0));
                oldTouch1 = touch1;
                oldTouch2 = touch2;
            }
        }


#endif

        //UpdatePlayerShUIPose();

    }
    #endregion

    #region 移动相机

    private void MoveCamera()
    {
        if (JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.AR) return;

#if UNITY_EDITOR

        if (Input.GetMouseButtonDown(0))
         {
             isUpdateMousePose = true;
             startMousePose = Input.mousePosition;
         }

         if (Input.GetMouseButton(0))
         {
             if (isUpdateMousePose)
             {
                 Vector3 delta = Input.mousePosition - startMousePose;//new Vector3(Screen.width/2 , Screen.height/2,0);
                 ControlDragMoveCamera(delta * 5);
                 startMousePose = Input.mousePosition;


             }
         }

         if (Input.GetMouseButtonUp(0))
         {
             isUpdateMousePose = false;
         }


      

#else
        if (Input.touchCount == 1)
        {
              Touch touch = Input.GetTouch(0);
                Vector2 deltaPos = touch.deltaPosition;
             ControlDragMoveCamera(deltaPos*5);
        }

#endif

        // UpdatePlayerShUIPose();
    }

    #endregion


    #region 缩放地图

    public void ScaleMap()
    {
        if(JIRVIS.Instance.isARType)return;

#if UNITY_EDITOR

        Vector3 v = ARMonsterSceneDataManager.Instance.MapCamera.transform.position;
         v.y+=Input.mouseScrollDelta.y * 3;
         v.y = Mathf.Clamp(v.y,500, 2500);
        ARMonsterSceneDataManager.Instance.MapCamera.transform.position = v;





#else

        if (Input.touchCount == 2)
        {
            Touch newTouch1 = Input.GetTouch(0);
            Touch newTouch2 = Input.GetTouch(1);
            if (newTouch2.phase == TouchPhase.Began)
            {
                oldTouch2 = newTouch2;
                oldTouch1 = newTouch1;
                return;

            }


            //计算老的两点距离和新的两点间距离，变大要放大模型，变小要缩放模型
            float oldDistance = Vector2.Distance(oldTouch1.position, oldTouch2.position);
            float newDistance = Vector2.Distance(newTouch1.position, newTouch2.position);

            //两个距离之差，为正表示放大手势， 为负表示缩小手势
            float offset = newDistance - oldDistance;

            //放大因子， 一个像素按 0.01倍来算(100可调整)
            float scaleFactor = offset / 100f;
            Vector3 localScale = Vector3.zero;
            Vector3 scale = new Vector3(localScale.x + scaleFactor,
                                            localScale.y + scaleFactor,
                                            localScale.z + scaleFactor);
            //最小缩放到 0.3 倍
            if (Mathf.Abs(scale.x) > 0.1f && Mathf.Abs(scale.y) > 0.1f && Mathf.Abs(scale.z) > 0.1f)
            {
                Vector3 v3 = ARMonsterSceneDataManager.Instance.MapCamera.transform.position;
                v3.y -= scale.y *10;
                v3.y = Mathf.Clamp(v3.y,500f,2500f);
                ARMonsterSceneDataManager.Instance.MapCamera.transform.position = v3;
            }

            //记住最新的触摸点，下次使用
            oldTouch1 = newTouch1;
            oldTouch2 = newTouch2;
        }


#endif
    }


    #endregion

}

