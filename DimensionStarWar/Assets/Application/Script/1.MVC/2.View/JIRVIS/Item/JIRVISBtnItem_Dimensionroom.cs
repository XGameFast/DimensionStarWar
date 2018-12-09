using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVISBtnItem_Dimensionroom : JIRVISButtonItemBase {

    public Text dimensionroom_nickname;
    public Image dimensionroom_levelboard;
    public Image dimensionroom_por;
    private System.Action<int> ClickCallBack;

    private PlayerStrongholdAttribute psa;

    private MonsterPorItem monsterPor;
   [SerializeField]
    public void BuildItem(PlayerStrongholdAttribute _psa,System.Action<int> click_callback)
    {
        psa = _psa;
        ClickCallBack = click_callback;
      

        PlayerStrongholdConfigAttribute strongholdBaseAttribution = MonsterGameData.GetStrongBasedAttribute();
      
        int limit = strongholdBaseAttribution.playerStrongholdGrowUpExp[_psa.strongholdLevel];//(_psa.strongholdLevel);//(pma.monsterMaxPower , monsterBaseConfig);
       
        float per  = (float)_psa.strongholdGloryValue / limit;
      
        monsterPor = AndaDataManager.Instance.InstantiateMenu<MonsterPorItem>("ShporMonsterPorItem");

       

        monsterPor.transform.SetUIInto(transform);
       
        Color color = AndaGameExtension.GetLevelColor(_psa.strongholdLevel);

        monsterPor.SetStrongholdInfo(_psa.medalLevel, _psa.statueID , per, color);

        monsterPor.boardButton.onClick.AddListener(ClickItem);
        //monsterPor.SetExpSlider(per,color);

        //monsterNickName.text = pma.monsterNickName;
        // monsterNickName.transform.SetAsLastSibling();
        SetNickName();

    }

    private void SetNickName()
    {
        dimensionroom_nickname.transform.SetAsLastSibling();
        dimensionroom_nickname.text = psa.strongholdNickName;
    }

    private void SetLevelBoard()
    {
        dimensionroom_levelboard.sprite = AndaDataManager.Instance.GetStrongholdLevelBoardSprite(psa.strongholdLevel+1);
    }

    private void SetPor()
    {
        //Debug.Log("porID" + psa.strongholdID);
        dimensionroom_por.sprite = AndaDataManager.Instance.GetStrongholdPorSprite(psa.strongholdID.ToString());
    }


    public override void ClickItem()
    {
        base.ClickItem();
        ClickCallBack(psa.strongholdIndex);
    }
}
