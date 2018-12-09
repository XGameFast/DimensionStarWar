using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class JIRVISContent_ItemInformation : UIBasic2 {
    
    public Transform monsterNamePoint;
    public Text consumableItemNamePoint;
    public Transform consuambleItemPoint;
    public Transform monsterPoint;
    public Text itemDescription;
    public GameObject closeBtn;
    public GameObject playActivityBtn;


    private MonsterBasic curMonster;
    private GameObject monsterNameObj;

    private JIRVISEditonConsumableItemInformationBar cusmableItemBoard;


    public override void OnDispawn()
    {
       
        ClearData();
        if (JIRVISListenerEvent.SpecialEvent_CloseConsumableInfoBar != null)
        {
            JIRVISListenerEvent.SpecialEvent_CloseConsumableInfoBar();
        }
        base.OnDispawn();
    }


    public void SetInfo(int id)
    {
        //现获取组的ID
        int idtype = AndaDataManager.Instance.GetObjectGroupID(id);
        switch(idtype)
        {
            case 1000:
                BuildMonsterInformation(id);
                break;
            case 40000:
                BuildConsumableInformation(id);
                break;
        }
    }


    private void ClearData()
    {
        if(curMonster!=null)
        {
            curMonster.gameObject.RemoveComponemont<MonsterItemTouchEvent>();
            AndaDataManager.Instance.RecieveItem(curMonster);
        }
        if(monsterNameObj!=null)Destroy(monsterNameObj);
        if(cusmableItemBoard)AndaDataManager.Instance.RecieveItem(cusmableItemBoard);
        itemDescription.text ="";
        closeBtn.gameObject.SetTargetActiveOnce(false);
        playActivityBtn.gameObject.SetTargetActiveOnce(false);
    }

    private void BuildMonsterInformation(int id)
    {
        if(curMonster!=null)AndaDataManager.Instance.RecieveItem(curMonster);
        curMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(id.ToString());
        curMonster.SetInto(monsterPoint);
        if(monsterNameObj!=null)Destroy(monsterNameObj);
        monsterNameObj = AndaDataManager.Instance.GetSpritePerfab("baseName" + id);
        monsterNameObj = monsterNameObj.Clone();
        monsterNameObj.transform.SetUIInto(monsterNamePoint);
        itemDescription.text = MonsterGameData.GetMonsterBaseConfig(id).monsterDescription;
        curMonster.gameObject.SetLayer(ONAME.LayerUI);
        closeBtn.gameObject.SetTargetActiveOnce(true);
        playActivityBtn.gameObject.SetTargetActiveOnce(true);

        if(curMonster.GetComponent<MonsterItemTouchEvent>()==null)
        {
            curMonster.gameObject.AddComponent<MonsterItemTouchEvent>();
        }
        //-------
    }

    private void BuildConsumableInformation(int itemID)
    {
        if(cusmableItemBoard!=null)AndaDataManager.Instance.RecieveItem(cusmableItemBoard);
        cusmableItemBoard = AndaDataManager.Instance.InstantiateMenu<JIRVISEditonConsumableItemInformationBar>("ConsumableBoardCircleBoard");//圆底的
        itemDescription.text = MonsterGameData.GetConsumableObjectDescription(itemID);
        cusmableItemBoard.SetNameAndCount(MonsterGameData.GetConsuambleObjectName(itemID), itemID.ToString(),0);
        cusmableItemBoard.transform.SetUIInto(consuambleItemPoint);
        closeBtn.gameObject.SetTargetActiveOnce(true);
    }

    public void ClickActivityBtn()
    {
        if(curMonster!=null)
        {
            curMonster.ControllerToPlayMoodForHudong00();
        }
    }

    public void ClickCloseItem()
    {
        JIRVIS.Instance.CloseEditorBarForItemInformation();
    }

    public void Update()
    {
        if(curMonster!=null)
        {
            curMonster.GetComponent<MonsterItemTouchEvent>().OnUpdate();
        }
    }

}
