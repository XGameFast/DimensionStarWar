using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
public class MonsterSkillBoard : UIBasic2 {
    public UITool_Press moveStepBtn;
    public RectTransform pointLeft;
    public RectTransform pointRight;
    public RectTransform arrow;
    public GameObject consumableBox;
    public Transform[] consumablePointTypes;
    private Transform currentConsumableboard;
    public AndaObjectBasic skillItemPrefab;
    public AndaObjectBasic consumablePrefab; 
    public GameObject onPressBtn;//长安按钮用于 呼去 道具面板

    public GridLayoutGroup gridLayoutGroup;
    public ScrollRect scrollRect;
    public RectTransform contentTransform;
    public RectTransform viewPointTransform;

    public MathTool_Slider MonsterPower;
    public Slider powerSlider;
    private int currentScrollIndex = -1;
    private AndaObjectBasic[] skillItems;

    private List<LD_Objs> currentLD_Objs;
    private List<PowerBlockItem> powerblockObjList;


    private System.Action<int> callBackSelectSkillItem; //返回技能列表的Index
    private System.Action callbackAttack;
    private System.Action<int> callbackSelectConsumableItem; //返回消耗品列表的Index
    public System.Action callbackMoveStepEvent;


    private bool isPressConsumableBtn =false;
    private bool isCheckArrow = false;

    private int consumableCount;
    private float betwentPointDistance;
    private float smallDistance;
    private float startPressPoint;
    private int selectConsuambleIndex = -1;
    private bool curIsActive=false;


    public Animator skillBoard;
    public GameObject[]skillObjItems;
    private int curSkillIndex;

    public System.Action<int> ChangeSkillEvent;


    private Vector2 p1 ;

    private Vector2 p2;

    public override void OnDispawn()
    {

        //foreach(var go in powerblockObjList)
        //{
        //    AndaDataManager.Instance.RecieveItem(go);
        //}
        //powerblockObjList.Clear();
        moveStepBtn.gameObject.SetTargetActiveOnce(false);
        FingerEvent.clickEvent -= ClickEvent;
        FingerEvent.HoriDrag -= DragEvent;
        
        base.OnDispawn();
    }


    public void ListenerChangeSkill(int skillIndex)
    {
         
        skillObjItems[curSkillIndex].gameObject.SetTargetActiveOnce(false);
        skillObjItems[skillIndex].gameObject.SetTargetActiveOnce(true);
        curSkillIndex = skillIndex;
    }

    public void UpdatePowerBlockValue(int itemIndex , int itemLessCount)
    {
        powerblockObjList[itemIndex].UpdateLessCount(itemLessCount);  
    }

    //构建宠物的技能，和玩家意志力事件
    public void BuildMonsterSkill(List<LD_Objs> lD_Objs ,System.Action<int> _callbackSelectConsumable , System.Action<int ,int> callbackUsePowerblock)
    {
        //callbackUsePowerblock =  UpdatePowerBlockValue;
        //callbackUsePowerblock =  UpdatePowerBlockValue;


        callbackSelectConsumableItem = _callbackSelectConsumable;

        //if(lD_Objs.Count!=0)
        //{
        //   BuildConsumable(lD_Objs);
        //}

        //构建长按事件
        EventTriggerListener eventTriggerListener = EventTriggerListener.Get(onPressBtn);
        eventTriggerListener.onDown += OnPress;
        eventTriggerListener.onUp += OnPress;


    }

    public void ActiveBoard(bool isActive)
    {
        if(isActive)
        {
            FadeIn();
            curIsActive = isActive;
        }else
        {
            FadeOut(CallbackFinishFadeout);
        }

        curIsActive = isActive;
    }

    public void OpenMoveStepBtn()
    {
        moveStepBtn.gameObject.SetTargetActiveOnce(true);
        moveStepBtn.BuildPressEvent(OnPressMoveStepBtn);
    }

    private void OnPressMoveStepBtn()
    {
        if (callbackMoveStepEvent != null)
        {
            callbackMoveStepEvent();
        }
    }


    private void CallbackFinishFadeout()
    {
        
    }

    private void CallbcakFinishFadeIn()
    {
        
    }

    public void OpenConsumableBoard(bool isOpen)
    {
        currentConsumableboard.gameObject.SetTargetActiveOnce(isOpen);
    }

    public void SelectConsuamable(int _index , System.Action<LD_Objs> useItem)
    {
        useItem(currentLD_Objs[_index]);
    }

