using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterState {
    /*
     * Dev :AndaChen
     * Date:2018.3.25
     * 宠物状态
     * 宠物状态用于宠物当前状态的区分 ，低级状态太无法在高级状态执行过程中插入。
     * 
     * 为了避免动画的错乱。只有高级状态会有权限打断低级动画
     */

    public MonsterBasic self;

    private MonsterInfo_State monsterInfoState_UI;
  


    private void BuildMonsterStateInfoBar()
    {
        if (monsterInfoState_UI == null)
        {
            monsterInfoState_UI = AndaUIManager.Instance.PopingMenu<MonsterInfo_State>(ONAME.MonsterInfo_State);
            monsterInfoState_UI.DidplayAlpha();
            monsterInfoState_UI.SetFollowTarget(self.head.transform);
        }
    }
}
