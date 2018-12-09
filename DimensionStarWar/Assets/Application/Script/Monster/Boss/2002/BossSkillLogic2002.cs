using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossSkillLogic2002 : BossSkillLogic {
    private Boss2002 boss2002 ;
    public override void BuildSkillLogic(BossBasic _bossBasic)
    {
        boss2002 = _bossBasic as Boss2002;
        bossBasic = boss2002;
    }

    public override void PlayAttack(PlayerSkillAttribute _playerSkillAttribute, Transform tra)
    {
        base.PlayAttack(_playerSkillAttribute, tra);
        BossSkillBasic bigElgun = AndaDataManager.Instance.InstantaiteSkillObj<BossSkillBasic>(_playerSkillAttribute.skillID.ToString());
        bigElgun.transform.SetInto(tra);
        bigElgun.SetInfo(_playerSkillAttribute , bossBasic);
        boss2002.bossData.SetCurSkillObj(bigElgun);
    }

    public void InstanceElectromagneticGun(PlayerSkillAttribute _playerSkillAttribute , Transform point)
    {
        BossSkillBasic _el = AndaDataManager.Instance.InstantaiteSkillObj<BossSkillBasic>(_playerSkillAttribute.skillID.ToString());
        _el.transform.SetInto(point);
        _el.SetInfo(_playerSkillAttribute , bossBasic);
        boss2002.getBossData2002.AddElgunObjTolist(_el);
    }

    public override void ReadSkill()
    {
        base.ReadSkill();
        boss2002.bossData.getCurSkillObj.SetGatherPose();
    }

    public override void TriggerSkill()
    {
        base.TriggerSkill();
        boss2002.bossData.getCurSkillObj.SetMainObjPose();
    }

}
