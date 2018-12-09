using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using GameRequest;
public class JIRVISContent_RewardBarForNormalReward : UIBasic2
{

    public Transform grid;
    private List<AndaObjectBasic> rewards;

    public void CloseBar()
    {

        JIRVIS.Instance.CloseTips();
        AndaDataManager.Instance.RecieveItem(selfObj);

    }
    public override void OnDispawn()
    {
        if (rewards != null)
        {
            int count = rewards.Count;
            for (int i = 0; i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(rewards[i]);
            }
            rewards.Clear();
        }


        base.OnDispawn();
    }

    public void PlayJIRVISTips()
    {
        JIRVIS.Instance.PlayTipsForchoose("来自星域的礼物，点击物品查看", OTYPE.TipsType.onlyOneChooseTips, "好的", "", CloseBar);
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
            int typeGrounp = AndaDataManager.Instance.GetObjectGroupID(rewardsData[i].objID);
            if(typeGrounp == 1000)
            {
                MonsterBaseConfig monsterBaseConfig = MonsterGameData.GetMonsterBaseConfig(rewardsData[i].objID);
                jIRVISEditonConsumableItemInformationBar.SetNameAndCount(monsterBaseConfig.monsterName, rewardsData[i].objID.ToString(), rewardsData[i].objCount);
                jIRVISEditonConsumableItemInformationBar.SetInto(grid.transform);
                jIRVISEditonConsumableItemInformationBar.SetCallBack(CallBackOpenAntherBar);
                rewards.Add(jIRVISEditonConsumableItemInformationBar);

            }
            else if(typeGrounp == 40000)
            {
                int objectType = AndaDataManager.Instance.GetObjTypeID(rewardsData[i].objID);

                CD_ObjAttr cD_ObjAttr = MonsterGameData.GetCD_ObjAttrs(objectType);
                int smallID = rewardsData[i].objID - objectType;
                jIRVISEditonConsumableItemInformationBar.SetNameAndCount(cD_ObjAttr.objectName[smallID], rewardsData[i].objID.ToString(), rewardsData[i].objCount);
                jIRVISEditonConsumableItemInformationBar.SetInto(grid.transform);
                jIRVISEditonConsumableItemInformationBar.SetCallBack(CallBackOpenAntherBar);
                rewards.Add(jIRVISEditonConsumableItemInformationBar);
            }

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
