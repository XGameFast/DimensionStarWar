using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestProtectGameController : TestGameBaseController {

    private Boss2002 bossBasic ;

    public override void ClickBuildMonster()
    {
        base.ClickBuildMonster();
        BuildEnemy();
    }


    public override void BuildEnemy()
    {
        base.BuildEnemy();

        PlayerMonsterAttribute playerMonster = new PlayerMonsterAttribute ();
        playerMonster.monsterID = 2002;
        playerMonster.monsterSkillIDList = new List<PlayerSkillAttribute>
        {
            new PlayerSkillAttribute{skillID = 10010},
            new PlayerSkillAttribute{skillID = 10011},
            new PlayerSkillAttribute{skillID = 10012}
        };

        bossBasic = AndaDataManager.Instance.InstantiateMonster<Boss2002>(playerMonster.monsterID.ToString());
        bossBasic.SetInfo(playerMonster);
       
        bossBasic.transform.position = curMineMonster.transform.position + -Vector3.Normalize(bossBasic.transform.position - curMineMonster.transform.position) * 10;
        bossBasic.bossData.SetEnemy(curMineMonster);
    }

    public override void ClickStartGame()
    {
        base.ClickStartGame();
        if(bossBasic!=null)
        {
       
            bossBasic.bossData.SetBossActive(true);
        }
        curMineMonster.SetControllerState(true);
    }

    private Vector3 lastMousePose;
    private Transform targetShotPower;
    protected override void OnUpdate()
    {
        base.OnUpdate();
        if(bossBasic!=null)
        {
        if(targetShotPower == null)
        {
            if(bossBasic.getBossData2002.getElgunObjsList==null)return;
            int count = bossBasic.getBossData2002.getElgunObjsList.Count;
            for(int i = 0 ; i < count; i++)
            {
                if(bossBasic.getBossData2002.getElgunObjsList[i] != null)
                {
                    targetShotPower = bossBasic.getBossData2002.getElgunObjsList[i].transform;
                }
            }
           
        }else
        {
            GameCamera.transform.forward = - (GameCamera.transform.position - targetShotPower.position);

        }
        }

        //Vector3 vector3 = GameCamera.transform.eulerAngles;
        //vector3.y += (Input.mousePosition.x - lastMousePose.x) * Time.deltaTime * 0.5f;
        //vector3.x -= (Input.mousePosition.y - lastMousePose.y) * Time.deltaTime * 0.5f;
        //lastMousePose = Input.mousePosition;
        //GameCamera.transform.eulerAngles = vector3;
        //GameCamera.transform.forward = - (GameCamera.transform.position -  new Vector3(bossBasic.selfPosX, bossBasic.selfPosY+4.5f, bossBasic.selfPosZ));
    }
}
