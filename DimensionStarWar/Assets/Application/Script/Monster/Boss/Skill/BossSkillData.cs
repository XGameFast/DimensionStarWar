using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossSkillData {

    private BossSkillBasic bossSkillBasic ;
    public PlayerSkillAttribute playerSkillAttribute ;

    public void BuildData(BossSkillBasic _bossSkillBasic , PlayerSkillAttribute _playerSkillAttribute)
    {
        bossSkillBasic = _bossSkillBasic;
        playerSkillAttribute  = _playerSkillAttribute;
    }
}
