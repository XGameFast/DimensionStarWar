using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterController {


    //
    protected MonsterBasic self;

    protected bool startEngine = false;
    
    public void DownloadMessage(MonsterBasic mb)
    {
        self = mb;
        self.OverAttackEvent = OverOnceAttack;
        self.UsingSkillEvent = UsingSkill; 
        InitValue();
    }
    public void InitValue()
    {
        OnInitValue();
    }
    public void Update()
    {
        //总开关
        if (!startEngine) return;
        OnUpdate();
    }
    public virtual void StartEngine()
    {
        startEngine = true;
    }
    public virtual void EndEngine()
    {
        startEngine = false;
    }


    protected virtual void OnInitValue()
    {

    }
    protected virtual void OnUpdate()
    {
        
    }

    protected virtual void OverOnceAttack()
    {
        
    }

    protected virtual void UsingSkill()
    {
        
    }
	
}
