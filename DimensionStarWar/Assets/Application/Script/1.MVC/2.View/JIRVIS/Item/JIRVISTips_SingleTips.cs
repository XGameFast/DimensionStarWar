using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISTips_SingleTips : AndaObjectBasic {

    public Text tipsText;

    public override void OnDispawn()
    {
        tipsText.text = "";
        tipsText.gameObject.SetTargetActiveOnce(false);
        base.OnDispawn();
    }

    public void SetInfo(string tisp , float duration)
    {
        tipsText.gameObject.SetTargetActiveOnce(false);
        tipsText.text = tisp;
        Invoke("InvokeSetTips", 0.25f);
        ResetDestory(duration);
    }

    private void InvokeSetTips()
    {
        tipsText.gameObject.SetTargetActiveOnce(true);
    }
}
