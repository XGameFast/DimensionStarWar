using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class JIRVISContent_RewardBarForChanllengeWinWithMedal : UIBasic2{

    public Transform medalPoint;

    public Transform grid;


    TowerMonster1002 towerMonster1002 ;

    private List<AndaObjectBasic> rewards;
    public override void OnDispawn()
    {

        if(rewards!=null)
        {
            int count= rewards.Count;
            for(int i = 0 ; i <count; i ++)
            {
                AndaDataManager.Instance.RecieveItem(rewards[i]);
            }
            rewards.Clear();
        }

        if(towerMonster1002!=null)
        {
            AndaDataManager.Instance.RecieveItem(towerMonster1002);
            towerMonster1002 = null;
        }
        base.OnDispawn();
    }




    public void CloseBar()
    {
        
        JIRVIS.Instance.CloseTips();
        AndaDataManager.Instance.RecieveItem(selfObj);

    }

    public void SetMedal(int medalLevel, int medalID)
    {
        if(towerMonster1002!=null)AndaDataManager.Instance.RecieveItem(towerMonster1002);
        towerMonster1002 = AndaDataManager.Instance.GetMedalItemEasy(medalLevel , medalID);
        towerMonster1002.SetInto(medalPoint);
        towerMonster1002.MedalFadeIn();
    }

    public void PlayJIRVISTips()
    {
        JIRVIS.Instance.PlayTipsForchoose("挑战成功，对手向您赠送过了小礼物，对您的非凡操作表示敬意" , OTYPE.TipsType.onlyOneChooseTips , "谢谢" ,"" , CloseBar);
    }

    public void SetRewards(List<AndaLocalRewardData> rewardsData)
    {

        if (rewardsData.Count <= 0) return;

        if (rewards != null)
        {
            int counts = rewards.Count;
            for (int i = 0; i < counts; i++)
            {
                AndaDataManager.Instance.RecieveItem(rewards[i]);
            }
            rewards.Clear();
        }
        int count = rewardsData.Count;
        for (int i = 0; i < count; i++)
        {
            if (rewards == null) rewards = new List<AndaObjectBasic>();
            JIRVISEditonConsumableItemInformationBar jIRVISEditonConsumableItemInformationBar = AndaDataManager.Instance.InstantiateMenu<JIRVISEditonConsumableItemInformationBar>(ONAME.ConsumableBoardCircleBoard);
            int objectType = AndaDataManager.Instance.GetObjTypeID(rewardsData[i].objID);
            CD_ObjAttr cD_ObjAttr = MonsterGameData.GetCD_ObjAttrs(objectType);
            int smallID = rewardsData[i].objID - objectType;
            jIRVISEditonConsumableItemInformationBar.SetNameAndCount(cD_ObjAttr.objectName[smallID], rewardsData[i].objID.ToString(), rewardsData[i].objCount);
            jIRVISEditonConsumableItemInformationBar.SetInto(grid.transform);
            jIRVISEditonConsumableItemInformationBar.SetCallBack(CallBackOpenAntherBar);
            rewards.Add(jIRVISEditonConsumableItemInformationBar);
        }
    }
    /// <summary>
    /// Calls the back click close bar.
    /// </summary>
    public void CallBackOpenAntherBar()
    {
        JIRVIS.Instance.CloseTips();
    }

}
