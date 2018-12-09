using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBarForPrivateStronghold : AndaObjectBasic {

    public UI2DSprite boardLevel;
    public UI2DSprite boardIcon;
    public UILabel privateStrongholdName;
    public UILabel privateStrongLevelName;
    public UIGrid medalgRID;
    //可以复用的 item，
    private List<MedalPortaitItem> medalList;
    public override void InitValue()
    {
        base.InitValue();
    }

    public void SetValue(StrongholdBaseAttribution _playerStrongholdAttribute)
    {
        PlayerStrongholdAttribute playerStrongholdAttribute = _playerStrongholdAttribute as PlayerStrongholdAttribute;

        privateStrongholdName.text = playerStrongholdAttribute.strongholdNickName;
        string medalLevelBoardName = "MedalLevelBoard" + playerStrongholdAttribute.strongholdLevel;

        boardLevel.sprite2D = AndaDataManager.Instance.GetMedalLevelBoardSprite(medalLevelBoardName);
        privateStrongLevelName.text = playerStrongholdAttribute.strongholdLevelName;
    }
}
