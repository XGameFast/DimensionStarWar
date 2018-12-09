using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Boss2002 : BossBasic {


    //[生成粒子炮的位子] ，2002独占的 ：）
    public Transform[] elGunPoints;
    public Transform gatherPoint;
    public Transform shotPont;
    public BossData2002 getBossData2002 {get {return bossData as BossData2002 ; }}

    private string elgunsAnimationClipName01 = "normalSkillLeft";
    private string elgunsAnimationClipName02 = "normalSkillRight";

    #region 动作调用接口

    public override void ReadySkill()
    {
        bossData.getBossSkillLogic.ReadSkill();
    }

    public override void TriggerSkill()
    {
        bossData.getBossSkillLogic.TriggerSkill();
    }


    #endregion


    #region 构建数据

    public override void SetInfo(PlayerMonsterAttribute _playerMonsterAttribute)
    {
        BuildData(_playerMonsterAttribute);
    }

    protected override void BuildData(PlayerMonsterAttribute _playerMonsterAttribute)
    {
        bossData = new BossData2002();
        bossData.CreatData(this, _playerMonsterAttribute);
    }

    #endregion

    #region 传递控制

    public override void ControlAttack()
    {
       if(getBossData2002.getBossLogic2002!=null)
        {
            if(!bossData.getIsEndOfAttack)return;//正在攻击
            bossData.getBossAnimtion.PlayAttact(bossData.getCurSkillObj.getSkillID);
        }
    }

    #endregion


    protected override void OnUpdate()
    {
        base.OnUpdate();
        if(getBossData2002!=null && getBossData2002.getBossSkillLogic2002!=null && getBossData2002.getBossIsActive)
        {
            bossData.getBossLogic.OnUpdate();
        }
    }
}
