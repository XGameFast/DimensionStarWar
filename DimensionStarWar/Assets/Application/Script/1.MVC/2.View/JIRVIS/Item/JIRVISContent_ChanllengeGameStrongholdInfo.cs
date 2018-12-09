using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISContent_ChanllengeGameStrongholdInfo : UIBasic2 {

    public Text strongholdMedalName;
    public Text strongholdName;
    public Text strongholdMonsterNickname;
    public Transform monsterPoint;
    public Transform medalPoint;
    private MonsterPorItem fightMonster;
    private TowerMonster1002 medalBasic;
    private bool canControl =false;
    private PlayerMonsterAttribute playerMonsterAttribute;
    private bool isOpenSkillBar =false;

    public Slider monsterMaxPower;
    public Text monsterMaxPowerValue;
    public Image maxPowersliderImage;

    public Text normalAttackNickName;
    public Slider monsterNormalAttackSlider;
    public Text monsterNomralAttackValue;
    public Image monsterNormalAttackSliderImage;

    public Text defenseSkillNickName;
    public Slider monsterDefenseSkillSlider;
    public Text monsterDefenseSkillValue;
    public Image monsterDefenseSliderImage;

    public Text specialSkillNickName;
    public Slider monsterSpecialSkillSlider;
    public Text monsterSpecialSkillValue;
    public Image monsterSpecialSliderImage;
    public override void OnDispawn()
    {
        if(medalBasic!=null)
        {
            medalBasic.gameObject.RemoveComponemont<MonsterItemTouchEvent>();
        }
        isOpenSkillBar =false;
        canControl =false;
       // FingerEvent.HoriDragGetSpeed -= ControlMedalRotate;
       // FingerEvent.clickSelectItemEvent3DUICamera-= TabMonster;
        if(fightMonster!=null)
        {
            AndaDataManager.Instance.RecieveItem(fightMonster);
            fightMonster = null;
        }
        if(medalBasic!=null)
        {
            AndaDataManager.Instance.RecieveItem(medalBasic);
            medalBasic = null;
        }
        base.OnDispawn();
    }

    public void SetInfo(PlayerMonsterAttribute playerMonster , PlayerStrongholdAttribute playerStrongholdAttribute)
    {
       //AndaGameExtension.ChangeTextColorToYellow("勋章");

        playerMonsterAttribute = playerMonster;
        strongholdMedalName.text =  "可得:" +  AndaGameExtension.ChangeTextColorToYellow(playerStrongholdAttribute.strongholdNickName) + "[勋章]";
        strongholdName.text = playerStrongholdAttribute.strongholdNickName;
        strongholdMonsterNickname.text = playerMonster.monsterNickName;
        BuildMonster(playerMonster);
        BuildMedeal(playerStrongholdAttribute);
       //FingerEvent.HoriDragGetSpeed += ControlMedalRotate;
      //  FingerEvent.clickSelectItemEvent+= TabMonster;
        canControl=true;
    }

    private void BuildMonster(PlayerMonsterAttribute playerMonster)
    {
        if(fightMonster !=null )AndaDataManager.Instance.RecieveItem(fightMonster);
        fightMonster = AndaDataManager.Instance.InstantiateMenu<MonsterPorItem>("ShporMonsterPorItem");


        float per = (float)playerMonster.mosterPower / playerMonster.monsterMaxPower;
        Color color = AndaGameExtension.GetLevelColor(playerMonster.monsterLevel);
        maxPowersliderImage.color = color;

        fightMonster.SetMonsterInfo(playerMonster.monsterLevel,playerMonster.monsterID,per,color);

       // fightMonster.SetExpSlider(per , color);
        fightMonster.SetInto(monsterPoint);

        //[构建意志力面板]
        StartCoroutine(ExcuteSkillSlider());
    }


    private IEnumerator ExcuteSkillSlider()
    {
        isOpenSkillBar = true;
        float t = 0;



        monsterNormalAttackSlider.gameObject.SetTargetActiveOnce(true);
        monsterDefenseSkillSlider.gameObject.SetTargetActiveOnce(true);
        monsterSpecialSkillSlider.gameObject.SetTargetActiveOnce(true);

        PlayerSkillAttribute skill00 = playerMonsterAttribute.monsterSkillIDList[0];
        PlayerSkillAttribute skill01 = playerMonsterAttribute.monsterSkillIDList[1];
        PlayerSkillAttribute skill02 = playerMonsterAttribute.monsterSkillIDList[2];


        normalAttackNickName.text = skill00.skillNickName;
        defenseSkillNickName.text = skill01.skillNickName;
        specialSkillNickName.text = skill02.skillNickName;

        int p1 = skill00.skillAchievement;
        int p1Level = AndaDataManager.Instance.GetSkillAchievementValue(p1, skill00.skillID);
        int p1Max = playerMonsterAttribute.monsterSkillIDList[0].baseSkillAttribute.skillArchievementLimit[p1Level];

        int p2 = skill01.skillAchievement;
        int p2Level = AndaDataManager.Instance.GetSkillAchievementValue(p2, skill01.skillID);
        int p2Max = playerMonsterAttribute.monsterSkillIDList[1].baseSkillAttribute.skillArchievementLimit[p2Level];


        int p3 = skill02.skillAchievement;
        int p3Level = AndaDataManager.Instance.GetSkillAchievementValue(p3, skill02.skillID);
        int p3Max = playerMonsterAttribute.monsterSkillIDList[2].baseSkillAttribute.skillArchievementLimit[p3Level];

        Color p1Color = AndaGameExtension.GetLevelColor(p1Level);
        Color p2Color = AndaGameExtension.GetLevelColor(p2Level);
        Color p3Color = AndaGameExtension.GetLevelColor(p3Level);

        while (t < 1 && isOpenSkillBar)
        {
            t += Time.deltaTime;
            t = Mathf.Clamp01(t);
            float per1 = p1 * t;
            float per2 = p2 * t;
            float per3 = p3 * t;
            p1Color.a = t * 2f;
            p2Color.a = t * 2f;
            p3Color.a = t * 2f;

            monsterNormalAttackSliderImage.color = p1Color;
            monsterDefenseSliderImage.color = p2Color;
            monsterSpecialSliderImage.color = p3Color;

            monsterNormalAttackSlider.value = per1 / p1Max;
            monsterDefenseSkillSlider.value = per2 / p2Max;
            monsterSpecialSkillSlider.value = per3 / p3Max;

            monsterNomralAttackValue.text = (int)per1 + "/" + p1Max;
            monsterDefenseSkillValue.text = (int)per2 + "/" + p2Max;
            monsterSpecialSkillValue.text = (int)per3 + "/" + p3Max;

           

            monsterMaxPower.value = (int)playerMonsterAttribute.mosterPower*t/ playerMonsterAttribute.monsterMaxPower;
            monsterMaxPowerValue.text = (int)playerMonsterAttribute.mosterPower * t + "/" + playerMonsterAttribute.monsterMaxPower.ToString();

            yield return null;
        }
    }


    private void BuildMedeal(PlayerStrongholdAttribute playerStrongholdAttribute)
    {
        if(medalBasic != null)AndaDataManager.Instance.RecieveItem(medalBasic);
        medalBasic = AndaDataManager.Instance.GetMedalItemEasy(playerStrongholdAttribute.medalLevel,playerStrongholdAttribute.statueID);
        medalBasic.SetInto(medalPoint);
        medalBasic.gameObject.SetLayer(ONAME.LayerUI);
        medalBasic.SetMedalName(playerStrongholdAttribute.strongholdNickName);
        medalBasic.SetMedalInfo(playerStrongholdAttribute.medalLevel,playerStrongholdAttribute.strongholdCreatTime);
        medalBasic.MedalFadeIn();
        if(medalBasic.GetComponent<MonsterItemTouchEvent>()==null)
        {
            medalBasic.gameObject.AddComponent<MonsterItemTouchEvent>();
        }
    }


    public void ControlMedalRotate(float delta,float _speed ,bool isDown)
    {
        speed = _speed*0.09f;
        if(isDown)
        {
            isStartRotate=false;
            Vector3 vector = medalBasic.transform.eulerAngles;
            vector.y+= -speed*Time.deltaTime;
            medalBasic.transform.eulerAngles = vector;
            autoRotate=false;
        }else
        {
            curTime =1f;
            curSpeed = speed;
            isStartRotate = true;
        }
    }

 
    #region 旋转徽章
    private bool autoRotate =false;
    private bool isStartRotate =false;

    private float curTime;
    private float lessTime;
    private float curSpeed;

    private float loadTime;
    private float angle;
    private float tagetAnlge;
    private float speed;
 

    private Quaternion curQuaernion;
    private Quaternion targetQuaternion;
    private void ExcuteRotate()
    {


        if(Mathf.Abs(speed) < 50)
        {
            if(!autoRotate)
            {

                if(medalBasic.transform.eulerAngles.y > 270 && medalBasic.transform.eulerAngles.y <360 || medalBasic.transform.eulerAngles.y >0 && medalBasic.transform.eulerAngles.y < 90)
                {
                    angle = 360 - medalBasic.transform.eulerAngles.y;
                    if(angle> 270)
                    {
                        angle = Mathf.Abs( angle -360);
                    }

                    curQuaernion = medalBasic.transform.rotation;
                    targetQuaternion = new Quaternion(0,0,0,1);
                }else
                {

                    curQuaernion = medalBasic.transform.rotation;
                    targetQuaternion = new Quaternion(0,1,0,0);
                }
                curTime= 0;
                loadTime =  angle /90;
                loadTime = 1- loadTime;
                autoRotate =true;
                lessTime = 0.5f;



                //Debug.Log("LoddTime" + loadTime);
            }else
            {  
                curTime += Time.deltaTime;
                if(curTime < loadTime)
                {
                    lessTime =  curTime / loadTime;
                }

                medalBasic.transform.rotation = Quaternion.Lerp(curQuaernion , targetQuaternion,lessTime);
                if(lessTime >1 )
                {
                    isStartRotate =false;
                }
            }
        }else
        {
            curTime -= Time.deltaTime;
            speed*=curTime;
            Vector3 vector = medalBasic.transform.eulerAngles;
            vector.y+= -speed*Time.deltaTime;
            medalBasic.transform.eulerAngles = vector;
        }
    }
    #endregion

    #region 与宠物互动
    public void TabMonster()
    {
        //fightMonster.ControllerToPlayMoodForHudong01();
    }

    #endregion

    public void Update()
    {
        if(!canControl)return;
        if(medalBasic!=null)
        {
            medalBasic.GetComponent<MonsterItemTouchEvent>().OnUpdate();
        }

    }

}
