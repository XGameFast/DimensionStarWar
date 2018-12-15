using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillBasic : AndaObjectBasic
{
    public AudioSource fSounds, hSounds, gSounds;

    protected MonsterBasic host;
    protected Vector3 toTargetPoint;
    protected Transform toTarget;
    protected Vector3 instanPoint;
    protected Transform  insPoint;
    public System.Action<int> CallBackAttackedTarget;
    public System.Action CallBackFinishLive;
    public System.Action CallBackStartFollow;
    protected PlayerSkillAttribute playerSkillAttribute;
    protected bool isExcuting = false;
    protected bool isRunning = false;
    protected bool isHitTarget = false;

    public int HitPower
    {
        get { return playerSkillAttribute.skillPower; }
    }
    public int getSkillType
    {
        get { return playerSkillAttribute.baseSkillAttribute.skillType ;}
    }
    public int getSkillID
    {
        get { return playerSkillAttribute.skillID ;}
    }

    public int getSkillIndex
    {
        get {return playerSkillAttribute.skillIndex ;}
    }

    public override void OnDispawn()
    {
        if (host != null)
        {
            host.MonsterOnDispawnEvent -= DestroySelf;
        }

        if (!isHitTarget)
        {
            CheckIsHitTarget();
        }
        base.OnDispawn();
    }
    public override void OnSpawn()
    {
        base.OnSpawn();
    }
    public override void InitValue()
    {
        base.InitValue();
        isExcuting = false;
        isRunning = true;

        host = null;
        toTargetPoint = Vector3.zero;
        toTarget = null;
        insPoint = null;
        isHitTarget = false;
        playerSkillAttribute = null;
        CallBackStartFollow = null;
        CallBackFinishLive = null;
        CallBackAttackedTarget = null;
    }

    private void SetAudio()
    {
        SkillAudio skillAudio = new SkillAudio();
        switch(playerSkillAttribute.baseSkillAttribute.skillType)
        {
            case 0:
                skillAudio = AndaDataManager.Instance.GetSkillAudioClip(playerSkillAttribute.skillID.ToString());
               SetClip(gSounds,skillAudio.g);
                SetClip(fSounds,skillAudio.f);
                SetClip(hSounds,skillAudio.h);
                break;
            case 1:
                skillAudio = AndaDataManager.Instance.GetSkillDefenseAudioClip(playerSkillAttribute.skillID.ToString());
                SetClip(fSounds,skillAudio.f);
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
                
        }
    }


    private void SetClip(AudioSource audioSource ,AudioClip[] clips)
    {
        if(audioSource!=null)
        {
            if(clips == null)return;
            int clipIndex = Random.Range(0,clips.Length);
            audioSource.clip = clips[clipIndex];
        }
    }


    public virtual void SetSkillInfo(PlayerSkillAttribute _playerSkillAttribute, MonsterBasic _host, Transform _insTarget, Transform hitTarget)
    {
        
        playerSkillAttribute = _playerSkillAttribute;
        SetAudio();
        insPoint = _insTarget;
        host = _host;
        toTarget = hitTarget;
    
    }


    public virtual void SetSkillInfo(PlayerSkillAttribute _playerSkillAttribute,MonsterBasic _host, Transform _insTarget , Vector3 hitPoint)
    {
        if (_playerSkillAttribute == null)
        {
            Debug.Log("kong！！！！！！！！！！！！");
        }
        playerSkillAttribute = _playerSkillAttribute;
        SetAudio();
        host = _host;
        insPoint = _insTarget;
        toTargetPoint = hitPoint;




    }

    public virtual void SetSkillInfo(PlayerSkillAttribute _playerSkillAttribute,MonsterBasic _host, Vector3 _insTarget, Vector3 hitPoint)
    {
        if (_playerSkillAttribute == null)
        {
           // Debug.Log("kong222222");
        }
        playerSkillAttribute = _playerSkillAttribute;
        host = _host;
        instanPoint = _insTarget;
        toTargetPoint = hitPoint;
        host.MonsterOnDispawnEvent += DestroySelf;
    }
    private void DestroySelf()
    {
        AndaDataManager.Instance.RecieveItem(this);
    }
    public void SetTargetPoint(Vector3 point)
    {
        toTargetPoint = point;
    }
    public void SetTargetPoint(Transform target)
    {
        toTarget = target;
        toTargetPoint = target.position;
    }

    /// <summary>
    /// 准备技能 ,一般用于蓄力过程
    /// </summary>
    public void ReadySkill()
    {
        if (!isRunning) return;
        StartSkill();
    }




    /// <summary>
    /// 执行技能 ，一般用于技能弹道运行
    /// </summary>
    public void UsingSkill()
    {
        if (!isRunning) return;
        RunningSkill();
    }
    
    /// <summary>
    /// 如果技能还没到达执行步骤，是可以被打断的 ,否者会继续触发
    /// </summary>
    public void StopSkill()
    {
        Debug.Log("StopSkill");
        if (!isExcuting)
        {
            isRunning = false;
            Live(false);
        }
    }


    /// <summary>
    /// 代表此技能的触发过程已经结束了
    /// </summary>
    public virtual void EndSkill()
    {
        
    }

    /// <summary>
    /// 护盾类型的技能会，防御成功会调用和这个
    /// </summary>
    public virtual void HasbeenHit()
    {
        
    }



    //内部调用
    protected virtual void StartSkill()
    {
        if (gSounds != null)
        {
            PlaySounds(gSounds);
        }
    }

    protected virtual void RunningSkill()
    {
        isExcuting = true;
        PlaySounds(fSounds);
        //ResetDestory(2f);
    }

    protected virtual void OverSkill()
    {

    }
    
    private void Update()
    {
        OnUpdate();
    }
    protected virtual void OnUpdate()
    {

    }
    /// <summary>
    /// 代表技能已经击中目标，准要向目标发送击中事件
    /// </summary>
    /// <param name="hitTarget"></param>
    protected virtual void Hit(AndaObjectBasic hitTarget , string hitLayer)
    {

        isHitTarget = true;

        CheckIsHitTarget();

        if (hitTarget != null)
        {
            switch (hitLayer)
            {
                case "Boss":
                    SendSkillValue();
                    ((BossBasic)hitTarget).HasBeenAttack(HitPower);
                    break;
                case "Monster":
                    SendSkillValue();
                    ((MonsterBasic)hitTarget).ControllerHasbeenHit(host, HitPower);
                    break;
                case "Player":
                    SendSkillValue();
                    ((MonsterBasic)hitTarget).ControllerHasbeenHit(host, HitPower);
                    break;
                case "Objects":
                    ((ObjectBasic)hitTarget).ControllerObjectHasBeenHit(HitPower);
                    break;
                case "Skill":
                    hitTarget.GetComponent<Magical>().DestoryYou();
                    break;
            }
        }

        AddEffect();
        Explore();
    }


    /// <summary>
    /// 击中后需要处理的事件 。不在底层处理，在技能自身逻辑层处理
    /// </summary>
    protected virtual void Explore()
    {
        PlaySounds(hSounds);
    }
    /// <summary>
    /// 有些技能有附带效果，例如减速之类的，这里并不指特效 。
    /// </summary>
    protected virtual void AddEffect()
    {

    }

    protected virtual void PlaySounds(AudioSource source)
    {
        if (source != null)
        {
            //if(source.clip == null) source.clip = AndaDataManager.Instance.GetAudioClip(name);
            source.Play();
        }
    }

    private void CheckIsHitTarget()
    {
        //只有没有被打断的技能才需要发送消息
        if (isRunning)
        {
            host.ReceiveSkillMessage(playerSkillAttribute.skillID, playerSkillAttribute.baseSkillAttribute.skillType, isHitTarget);
        }
    }

    private void SendSkillValue()
    {
        switch(getSkillType)
        {
            case 0:
                host.UpdateSKillUseData(playerSkillAttribute.skillPower ,1, getSkillType ,getSkillID , getSkillIndex);
                break;
            case 1:
                host.UpdateSKillUseData (playerSkillAttribute.skillPower ,1,getSkillType,getSkillID,getSkillIndex);
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
        }
    }


}
