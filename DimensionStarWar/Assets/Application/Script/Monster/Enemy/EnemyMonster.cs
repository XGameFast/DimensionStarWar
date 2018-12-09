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
    protected EnemyState currentState;

    protected override void OnInitValue()
    {
        base.OnInitValue();
        currentState = EnemyState.none;
    }
}
