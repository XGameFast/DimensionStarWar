using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
public class PlayerMonster:MonsterController {
    //
    /*
     * DevBy: AndaChen
     * Date:2018.3.4
     * 
     * 玩家控制器的基类。在它之上还有 玩家战斗控制器 玩家寻宝控制器 等不同模块的不同控制器，
     * 决定着玩家是否要主动去操控怪兽
     * 还有 基础操作。切换技能和触屏攻击等
     * 
     */
    private Transform followTarget
    {
        get
        {
            return ARMonsterSceneDataManager.Instance.mainCamera.transform;
        }
    }
    protected bool startrController = false;
    protected bool canUseSkill = false;
    protected Vector3 currentAttackTargetPoint;

    protected RaycastHit hit;
    protected Vector3 hitPoint;
    protected bool isPlayerController;
    protected float updateInterval;
    protected float updateloadTime;
    protected Vector3 cameraPointWihtMonsterY;
    protected Vector3 cameraForwardWithZero;
    protected float keepDistance;
    protected float moveSpeed;
    protected float updateDistance;
    protected bool faceToTarget;

    private MonsterSkillBoard monsterSkillBoard;
    private AndaObjectBasic moveStepRootObj;
    protected override  void OnInitValue()
    {
        base.OnInitValue();

    }

    public override void StartEngine()
    {
        base.StartEngine();

        //构建控制面板
        BuildMonsterSkillControlBoard();
        //构建移动的光标
 
        BuildMoveStepObj();
    }


    public override void EndEngine()
    {
        if(monsterSkillBoard!=null)
        {
            monsterSkillBoard.callbackMoveStepEvent = null;
            AndaDataManager.Instance.RecieveItem(monsterSkillBoard);
            monsterSkillBoard=  null;
        }
        if(moveStepRootObj!=null)
        {
            AndaDataManager.Instance.RecieveItem(moveStepRootObj);
            moveStepRootObj =null;
        }
        base.EndEngine();
    }

    private void BuildMoveStepObj()
    {
        if(moveStepRootObj == null)
        {
            moveStepRootObj = AndaDataManager.Instance.InstantiateOtherObj("MoveStepRootItem");
            moveStepRootObj.transform.localScale = Vector3.one * ARMonsterSceneDataManager.Instance.getARWorldScale;
        }
    }

    private void BuildMonsterSkillControlBoard()
    {
        if(monsterSkillBoard == null)
        {
            monsterSkillBoard = AndaUIManager.Instance.PopingMenu2<MonsterSkillBoard>(ONAME.MonsterSkillBoard);
            monsterSkillBoard.BuildMonsterSkill(self.monsterDataValue.prop_PowerBlock , UsePropPowerBlock ,self.UsingPropPowerblockEvent);
            self.UsingPropPowerblockEvent = monsterSkillBoard.UpdatePowerBlockValue;
            monsterSkillBoard.ActiveBoard(true);
            monsterSkillBoard.OpenMoveStepBtn();
            monsterSkillBoard.callbackMoveStepEvent = ControlMove;
        }

        monsterSkillBoard.ListenerChangeSkill(1);//默认为普通攻击
    }

    public void StartPlayerControll()
    {
        isPlayerController = true;
    }
    public void EndPlayerControll()
    {
        isPlayerController = false;
    }
    
