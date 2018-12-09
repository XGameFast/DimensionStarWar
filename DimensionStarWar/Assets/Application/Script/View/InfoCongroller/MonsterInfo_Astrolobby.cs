using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterInfo_Astrolobby : UIFollowWithTarget
{
    private InfoBar_Slider_Label expInfo;
    private InfoBar_Slider_Label strengthInfo;
    private bool isExuteUpdateStrenthValue;

    private int targetTimer;
    private float offsetValue;
    private float offsetTimer;
    private int currentValue;
    private int targetValue;  
    public override void InitValue()
    {
        base.InitValue();
        expInfo.DestroyByAndaDataManager();
        strengthInfo.DestroyByAndaDataManager();
        isExuteUpdateStrenthValue = false;
    }

    public override void OnDispawn()
    {
        base.OnDispawn();
    }

    public void SetValue(PlayerMonsterAttribute pma , Transform followTarget)
    {
        //StrengthInformation(pma.monsterRecoveryTime , pma.monsterCurrentStrength,pma.monsterStrength);
        //ExpInformation(pma.monsterCurEXP,pma.monsterMaxExp,"Lv." + (pma.monsterLevel+1));
        //SetFollowTarget(followTarget);
    }
    private void ExpInformation(int exp , int maxValue ,string level)
    {
        BuildExpInformation();
        expInfo.UpdateValue(exp,maxValue, level, true, false);
        
    }

   
    private void StrengthInformation(int timer, int _currentvalue,int _targetValue)
    {
        BuildStrengthInformation();
        currentValue = _currentvalue;
        targetValue = _targetValue;

        targetTimer = timer;

        offsetValue = targetValue - currentValue;
        offsetTimer = timer - AndaGameExtension.GetCurrentUnixTime();
        if (!isExuteUpdateStrenthValue)
        {
            StartCoroutine(ExcuteUpdateStrengtInfo());
        }
    }
    private IEnumerator ExcuteUpdateStrengtInfo()
    {
        isExuteUpdateStrenthValue = true;
        while (AndaGameExtension.GetCurrentUnixTime() < targetTimer)
        {
            int lessTime = targetTimer - AndaGameExtension.GetCurrentUnixTime();
            float timerPer = 1 - ((float)lessTime / offsetTimer);
            int tmpCurValue = currentValue + (int)(timerPer * offsetValue);
            strengthInfo.UpdateValue(tmpCurValue, targetValue, lessTime.UnixCovertToTime(),true,false);
            yield return null;
        }
        isExuteUpdateStrenthValue = false;
        strengthInfo.UpdateValue(targetValue, targetValue,"FULL", true, false);
    }

    private void BuildExpInformation()
    {
        if (expInfo == null)
        {
            expInfo = AndaUIManager.Instance.PopingMenu<InfoBar_Slider_Label>(ONAME.InfoBar_Slider_Label_Circle);
            expInfo.transform.SetParent(point[0]);
            expInfo.ResetTran();
        }
        expInfo.InitValue();
    }

    private void BuildStrengthInformation()
    {
        if (strengthInfo == null)
        {
            strengthInfo = AndaUIManager.Instance.PopingMenu<InfoBar_Slider_Label>(ONAME.InfoBar_Slider_Label_Circle);
            strengthInfo.transform.SetParent(point[1]);
            strengthInfo.ResetTran();
        }
        strengthInfo.InitValue();
    }
    
}
