using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
using System;

public class BuildDimensionMenu_RoomInfoBar : AndaObjectBasic
{
    public float loadSpeed;
    public Animator itemAnimator;
    public GameObject fadeInEffect;
    public Text dimensionRoomName;
    public Text levelType;

    public Slider dimensionRoomLevelProgress;
    public Slider levelProgressBackground;

    public Text dimensionRoomLevelValue;
    public Text dimensionRoomLevel;
    public Text dimensionRoomLocation;



    public Text dimensionRoomPolutionValue;


    //--体力恢复值
    public Slider recoverPowerProgress;
    public Slider recoverPowerbackground;
    public Text recoverPowerValue;
    //精粹
    public Slider freeExpSliderProgeress;
    public Slider freeExpSliderBackground;
    public Text freeExpValue;

    //- 容量
    public Slider capcityProgress;
    public Slider capacityProgressBackground;
    public Text capacityValue;

    public Transform towerPoint;

    public CanvasGroup canvasGroup;
    public CanvasGroup canvasBoardGroup;
    public CanvasGroup itemboardGroup;

    public PlayerStrongholdAttribute playerStrongholdAttribute;

    private TowerMonster1002 medal;//实际上是个徽章
    private float oldy = 180;//原来的旋转角度
    private float y=180;//旋转角度
    private float yTime;//旋转角度

    private System.Action callback_entetDimensionroom;

    private List<int> statueIDs;
    private int tmpSelectStatusID;
    private BuildDimensionRoomMenu buildDimensionRoomMenu;
    private System.Action CallbackAddStrongholdl;
    private System.Action<int, int> FinishDragItem;//返回方向到底是加还是减
    private int curItemIndex;//grid 的 游标
    private bool isAddtionBar = false;

    public GameObject infoBar;
    public CanvasGroup additionBar;

    public Button getExpButton;
    public GameObject ExpPanel;

    public Text Exp01;
    public Text Exp02;
    public Text Exp03;


    public override void OnSpawn()
    {
        base.OnSpawn();

    }

    public override void OnDispawn()
    {


        itemAnimator.enabled = false;
        base.OnDispawn();
    }

    public void TurnMedal()
    {
        if (medal == null)
            return;
        if (yTime != 0)
            return;
        yTime = 0f;
        y += 180;
        StartCoroutine(Turn());
    }
    IEnumerator  Turn()
    {
        while (yTime <= 0.5)
        {
            yTime += Time.deltaTime;
            medal.transform.rotation= Quaternion.Euler(new Vector3(0, Mathf.Lerp(oldy, y, yTime*2), 0)) ;
            yield return null;
        }
        oldy = y;
        yTime = 0;
    }
    public void SetValue(int _itemIndex, PlayerStrongholdAttribute _playerStrongholdAttribute, System.Action callback, BuildDimensionRoomMenu _buildDimensionRoomMenu, System.Action<int, int> dragFinishCallaback)
    {
        isAddtionBar = false;
        infoBar.gameObject.SetActive(true);
        additionBar.gameObject.SetActive(false);
        curItemIndex = _itemIndex;
        buildDimensionRoomMenu = _buildDimensionRoomMenu;
        callback_entetDimensionroom = callback;
        FinishDragItem = dragFinishCallaback;
        playerStrongholdAttribute = _playerStrongholdAttribute;
        BuildStatuesValue();
    }

    public void SetAdditionBar(int _itemIndex, System.Action<int, int> dragFinishCallaback, System.Action addtionStronghold)
    {
        CallbackAddStrongholdl = addtionStronghold;
        curItemIndex = _itemIndex;
        isAddtionBar = true;
        infoBar.gameObject.SetActive(false);
        additionBar.gameObject.SetActive(true);
        FinishDragItem = dragFinishCallaback;
    }

    public void ClickAddtionStronghold()
    {
        if (CallbackAddStrongholdl != null)
        {
            CallbackAddStrongholdl();
        }
    }

    public void FadeOut()
    {
        StartCoroutine(ExcuteFadeOut());
    }

    private IEnumerator ExcuteFadeOut()
    {
        float t = 1;
        while (t > 0)
        {
            t -= Time.deltaTime;
            t = Mathf.Clamp01(t);
            if (medal != null)
            {
                float a = Mathf.Clamp(t, 0.3f, 1f);
                medal.SetAlpha(a);
            }
            //canvasBoardGroup.alpha = t;
            yield return null;
        }
        medal.gameObject.SetTargetActiveOnce(false);
    }

