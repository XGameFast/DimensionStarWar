using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEngine.UI;
public class JIRVISContent_EditorMonsterInformation : UIBasic2 {

    public InputField monsterNameInputField;
    public Transform monsterPoint;
    public Transform monsterNamePoint;
    public Transform grid;
    public GameObject selectItemBoard;
    private PlayerMonsterAttribute playerMonsterAttribute;
    private MonsterBasic curMonster;
    private GameObject curMonsterNameObj;
    private List<StrongholdPorItem> strongholdPorItems;
    private int selectStrongholdIndex;
    private string inputMonsterName;
    private string tipsContent;
    private bool isChangeInfo = false;

    private System.Action callbackGiveUpEditorMonsterInfo;
    private System.Action callbackFinishUploadMonsterInfo;


    
    public override void OnDispawn()
    {
        ClearData();
        if(JIRVISListenerEvent.SpecialEvent_CloseMonsterEditorInfoBar!=null)
        {
            JIRVISListenerEvent.SpecialEvent_CloseMonsterEditorInfoBar();
        }
        base.OnDispawn();
    }

    private void ClearData()
    {
        if(playerMonsterAttribute!=null)playerMonsterAttribute = null;
        if(curMonster!=null)
        {
            curMonster.gameObject.RemoveComponemont<MonsterItemTouchEvent>();
            AndaDataManager.Instance.RecieveItem(curMonster);
        }
       
        if(curMonsterNameObj!=null)Destroy(curMonsterNameObj);
        if(strongholdPorItems!=null)
        {
            int count = strongholdPorItems.Count;
            for(int i = 0 ;i < count; i++)
            {
                AndaDataManager.Instance.RecieveItem(strongholdPorItems[i]);

            }
            strongholdPorItems.Clear();
        }
        selectItemBoard.SetInto(transform);
        selectItemBoard.gameObject.SetTargetActiveOnce(false);
        isChangeInfo = false;
    }

    public void SetInfo(PlayerMonsterAttribute _playerMonsterAttribute ,int _strongholdIndex , System.Action callbackSure, System.Action callbackCancel)
    {
        callbackFinishUploadMonsterInfo = callbackSure;
        callbackGiveUpEditorMonsterInfo = callbackCancel;
        playerMonsterAttribute = _playerMonsterAttribute;
        BuildMonster();
        BuildMonsterName();

        if(_playerMonsterAttribute.belongStrongholdIndex == 0)
        {
            BuildMineStrongholdList();

            if (_strongholdIndex != -1)//在据点里，设置宠物的据点位置
            {
                CallBackClickStrongholdPorItem(_strongholdIndex);
            }
            else
            {
                CallJIRVISPlayTipsForToCloseInfomationBar();
            }
        }
       
        if(_playerMonsterAttribute.monsterNickName!=null || _playerMonsterAttribute.monsterNickName!="")
        {
            monsterNameInputField.text = _playerMonsterAttribute.monsterNickName;
        }else
        {
            monsterNameInputField.text = "";
        }
    }

    private void BuildMonster()
    {
        if(curMonster!=null)AndaDataManager.Instance.RecieveItem(curMonster);
        curMonster = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(playerMonsterAttribute.monsterID.ToString());
        curMonster.SetInto(monsterPoint);
        curMonster.gameObject.SetLayer(ONAME.LayerUI);
        if(curMonster.GetComponent<MonsterItemTouchEvent>()==null)
        {
            curMonster.gameObject.AddComponent<MonsterItemTouchEvent>();
        }
    }

    private void BuildMonsterName()
    {
        if(curMonsterNameObj!=null)Destroy(curMonsterNameObj);
        curMonsterNameObj = AndaDataManager.Instance.GetSpritePerfab("baseName" + playerMonsterAttribute.monsterID);
        curMonsterNameObj = curMonsterNameObj.Clone();
        curMonsterNameObj.transform.SetUIInto(monsterNamePoint);
    }

