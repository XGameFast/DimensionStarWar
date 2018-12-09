using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossSkillLogic {
    
    protected BossBasic bossBasic;
    public virtual void BuildSkillLogic(BossBasic _bossBasic)
    {
        bossBasic = _bossBasic;
    }

    public virtual void PlayAttack(PlayerSkillAttribute _playerSkillAttribute , Transform tra)
    {
        
    }

    public virtual void ReadSkill()
    {
       
    }

    public virtual void TriggerSkill()
    {
        
    }
}
