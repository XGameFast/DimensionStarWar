using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyMonster :MonsterController{
    public enum EnemyState
    {
        none,
        lersure,
        fight,
    }

    public float thinkTime = 3f;
    public bool allowThink = true;
    public bool allowBigAttack = true;
    public bool allowDefnse = true;
    public bool allowNormalAttack = true;
    public bool allowMove = true;

    protected EnemyState currentState;

    protected override void OnInitValue()
    {
        base.OnInitValue();
        currentState = EnemyState.none;
    }
}
