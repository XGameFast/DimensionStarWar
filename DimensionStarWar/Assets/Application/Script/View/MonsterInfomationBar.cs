using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterInfomationBar : UIBasic {

    private InfoBarForSlider blood;
    private InfoBarForSlider energy;
    private InfoBarForSlider strength;
    private InfoBarForLabel monsterName;

    private FollowTargetUI followTargetUI;
    private bool needReverseDirectionInfoBar = false;

    public override void OnDispawn()
    {
        //清理一下 附带产生的垃圾
        ClearObj();
        base.OnDispawn();
    }
    private void ClearObj()
    {
        if (blood != null)
        {
            AndaDataManager.Instance.DestoryObj(blood);
        }
        if (energy != null)
        {
            AndaDataManager.Instance.DestoryObj(energy);
        }
        if (strength != null)
        {
            AndaDataManager.Instance.DestoryObj(strength);
        }
        if (followTargetUI != null)
        {
            AndaDataManager.Instance.DestoryObj(followTargetUI);
        }
        if (monsterName != null)
        {
            AndaDataManager.Instance.DestoryObj(monsterName);
        }

    }
    public override void InitValue()
    {
        base.InitValue();
        needReverseDirectionInfoBar = false;
        ClearObj();
    }
    //
    //


    public void SetInformation(bool _needReverseDirectionInfoBar =false)
    {
        needReverseDirectionInfoBar = _needReverseDirectionInfoBar;
    }


    public void SetDisplayName(string name)
    {
        if (monsterName == null)
        {
            monsterName = AndaUIManager.Instance.PopingMenu<InfoBarForLabel>(MonsterGameData.InfoBarForLabelForward);
            followTargetUI.SetTargetToTopPoint(monsterName.transform);
        }
        monsterName.SetValue(name);

    }
    public void SetFollowTarget(Transform target)
    {
        if (followTargetUI == null)
        {
            followTargetUI = AndaUIManager.Instance.PopingMenu<FollowTargetUI>("FollowTargetUI");
            followTargetUI.SetInformation(needReverseDirectionInfoBar);
        }

        followTargetUI.SetFollowValue(OTYPE.UIActiveType.linear, target, 0.05f, 0.01f);
    }

    public void UpdateBlood(int updateValue,int maxValue)
    {
        if (blood == null)
        {
            if (needReverseDirectionInfoBar)
                blood = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Reverse");
            else
                blood = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Forward");

           

            blood.InitValue();
            blood.SetInformation(0.5f, 0.25f);
            followTargetUI.SetTargetToPoint(blood.transform);
        }
        blood.UpdateValue(updateValue,maxValue);
    }

    public void UpdateEnergy(int updateValue, int maxValue)
    {
        if (energy == null)
        {
            if (needReverseDirectionInfoBar)
                energy = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Reverse");
            else
                energy = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Forward");
          
            energy.InitValue();
            energy.SetInformation(0.5f, 0.25f);
            followTargetUI.SetTargetToPoint(energy.transform);
        }
        energy.UpdateValue(updateValue, maxValue);
    }

    public void UpdateStrength(int updateValue, int maxValue)
    {
        if (strength == null)
        {
            if (needReverseDirectionInfoBar)
                strength = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Reverse");
            else
                strength = AndaUIManager.Instance.PopingMenu<InfoBarForSlider>("InforBar_00_Forward");
            
            strength.InitValue();
            strength.SetInformation(0.5f, 0.25f);
            followTargetUI.SetTargetToPoint(strength.transform);
        }
        strength.UpdateValue(updateValue, maxValue);
    }

    private void Update()
    {
        if (blood != null)
        {
            blood.OnUpdate();
        }
        if (energy != null)
        {
            energy.OnUpdate();
        }
        if (strength != null)
        {
            strength.OnUpdate();
        }
        if (followTargetUI!= null)
        {
            followTargetUI.OnUpdate();
        }
    }
}
