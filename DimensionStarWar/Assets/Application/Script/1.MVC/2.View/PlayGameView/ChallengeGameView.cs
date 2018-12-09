using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
public class ChallengeGameView : UIBasic2
{
    public UITool_Press selectMonsterbtn;
    private ChanllengeGameController chanllengeGameController;
    private System.Action<float> callbackOnPressSelectMonsterBtn;
    private float pressValue;

    public Image countDownImage;
    public Sprite[] countdownNumSprites;

    public GameObject comfirmBtn;


    public ChallegeMonsterPowerBar mineMonsterPowerBar;
    public ChallegeMonsterPowerBar enmeyMonsterPowerBar;

    public GameObject ExpPanel;

    public GameObject ExpButton;

    public Text Exp01;
    public Text Exp02;
    public Text Exp03;

    private PlayerMonsterAttribute pma;


    public override void OnDispawn()
    { 
        pressValue= 0;
        selectMonsterbtn.SetPress(false);
        callbackOnPressSelectMonsterBtn = null;
        mineMonsterPowerBar.isExcuteFadeIn = false;//因为流程原因 所以需在此处 初始化
        mineMonsterPowerBar.baseGroup.alpha = 0;
        ExpPanel.SetTargetActiveOnce(false);
        OpenComfirmBtn(false);
        ExpButton.SetTargetActiveOnce(false);
        if (pma != null)
            pma = null;
        base.OnDispawn();
    }

    public void ChoiceExp(int _index) //传入 配置文件的Index
    {
        if (pma.mosterPower >=
            pma.monsterMaxPower)
        {
            JIRVIS.Instance.PlayTips("星宿意志力满！无法过度使用！");
            return;
        }

        var objectList = AndaDataManager.Instance.userData.GetRecoveryList();
        if (objectList == null)
        {
            JIRVIS.Instance.PlayTips("储存瓶数量不足");
            return;
        }
        var info = objectList.FirstOrDefault(o => o.id == (40000 + _index));
        if (info == null)
        {
            JIRVIS.Instance.PlayTips("储存瓶数量不足");
            return;
        }
        if (info.count > 0)
            info.count -= 1;
        else
        {
            JIRVIS.Instance.PlayTips("储存瓶数量不足");
            return;
        }
        AndaDataManager.Instance.CallServerUpRecovery(pma.monsterIndex, info.lD_Objs[0].objIndex, 1, CallBack);
    }
    public void CallBack(bool success)
    {
        if (success)
        {
            List<UserObjsBox> objectList = AndaDataManager.Instance.userData.GetRecoveryList();
            if (objectList == null)
                return;
            var item = objectList.FirstOrDefault(o => o.id == 40000);
            if (item != null)
                Exp01.text = item.count.ToString();
            item = objectList.FirstOrDefault(o => o.id == 40001);
            if (item != null)
                Exp02.text = item.count.ToString();
            item = objectList.FirstOrDefault(o => o.id == 40002);
            if (item != null)
                Exp03.text = item.count.ToString();

            UpdateMineMonsterPower(pma.mosterPower, pma.monsterMaxPower);

            OpenComfirmBtn(true);
        }
    }

    public void ShowExp()
    {
        try
        {
            if (!ExpPanel.activeSelf)
            {
                ExpPanel.SetTargetActiveOnce(true);
                List<UserObjsBox> objectList = AndaDataManager.Instance.userData.GetRecoveryList();
                if (objectList == null)
                    return;
                var item = objectList.FirstOrDefault(o => o.id == 40000);
                if (item != null)
                    Exp01.text = item.count.ToString();
                item = objectList.FirstOrDefault(o => o.id == 40001);
                if (item != null)
                    Exp02.text = item.count.ToString();
                item = objectList.FirstOrDefault(o => o.id == 40002);
                if (item != null)
                    Exp03.text = item.count.ToString();
            }
            else
            {
                ExpPanel.SetTargetActiveOnce(false);
            }
        }
        catch (Exception ex)
        {
            Debug.Log(ex.Message);
        }
    }

    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
      
