using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using GameRequest;
public class JIRVISContent_RewardBar : UIBasic2 {
 
    public enum RewardBarType
    {
        chanllengeWinWithMedal = 0 , 
        chanllengeWinWithNoMedal =1,
        chanllegenLose = 2 ,
        normalReward = 3 ,
    }

    private List<AndaLocalRewardData> rewardsList;
    private int medalLevel;
    private int medalId;
    private RewardBarType rewardBarType ;


    private JIRVISContent_RewardBarForChanllengeWinWithMedal JIRVISContent_RewardBarForChanllengeWinWithMedal;

    private JIRVISContent_RewardBarForChanllengeWinNoMedal JIRVISContent_RewardBarForChanllengeWinNoMedal;

    private JIRVISContent_RewardBarForChanllengeLose JIRVISContent_RewardBarForChanllengeLose;

    private JIRVISContent_RewardBarForNormalReward jIRVISContent_RewardBarForNormalReward;

    private System.Action clickCallback;
    public override void OnDispawn()
    {

        UnRegisterJIRVISEvent();

        switch(rewardBarType)
        {
            case RewardBarType.chanllegenLose:
                JIRVISContent_RewardBarForChanllengeLose = null;
                break;
            case RewardBarType.chanllengeWinWithMedal:
                JIRVISContent_RewardBarForChanllengeWinWithMedal = null;
                break;
            case RewardBarType.chanllengeWinWithNoMedal:
                JIRVISContent_RewardBarForChanllengeWinNoMedal =null;
                break;
            case RewardBarType.normalReward:
                jIRVISContent_RewardBarForNormalReward = null;
                break;
        }


        if (clickCallback!=null)
        {
            clickCallback();
        }
        base.OnDispawn();
    }

    public void CloseBar()
    {
        JIRVIS.Instance.jIRVISData.ClearNormalRewardList();
        JIRVIS.Instance.CloseTips();
        AndaDataManager.Instance.RecieveItem(selfObj);
    }
   
    public void BuildChanllenGameWinWithMedalRewards(int _medalLevel, int _medalID, List<BattelObject> objs)
    {
        RegisterListenerSpecialEvent();
        rewardBarType = RewardBarType.chanllengeWinWithMedal;
        BattelObjectConverToAndaLocalRewardData(objs);
        medalLevel = _medalLevel;
        medalId = _medalID;
        ToWithMedal();
       // JIRVIS.Instance.PlayTipsForchoose("挑战成功，对手向您赠送过了小礼物，对您的非凡操作表示敬意" , OTYPE.TipsType.onlyOneChooseTips , "谢谢" ,"" , CloseBar);
    }

    public void BuildChanllenGameWinRewards(List<BattelObject> objs)
    {
        RegisterListenerSpecialEvent();
        rewardBarType = RewardBarType.chanllengeWinWithNoMedal;
        BattelObjectConverToAndaLocalRewardData(objs);
        ToNoMedal();
      // JIRVIS.Instance.PlayTipsForchoose("挑战成功，对手向您赠送过了小礼物，对您的非凡操作表示敬意", OTYPE.TipsType.onlyOneChooseTips, "谢谢", "", CloseBar);
    }

    public void BuildChanlleGameLoseReward(List<BattelObject> objs)
    {
        RegisterListenerSpecialEvent();
        rewardBarType = RewardBarType.chanllegenLose;
        BattelObjectConverToAndaLocalRewardData(objs);
        ToNoMedal();
       // JIRVIS.Instance.PlayTipsForchoose("真的可惜，再接再厉,对手向你赠送了小礼物，对您的勇气表示赞赏,", OTYPE.TipsType.onlyOneChooseTips, "谢谢大佬", "", CloseBar);
    }

    public void BuildNormalReward(List<AndaLocalRewardData> objs ,System.Action callback)
    {
        RegisterListenerSpecialEvent();
        rewardBarType = RewardBarType.normalReward;
        rewardsList = objs;
        clickCallback = callback;
        ToNoMedal();
       // JIRVIS.Instance.PlayTipsForchoose("来自星域的礼物，点击物品查看", OTYPE.TipsType.onlyOneChooseTips, "好的", "", CloseBar);

    }

    public void ToWithMedal()
    {
        if (JIRVISContent_RewardBarForChanllengeWinWithMedal == null)
        {
            JIRVISContent_RewardBarForChanllengeWinWithMedal = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBarForChanllengeWinWithMedal>(ONAME.JIRVISContent_RewardBarForChanllengeWinWithMedal);
            JIRVISContent_RewardBarForChanllengeWinWithMedal.FadeIn();
        }
        JIRVISContent_RewardBarForChanllengeWinWithMedal.SetInto(transform);
        JIRVISContent_RewardBarForChanllengeWinWithMedal.menuLayer = GetMenuLayerAddOne();
        JIRVISContent_RewardBarForChanllengeWinWithMedal.SetMedal(medalLevel, medalId);
        JIRVISContent_RewardBarForChanllengeWinWithMedal.SetRewards(rewardsList);
        JIRVISContent_RewardBarForChanllengeWinWithMedal.PlayJIRVISTips();
    }

