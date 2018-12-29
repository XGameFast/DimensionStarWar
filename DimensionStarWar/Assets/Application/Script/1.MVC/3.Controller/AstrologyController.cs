using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class AstrologyController : BaseController {
    /*
     * Dev:AndaChen
     * Date:2018 .3.2
     * 占星庭控制器
     * 占星庭就是玩家的私人据点的具象产物
     * 
     * 每个据点每日会产生 经验精粹，也会产生污染度 
     * 属于该据点饲养的宠物会每次战斗胜利或者寻宝成都会据点带来荣誉值。
     * 0.据点等级基于荣誉值
     * 1.每日产生的经验精粹数量会随着等级提升而增加
     * 2.体力恢复满额时间随着等级提升而缩减
     * 3.空间的污染度基于 空间每日固定产生污染度 + 每只宠物产生的污染
     * 4.空间的容量基于等级提升而增加
     * 5.据点覆盖范围基于等级提升而扩大
     * 6.被挑战的模式会随着等级提升而解锁不同模式
     * 7.据点勋章：玩家为用该据点宠物挑战并获得勋章 将属于该据点。勋章的数量和 据点等级 将为改变该据点的徽章等级
     * 
     * 在占星庭选择宠物可以喂养给他投递经验精粹。但是每只宠物每日经验有吸收上限。达到一定之后无法吸收。
     * 
     * 
     * 进入商店的入口
     * 进入图鉴的入口=》 图鉴可以查看所有宠物，
     * 
     * 
     * 进入地图的入口
     * 进入探测器入口
     * 
     * 
     * 宠物状态释放===》
     * 服务上会保存宠物的上一次状态 ，每日进入占星庭都会进行检测。如果有正在打扫的宠物则自动加载并且执行打扫
     * 
     * 在选择宠物的时候，如果正忙的宠物比如打扫或者出去寻宝的宠物的头上会有感叹号，无法出现。
     * 
     */
   
    public AstrologylobbyData astrologylobbyData;
    public override void StartController()
    {
        base.StartController();
        //base.worldType = OTYPE.WolrdType.Virtual;

        //ARMonsterSceneDataManager.Instance.aRWorld.CloseBlur();
        //ARMonsterSceneDataManager.Instance.aRWorld.ClosebackgroundVV();

        BuildAstrologyData();
        //设置当前据点的数据
         
        astrologylobbyData.BuildMenu(ONAME.AstrologyMenu);
        astrologylobbyData.getm_Menu.FadeIn();
        BuildJirvisFunBtn();  
        SetPlayerStrongholdData();
        SetMonsterData();

        //--默认选择第一个
        SwitchMonsterItem(0);
        FingerEvent.HoriDrag += CallBackDrag;
        FingerEvent.clickSelectItemEvent += TouchMouster;
    }

    public override void EndController()
    {
        base.EndController();
        astrologylobbyData.ReciveItem();
        InitValue();
        astrologylobbyData.getm_Menu.SetTargetActiveOnce(false);
        FingerEvent.HoriDrag -= CallBackDrag;
        //FingerEvent.UnregisterDragEvent();
    }

    //构建占星庭的数据
    private void BuildAstrologyData()
    {
        if (astrologylobbyData == null)
        {
            astrologylobbyData = new AstrologylobbyData();
           
        }
        astrologylobbyData.BuildData(this);
    }

    //构建占星庭里里的  JIRVIS功能按钮
    private void BuildJirvisFunBtn()
    {

        List<JIRVISFuncBtnStruct> btnStructs = new List<JIRVISFuncBtnStruct>();
        //如果是VV模式，那么需要一个AR模式按钮 用于切换
        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.VV)
        {
            JIRVISFuncBtnStruct arBtn = new JIRVISFuncBtnStruct()
            {
                btnName ="",btnIconKey = ONAME.ARIcon , clickCallBack = ClickARMode
            };
            btnStructs.Add(arBtn);

        }else //如果是AR模式，那么需要构建一个VV模式按钮用于切换
        {
            JIRVISFuncBtnStruct arBtn = new JIRVISFuncBtnStruct()
            {
                btnName ="",btnIconKey = ONAME.VVIcon , clickCallBack = ClickVVMode
            };
            btnStructs.Add(arBtn);

        }
        //构建宠物按钮
        JIRVISFuncBtnStruct monsterBtns = new JIRVISFuncBtnStruct 
        {
            btnName ="",btnIconKey = ONAME.MonsterIcon , clickCallBack = ClickOpenMonsterBtns 
        };
        btnStructs.Add(monsterBtns);

        //构建据点按钮
        JIRVISFuncBtnStruct mindeStrongholBtns = new JIRVISFuncBtnStruct
        {
            btnName = "" , btnIconKey = ONAME.minePlayerSH , clickCallBack = ClickOpenStrongholdBtns
        };

        btnStructs.Add(mindeStrongholBtns);


      
        JIRVIS.Instance.BuildFunctionBtn(btnStructs,FinishBuildJIRVISBtn);
    }
   
    private void FinishBuildJIRVISBtn()
    {
        Debug.Log("JIRVIS Said: oh, i was finihed build function btn ，have fun :) ");
    }

    //[打开AR模式]
    private void ClickARMode()
    {
        JIRVIS.Instance.jIRVISData.SetCurrentDisplayType(OTYPE.GameDisplayType.AR);
        BuildJirvisFunBtn();
    }

    //[打开VV模式]
    private void ClickVVMode()
    {
        JIRVIS.Instance.jIRVISData.SetCurrentDisplayType(OTYPE.GameDisplayType.VV);
        BuildJirvisFunBtn();
    }

    private void ClickStrongholdMessage()
    {
        FingerEvent.HoriDrag -= CallBackDrag;
        var list= AndaDataManager.Instance.GetStrongholdMessages(JIRVIS.Instance.jIRVISData.getCurMineStrongholdIndex); //拉去数据
        astrologylobbyData.ShowStrongholdMessage(list);
    }

    //在jirvis面板上打开宠物按钮列表
    private void ClickOpenMonsterBtns()
    {
        JIRVIS.Instance.BuildCurrentDimensionRoomMonsterBtn(ClickMonsterBtn);
        JIRVISFuncBtnStruct jIRVISFuncBtnStruct = new JIRVISFuncBtnStruct
        {
            btnName= "" ,btnIconKey = ONAME.BackStep , clickCallBack = BuildJirvisFunBtn
        };

        JIRVIS.Instance.AddFunctionBtn(jIRVISFuncBtnStruct);
    }

    //在jiirvis 面板上选了某一个宠物
    private void ClickMonsterBtn(PlayerMonsterAttribute pma)
    {
        int index = astrologylobbyData.GetMonsterItemIndexByData(pma);
        SwitchMonsterItem(index);
    }


    private void ClickOpenStrongholdBtns()
    {
        JIRVIS.Instance.BuildMineStrongholdListBtn(ClickStrongholdBtn);
        JIRVISFuncBtnStruct jIRVISFuncBtnStruct = new JIRVISFuncBtnStruct
        {
            btnName= "" ,btnIconKey = ONAME.BackStep , clickCallBack = BuildJirvisFunBtn
        };

        JIRVIS.Instance.AddFunctionBtn(jIRVISFuncBtnStruct);
    }


    //切换据点的时候也会切换宠物
    private void ClickStrongholdBtn(int strongholdIndex)
    {
        JIRVIS.Instance.jIRVISData.SetCurrentDimensionRoomIndex(strongholdIndex);
        astrologylobbyData.InitValue();
        SetPlayerStrongholdData();
        SetMonsterData();
        SwitchMonsterItem(0);
        BuildJirvisFunBtn();
    }


    private void SetPlayerStrongholdData()
    {
        astrologylobbyData.BuildPlayerStrongholdData();

    }

    private void SetMonsterData()
    {
        astrologylobbyData.BuildMonsterData();
    }


    private void CallBackDrag(int dir)
    {
        if(astrologylobbyData.getCurSelectMonsterItemIndex+dir<0 || astrologylobbyData.getCurSelectMonsterItemIndex+dir > astrologylobbyData.GetCurStrongholdMonsterCount-1)
            return;
        
        SwitchMonsterItem(astrologylobbyData.getCurSelectMonsterItemIndex+dir);
    }

    private void SwitchMonsterItem(int _index)
    {
        if(_index == astrologylobbyData.getCurSelectMonsterItemIndex)return; //与上一个相同，什么也不做
        astrologylobbyData.SetCurrentSelectMonsterItemIndex(_index);
        if(JIRVIS.Instance.jIRVISData.getCurDisplayType == OTYPE.GameDisplayType.VV)
        {
            astrologylobbyData.BuildMonsterItemForVV();
        }else
        {
            astrologylobbyData.BuildMonsterItemForAR();
        }
        astrologylobbyData.NotifyToMenuOpenMonsterPowerBar();
    }

    private void TouchMouster(Transform _monsterItem)
    {
        if(_monsterItem.tag == ONAME.MonsterTag)
        {
            _monsterItem.GetComponent<MonsterBasic>().ControllerToPlayMoodForHudong00();
        }
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        FingerEvent.OnUpdate();
        if(astrologylobbyData.getAstrologyMenu!=null && astrologylobbyData.getSingleItem != null)
        {
            astrologylobbyData.getAstrologyMenu.OnUpdate();
        }
    }
    private void FinishRecogineAR()
    {
        Debug.Log("JIRVIS: Finish Build AR " );
        //astrologylobbyData.SetCurrentIndex();
        astrologylobbyData.BuildMonsterItemForAR();

    }
}