        chanllengeGameController = _baseController as ChanllengeGameController;
       
    }

    public void BuildSelectMonsterBtn(System.Action<float> callback)
    {
        pressValue = 0f;
        if(callbackOnPressSelectMonsterBtn == null)
        {
            OpenSelectMonsterBtn();
            callbackOnPressSelectMonsterBtn = callback;
            selectMonsterbtn.BuildPressEvent(MonsterSelectBtnOnPointerDown);
        }
    }

    public void UpdateMonster(PlayerMonsterAttribute _pma)
    {
        pma = _pma;  
    }

    public void UnregisterMonsterBtn()
    {
        selectMonsterbtn.BuildPressEvent(MonsterSelectBtnOnPointerDown);
    }

    public void MonsterSelectBtnOnPointerDown()
    {
        if(pressValue<=1)
        {
          pressValue += Time.deltaTime *0.2f;
            pressValue = Mathf.Clamp01(pressValue);
          callbackOnPressSelectMonsterBtn(pressValue);
        }
    }


    public void OpenSelectMonsterBtn()
    {

        selectMonsterbtn.gameObject.SetTargetActiveOnce(true);
    }

    public void CloseSelectMonsterBtn()
    {
        selectMonsterbtn.gameObject.SetTargetActiveOnce(false);
    }

    public void StartCountDown(System.Action callback)
    {
        countDownImage.gameObject.SetTargetActiveOnce(true);

        AndaObjectBasic andaObject = AndaDataManager.Instance.InstantiateOtherObj<AndaObjectBasic>("StartFight");
        andaObject.SetInto(transform);
        StartCoroutine(ReadCountDown(callback));
    }
    private IEnumerator ReadCountDown(System.Action callback)
    {
        int  count = 3 ;
        float time = 1;
        Color color  = Color.white;
        while(count > 0)
        {
           // countDownImage.sprite = countdownNumSprites[count -1];
          //  countDownImage.transform.localScale = Vector3.one*2;
          //  color  = Color.white;
            time = 1;
            while(time>0)
            {
                time -= Time.deltaTime;
            //    countDownImage.transform.localScale = Vector3.one * time * 2;
            //    color.a = time;
            //    countDownImage.color = color;
                yield return null;
            }
            yield return null;

            count -= 1;
        }
        callback();
        countDownImage.gameObject.SetTargetActiveOnce(false);
    }
    public void OpenExpButton(bool isOpen)
    {
        ExpButton.SetTargetActiveOnce(isOpen);
    }

    public void OpenComfirmBtn(bool isOpen)
    {
      
        comfirmBtn.gameObject.SetTargetActiveOnce(isOpen);
    }
   

    public void ClickConfirm()
    {
        chanllengeGameController.ClickComfirmThisMonster();
        JIRVIS.Instance.RemoveCurrentBtnList();

    }

    public void UpdateMineMonsterPower(int curPower , int max)
    {
        mineMonsterPowerBar.UpdatePowerSingleValue(curPower ,max);
    }

    public void UpdateEnmeyMonsterPower(int cur  ,int max)
    {
        enmeyMonsterPowerBar.UpdatePowerSingleValue(cur , max);
    }

    public void UpdateEnmeyPowerBarPose(Vector3 pose)
    {
        Vector2 vector2 = ARMonsterSceneDataManager.Instance.mainCamera.WorldToScreenPoint(pose);
        Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(vector2);
        enmeyMonsterPowerBar.transform.position = p;
    }

    public void OpenMineMonsterPowerBar(bool isOpen)
    {
        if(isOpen)
        {
            mineMonsterPowerBar.FadeIn();
        }else
        {
            mineMonsterPowerBar.FadeOut();
        }
    }

    public void OpenEnemyMonsterPowerBar(bool isOpen)
    {
        if (isOpen)
        {
            enmeyMonsterPowerBar.FadeIn();
        }
        else
        {
            enmeyMonsterPowerBar.FadeOut();
        }
    }
}