    public void Fade(float _value)
    {
        canvasBoardGroup.alpha = _value;
    }

    public void OffsetBar(float value)
    {
        Vector3 vector3 = transform.eulerAngles;
        // Debug.Log("vector3" +vector3);
        vector3.z = value;
        transform.eulerAngles = vector3;
    }


    public void CloseBoard(float _value)
    {
        if (!isAddtionBar)
        {
            if (medal != null)
            {
                medal.gameObject.SetTargetActiveOnce(false);
                dimensionRoomLevelProgress.value = 0;
                capcityProgress.value = 0;
                capacityValue.text = "";
                recoverPowerProgress.value = 0;
                recoverPowerValue.text = "";
                freeExpSliderProgeress.value = 0;
                freeExpValue.text = "";
                dimensionRoomLocation.text = "";
                dimensionRoomName.text = "";
                levelType.text = "";

            }
        }

        canvasGroup.alpha = 0;

    }

    public void DisplayTower(bool isDisplay)
    {
        if (!isAddtionBar) medal.gameObject.SetTargetActiveOnce(isDisplay);
    }

    private void BuildStatuesValue()
    {
        List<int> ids = AndaDataManager.Instance.GetUserMonsterIDs(playerStrongholdAttribute.strongholdIndex);
        int count = ids.Count;
        for (int i = 0; i < count; i++)
        {
            if (statueIDs == null) statueIDs = new List<int>();
            if (!statueIDs.Contains(ids[i]))
            {
                statueIDs.Add(ids[i]);
            }
        }
    }

    public void PlayInfo()
    {
        if (!isAddtionBar)
        {
            PlayRoomName();
            StartCoroutine(PlayRoomLevelSlider());
            PlayRoomLocation();
            //StartCoroutine(PlayCurrentPollution());
            //PlayRoomRecoveryStrengthValue();
            //PlayRoomExpCount();
            //StartCoroutine(PlayRoomCapaity());
            StartCoroutine(PlayRoomFreeExp());
            StartCoroutine(PlayRoomCapaity());
            StartCoroutine(PlayerRecoveryPower());
            //SetTowerObj();
        }
        fadeInEffect.gameObject.SetActive(true);
        StartCoroutine(DisplayAlpha());
    }

    private void PlayRoomName()
    {
        Debug.Log(playerStrongholdAttribute.strongholdNickName);
        dimensionRoomName.text = playerStrongholdAttribute.strongholdNickName;
    }

    private IEnumerator PlayRoomLevelSlider()
    {
        int max = playerStrongholdAttribute.strongholdMaxValue;
        float per = ((float)playerStrongholdAttribute.strongholdGloryValue / max).FloatToFloat();
        dimensionRoomLevel.text = "Lv." + playerStrongholdAttribute.strongholdLevel.ToString();
        float t = 0;
        while (t < 1)
        {
            t += Time.deltaTime * loadSpeed;
            float percent = Mathf.Lerp(0, per, t);
            float bkprecent = Mathf.Lerp(0, 1, t);
            dimensionRoomLevelValue.text = (int)(percent * max) + "/" + max;
            dimensionRoomLevelProgress.value = percent;
            //levelProgressBackground.value = bkprecent;
            yield return null;
        }

        dimensionRoomLevelProgress.value = per;
        dimensionRoomLevelValue.text = playerStrongholdAttribute.strongholdGloryValue + "/" + max;
    }

    private void PlayRoomLocation()
    {
        dimensionRoomLocation.text = playerStrongholdAttribute.strongholdLocationName;
        //levelType.text = playerStrongholdAttribute.strongholdLevelName;
    }

    private IEnumerator PlayCurrentPollution()
    {
        float curPollution = playerStrongholdAttribute.currentPollution;
        //Debug.Log("curPollution" + curPollution);
        float tmp = 0;

        while (tmp < 1)
        {

            tmp += Time.deltaTime * loadSpeed;
            // dimensionRoomPolutionProgress.value = Mathf.Lerp(0,curPollution,tmp);
            // polutionProgressBackground.value =Mathf.Lerp(0,1,tmp);
            dimensionRoomPolutionValue.text = ((int)(tmp * 100)) + "%";
            yield return null;
        }
        // dimensionRoomPolutionProgress.value = curPollution;
        dimensionRoomPolutionValue.text = ((int)(curPollution * 100)) + "%";
    }

