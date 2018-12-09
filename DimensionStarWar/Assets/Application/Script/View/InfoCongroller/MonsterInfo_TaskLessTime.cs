using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterInfo_TaskLessTime : UIFollowWithTarget {
    private InfoBar_Slider_Label_Icon currentTaskBar;
    public override void InitValue()
    {
        base.InitValue();

    }

    public void SetValue()
    {

    }
    private void SetValue(PlayerMonsterAttribute pma ,Transform followTarget)
    {
        switch (pma.currentStateType)
        {
            case (int)OTYPE.MonsterStateType.clean:
                
                break;
        }
    }



    private void SetCleanInformation(PlayerMonsterAttribute pma)
    {
        BuildTaskInfoBar();
        //currentTaskBar.UpdateValue();
    }


    private void ExcuteUpdateTime()
    {

    }
    private void BuildTaskInfoBar ()
    {
        if (currentTaskBar == null)
        {
            currentTaskBar = AndaUIManager.Instance.PopingMenu<InfoBar_Slider_Label_Icon>(ONAME.InfoBar_Slider_Label_Icon);
            currentTaskBar.transform.SetParent(point[0]);
            currentTaskBar.ResetTran();
        }
    }
}
