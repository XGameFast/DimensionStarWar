using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FightPlayerMonster : PlayerMonster {

    private const float _interval = 0.01f;
    private const float _keepDistance = 2f;
    private const float _updateDistance = 0.35f;
    private const bool _faceTotarget = true; 
    protected override void OnInitValue()
    {
        //
        base.OnInitValue();
        updateloadTime = Time.time;
        updateInterval = _interval;
        keepDistance = _keepDistance;
        updateDistance = _updateDistance * ARMonsterSceneDataManager.Instance.aRWorld.transform.localScale.x;
        faceToTarget = _faceTotarget;
        moveSpeed = self.monsterDataValue.moveSpeed;
        canUseSkill = true;
        StartPlayerControll();
       
    }
    protected override void OnUpdate()
    {
        base.OnUpdate();
        currentAttackTargetPoint = hitPoint;
    }
}
