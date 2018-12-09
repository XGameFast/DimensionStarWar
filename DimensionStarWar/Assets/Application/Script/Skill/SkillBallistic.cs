using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillBallistic : SkillBasic {

    public BallisticType ballisticType = BallisticType.straightLine;
    public Transform mainObj;
    public Transform GatheringObj;
    public Transform exploreObj;
    public Transform trailObj;
    public SkillTriggerEvent dandao;
    private Vector3 startPoint;
    private float timer;
    private float ditance;

    public float moveSpeed
    {
        get
        { return playerSkillAttribute.baseSkillAttribute.skillMoveSpeed.DoubleToFloat();/*+ skillGrowupAttribute.skillGrowupMoveSpeed.DoubleToFloat();*/ }
    }
    public enum BallisticType
    {
        straightLine =1,
        parabola =2,
        IrregularMovement =3
    }
    /// <summary>
    /// 直线运动
    /// </summary>
    protected virtual  void StraightLineMovement()
    {
      
       

    }
   
    protected override void OnUpdate()
    {
        base.OnUpdate();
        if (ballisticType == BallisticType.straightLine && isExcuting)
        {
            StraightLineMovement();
        }
    }

    protected override void RunningSkill()
    {
        base.RunningSkill();
        if (ballisticType == BallisticType.straightLine)
        {
            startPoint = insPoint == null ? instanPoint : insPoint.position;
            //Debug.DrawLine(toTargetPoint,startPoint,Color.red,10);
            mainObj.transform.forward = toTargetPoint - startPoint;
        }
    }
    
    /// <summary>
    /// 让特效脱离母体
    /// </summary>
    public void SetObjOutSelf(GameObject target)
    {
        target.transform.parent = null;
    }
    /// <summary>
    /// 设置特效出现的位置
    /// </summary>
    public void SetObjtToTargetPoint(GameObject target, Vector3 point , bool needOutSelf = false)
    {
        if (needOutSelf)
        {
            SetObjOutSelf(target);
        }
        target.gameObject.SetActive(true);
      
        target.transform.position = point;
    }

    public void SetObjtToTargetPoint(GameObject target, Transform targetPoint)
    {
        target.gameObject.SetActive(true);
        target.transform.parent = targetPoint;
        target.transform.localPosition = Vector3.zero;
    }

    /// <summary>
    /// 让特效回来
    /// </summary>
    public void ObjBackToSelf(GameObject target)
    {
        target.gameObject.SetActive(false);
        target.transform.SetParent(transform);
        target.transform.localPosition = Vector3.zero;
    }
    public void ObjBackToSelf(Transform target)
    {
        target.gameObject.SetActive(false);
        target.SetParent(transform);
        target.localPosition = Vector3.zero;
    }
}
