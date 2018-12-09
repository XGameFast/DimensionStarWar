using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FightGameEventCenter {

    public FightGameController ft_ctr;

    public void BuildData(FightGameController _ft_ctr)
    {
        ft_ctr = _ft_ctr;
    }

    public void ClearData()
    {

    }

    public void BuildMonsterEvent(MonsterBasic monsterBasic)
    {
        //注册过就不会再次注册了
        if (monsterBasic.MonsterDeadEvent == null)
        {
            monsterBasic.MonsterDeadEvent = ListenrMonsterDeathEvent;
        }
    }
    private void ListenrMonsterDeathEvent(int monsterIndex, bool isPlayer)
    {
        ft_ctr.MonsterDeathEvent(isPlayer);
    }
    private void ListnerMonsterUseSkillEvent(int skillID, int skillType, bool isHit)
    {

    }
}
