using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
public class MonsterInfomationBar_AstrologyItem : AndaObjectBasic {


    public Text name_str;
    public float loadSpeed;

    public Transform monsterPoint;

    public CanvasGroup canvasGroup;

    public Slider level_progress;
    public Slider level_background_progress;
    public Text level_progress_value;
    public Text level_str;


    public Slider strength_progress;
    public Slider strength_background_progress;
    public Text   strength_str;

    public Slider blood_progress;
    public Slider blood_background_progress;
    public Text blood_str;

    public Slider power_progress;
    public Slider power_background_progress;
    public Text power_str;

    public Slider luckyProgress;
    public Text luckyStr;
    public Slider pollutionProgress;
    public Text pollutionStr;
    public Slider cleanProgress;
    public Text cleanStr;

    private PlayerMonsterAttribute playerMonsterAttribute;
    AndaObjectBasic monster;


    public override void OnDispawn()
    {

        if(monster!=null)
        {
            AndaDataManager.Instance.RecieveItem(monster);
            monster = null;
        }
        base.OnDispawn();
    }


    public void SetInfo(PlayerMonsterAttribute _pma)
    {
        playerMonsterAttribute = _pma;
    }


    public void PlayInfo()
    {
        PlayName();
        StartCoroutine(PlaySlider());
        PlayBuildmonster();
    }


    private IEnumerator PlaySlider()
    {
        /*int expMax = playerMonsterAttribute.monsterMaxExp;
        int curExp = playerMonsterAttribute.monsterCurEXP;
        float expPer = (float)curExp / expMax;

        int strengthMax = playerMonsterAttribute.monsterMaxStrength;    
        int curStrength = playerMonsterAttribute.monsterCurrentStrength;
        float strengthPer = (float)curStrength/strengthMax;

        int bloodMax = playerMonsterAttribute.monsterMaxPower;
        int curBlood = playerMonsterAttribute.mosterPower;
        float bloodPer = (float)curBlood/ bloodMax;

        int energyMax = playerMonsterAttribute.monsterMaxEnergy;
        int curEnergy = playerMonsterAttribute.monsterEnergy;
        float energyPer = (float) curEnergy/energyMax;

        float curPollution = playerMonsterAttribute.pollution;
        float curLuckValue = playerMonsterAttribute.lucykValue;
        float luckyMax = playerMonsterAttribute.maxLucky;
       
        float luckPer = curLuckValue/luckyMax;
        float cleanValue = playerMonsterAttribute.curCleanValue;
        float tmp = 0;
        while(tmp < 1)
        {
            tmp +=Time.deltaTime*loadSpeed;
            float levelgress = Mathf.Lerp(0,expPer,tmp);
            float strengthGress = Mathf.Lerp(0,strengthPer ,tmp);
            float bloodGress = Mathf.Lerp(0,bloodPer,tmp);
            float energyGress = Mathf.Lerp(0,energyPer,tmp);
            float backgroundGress = Mathf.Lerp(0,1,tmp);
            float pollutionGress = Mathf.Lerp(0,curPollution,tmp);
            float luckyGress = Mathf.Lerp(0,luckPer ,tmp);
            float cleanGress = Mathf.Lerp(0,cleanValue ,tmp);


            level_background_progress.value = backgroundGress;
            strength_background_progress.value = backgroundGress;
            blood_background_progress.value =backgroundGress;
            power_background_progress.value = backgroundGress;
            canvasGroup.alpha = backgroundGress;


            level_progress.value = levelgress;
            strength_progress.value = strengthGress;
            blood_progress.value = bloodGress;
            power_progress.value = energyGress;
            pollutionProgress.value = pollutionGress;
            luckyProgress.value = luckyGress;
            cleanProgress.value = cleanGress;

            level_progress_value.text = ((int)(levelgress*curExp)).ToString();
            strength_str.text = ((int)(strengthGress*curStrength)).ToString();
            blood_str.text = ((int)(bloodGress*curBlood)).ToString();
            power_str.text = ((int)(energyGress*curEnergy)).ToString();
            pollutionStr.text = ((int)(pollutionGress *100)) + "%";
            luckyStr.text =((int)(luckyGress*100)) + "%";
            cleanStr.text =((int)(cleanGress*100)) + "%";
            yield return null;

        }

        level_progress.value = expPer;
        strength_progress.value = strengthPer;
        blood_progress.value = bloodPer;
        power_progress.value = energyPer;


        level_progress_value.text = curExp.ToString();
        strength_str.text = curStrength.ToString();
        blood_str.text = curBlood.ToString();
        power_str.text = curEnergy.ToString();*/
        yield return null;
    }


    private void PlayName()
    {
        name_str.text = playerMonsterAttribute.monsterNickName;
    }

   

    private void PlayBuildmonster()
    {
        if(monster == null)
        {
            monster = AndaDataManager.Instance.InstantiateMonster<AndaObjectBasic>(playerMonsterAttribute.monsterID.ToString());
            monster.gameObject.SetLayer(ONAME.LayerHoloUI);
            monster.gameObject.AddComponent<MonsterActivityWithPlayer>();
            monster.SetInto(monsterPoint);
            monster.SkinNormal();

        }
        monster.GetComponent<Animator>().Play("fadeIn");
        //monster.gameObject.SetLayer(ONAME.LayerHoloUI);
        //monster.SetInto(monsterPoint);
        //monster.GetComponent<Animator>().Play("fadeIn");
    }

}
