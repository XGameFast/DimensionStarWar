using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterMood  {

    private MonsterBasic self;

    private string animtion_happy00 = "happy00";
    private string animtion_happy01 = "happy01";
    private string animtion_sad = "sad";
    private string animtion_hudong00 = "hudong00";
    private string animtion_hudong01 = "hudong01";
    private string animtion_sayhello00 = "hello00";
    private string animtion_sayhello01 = "hello01";
    private string animtion_yunxuan =  "yunxuan";
    private string animtion_normalIdle = "idle";
    private string animtion_broke = "broke";
    private bool isPlayAnimation =false;
    private string isCurrentAnimationName;

    private int hudongTimes;



    public enum MoodType
    {
        happy00 = 0,
        happy01 = 1,
        sad = 2,
        hudong00 = 3,
        hudong01 = 4,
        sayhello00 = 5,
        sayhello01 = 6,
        yunxuan = 7,
        normalIdle = 8,
        broke = 9
    }

    public void BuildData(MonsterBasic _self)
    {
        self = _self;
        isPlayAnimation = false;
    }

    public void PlayMood(MoodType _curMood)
    {

        //if(isPlayAnimation)return;
        SetMoodState(true);
        switch(_curMood)
        {
            case MoodType.happy00:
               // if(isCurrentAnimationName == animtion_happy00)return;
                self.animator.Play(animtion_happy00);
                break;
            case MoodType.happy01:
              //  if (isCurrentAnimationName == animtion_happy01) return;
                self.animator.Play(animtion_happy01);
                break;
            case MoodType.sad:
               // if (isCurrentAnimationName == animtion_sad) return;
                self.animator.Play(animtion_sad);
                break;
            case MoodType.hudong00:

                Playhudong();
                break;
            case MoodType.hudong01:
              // if (isCurrentAnimationName == animtion_happy01) return;
                self.animator.Play(animtion_hudong01);
                break;
            case MoodType.sayhello00:
              //  if (isCurrentAnimationName == animtion_happy01) return;
                PlayeHello();
                break;
            case MoodType.sayhello01:
               // if (isCurrentAnimationName == animtion_happy01) return;
                //PlayeHello(1);
                self.animator.Play(animtion_sayhello01);
                break;
            case MoodType.yunxuan:
              //  if (isCurrentAnimationName == animtion_happy01) return;
                self.animator.Play(animtion_yunxuan);
                break;
            case MoodType.normalIdle:
             //   if (isCurrentAnimationName == animtion_happy01) return;
                self.animator.Play(animtion_normalIdle);
                break;
            case MoodType.broke:
               // if (isCurrentAnimationName == animtion_happy01) return;
                self.animator.Play(animtion_broke);
                break;
        }
    }


    public void Playhudong()
    {
       // if (isCurrentAnimationName == "hudong0") return;
        int t = Random.Range(0,self.hudongAnimationCount);
        self.animator.Play("hudong0"+t);
    }

    public void PlayeHello()
    {
      // if (isCurrentAnimationName == "hello0") return;
        int t = Random.Range(0,self.helloAnimationCount);
        self.animator.Play("hello0"+t);
    }

    public void SetMoodState(bool isPlaying )
    {
        isPlayAnimation = isPlaying;
      
    }

    public void SetClipName(string _name)
    {
        isCurrentAnimationName = _name;
    }


}
