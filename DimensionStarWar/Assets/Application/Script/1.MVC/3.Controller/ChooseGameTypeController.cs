using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChooseGameTypeController : BaseController {

    public ChooseGameTypeCtrData chooseGameTypeCtrData;
    public override void StartController()
    {
        base.StartController();
        BuildData();
        chooseGameTypeCtrData.BuildMenu(ONAME.ChooseGameTypeMenu);
        chooseGameTypeCtrData.chooseGameTypeMenu.FadeIn();
    }
    public override void EndController()
    {
        base.EndController();
        //chooseGameTypeCtrData.getm_Menu.OnDispawn();
        AndaDataManager.Instance.DestoryObj(chooseGameTypeCtrData.getm_Menu);
    }

    public void BuildData()
    {
        if(chooseGameTypeCtrData == null)
        {
            chooseGameTypeCtrData = new ChooseGameTypeCtrData();
            chooseGameTypeCtrData.BuildData(this);
        }
    }

    public void ChooseType(string typeKey)
    {
        switch(typeKey)
        {
            case "AR":
                JIRVIS.Instance.ChooseGameDisplayType(OTYPE.GameDisplayType.AR);
                break;
            case "VV":
                JIRVIS.Instance.ChooseGameDisplayType(OTYPE.GameDisplayType.VV);
                break;
        }
       
        callbackFinishController(ONAME.BUILDDIMENSIONROOMCONTROLLER);
    }
}
