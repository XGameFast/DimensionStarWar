using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MonsterIcon_levelboard_Item : JIRVISButtonItemBase {

    public Image icon;
    public Image board;
    public Text monsterNickName;
    private System.Action<PlayerMonsterAttribute> CallBackClickItem;
    private PlayerMonsterAttribute pma;
    private MonsterPorItem monsterPor;
    public override void OnDispawn()
    {
        if(monsterPor!=null)
        {
            monsterPor.GetComponentInChildren<Button>().onClick.RemoveListener(ClickItem);
            AndaDataManager.Instance.RecieveItem(monsterPor);

        }

        base.OnDispawn();
    }

    public void BuildItem(PlayerMonsterAttribute _pma,System.Action<PlayerMonsterAttribute> click_callback)
    {
        pma = _pma;
        CallBackClickItem = click_callback;

        MonsterBaseConfig monsterBaseConfig = MonsterGameData.GetMonsterBaseConfig(pma.monsterID);
        int getLevel= AndaDataManager.Instance.GetMonsterLevelValue(pma.monsterMaxPower,monsterBaseConfig);
                                            
        int limit = AndaDataManager.Instance.GetMonsterExpLimit(pma.monsterMaxPower , monsterBaseConfig);

       // Debug.Log("limit" + limit) ;
        float per  = (float)pma.monsterMaxPower / limit;
      //  Debug.Log("per" + per) ;
        monsterPor = AndaDataManager.Instance.InstantiateMenu<MonsterPorItem>("ShporMonsterPorItem");
        monsterPor.gameObject.SetTargetActiveOnce(false);


        monsterPor.transform.SetUIInto(transform);
       
        Debug.Log("getLevel" + getLevel);
        Color color = AndaGameExtension.GetLevelColor(getLevel);
        monsterPor.SetMonsterInfo(_pma.monsterLevel, _pma.monsterID, per, color);
        monsterPor.boardButton.onClick.AddListener(ClickItem);
        monsterNickName.text = pma.monsterNickName;
        monsterNickName.transform.SetAsLastSibling();
    }

    public override void SetFadeInEffect(int type)
    {
        base.SetFadeInEffect(type);
        Invoke("InvokeOpenItem" ,0.2f);

    }
    private void InvokeOpenItem()
    {
        monsterPor.gameObject.SetTargetActiveOnce(true);
    }

    public override void ClickItem()
    {
        CallBackClickItem(pma);
    }
}