    #region 玩家手机控制怪兽移动
    private void ExcutePlayerController()
    {
        if (Time.time - updateloadTime > updateInterval)
        {
            Vector3 vector3 = ARMonsterSceneDataManager.Instance.GetCameraForwardFixPoint();


            if(!self.isAttack)
            {
                if(self.CheckCanMove())
                {
                    if (Vector3.Distance(self.selfPostion,vector3) > updateDistance)
                    {
                        self.ControllerMoveToTargetPoint(self.selfPostion, vector3, moveSpeed);
                        Quaternion q = Quaternion.LookRotation(vector3-self.selfPostion);
                        self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, q, 0.35f);
                        self.PlayAnimationState();
                    }else
                    {
                        Quaternion q = Quaternion.LookRotation(-ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(self.selfPostion)/*ARMonsterSceneDataManager.Instance.arCameraForward*//* self.selfPostion - new Vector3(hitPoint.x, self.selfPosY, hitPoint.z)*/);
                        self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, q, 0.35f);
                    }
                }
            }else
            {
                Quaternion q = Quaternion.LookRotation(-ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(self.selfPostion)/* self.selfPostion - new Vector3(hitPoint.x, self.selfPosY, hitPoint.z)*/);
                self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, q, 0.35f);
            }

            updateloadTime = Time.time;
        }

       /* if (faceToTarget)
        {
            Quaternion q = Quaternion.LookRotation(hitPoint - self.head.position);
            self.ControllerRotateHeadToTargetDir(self.head.rotation, q, 0.35f);
        }*/
    }

    private void ControlMove()
    {
        if (!self.isAttack)
        {
            if (self.CheckCanMove())
            {
                Vector3 moveTargetPoint = ARMonsterSceneDataManager.Instance.MoveRayHit();// ARMonsterSceneDataManager.Instance.GetCameraForwardFixPoint();
                self.ControllerMoveToTargetPoint(self.selfPostion, moveTargetPoint, moveSpeed);
                Quaternion q = Quaternion.LookRotation(moveTargetPoint - self.selfPostion/* self.selfPostion - new Vector3(hitPoint.x, self.selfPosY, hitPoint.z)*/);
                self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, q, 0.35f);
                self.PlayAnimationState();
            }
            else
            {
                Quaternion q = Quaternion.LookRotation(ARMonsterSceneDataManager.Instance.GetCameraLookForward(self.selfPostion)/* self.selfPostion - new Vector3(hitPoint.x, self.selfPosY, hitPoint.z)*/);
                self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, q, 0.35f);
            }
        }
        else
        {
            Quaternion q = Quaternion.LookRotation(ARMonsterSceneDataManager.Instance.GetCameraLookForward(self.selfPostion)/*ARMonsterSceneDataManager.Instance.arCameraForward*//* self.selfPostion - new Vector3(hitPoint.x, self.selfPosY, hitPoint.z)*/);
            self.ControlloerRotateBodyToTargetDir(self.allBody.rotation, q, 0.35f);
        }
    }

    private void UpdateMoveStepRootPosition()
    {
        if(moveStepRootObj!=null)
        {
            hitPoint = ARMonsterSceneDataManager.Instance.MoveRayHit();
            moveStepRootObj.transform.position = hitPoint;
        }
    }

    #endregion

    #region 切换技能 和攻击 的操作
    //用于屏幕滑动的数值
    private Vector2 startDragPosition;
    private bool isTriggerUI =false;
    private void ControllChangeSkill()
    {
        if (EventSystem.current.IsPointerOverGameObject())
        {
            //代表点到了UI上
            isTriggerUI = true;
            return;
        }

        if (Input.GetMouseButtonDown(0))
        {
            startDragPosition = Input.mousePosition;
        }

        if (Input.GetMouseButtonUp(0))
        {
            if(isTriggerUI){ isTriggerUI =false ;return ;  } 
            //防御
            if (Input.mousePosition.x - startDragPosition.x > 200)
            {
                ChangeSkillAndAttack(0);

            }
            else //特殊技能
            if (Input.mousePosition.x - startDragPosition.x < -200)
            {
                ChangeSkillAndAttack(2);
               
            }
            else //点击屏幕
            {
                if (canUseSkill)
                {
                    ChangeSkillAndAttack(1);
                }
            }
        }
    }

    private void ChangeSkillAndAttack(int skillItemIndex)
    {
        if(self.isStartSkill){ Debug.Log("技能正在使用");return; } 
        if(!self.SkillIsCownDown(skillItemIndex)){ Debug.Log("技能还在CD");return;}
        if(!self.SetState((int)OTYPE.MonsterActiveStateType.attack)){ Debug.Log("当前不可以使用技能");return; }

        self.ControlChangeSkillFixSkill(skillItemIndex);
        if(monsterSkillBoard!=null)
        {
            monsterSkillBoard.ListenerChangeSkill(skillItemIndex);
        }

        ControlAttack();
    }

    private void OnlyChangeSkill(int skillItemIndex)
    {
        if(self.isStartSkill){ Debug.Log("技能正在使用");return; } 
        if(!self.SkillIsCownDown(skillItemIndex)){ Debug.Log("技能还在CD");return;}
        if(!self.SetState((int)OTYPE.MonsterActiveStateType.attack)){ Debug.Log("当前不可以使用技能");return; }

        self.ControlChangeSkillFixSkill(skillItemIndex);
        if(monsterSkillBoard!=null)
        {
            monsterSkillBoard.ListenerChangeSkill(skillItemIndex);
        }

    }

    private void BackToNormalAttack()
    {
        if(self.getCurrentSkillIndex == 1)return;
        self.ControlChangeSkillFixSkill(1);
        if (monsterSkillBoard != null)
        {
            monsterSkillBoard.ListenerChangeSkill(1);
        }
    }

    private void ControlAttack()
    {
        currentAttackTargetPoint = ARMonsterSceneDataManager.Instance.FightRayHit();
        if(currentAttackTargetPoint == Vector3.zero)
        {
            currentAttackTargetPoint =  self.transform.forward.normalized * 10* ARMonsterSceneDataManager.Instance.getARWorldScale + self.transform.position ;//   ARMonsterSceneDataManager.Instance.currentEnemy.center.position;
        }
        self.ControllerToRotateBodyByPoint(currentAttackTargetPoint, 0.35f);
        self.ControllerToAttak(currentAttackTargetPoint, true);
    }


    private void UsePropPowerBlock(int _index)
    {
        self.ControllerUsePowerBlock(_index);
    }
      


    protected override void UsingSkill()
    {
        base.UsingSkill();
        //ChangeSkill(1);//回到普通攻击
    }

    protected override void OverOnceAttack()
    {
        base.OverOnceAttack();
        //回到普通攻击 
        BackToNormalAttack();
        //OnlyChangeSkill(1);
    }



    #endregion


    protected override void OnUpdate()
    {
        base.OnUpdate();
        
        if (isPlayerController)
        {
            ControllChangeSkill();
            UpdateMoveStepRootPosition();
        }
    }
    
}
