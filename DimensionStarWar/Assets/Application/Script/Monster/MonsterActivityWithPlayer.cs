using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterActivityWithPlayer : MonoBehaviour {

    private MonsterBasic _monsterBasic = null;
    private MonsterBasic monsterBasic 
    { 
        get  
        { 
            if(_monsterBasic == null ) 
                _monsterBasic = GetComponent<MonsterBasic>();
            return _monsterBasic;
        } 
    } 

    private int stampcount = 0;
    public void PlayerStamp()
    {
        monsterBasic.animator.CrossFade("hit00",0.0f);
        stampcount+=1;
        if(stampcount>3)
        {
            monsterBasic.animator.CrossFade("fight01",0.0f);
        }
    }
}
