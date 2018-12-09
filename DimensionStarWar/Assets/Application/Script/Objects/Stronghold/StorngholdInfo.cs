using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class StorngholdInfo :ObjectsInfo{

    public StrongholdBaseController self_sh;

    public override void DownloadMessage(AndaObjectBasic obj)
    {
        base.DownloadMessage(obj);
        self_sh = obj as StrongholdBaseController;
    }

    public void BuildStorngholdInfomation(string name)
    {
        switch (name)
        {
            case "SelfStrongHold":
                BuildSHSelfInfo();
                break;
            case "BusinessStrongHold":
                BuildSHBusinessInfo();
                break;
            case "PrivateStrongHold":
                BuildSHSelfInfo();
                break;
        }
    }

    #region 显示商家据点信息 ，商家据点 名字 等级  图标，怪兽列表，奖励列表 ，等级名字， 经验，
    public void BuildSHBusinessInfo()
    {
        BuildFollowTargetBoard();
        BusinessStrongholdAttribute bsa = self_sh.strongholdDataValue.sh_dataValue as BusinessStrongholdAttribute;
        SetBusinessStrongholdName(bsa);
        SetBusinessStrongholdLevelInfo(bsa);
        SetBusinessStrongholdIconInfo(bsa);
        SetBusinessStrongholdMonsterList(bsa);
    }

    private void SetBusinessStrongholdName(BusinessStrongholdAttribute bsa)
    {
        InfoBar_Label sh_name = AndaUIManager.Instance.PopInfoBar_Label();
       sh_name.SetValue(bsa.strongholdNickName);
        followBoard.SetNameToPoint(sh_name.transform);
        itemList.Add(sh_name);
    }
    //显示据点的等级，经验圈  和 经验值
    private void SetBusinessStrongholdLevelInfo(BusinessStrongholdAttribute bsa)
    {
        InfoBar_Slider_Label exp = AndaUIManager.Instance.PopInfoBar_Slider_Label_Circle();
       exp.UpdateValue(bsa.strongholdGloryValue, bsa.strongholdMaxValue, "Lv." + (bsa.strongholdLevel+1), true, false,1);
        followBoard.SetToIcon_Board_LevelName(exp.transform);
        itemList.Add(exp);
    }
    //设置据点头像 头像框 据点等级名称
    private void SetBusinessStrongholdIconInfo(BusinessStrongholdAttribute bsa)
    {
        InfoBar_Stronghold_Icon_board_label iconInfo = AndaUIManager.Instance.PopStrongholdInfoBar();
        iconInfo.SetValue(bsa.strongholdPorID, bsa.strongholdLevel, bsa.strongholdLevelName);
        followBoard.SetToIcon_Board_Value_Tips(iconInfo.transform);
        itemList.Add(iconInfo);
    }
    //设置怪兽
    private void SetBusinessStrongholdMonsterList(BusinessStrongholdAttribute bsa)
    {
        List<int> idList = new List<int>();
        List<int> boardList = new List<int>();
        foreach (var go in bsa.fightMonsterListIndex)
        {
            PlayerMonsterAttribute pma = AndaDataManager.Instance.GetPlayerMonsterAttribute(go,bsa.hostIndex,bsa.hostType);
            idList.Add(pma.monsterID);
            boardList.Add(pma.monsterLevel);
        }
        InfoBar_Icon_Board_List monsterIconList = AndaUIManager.Instance.PopIcon_Board_List();
        monsterIconList.SetValue(idList, boardList);
        followBoard.SetToListPoint(monsterIconList.transform);
        itemList.Add(monsterIconList);
    }


    #endregion


    #region 显示玩家据点 据点名字 据点等级，据点经验 ，据点图标，已经获得徽章列表
    public void BuildSHSelfInfo()
    {
        PlayerStrongholdAttribute psa = self_sh.strongholdDataValue.sh_dataValue as PlayerStrongholdAttribute;
        BuildFollowTargetBoard();
        SetPrivateSHName(psa);
        SetPrivateSHExp(psa);
        SetPrivateSHIcon(psa);
    }
    private void SetPrivateSHName(PlayerStrongholdAttribute psa)
    {
        InfoBar_Label shName = AndaUIManager.Instance.PopInfoBar_Label();
        shName.SetValue(psa.strongholdNickName);
        followBoard.SetNameToPoint(shName.transform);
        itemList.Add(shName);
    }
    private void SetPrivateSHExp(PlayerStrongholdAttribute psa)
    {
        InfoBar_Slider_Label exp = AndaUIManager.Instance.PopInfoBar_Slider_Label_Circle();
        exp.UpdateValue(psa.strongholdGloryValue, psa.strongholdMaxValue, "Lv." + (psa.strongholdLevel + 1), true, false);
        followBoard.SetToIcon_Board_LevelName(exp.transform);
        itemList.Add(exp);
    }

    private void SetPrivateSHIcon(PlayerStrongholdAttribute psa)
    {
        InfoBar_Stronghold_Icon_board_label icon = AndaUIManager.Instance.PopStrongholdInfoBar();
        icon.SetValue(psa.strongholdPorID, psa.strongholdLevel, psa.strongholdLevelName);
        followBoard.SetToIcon_Board_Value_Tips(icon.transform);
        itemList.Add(icon);
    }
    private void SetSHMedalList()
    {

    }

    #endregion
}