    private void PlayRoomRecoveryStrengthValue()
    {
        recoverPowerValue.text = playerStrongholdAttribute.playerStrongholdRecoveryStrengthTime + "h";
    }

    private void PlayRoomExpCount()
    {
        freeExpValue.text = playerStrongholdAttribute.playerStrongholdExpblockCount.ToString();
    }

    private IEnumerator PlayRoomCapaity()
    {
        int max = playerStrongholdAttribute.playerStrongholdCapacity;
        int count = playerStrongholdAttribute.currentMonsterCount;
        float per = (float)count / max;

        float tmp = 0;
        while (tmp < 1)
        {

            tmp += Time.deltaTime * loadSpeed;
            tmp = Mathf.Clamp01(tmp);
            capcityProgress.value = per * tmp;
            capacityValue.text = (int)(count * tmp) + "/" + max;
            yield return null;
        }

    }
    private IEnumerator PlayRoomFreeExp()
    {
        int max = playerStrongholdAttribute.playerStrongholdExpblockMax;
        int cur = playerStrongholdAttribute.currentExp;

        if (playerStrongholdAttribute.currentExp > 0)
            getExpButton.enabled = true;
        else
            getExpButton.enabled = false;

        float tmp = 0;
        while (tmp < 1)
        {
            tmp += Time.deltaTime * loadSpeed;
            tmp = Mathf.Clamp01(tmp);
            freeExpSliderProgeress.value = (cur / max) * tmp;
            freeExpValue.text =(int)Mathf.Lerp(0, cur, tmp) + "/" + max;
            yield return null;
        }
    }

    private IEnumerator FreeExpChange(int oldvalue, int newvalue)
    {
        int max = playerStrongholdAttribute.playerStrongholdExpblockMax;

        if (playerStrongholdAttribute.currentExp > 0)
            getExpButton.enabled = true;
        else
            getExpButton.enabled = false;

        float tmp = 0;
        while (tmp < 1)
        {
            tmp += Time.deltaTime * loadSpeed;
            tmp = Mathf.Clamp01(tmp);
            freeExpSliderProgeress.value = Mathf.Lerp(oldvalue/max, newvalue/max, tmp);
            freeExpValue.text = (int)Mathf.Lerp(max, newvalue, tmp) + "/" + max;
            yield return null;
        }
    }