    public void ToNoMedal()
    {
        switch(rewardBarType)
        {
            case RewardBarType.chanllegenLose:
                if (JIRVISContent_RewardBarForChanllengeLose == null)
                {
                    JIRVISContent_RewardBarForChanllengeLose = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBarForChanllengeLose>(ONAME.JIRVISContent_RewardBarForChanllengeLose);
                    JIRVISContent_RewardBarForChanllengeLose.FadeIn();

                }
                JIRVISContent_RewardBarForChanllengeLose.menuLayer = GetMenuLayerAddOne();
                JIRVISContent_RewardBarForChanllengeLose.SetInto(transform);
                JIRVISContent_RewardBarForChanllengeLose.SetRewards(rewardsList);
                JIRVISContent_RewardBarForChanllengeLose.PlayJIRVISTips();
                break;
            case RewardBarType.chanllengeWinWithNoMedal:
                if (JIRVISContent_RewardBarForChanllengeWinNoMedal == null)
                {
                    JIRVISContent_RewardBarForChanllengeWinNoMedal = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBarForChanllengeWinNoMedal>(ONAME.JIRVISContent_RewardBarForChanllengeWinNoMedal);
                    JIRVISContent_RewardBarForChanllengeWinNoMedal.FadeIn();


                }
                JIRVISContent_RewardBarForChanllengeWinNoMedal.menuLayer = GetMenuLayerAddOne();
                JIRVISContent_RewardBarForChanllengeWinNoMedal.SetInto(transform);
                JIRVISContent_RewardBarForChanllengeWinNoMedal.SetRewards(rewardsList);
                JIRVISContent_RewardBarForChanllengeWinNoMedal.PlayJIRVISTips();
                break;
            case RewardBarType.normalReward:
                if (jIRVISContent_RewardBarForNormalReward == null)
                {
                    jIRVISContent_RewardBarForNormalReward = AndaDataManager.Instance.InstantiateMenu<JIRVISContent_RewardBarForNormalReward>(ONAME.JIRVISContent_RewardBarForNormalReward);
                    jIRVISContent_RewardBarForNormalReward.FadeIn();

                }
                jIRVISContent_RewardBarForNormalReward.menuLayer = GetMenuLayerAddOne();
                jIRVISContent_RewardBarForNormalReward.SetInto(transform);
                jIRVISContent_RewardBarForNormalReward.SetRewards(rewardsList);
                jIRVISContent_RewardBarForNormalReward.PlayJIRVISTips();
                break;
        }
    }



    public void RegisterListenerSpecialEvent()
    {
        JIRVISListenerEvent.JIRVISEvent_CloseSecondBar += CallBackCloseSecondBar;
        JIRVISListenerEvent.SpecialEvent_CloseConsumableInfoBar += CallBackCloseThridBar;
        JIRVISListenerEvent.SpecialEvent_CloseMonsterEditorInfoBar += CallBackCloseThridBar;
    }

    public void UnRegisterJIRVISEvent()
    {
        JIRVISListenerEvent.SpecialEvent_CloseConsumableInfoBar -= CallBackCloseThridBar;
        JIRVISListenerEvent.SpecialEvent_CloseMonsterEditorInfoBar -= CallBackCloseThridBar;
        JIRVISListenerEvent.JIRVISEvent_CloseSecondBar -= CallBackCloseSecondBar;
    }

    public void CallBackCloseThridBar()
    {
        //重新打开
        switch(rewardBarType)
        {
            case RewardBarType.chanllengeWinWithMedal:
                ToWithMedal();
                break;
            case RewardBarType.chanllengeWinWithNoMedal:
            case RewardBarType.chanllegenLose:
            case RewardBarType.normalReward:
                ToNoMedal();
                break;
        }
    }

    public void CallBackCloseSecondBar()
    {
        CloseBar();
    }

    public void BattelObjectConverToAndaLocalRewardData(List<BattelObject> objs)
    {
        int count = objs.Count;
        for(int i = 0; i < count; i++)
        {
            AndaLocalRewardData andaLocalRewardData = new AndaLocalRewardData()
            {
                objID = objs[i].objectId,
                objCount = objs[i].addCount,
            };
            if(rewardsList == null)rewardsList = new List<AndaLocalRewardData>();
            rewardsList.Add(andaLocalRewardData);
        }
    }


}