    private void BuildMineStrongholdList()
    {
        List<PlayerStrongholdAttribute> list = AndaDataManager.Instance.GetPlayerAllStrongholdAttribute();
        int count = list.Count;
        for(int i = 0 ; i < count; i++)
        {
            StrongholdPorItem strongholdPorItem = AndaDataManager.Instance.InstantiateMenu<StrongholdPorItem>(ONAME.StrongholdPorItem);
            strongholdPorItem.SetInfo(list[i].strongholdNickName , list[i].statueID , list[i].medalLevel,list[i].strongholdIndex);
            strongholdPorItem.SetCallBack(CallBackClickStrongholdPorItem);
            strongholdPorItem.transform.SetInto(grid.transform);
            if(strongholdPorItems == null)strongholdPorItems =new List<StrongholdPorItem>();
            strongholdPorItems.Add(strongholdPorItem);
        }

        if(playerMonsterAttribute.belongStrongholdIndex != 0)
        {
            SelectStrongholdItem(playerMonsterAttribute.belongStrongholdIndex);
        }
    }

    private void CallBackClickStrongholdPorItem(int _strongholdIndex)
    {

        SelectStrongholdItem(_strongholdIndex);
      
    }

    private void SelectStrongholdItem(int strongholdIndex)
    {
        selectItemBoard.gameObject.SetTargetActiveOnce(true);
        StrongholdPorItem strongholdPorItem = strongholdPorItems.FirstOrDefault(s=>s.strongholdIndex == strongholdIndex);
        selectItemBoard.SetInto(strongholdPorItem.transform);
        selectItemBoard.transform.SetAsFirstSibling();
        selectStrongholdIndex = strongholdIndex;//playerMonsterAttribute.belongStrongholdIndex;
        OnChangeStronghold();
    }

    public void UpdateDataInputMonsterName()
    {
        inputMonsterName = monsterNameInputField.text;
    }


    //【改变了名字】 
    public void OnChangeName()
    {
        if(!isChangeInfo)
        {
            CallJIRVISSetChooseUploadMonsterInformatiopn();
            isChangeInfo = true;
        }
    }

    //【改变了据点】
    private void OnChangeStronghold()
    {
        if(!isChangeInfo)
        {
            CallJIRVISSetChooseUploadMonsterInformatiopn();
            isChangeInfo = true;
        }
    }

    private void CallJIRVISSetChooseUploadMonsterInformatiopn()
    {
        JIRVIS.Instance.PlayTipsForchoose("尊敬的读星者，请确认信息完整，点击确认将向星域技术局发送您的修改请求" , OTYPE.TipsType.chooseTips , "确认", "取消" , CallBackSureaboutUploadInfomation ,CallbackForgetChangeInformation);
    }

    private void CallJIRVISPlayTipsForToCloseInfomationBar()
    {
        JIRVIS.Instance.PlayTipsForchoose("噢我的上帝啊，亲爱的读星者，您终于想起为这只星宿取名了，他将非常开心。" , OTYPE.TipsType.onlyOneChooseTips , "我就路过" , "" ,CallbackForgetChangeInformation , null);
    }

    private void CallBackSureaboutUploadInfomation()
    {
        if(!isChangeInfo)
        {
            Debug.Log("JIRVIS Tip:没有做任何的修改");
            return;
        }
        AndaDataManager.Instance.CallServerInsertMonsterToStronghold(playerMonsterAttribute.monsterIndex, selectStrongholdIndex, inputMonsterName ,CallBackFinishiUploadMonsterChangeInfo);
    }

    private void CallBackFinishiUploadMonsterChangeInfo(bool isSuccess)
    {
        if(isSuccess)
        {
            if (callbackFinishUploadMonsterInfo != null)
            {
                callbackFinishUploadMonsterInfo();
            }

            //取消
            JIRVIS.Instance.CloseEditorBarForMonsterChangeNameOrBelongStorngholdIndex();
            JIRVIS.Instance.CloseTips();
        }


    }
    private void CallbackForgetChangeInformation()
    {
        if(callbackGiveUpEditorMonsterInfo!=null)
        {
            callbackGiveUpEditorMonsterInfo();
        }

        //取消
        JIRVIS.Instance.CloseEditorBarForMonsterChangeNameOrBelongStorngholdIndex();
        JIRVIS.Instance.CloseTips();
    }

    public void ClickActivity()
    {
        if(curMonster!=null)
        {
            curMonster.ControllerToPlayMoodForHudong00();
        }
    }

    private void Update()
    {
        if(curMonster!=null)
        {
            curMonster.GetComponent<MonsterItemTouchEvent>().OnUpdate();
        }
    }
}