    public void ShowExp()
    {
        try
        {
            if (!ExpPanel.activeSelf)
            {
                ExpPanel.SetTargetActiveOnce(true);
                List<UserObjsBox> objectList = AndaDataManager.Instance.userData.GetBottleList();
                if (objectList == null)
                    return;
                var item = objectList.FirstOrDefault(o => o.id == 40020);
                if (item != null)
                    Exp01.text = item.count.ToString();
                item = objectList.FirstOrDefault(o => o.id == 40021);
                if (item != null)
                    Exp02.text = item.count.ToString();
                item = objectList.FirstOrDefault(o => o.id == 40022);
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
   
    public void ChoiceExp(int _index) //传入 配置文件的Index
    {
        var objectList = AndaDataManager.Instance.userData.GetBottleList();
        if(objectList==null)
        {
            JIRVIS.Instance.PlayTips("储存瓶数量不足");
            return;
        }
        var info = objectList.FirstOrDefault(o => o.id ==(40020+ _index));
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
        GetRoomExp(_index+1, info.lD_Objs[info.count -1 ].objIndex);
        ExpPanel.SetTargetActiveOnce(false);
    }

    //精粹获取
    private void GetRoomExp(int createObjectID, int objectIndex)
    {

        AndaDataManager.Instance.GetEXP(_getRommExpBack, playerStrongholdAttribute.strongholdIndex, objectIndex, createObjectID);
    }

    public void _getRommExpBack(SD_Pag sd_pag)
    {
        if (sd_pag.code != "200")//获取精粹失败
        {
            getExpButton.enabled = true;
            JIRVIS.Instance.PlayTips(sd_pag.detail);
        }

        else
        {
            JIRVIS.Instance.PlayTips("获取精粹成功！");
            int old = playerStrongholdAttribute.currentExp;
            playerStrongholdAttribute.currentExp -= sd_pag.SD_Pag4U.objectValue;
            StartCoroutine(FreeExpChange(old, playerStrongholdAttribute.currentExp));
            //StartCoroutine(PlayRoomFreeExp());
            //是否在此处显示获取到的能量精粹瓶子

        }
    }

    private IEnumerator PlayerRecoveryPower()
    {
        float t = 0;
        while (t < 1)
        {
            t += Time.deltaTime;
            t = Mathf.Clamp01(t);
            recoverPowerProgress.value = t;
            recoverPowerValue.text = (t * 7.5f) + "小时";
            yield return null;
        }

    }



    private IEnumerator DisplayAlpha()
    {
        itemboardGroup.alpha = 0;
        yield return new WaitForSeconds(0.5f);
        fadeInEffect.gameObject.SetActive(false);
        itemboardGroup.alpha = 1;
        float tmp = 0;
        while (tmp < 1)
        {
            tmp += Time.deltaTime * loadSpeed;
            tmp = Mathf.Clamp01(tmp);
            if (isAddtionBar)
            {
                additionBar.alpha = tmp;
            }
            else
            {
                canvasGroup.alpha = tmp;
            }

            yield return null;
        }
    }

    private void SetTowerObj()
    {
        if (medal == null)
        {
            medal = AndaDataManager.Instance.GetMedalItemEasy(playerStrongholdAttribute.medalLevel, playerStrongholdAttribute.statueID);
            medal.SetInto(towerPoint);
            medal.SetMedalInfo(playerStrongholdAttribute.medalLevel, AndaGameExtension.GetCurrentUnixTime());
            medal.SetMedalName(playerStrongholdAttribute.strongholdNickName);
            medal.gameObject.SetLayer(ONAME.LayerUI);
        }
        medal.SetAlpha(1f);
        medal.SetTargetActiveOnce(true);
        medal.animator.Play("FadeIn");//.GetComponent<Animator>().Play("FadeIn");

    }

    public void PlayItemEnterAstroloy()
    {
        itemAnimator.enabled = true;
        itemAnimator.Play("FadeOut");
        medal.SetTargetActiveOnce(false);
    }

    public void PlayItemOutAstrology()
    {
        itemAnimator.Play("FadeIn");
        medal.SetTargetActiveOnce(true);
        medal.animator.Play("FadeIn");
        Invoke("InvokPlayeItemOutAstrology", 1f);
    }

    public void PlayItemEnterStarMap()
    {
        itemAnimator.enabled = true;
        itemAnimator.Play("FadeInStartMap");
    }

    private void InvokPlayeItemOutAstrology()
    {
        itemAnimator.enabled = false;
    }

    public void ClickEnterDimension()
    {

        PlayItemEnterAstroloy();

        // itemAnimator.Play("FadeOut");
        callback_entetDimensionroom();

    }

    //[点击切换徽章图标]
    public void ClickChangeStatus()
    {
        buildDimensionRoomMenu.PauseFingervent(true);
        //tower.gameObject.SetTargetActiveOnce(false);
        //JIRVIS.Instance.OpenChangeStrongholdStatusBar(statueIDs,playerStrongholdAttribute.strongholdLevel,CallbackClickComfrimSelectItem ,CallbackClickCancelSelectItem,CallbackSeletctStatueID);
    }

    #region 回调

    public void CallbackSeletctStatueID(int _id)
    {
        tmpSelectStatusID = _id;
    }

    public void CallbackClickComfrimSelectItem()
    {
        if (tmpSelectStatusID == -1) return;
        AndaDataManager.Instance.CallServerUploadStrongholdStatusID(playerStrongholdAttribute.strongholdIndex, 10001, CallbackFinishUploadSelectStatueID);
        buildDimensionRoomMenu.PauseFingervent(false);
    }

    public void CallbackClickCancelSelectItem()
    {
        JIRVIS.Instance.jIRVISData.RemoveChangeStrongholdStatueBar();
        JIRVIS.Instance.CloseTips();
        buildDimensionRoomMenu.PauseFingervent(false);
        medal.gameObject.SetTargetActiveOnce(true);
    }

    public void CallbackFinishUploadSelectStatueID()
    {
        /*JIRVIS.Instance.jIRVISData.RemoveChangeStrongholdStatueBar();
        JIRVIS.Instance.CloseTips();
        medal.data.getStrongholdBaseAttribution.statueID = tmpSelectStatusID;
        medal.UpdateTowerSkin(true);
        tmpSelectStatusID = -1;
        medal.gameObject.SetTargetActiveOnce(true);
*/

    }

    #endregion


    #region ActiveEvent

    private bool isClikcDown = false;

    private float rollValue;
    private float rollPercent;
    private int startDir;
    private int isChangeItem = 0;
    private bool isTrigged = false;
    /// <summary>
    /// 用于判断当前对焦的是哪个Item
    /// </summary>
    private bool curItemIsSelf = false;

    public void UpdateCurItemIsSelf(int curIndex)
    {
        curItemIsSelf = curIndex == curItemIndex;
        // Debug.Log(  playerStrongholdAttribute.strongholdNickName + "isSelf : " + curItemIsSelf);
    }

    public void RotateAngle(int _dir, bool isLast)
    {
        StartCoroutine(ExcuteRotateAngle(_dir, isLast));
    }

    private IEnumerator ExcuteRotateAngle(int _dir, bool isLast)
    {

        if (_dir == 1)
        {
            CloseBoard(0);
        }
        float t = 0;
        while (t < 1)
        {
            t += Time.deltaTime * 2f;
            t = Mathf.Clamp01(t);
            if (_dir == -1) //下一个
            {
                float angle = t * 45;
                float alpha = 1 - t;
                if (!isLast) //等于0 即最后一个
                {
                    OffsetBar(angle);
                    Fade(alpha);
                }
                else
                {
                    Fade(t);
                }

            }
            else if (_dir == 1) //上一个
            {
                float angle = (1 - t) * 45;
                float alpha = t;
                if (!isLast)//这个最后一个是指 最有一个要读取的独享
                {
                    if (transform.GetSiblingIndex() == 0) //当前这个在列队的最有一个，那么是不需要移动位置的
                    {
                        Fade(1 - alpha); //只需要隐藏
                    }
                    else
                    {
                        OffsetBar(angle); //滚动 
                        Fade(1 - alpha);  //隐藏
                    }
                }
                else  //如果是要读取的最后一个，
                {
                    Fade(alpha); //第一个就是0 ～ 1
                    OffsetBar(angle);
                }
            }

            yield return null;
        }

        if (_dir == -1)
        {
            CloseBoard(0);
        }
    }

    public void RollAngle(float value, bool _isDown)
    {
        if (_isDown)
        {
            value *= 0.5f;
        }
        if (!_isDown)
        {
            if (isClikcDown)
            {
                isClikcDown = false;
                if (startDir == 1)
                {
                    if (curItemIsSelf) //如果是向前查看，并且当前是自己，那么显示徽章
                    {
                        DisplayTower(true);
                    }
                }

                StartCoroutine(AutoRollItem());
            }

            return;
        }

        if (isClikcDown)
        {
            rollValue += value;
            rollPercent = rollValue / (Screen.width / 2f);
            if (startDir == -1) //下一个
            {
                if (curItemIsSelf)
                {
                    if (transform.GetSiblingIndex() == 0) //序号为1的item 只做位移 ，到头了
                    {
                        OffsetBar(rollPercent * -1 * 45);
                    }
                    else
                    {
                        Fade(1 - rollPercent * -1); //
                        OffsetBar(rollPercent * -1 * 45);
                    }

                }
                else //如果当前不是自己，就只是出现
                {
                    Fade(rollPercent * -1);
                }
            }

            if (startDir == 1) //上一个
            {
                if (curItemIsSelf)
                {
                    if (curItemIndex == 0) //头一个只做位
                    {
                        OffsetBar(rollPercent * -45);
                    }
                    else
                    {
                        Fade(1 - rollPercent); //向前一个查看，如果不是头一个，那么只需做 透明处理
                    }

                }
                else  //如果不是自己，位移 和透明都需要处理
                {
                    Fade(rollPercent);
                    OffsetBar((1 - rollPercent) * 45);
                }
            }

        }

        if (!isClikcDown)
        {
            if (value < 0)
            {
                startDir = -1;
                isClikcDown = true;
            }

            if (value > 0)
            {
                startDir = 1;
                if (curItemIsSelf)
                {
                    DisplayTower(false);
                }
                isClikcDown = true;
            }
        }

    }

    public IEnumerator AutoRollItem()
    {
        bool isEnd = false;
        while (!isClikcDown && !isEnd)
        {
            if (startDir == -1) //这里的rollpercent 为 负数
            {

                if (curItemIsSelf)
                {
                    if (transform.GetSiblingIndex() == 0) //向后查看，到头了 ，
                    {
                        rollPercent += Time.deltaTime * 5f;
                        rollPercent = Mathf.Clamp(rollPercent, -1, 0);
                        OffsetBar(-rollPercent * 45);
                        if (rollPercent.Equals(0))
                        {
                            isEnd = true;
                        }
                        continue;
                    }
                }


                if (Mathf.Abs(rollPercent) > 0.3f) //向后查看，大于30% ，进入下一个 ，
                {
                    rollPercent -= Time.deltaTime;
                    rollPercent = Mathf.Clamp(rollPercent, -1, 0);
                    if (curItemIsSelf)
                    {
                        Fade(1 + rollPercent);
                        OffsetBar((-rollPercent) * 45f);
                    }
                    else
                    {
                        Fade(-rollPercent);
                    }

                    if (rollPercent.Equals(-1))
                    {
                        isChangeItem = 1;
                        isEnd = true;
                    }
                }
                else //回退
                {
                    rollPercent += Time.deltaTime;
                    rollPercent = Mathf.Clamp(rollPercent, -1, 0);
                    if (curItemIsSelf)
                    {
                        Fade(1 - rollPercent);
                        OffsetBar(-rollPercent * 45);

                    }
                    else
                    {
                        Fade(-rollPercent);
                    }

                    if (rollPercent.Equals(0))
                    {
                        isEnd = true;
                    }
                }

            }
            else if (startDir == 1) //这里的rollpercent 为 正数数
            {
                if (curItemIsSelf)
                {
                    if (curItemIndex == 0) //向前查看，到头了
                    {
                        rollPercent -= Time.deltaTime * 5f;
                        rollPercent = Mathf.Clamp(rollPercent, 0, 1);
                        OffsetBar(rollPercent * -45);
                        if (rollPercent.Equals(0))
                        {
                            isEnd = true;
                        }
                        continue;
                    }
                }

                if (Mathf.Abs(rollPercent) > 0.3f) // 大于30% 会进入到前一个
                {
                    rollPercent += Time.deltaTime;
                    rollPercent = Mathf.Clamp(rollPercent, 0, 1);
                    if (curItemIsSelf)
                    {

                        if (!isTrigged)
                        {
                            CloseBoard(0);
                            isTrigged = true;
                        }

                        Fade(1 - rollPercent);


                    }
                    else
                    {

                        Fade(rollPercent);
                        OffsetBar((1 - rollPercent) * 45f);
                    }

                    if (rollPercent.Equals(1))
                    {
                        isEnd = true;
                        isChangeItem = -1;
                    }

                }
                else //小于30% 会回退
                {

                    rollPercent -= Time.deltaTime;
                    rollPercent = Mathf.Clamp(rollPercent, 0, 1);
                    if (curItemIsSelf)
                    {
                        Fade(1 - rollPercent);
                    }
                    else
                    {
                        Fade(rollPercent);
                        OffsetBar((1 - rollPercent) * 45);
                    }
                    if (rollPercent.Equals(0))
                    {
                        isEnd = true;
                    }
                }

            }

            yield return null;
        }

        if (isChangeItem == 1)
        {
            CloseBoard(0);
            if (FinishDragItem != null)
            {
                FinishDragItem(1, curItemIndex);
            }

            //Debug.Log("curItemIndex" + curItemIndex); 
        }
        else if (isChangeItem == -1)
        {
            if (FinishDragItem != null)
            {
                FinishDragItem(-1, curItemIndex);
            }

            // Debug.Log("curItemIndex" + curItemIndex);
        }
        /*if(curItemIndex == 0)
        {
            FinishDragItem(1,0);
        }*/

        rollPercent = 0;
        startDir = 0;
        rollValue = 0;
        isChangeItem = 0;
        isTrigged = false;
    }


    #endregion

}
