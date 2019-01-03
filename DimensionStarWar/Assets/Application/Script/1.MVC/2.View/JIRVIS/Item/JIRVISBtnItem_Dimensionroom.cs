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
    private BusinessStrongholdAttribute bsa;
    private Exchange exc;


    private MonsterPorItem monsterPor;
    public override void OnDispawn()
    {
        psa = null;
        bsa = null;
        exc = null;
        if(monsterPor!=null)
        {
            monsterPor.boardButton.onClick.RemoveAllListeners();
            AndaDataManager.Instance.RecieveItem(monsterPor);
            monsterPor = null;
        }
        base.OnDispawn();
    }


    public void BuildItem(PlayerStrongholdAttribute _psa,System.Action<int> click_callback)
    {
        psa = _psa;
        ClickCallBack = click_callback;
      

        PlayerStrongholdConfigAttribute strongholdBaseAttribution = MonsterGameData.GetStrongBasedAttribute();
      
        int limit = strongholdBaseAttribution.playerStrongholdGrowUpExp[_psa.strongholdLevel];//(_psa.strongholdLevel);//(pma.monsterMaxPower , monsterBaseConfig);
       
        float per  = (float)_psa.strongholdGloryValue / limit;
      
        monsterPor = AndaDataManager.Instance.InstantiateMenu<MonsterPorItem>("ShporMonsterPorItem");

        monsterPor.SetTargetActiveOnce(false);

        monsterPor.transform.SetUIInto(transform);
       
        Color color = AndaGameExtension.GetLevelColor(_psa.strongholdLevel);

        monsterPor.SetStrongholdInfo(_psa.medalLevel, _psa.statueID , per, color);

        monsterPor.boardButton.onClick.AddListener(ClickItem);
        //monsterPor.SetExpSlider(per,color);

        //monsterNickName.text = pma.monsterNickName;
        // monsterNickName.transform.SetAsLastSibling();
        SetNickName();

    }


    public void BuildItem(BusinessStrongholdAttribute _bsa ,ItemScrollStruct itemScrollStruct ,System.Action<int> click_callback)
    {
        bsa = _bsa;
        ClickCallBack = click_callback;

        monsterPor = AndaDataManager.Instance.InstantiateMenu<MonsterPorItem>("ShporMonsterPorItem");
        monsterPor.SetTargetActiveOnce(false);

        monsterPor.transform.SetUIInto(transform);

        monsterPor.SetBussinessStrongholdInfo(_bsa.strongholdIndex ,_bsa.strongholdLevel, _bsa.headImage, itemScrollStruct);

        monsterPor.boardButton.onClick.AddListener(ClickItem);
       
        SetNickName();
    }
    public void BuildItem(Exchange _exc  , ItemScrollStruct itemScrollStruct ,System.Action<int> click_callback)
    {
        exc = _exc;
        ClickCallBack = click_callback;
        monsterPor = AndaDataManager.Instance.InstantiateMenu<MonsterPorItem>("ShporMonsterPorItem");
        monsterPor.transform.SetUIInto(transform);

        monsterPor.SetExchangeInfo(_exc.userIndex, _exc.exchangeIndex, _exc.headImg, itemScrollStruct);

        monsterPor.boardButton.onClick.AddListener(ClickItem);

        SetNickName();
    }

    private void SetNickName()
    {
        dimensionroom_nickname.transform.SetAsLastSibling();
        if(psa!=null)
        {
            dimensionroom_nickname.text = psa.strongholdNickName;
        }

        if(bsa!=null)
        {
            dimensionroom_nickname.text = bsa.strongholdNickName;
        }

        if(exc!=null)
        {
            dimensionroom_nickname.text = exc.ExchangeName;//;.strongholdNickName;
        }
       
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
        if(psa!=null)
        {
            ClickCallBack(psa.strongholdIndex);
        }
        if(bsa!=null)
        {
            ClickCallBack(bsa.strongholdIndex);
        }

        if(exc!=null)
        {
            ClickCallBack(exc.exchangeIndex);
        }

    }

    public override void SetFadeInEffect(int type)
    {
        base.SetFadeInEffect(type);
        Invoke("InvokeOpenItem" , 0.2f);
    }

    private void InvokeOpenItem()
    {
        monsterPor.SetTargetActiveOnce(true);
    }

     
}

public class ItemScrollStruct
{
    public Vector3 center{get;set;}
    public float distance {get;set;}
}