    //购买道具的消耗品
    private void BuildConsumable(List<LD_Objs> lD_Objs )
    {
        currentLD_Objs = lD_Objs;
        consumableCount = lD_Objs.Count;


        p1 = ARMonsterSceneDataManager.Instance.UICamera.WorldToScreenPoint(pointLeft.position);

        p2 = ARMonsterSceneDataManager.Instance.UICamera.WorldToScreenPoint(pointRight.position);

        betwentPointDistance = Mathf.Abs(p1.x - p2.x);

        smallDistance =  betwentPointDistance / consumableCount;

        currentConsumableboard = consumablePointTypes[consumableCount-1];
        currentConsumableboard.gameObject.SetTargetActiveOnce(true);

        for(int i = 0 ; i < consumableCount;i++)
        {
            PowerBlockItem consumableItem = BuildConsumableItem(lD_Objs[i]);
            consumableItem.transform.SetUIInto(currentConsumableboard.GetChild(i).transform);
            if(powerblockObjList == null)powerblockObjList = new List<PowerBlockItem>();
            powerblockObjList.Add(consumableItem);
        }
    }

    public void UpdateMonsterPower(int curPow,int maxPow)
    {
        float targetValue = (float)curPow/ maxPow;
        MonsterPower.StartSlider(targetValue,UpdatepowerSlider);
    }

    private void UpdatepowerSlider(float power)
    {
        powerSlider.value = power;
    }


    private AndaObjectBasic BuildSkillItem(PlayerSkillAttribute playerSkillAttribute)
    {
        AndaObjectBasic _skillItem = skillItemPrefab.Clone().GetComponent<AndaObjectBasic>();
        string boardLevelPath = "Level/" + playerSkillAttribute.skillLevel;
        _skillItem.transform.Find("levelboard").GetComponent<Image>().sprite = AndaDataManager.Instance.GetSkillSprite(boardLevelPath);
        if(playerSkillAttribute.baseSkillAttribute.skillType == 0)
        {
            if(playerSkillAttribute.baseSkillAttribute.attackType == 0)
            {
                _skillItem.transform.Find("skillicon").GetComponent<Image>().sprite  = AndaDataManager.Instance.GetSkillSprite (ONAME.normallAttackIcon);
            }else
            {
                _skillItem.transform.Find("skillicon").GetComponent<Image>().sprite  = AndaDataManager.Instance.GetSkillSprite (ONAME.specialSkillIcon);
            }
        }else
        {
            _skillItem.transform.Find("skillicon").GetComponent<Image>().sprite  = AndaDataManager.Instance.GetSkillSprite (ONAME.defenseSkillIcon);
        }
       
        return _skillItem;
    }

    private PowerBlockItem BuildConsumableItem(LD_Objs _ld_Objs)
    {
        PowerBlockItem _consumableItem = AndaDataManager.Instance.InstantiateMenu<PowerBlockItem>(ONAME.PowerBlockItemForMonsterUseSkillBar);
        _consumableItem.SetInfo(_ld_Objs.objID,_ld_Objs.lessCount,_ld_Objs.giveValue);
        return _consumableItem;
    }

    public void Scroll(int index)
    {
        if(currentScrollIndex == index)return;
        currentScrollIndex = index;
        CenterOnItem(skillItems[currentScrollIndex].GetComponent<RectTransform>(),scrollRect,viewPointTransform,contentTransform);
    }

    private void ClickEvent()
    {
        callbackAttack();
    }

