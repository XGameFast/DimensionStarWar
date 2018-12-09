using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class AudiodataManager : MonoBehaviour {

    private List<SkillAudio> skillAudios;
    public List<AudioClip> UICliplist;
    public AudioSource uiAudioSource;
    public AudioSource tipsAuidoSource;
    public AudioSource backgroundAudio;
    public enum AudioType
    {
        ui,
        tips
    }
    private void Awake()
    {
        AndaDataManager.Instance.audiodataManager = this;
    }
    public void PlaySounds(string audioname, AudioType audioType)
    {
        switch (audioType)
        {
            case AudioType.ui:
                PlayUISounds(audioname);
                break;
            case AudioType.tips:
                PlayTipsSounds(audioname);
                break;
            default:
                break;
        }
    }

    public void PlayUISounds(string clipName)
    {
        AudioClip ac = UICliplist.FirstOrDefault(s => s.name == clipName);
        uiAudioSource.PlayOneShot(ac);
    }

    public void PlayTipsSounds(string clipName)
    {
        AudioClip ac = Resources.Load<AudioClip>("Sounds/Tips/" + clipName);
        uiAudioSource.PlayOneShot(ac);
    }


    public AudioClip PlaySkillSounds(string name)
    {
        AudioClip ac = Resources.Load<AudioClip>("Sounds/Skill/"+name);
        return ac;
    }

    public void PlayBackgroundSounds(bool isPlay)
    {
        if(isPlay)
        backgroundAudio.Play();
        else backgroundAudio.Stop();
    }

    public SkillAudio GetSkillSounds(string name)
    {
        if(skillAudios == null)skillAudios = new List<SkillAudio>();
        SkillAudio skillAudio = skillAudios.FirstOrDefault(s=>s.id == name);
        if(skillAudio == null)
        {
            skillAudio = new SkillAudio();
            skillAudio.id = name;
            string path = "Sounds/Skill/"+name+"/f";
            skillAudio.f = Resources.LoadAll<AudioClip>(path);
            path = "Sounds/Skill/"+name+"/h";
            skillAudio.h = Resources.LoadAll<AudioClip>(path);
            path = "Sounds/Skill/"+name+"/g";
            skillAudio.g = Resources.LoadAll<AudioClip>(path);

            skillAudios.Add(skillAudio);
        }
        return skillAudio;
    }

    public SkillAudio GetDefenseSkillAudio(string name)
    {
        if(skillAudios == null)skillAudios = new List<SkillAudio>();
        SkillAudio skillAudio = skillAudios.FirstOrDefault(s=>s.id == name);
        if(skillAudio == null)
        {
            skillAudio = new SkillAudio();
            skillAudio.id = name;
            string path = "Sounds/Skill/"+name+"/f";
            skillAudio.f = Resources.LoadAll<AudioClip>(path);

            skillAudios.Add(skillAudio);
        }
        return skillAudio;
    }
    
}

public class SkillAudio
{
    public string id{get;set;}
    public AudioClip[] f {get;set;}
    public AudioClip[] h {get;set;}
    public AudioClip[] g {get;set;}
}
