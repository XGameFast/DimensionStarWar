using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChooseGameTypeMenu : UIBasic2 {

    private ChooseGameTypeController chooseGameTypeController;

    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
        chooseGameTypeController =  baseController as ChooseGameTypeController;
    }

    public void OnClickItem(string name)
    {
        chooseGameTypeController.ChooseType(name);
    }

}
