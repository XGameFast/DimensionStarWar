using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FightResultBar : UIBasic {
    public GameObject infoBarLeft;
    public GameObject infoBarRight;

    private FollowTargetUI followTargetUI;

    private List<AndaObjectBasic> infoSliderList;
    public override void OnDispawn()
    {
        if (infoSliderList != null)
        {
            infoSliderList.DestroyListByAndaData();
        }
        base.OnDispawn();

    }
    public override void InitMenu()
    {
        base.InitMenu();
    }

    public override void InitValue()
    {
        base.InitValue();
        if (infoSliderList != null)
        {
            infoSliderList.DestroyListByAndaData();
        }
        else
        {
            infoSliderList = new List<AndaObjectBasic>();
        }
    }

    public void SetFollow(Transform followTarget)
    {
        if (followTargetUI == null)
        {
            followTargetUI = AndaUIManager.Instance.PopingMenu<FollowTargetUI>("FollowTargetUI");
            followTargetUI.transform.SetParent(transform);
            followTargetUI.ResetTran();
        }
        followTargetUI.InitValue();
        followTargetUI.SetFollowValue(OTYPE.UIActiveType.equls, followTarget);
    }
    
    public IEnumerator SetValue(List<MonsterUseSkillValue> monsterUseSkillValueList ,Transform _followTarget )
    {

        SetFollow(_followTarget);
        int count = monsterUseSkillValueList.Count;
        for (int i = 0; i < count;i++)
        {
            MonsterUseSkillValue musv = monsterUseSkillValueList[i];
            InfoBarForSlider mfvb = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Forward");
            infoSliderList.Add(mfvb);
            //mfvb.KeepValue(1);

            mfvb.SetInformation(0, 2f);//设置延迟时间 和 速度

            followTargetUI.SetTargetToPoint(mfvb.transform);//把barset到对应的点上

             mfvb.UpdateValueFromTo(musv.currentMakePower,0 );//传入要LERP的数据

            yield return new WaitForSeconds(2f);

            InfoBarForSlider mfvb2 = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Reverse");

            infoSliderList.Add(mfvb2);

            mfvb2.SetInformation(0, 2f);

            //mfvb2.KeepValue(0);

            //这里应该有一个计算公式，暂时先直接取值

            followTargetUI.SetTargetPointReverse(mfvb2.transform);//把barset到对应的点上

             mfvb2.UpdateValueFromTo(0, musv.currentMakePower);

            yield return new WaitForSeconds(2f);
        }
    }

    private void BuildResultHUD()
    {

    }

   

    private void Update()
    {
        if (followTargetUI != null)
        {
            followTargetUI.OnUpdate();
        }

        if (infoSliderList != null && infoSliderList.Count != 0)
        {
            foreach (var go in infoSliderList)
            {
                ((InfoBarForSlider)go).OnUpdate();
            }
        }
    }
}
