using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillBar : UIBasic {

    public TweenAlpha sparkLight;
    public override void InitValue()
    {
        base.InitValue();
        skillBoard.SetActive(false);
        playerCurrentSkillIndex = 0;
        currentLoadTime = 0;
        currentCDTime = 0;
    }
    
    public UICenterOnChild uICenterOnChild;
    public UIGrid uiGrid;
    public GameObject skillBoard;
    public FightMenuForSkillIterm playerSkillItem;
    //----PlaySkillAttribute
    private List<FightMenuForSkillIterm> skilList = new List<FightMenuForSkillIterm>();
    private int playerCurrentSkillIndex;
    private float currentLoadTime;
    private float currentCDTime;

    public UISlider playerBlood;
    public UISlider playerEnergy;
    public GameObject skillErrorTips;
    public UILabel skillErrorContent;

    public bool isHiden = false;


    public void Hiden()
    {
        isHiden = true;
    }

    public void Display()
    {
        isHiden = false;
    }

    public void ResetValue(List<PlayerSkillAttribute> _playerList)
    {
        isHiden = true;
        InitValue();
        foreach (var go in skilList)
        {
            Destroy(go.gameObject);
        }
        skilList.Clear();

        BuildPlayerSkillList(_playerList);

        isHiden = false;
    }

    public void BuildPlayerSkillList(List<PlayerSkillAttribute> _playerList)
    {
        foreach (var go in _playerList)
        {
            var item = playerSkillItem.Clone();
            var t = item.GetComponent<FightMenuForSkillIterm>();
            t.SetValue(go.skillID);
            skilList.Add(t);
            item.transform.SetParent(uiGrid.transform);
            item.ResetTran();
        }
        uiGrid.Reposition();
       
        skillBoard.SetActive(true);
    }
    public void UpdatePlayerCurrentSkillIndex(int currentSkillIndex, float cdLoadTime, float cdTime)
    {
        playerCurrentSkillIndex = currentSkillIndex;

        currentLoadTime = cdLoadTime;
        
        currentCDTime = cdTime;
        
        if (skilList == null || skilList.Count == 0) return;

        sparkLight.PlayForward();
        
        CenterOnTartet();
        
    }
    public void UpdateLoadSkillTime(float time, bool useSuccess, string errorType)
    {
        if (useSuccess)
        {
            
            currentLoadTime = time;
        }
        else
        {
            DisplaySkillErrorTips(true, errorType);
        }
    }
    public void DisplaySkillErrorTips(bool isDisplay, string errorContent = "")
    {
        if (isDisplay == skillErrorTips.activeSelf) return;
        skillErrorTips.SetActive(isDisplay);
        skillErrorContent.text = errorContent;
        if (isDisplay)
        {
            AndaAudioManager.Instance.PlayUISounds("skillError");
            StartCoroutine(WaitForDisable());
        }
    }
    private IEnumerator WaitForDisable()
    {
        yield return new WaitForSeconds(0.5f);
        DisplaySkillErrorTips(false);
    }

    private void CucalSkillCDTimer()
    {
        if (skilList == null || skilList.Count == 0) return;
        if (skilList[playerCurrentSkillIndex] != null)
        {

            float lessTime = (currentCDTime - (Time.time - currentLoadTime)).FloatToFloat();
            float per = (lessTime / currentCDTime).FloatToFloat();
            if (lessTime > 0)
            {
                skilList[playerCurrentSkillIndex].OpenCDMask(true);
                skilList[playerCurrentSkillIndex].UpdateCDValue(lessTime, per);
            }
            else
            {
                skilList[playerCurrentSkillIndex].OpenCDMask(false);
                if (skilList[playerCurrentSkillIndex].cdMask.gameObject.activeSelf)
                {
                    
                   // sparkLight.PlayForward();
                }
            }
        }
    }
    public void OutLight()
    {
        if (sparkLight.value == 0) return;
        sparkLight.PlayReverse();
    }

    private void CenterOnTartet()
    {
        uICenterOnChild.CenterOn(skilList[playerCurrentSkillIndex].transform);
    }

    private void Update()
    {
        if (isHiden) return;
        CucalSkillCDTimer();
    }
}
