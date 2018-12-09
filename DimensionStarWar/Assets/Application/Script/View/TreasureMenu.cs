using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreasureMenu : UIBasic {

    public UILabel tipsContent;
    public TweenScale ts;
    public SkillBar skillbar;
    public MonsterInfomationBar monsterInformaionBar;

    public override void InitMenu()
    {
        base.InitMenu();
        monsterInformaionBar.InitValue();
    }
    public void DisplayContent()
    {
        
    }
    public void SetTipsContent(string content)
    {
        tipsContent.text = content;
    }
    private bool isOpenTips = false;
    private float tipsWaitTime;
    private void OpenTips()
    {
        tipsWaitTime = Time.time;
        if (isOpenTips) return;
        isOpenTips = true;
        ts.PlayForward();
        StartCoroutine(WaitForCloseTipsBar());

    }
    private IEnumerator WaitForCloseTipsBar()
    {
        while (Time.time - tipsWaitTime < 4)
        {
            yield return null;
        }

        ts.PlayReverse();
        isOpenTips = false;
    }

  
    #region Click

    public void ClickOpenTips()
    {
        OpenTips();
    }
    #endregion


    public override void OnUpdate()
    {
        base.OnUpdate();
        if (skillbar != null)
        {
            skillbar.OnUpdate();
        }
        if (monsterInformaionBar != null)
        {
            monsterInformaionBar.OnUpdate();
        }
    }
}
