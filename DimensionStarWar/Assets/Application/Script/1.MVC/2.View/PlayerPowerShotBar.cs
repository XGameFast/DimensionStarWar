using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class PlayerPowerShotBar :  UIBasic2 {

    int catchRate ;
    private bool wasHit =false;
    private System.Action<bool>CallBackResult;
    private AndaObjectBasic itemObj;
    public override void OnDispawn()
    {
        wasHit = false;
        base.OnDispawn();
    }

    public void SetInfo(int _catchRate , System.Action<bool> callbackResult,AndaObjectBasic item)
    {
        itemObj = item;
        CallBackResult = callbackResult;
        catchRate = _catchRate;
        ComfirmClick();
    }

    /// <summary>
    /// 同意点击
    /// </summary>
    public void ComfirmClick()
    {
        baseGroup.interactable = true;
        FadeIn();
    }
    /// <summary>
    /// 不能点击
    /// </summary>
    public void Unclick()
    {
        baseGroup.interactable =false;
        FadeOut();
    }

    public void ClickShot()
    {
        AndaGameExtension.UIImpactFeedbackStyleHeavy();
        PlayerSkill_PowerLink playerSkill_PowerLink = AndaDataManager.Instance.InstantiateOtherObj<PlayerSkill_PowerLink>("PlayerSkillPowerLink");
        playerSkill_PowerLink.SetInto(ARMonsterSceneDataManager.Instance.aRWorld.transform);
        playerSkill_PowerLink.transform.position = ARMonsterSceneDataManager.Instance.mainCamera.transform.position;
        Vector3 hitPoint = ARMonsterSceneDataManager.Instance.FightRayHit();
        if (hitPoint == Vector3.zero)
        {
            hitPoint = ARMonsterSceneDataManager.Instance.mainCamera.transform.position + ARMonsterSceneDataManager.Instance.mainCamera.transform.forward * 3 * ARMonsterSceneDataManager.Instance.getARWorldScale;
        }
        playerSkill_PowerLink.ShotPowerLink(hitPoint, catchRate, WasCatched , WasHit);
        Unclick();
        Invoke("InvockCheckIsHit" ,2f);
    }

    private void WasHit()
    {
        wasHit = true;
        if(itemObj==null || !itemObj.isActive)return;
        //跟控制器说一下，让控制器使角色晕眩
        int idType = AndaDataManager.Instance.GetObjectGroupID((int.Parse(itemObj.objectID)));
        switch(idType)
        {
            case 1000:
                itemObj.GetComponent<MonsterBasic>().ControllerToPlayMoodForYunxuan();
                break;
        }
    }

    private void InvockCheckIsHit()
    {
        if (itemObj == null || !itemObj.isActive) return;
        if (wasHit)return;//如果成功命中敌方，这里就不在进行了。等捕捉结果
        ComfirmClick();
        int idType = AndaDataManager.Instance.GetObjectGroupID((int.Parse(itemObj.objectID)));
        switch (idType)
        {
            case 1000:
                itemObj.GetComponent<MonsterBasic>().ControllerToPlayMoodIdle();
                break;
        }
    }

    private void WasCatched(bool isCatchSuccess)
    {
        if (itemObj == null || !itemObj.isActive) return;
        int idType = AndaDataManager.Instance.GetObjectGroupID((int.Parse(itemObj.objectID)));
        if (isCatchSuccess)
        {
         
            switch (idType)
            {
                case 1000:
                    itemObj.GetComponent<MonsterBasic>().ControllerToPlayMoodForSayHello00();
                    break;
            }

            Invoke("InvockCallBackCatchSuccess" ,3f);
        }
        else
        {
            switch (idType)
            {
                case 1000:
                    itemObj.GetComponent<MonsterBasic>().ControllerToPlayMoodBreakon();
                    break;
            }

            Invoke("InvockCallBackCatchFaild", 3f);
        }

    }

    private void InvockCallBackCatchFaild()
    {
      
        if (AndaDataManager.Instance.PlayerIsFishBird())
        {
            ComfirmClick();
        }
        else
        {
            int runRate = Random.Range(0, 100);
            if (runRate > 60)
            {
               
                ComfirmClick();
            }
            else
            {
               // JIRVIS.Instance.PlayTips("精神链接建立失败，再试一次八");
                //ComfirmClick();
                //40%概率逃跑
                CallBackResult(false);
            }
        }
    }

    private void InvockCallBackCatchSuccess()
    {
        CallBackResult(true);
    }

}
