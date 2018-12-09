using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FightMenuForSkillIterm : AndaObjectBasic {

    public UI2DSprite skillIcon;
    public UISlider cdMask;
    public UILabel cdTimeLabel;
    
    public void SetValue(int skillID)
    {
        skillIcon.sprite2D = AndaDataManager.Instance.GetSkillSprite(skillID.ToString());
    }

    public void OpenCDMask(bool isOpen)
    {
        if (isOpen == cdMask.gameObject.activeSelf)
            return;
        cdMask.gameObject.SetActive(isOpen);
        cdTimeLabel.gameObject.SetActive(isOpen);
    }

    public void UpdateCDValue(float timer,float percent)
    {
        cdMask.value = percent;
        cdTimeLabel.text = timer.ToString("0.0")+"s";
    }


}
