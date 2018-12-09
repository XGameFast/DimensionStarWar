using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FightGameInterface{
    /*
     * FightGameInterface是用于用户交互
     */
    private FightMenu fightMenu;
    private FightGameController fightCtr;
    private SkillBar skillBar;
    public void BuildData(FightGameController _fightCtr, FightMenu _fightMenu)
    {
        fightCtr = _fightCtr;
        fightMenu = _fightMenu;
        BuildMenu();
    }
    private void BuildMenu()
    {
        if (fightMenu != null)
        {
            fightMenu.InitMenu();
            fightMenu.DidplayAlpha();
            fightMenu.BuildListenerEvent(SelectPlayerMonster, TriggerSelectEvent);
        }
    }

    private void SelectPlayerMonster(int index)
    {
        fightCtr.SelectMonster(index, true);
    }

    private void TriggerSelectEvent(bool isTrigger)
    {
        if (isTrigger)
        {
            AndaGameExtension.GameTimeScale(0.15f);
        }
        else
        {
            AndaGameExtension.GameTimeScale(1);
        }
    }

    public void BuildMonsterListIcon(List<PlayerMonsterAttribute> pmaList)
    {
        fightMenu.BuildMonseterIconsList(pmaList);
    }
    public void SwitchSetMonsterSkill(MonsterBasic mb)
    {
        if (skillBar == null)
        {
            skillBar = AndaUIManager.Instance.PopingMenu<SkillBar>(ONAME.SkillBar);
            skillBar.BuildPlayerSkillList(mb.monsterDataValue.playerSkillAttributeList);
            BuildSlideListerEvent();
        }
        else
        {
            skillBar.CloseAlpha();
            skillBar.ResetValue(mb.monsterDataValue.playerSkillAttributeList);
        }

        skillBar.UpdatePlayerCurrentSkillIndex(mb.getCurrentSkillIndex, mb.currentSkillCDLoadTime, mb.currentSkillCDLimit);

        mb.MonsterUseSkill = skillBar.UpdateLoadSkillTime;
        mb.MonsterChangeSkill = skillBar.UpdatePlayerCurrentSkillIndex;
        
        skillBar.DidplayAlpha();
    }

    private void BuildSlideListerEvent()
    {

    }


    public void OnUpdate()
    {
        if (skillBar != null)
        {

        }
    }
}
