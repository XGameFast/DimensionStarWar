using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.UI;
public class DimensionMonsterInfoHologarmScreen : AndaObjectBasic {


    public List<UITool_FadeIn> uilist;
    public Transform monsterPoint;
    public Text monsterNickNameText;
    public Text monsterTypeText;
    public Slider monsterExpSlider;
    public Slider monsterStrengthSlider;

    private int loadIndex;
    private bool isDisplay = false;
    private AndaObjectBasic monsterObj;

    private bool isFinishLoadInformationbar = false;
    private bool isLoadingInformation = false;
    private PlayerMonsterAttribute currentMonsterAtrribute;
    private System.Action FinishFadeCallBack;

    public void PlayFadeIn(System.Action _callback)
    {
        if (isDisplay) return;
        FinishFadeCallBack = _callback;
        isDisplay = true;
        loadIndex = 0;
        ExcuteFadeIn();
    }

    public void PlayFadeOut(System.Action _callback)
    {
        //-----Sype  //
        if (!isDisplay) return;
        FinishFadeCallBack = _callback;
        isDisplay = false;
        loadIndex = uilist.Count-1;
        ExcuteFadeOut();
    }


    private void ExcuteFadeIn()
    {
        if (loadIndex >= uilist.Count)
        {
            // 界面弹出完毕

            //第一次界面加载完的时候，需要把怪兽数据加载出
            if (!isFinishLoadInformationbar)
            {
                isFinishLoadInformationbar = true;

                //回调告诉控制器已经
                if(FinishFadeCallBack!=null)FinishFadeCallBack();
                 //面板已经加载了
                //DisplayMonsterInformation(currentMonsterAtrribute);
            }

            return;
        }
        uilist[loadIndex].PlayFadeIn(true,ExcuteFadeIn);
        loadIndex += 1;

    }

    private void ExcuteFadeOut()
    {
        monsterPoint.gameObject.SetActive(false);
        monsterNickNameText.gameObject.SetActive(false);
        monsterTypeText.gameObject.SetActive(false);
        monsterExpSlider.gameObject.SetActive(false);
        monsterStrengthSlider.gameObject.SetActive(false);
        if (loadIndex < 0)
        { 
            if(FinishFadeCallBack!=null)FinishFadeCallBack();
            return;
        }
        uilist[loadIndex].PlayFadeIn(false, ExcuteFadeOut);
        loadIndex -= 1;
        if(isFinishLoadInformationbar )
        {
            isFinishLoadInformationbar = false;
        }
    }


    public void DisplayMonsterInformation(PlayerMonsterAttribute pma)
    {
        currentMonsterAtrribute = pma;
        //如果面吧还没加完。是不会去加载怪兽的数据的。
        if(isFinishLoadInformationbar && !isLoadingInformation)
        {
            isLoadingInformation = true;
            StartCoroutine(ExcuteDisplayMonsterInfo(currentMonsterAtrribute));
        }
    }

    private IEnumerator ExcuteDisplayMonsterInfo(PlayerMonsterAttribute pma)
    {
        ClearInformation();
        DisplayMonster(pma);
        yield return StartCoroutine(DisplayMonsterName(pma.monsterNickName));
        yield return StartCoroutine(DisplayMonsterTypeName(pma.monsterName));
        yield return StartCoroutine(DisplayMonsterExp(pma));
        yield return StartCoroutine(DisplayMonsterStrengthValue(pma));
        isLoadingInformation = false;
    }

    private void DisplayMonster(PlayerMonsterAttribute pma)
    {
        monsterObj = AndaDataManager.Instance.InstantiateMonster(pma.monsterID.ToString());
        monsterObj.SetInto(monsterPoint);
        monsterObj.SkinHologarm();
        monsterPoint.gameObject.SetActive(true);
    }

    private IEnumerator DisplayMonsterName(string _monsterNickName)
    {
        int count = _monsterNickName.Length;
        monsterNickNameText.gameObject.SetActive(true);
        for (int i = 0; i < count; i++)
        {
            monsterNickNameText.text += _monsterNickName[i];
            yield return new WaitForSeconds(0.5f);
        }
    }

    private IEnumerator DisplayMonsterTypeName(string _monsterTypeName)
    {
        int count = _monsterTypeName.Length;
        monsterTypeText.gameObject.SetActive(true);

        for (int i = 0; i < count; i++)
        {
            monsterTypeText.text += _monsterTypeName[i].ToString();
            yield return new WaitForSeconds(0.1f);
        }
    }

    private IEnumerator DisplayMonsterExp(PlayerMonsterAttribute pma)
    {
        /*monsterExpSlider.gameObject.SetActive(true);
        int currentExpValue = pma.monsterCurEXP;
        int maxExp = pma.monsterMaxExp;
        float per = currentExpValue / (float)maxExp;
        float currentPer = 0; 
        while(currentPer < per)
        {
            currentPer += Time.deltaTime;
            monsterExpSlider.value = currentPer;
            yield return null;
        }
        currentPer = per;
        monsterExpSlider.value = currentPer;*/
        yield return null;
    }
    private IEnumerator DisplayMonsterStrengthValue(PlayerMonsterAttribute pma)
    {
        /*monsterStrengthSlider.gameObject.SetActive(true);

        int currentStg = pma.monsterCurrentStrength;
        int maxStg = pma.monsterStrength;
        float per = currentStg/(float)maxStg;
        float curPer = 0;
        while(curPer<per)
        {
            curPer += Time.deltaTime;
            monsterStrengthSlider.value = curPer;
            yield return null;
        }
        curPer = per;
        monsterStrengthSlider.value = curPer;*/
        yield return null;
    }

    private void ClearInformation()
    {
        monsterObj.DestroyByAndaDataManager();
        monsterNickNameText.text = "";
        monsterTypeText.text = "";
        monsterExpSlider.value = 0;
        monsterStrengthSlider.value = 0;
    }
}
