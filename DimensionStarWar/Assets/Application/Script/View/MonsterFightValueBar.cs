using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterFightValueBar : AndaObjectBasic {

    public List<MonsterFightValueBarItem> monsterFightValueBarItemList;
    public void InitInfo(int monsterIndex, List<MonsterUseSkillValue> musv)
    {
        BuildInfo(musv);
    }
    private void BuildInfo(List<MonsterUseSkillValue> musv)
    {
        int count = musv.Count;
        for (int i = 0; i < count; i++)
        {
            monsterFightValueBarItemList[i].gameObject.SetActive(true);
         //   monsterFightValueBarItemList[i].InitValue(musv[i].needMakePower , );
        }
    }
}