    private void DragEvent(int _value)
    {
        callBackSelectSkillItem(_value);
    }

   
    private void OnPress(GameObject btn)
    {
        if(!isPressConsumableBtn)
        {
            if(currentLD_Objs == null)return;
            consumableBox.gameObject.SetTargetActiveOnce(true);
            OpenConsumableBoard(true);
            isPressConsumableBtn=true;
            arrow.gameObject.SetTargetActiveOnce(true);
          
        }else
        {
            if(currentLD_Objs == null)return;
            lastSelectCousumableIndex =-1;
            isCheckArrow=false;
            OpenConsumableBoard(false);
            if(selectConsuambleIndex!=-1) 
            {
                if(callbackSelectConsumableItem!=null)
                {
                    callbackSelectConsumableItem(selectConsuambleIndex);
                }
            }
            currentConsumableboard.gameObject.SetTargetActiveOnce(false);
            consumableBox.gameObject.SetTargetActiveOnce(false);
            arrow.gameObject.SetTargetActiveOnce(false);
            Invoke("InvokExcuteSetPress" , 0.1f);

        }
    } 
    Vector2 point;
    private int lastSelectCousumableIndex=-1;
    //检查当前指向的是哪个
    private void CheckFingerArrowWhich()
    {
        if(!isCheckArrow)
        {
            isCheckArrow = true;
        }

        point = Input.mousePosition;//ARMonsterSceneDataManager.Instance.UICamera.WorldToScreenPoint(Input.mousePosition);
       // RectTransformUtility.ScreenPointToLocalPointInRectangle(AndaUIManager.Instance.canvas.GetComponent<RectTransform>(),
         //                                                       Input.mousePosition, AndaUIManager.Instance.canvas.worldCamera,out point);




        switch(consumableCount)
        {
            case 1:
                selectConsuambleIndex = 0;

                arrow.transform.localEulerAngles = Vector3.zero;

                break;
            case 2: 
                if(point.x > p1.x + smallDistance )
                {
                    selectConsuambleIndex = 1;
                    arrow.transform.localEulerAngles = new Vector3(0,0,-45f);
                    TriggerImpactFeedbackStyleLight();
                }else if(point.x < 0)
                {
                    selectConsuambleIndex = 0;
                    arrow.transform.localEulerAngles = new Vector3(0,0,45f);
                    TriggerImpactFeedbackStyleLight();
                }break;
            case 3:
                if(point.x > p1.x + smallDistance  && point.x < p2.x - smallDistance)
                {
                    selectConsuambleIndex = 0;
                    arrow.transform.localEulerAngles = new Vector3(0,0,0);
                    TriggerImpactFeedbackStyleLight();
                   
                }else if(point.x > p1.x + 2 * smallDistance) // 右边
                {
                    selectConsuambleIndex = 2;
                    arrow.transform.localEulerAngles = new Vector3(0,0,-45f);
                    TriggerImpactFeedbackStyleLight();


                }else { //左边
                    selectConsuambleIndex = 1;
                    arrow.transform.localEulerAngles = new Vector3(0,0,45f);
                    TriggerImpactFeedbackStyleLight();
                }
                break;
            case 4:

                if(point.x < p2.x && point.x > p2.x - smallDistance)
                {

                    selectConsuambleIndex = 3;
                    arrow.transform.localEulerAngles = new Vector3(0,0,-80f);
                   
                }
                else if(point.x < p2.x - smallDistance && point.x > p2.x - 2*smallDistance )
                {
                    selectConsuambleIndex = 1;
                    arrow.transform.localEulerAngles = new Vector3(0,0,-40f);

                }else if(point.x > p1.x + smallDistance && point.x< p1.x +2*smallDistance)
                {
                    selectConsuambleIndex = 0;
                    arrow.transform.localEulerAngles = new Vector3(0,0,40f);
                }else if(point.x > p1.x && point.x < p1.x +smallDistance )
                {
                    selectConsuambleIndex = 2;
                    arrow.transform.localEulerAngles = new Vector3(0,0,80f);
                }break;
            case 5:
                break;
        }


        
    }

    private void TriggerImpactFeedbackStyleLight()
    {
        if(lastSelectCousumableIndex != selectConsuambleIndex)
        {
          AndaGameExtension.ImpactFeedbackStyleLight();
          lastSelectCousumableIndex = selectConsuambleIndex;
        }
    }

    //延迟结束，避免事件冲
    private void InvokExcuteSetPress()
    {
        isPressConsumableBtn=false;

    }

    public void Update()
    {
        if(!curIsActive)return;
        //防止手指事情冲突，在点击道具按钮的时候 ，手指事件不会触发
        if(isPressConsumableBtn)
        {
            CheckFingerArrowWhich();
           
        }else
        {
            FingerEvent.OnUpdate();
        }
    }

   


    /*public void OnGUI()
    {
        GUI.Box(new Rect (p1.x,0,smallDistance,Screen.height) ,"first");
        GUI.Box(new Rect (p1.x + smallDistance ,0,smallDistance,Screen.height) ,"second");
        GUI.Box(new Rect (p2.x - smallDistance ,0,smallDistance,Screen.height) ,"thrid");

        GUI.Box(new Rect(point.x,point.y,smallDistance,smallDistance),"mouse");
    }*/
}
