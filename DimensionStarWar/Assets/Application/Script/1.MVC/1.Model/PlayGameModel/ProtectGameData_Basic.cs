using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProtectGameData_Basic  {

    protected UIBasic2 m_View;
    protected ProtectGameCtr_Basic protectGameCtr_Basic;
    public MonsterBasic currentMonsterItem;
    public PlayerMonsterAttribute currentMonsterData;
    public bool isWin = false;
    public virtual void Clear()
    {
        isWin =false;
        RemoveMineMonster();
        RemoveMenu();
    }

    public virtual void RemoveMineMonster()
    {
        if (currentMonsterItem != null)
        {
            AndaDataManager.Instance.RecieveItem(currentMonsterItem);
            currentMonsterItem = null;
        }
    }

    public virtual void RemoveMenu()
    {
        if(m_View!=null)
        {
            AndaDataManager.Instance.RecieveItem(m_View);
            m_View = null;
        }
    }


    public virtual void BuildMenu(string name)
    {
        m_View = AndaUIManager.Instance.PopingMenu2<UIBasic2>(name);
    }

    public virtual void BuildData(ProtectGameCtr_Basic _protectGameCtr_Basic)
    {
        protectGameCtr_Basic = _protectGameCtr_Basic;

    }



    public virtual void SetCurrentMonster(PlayerMonsterAttribute pma)
    {
        currentMonsterData = pma;
    }

   

    public virtual void BuildMonster()
    {
        RemoveMineMonster();
        currentMonsterItem = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(currentMonsterData.monsterID.ToString());
        currentMonsterItem.isPlayer = true;
    }
}
