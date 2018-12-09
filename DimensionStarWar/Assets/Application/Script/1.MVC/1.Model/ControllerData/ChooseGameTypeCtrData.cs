using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChooseGameTypeCtrData : ControllerData {

    public ChooseGameTypeMenu chooseGameTypeMenu;

    private ChooseGameTypeController chooseGameTypeController;

    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        chooseGameTypeController = baseController as ChooseGameTypeController;
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        chooseGameTypeMenu = m_Menu as ChooseGameTypeMenu;
    }
}
