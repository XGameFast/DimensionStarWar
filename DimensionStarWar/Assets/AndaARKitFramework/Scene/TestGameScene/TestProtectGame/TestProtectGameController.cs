using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestProtectGameController : MonoBehaviour {

    private Boss2002 bossBasic ;
    public Camera ct;

    private MonsterBasic mineMonster;

    public void Start()
    {
        ARMonsterSceneDataManager.Instance.mainCamera  = ct;
    }

    public  void ClickBuildMonster()
    {
        BuildEnemy();
    }


    public  void BuildEnemy()
    {
      
        PlayerMonsterAttribute playerMonster = new PlayerMonsterAttribute ();
        playerMonster.monsterID = 2001;
        playerMonster.monsterSkillIDList = new List<PlayerSkillAttribute>
        {
            new PlayerSkillAttribute{skillID = 10201},
            new PlayerSkillAttribute{skillID = 11201},
            new PlayerSkillAttribute{skillID = 12201}
        };

        bossBasic = AndaDataManager.Instance.InstantiateMonster<Boss2002>(playerMonster.monsterID.ToString());
        bossBasic.SetInfo(playerMonster);
        Vector3 vector3 = ct.transform.position;
        vector3.y =0 ;
        bossBasic.transform.position = vector3 + Vector3.Normalize(bossBasic.transform.position - vector3) * 10;
        bossBasic.bossData.SetBossActive(true);
    }


    public void BuildMineMonster()
    {
        PlayerMonsterAttribute pma = AndaDataManager.Instance.GetUserPlayerMonstesrList()[0];
        mineMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(pma.monsterID.ToString());
        mineMonster.isPlayer = true;
        mineMonster.DownloadMonsterValue(pma, OTYPE.MonsterStateType.fight);
    }

    public void ClickStartGame()
    {

        if(bossBasic!=null && mineMonster!=null)
        {
            // bossBasic.bossData.SetBossActive(true);
            bossBasic.bossData.SetEnemy(mineMonster);
            mineMonster.SetControllerState(true);
        }
       // curMineMonster.SetControllerState(true);
    }

  
}
