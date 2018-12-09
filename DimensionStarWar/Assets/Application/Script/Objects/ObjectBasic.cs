using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ObjectBasic : AndaObjectBasic
{
    /*
     * 物件的脚本，
     * 用于场景中需要生成的物件，可以接受攻击
     * 隐藏的物件，需要 显现技能才可以 显现。 但可以被攻击直接摧毁。并且不显现。
     * 如果是隐藏的物体，显现后被再次受到先技能施法的话。会被拾取。
     * 
     * 监听事件：显现事件，收取事件
     * 
     * 后续为物件增加状态属性。目前暂时不加。
     */

    #region 监听事件
    public System.Action HasBeenFoundEvent;
    public System.Action HasBeenPickUpEvent;
    public System.Action HasBeenDestroyEvent;

    #endregion


    #region 组件
    public ObjectDataValue objectDataValue;
    public ObjectsInfo objectsInfo;
    #endregion
    private bool isHiden = false;
    public override void InitValue()
    {
        base.InitValue();
        isHiden = false;
    }

    public void DownloadValue(int id , bool _needHide)
    {
        gameObject.layer = LayerMask.NameToLayer("Objects");
        isHiden = _needHide;
        BuildCompoenment();
        BuildObjData(id);
    }

   
    private void BuildCompoenment()
    {
        if(objectDataValue == null) objectDataValue = new ObjectDataValue();
        if (objectsInfo == null) objectDataValue = new ObjectDataValue();
        objectDataValue.DownloadMessage(this);
        objectsInfo.DownloadMessage(this);
    }
    private void BuildObjData(int id)
    {
        objectDataValue.BuildData(id);
    }

    public void ControllerObjectHasBeenHit(int hipower)
    {
        var value = objectDataValue.UpdateBlodd(-hipower);
        if (value == -1) return;
        else if (value <= 0)
        {
            AndaDataManager.Instance.DestoryObj(this);

            if (HasBeenDestroyEvent != null)
            {
                HasBeenDestroyEvent();
            }
        }
        else
        {
            if (isHiden)
            {
                ControllerToDisplay();
                if (HasBeenFoundEvent != null)
                {
                    HasBeenFoundEvent();
                }
                isHiden = false;
            }
            else
            {
                ControllerPickUpForPlayer();
                if (HasBeenPickUpEvent != null)
                {
                    HasBeenPickUpEvent();
                }
            }
        }
    }

    public virtual void ControllerToHidenSelf()
    {

    }

    public virtual void ControllerToDisplay()
    {

    }

    public virtual void ControllerPickUpForPlayer()
    {

    }

    public virtual void ControllerThrow(Vector3 struck)
    {
        selfRigidbody.useGravity = true;
        selfRigidbody.AddForce(struck);
    }

    #region 接受消息
    


    #endregion
}
