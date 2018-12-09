using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class View_FollowObject : UIBasic {
    /*
     * UI跟随脚本，
     * 1.这个是一个底部的面板。这个面板会跟随输入的目标点进行移动
     * 2.只负责跟随移动。如果跟随的目标消失，怎这个也会消失
     */

    public Transform board;
    public Transform list_board;
    private bool excuteFollow = false;
    private Transform followTarget;
    private Vector3 followTargetPoint;
    private List<Transform> infoPoint_list;
    private int currentSetpointIndex;
    private bool pause;
    #region 快速获取
    public Transform getNamePoint
    {
        get
        {
            //这里物件的名字是约定好的。直接在面板里设置名字
            return infoPoint_list.FirstOrDefault(s => s.name == "namepoint");
        }
    }

    public Transform getNamePoint2
    {
        get
        {
            return infoPoint_list.FirstOrDefault(s => s.name == "namepoint2");
        }

    }
    public Transform getDesPoint
    {
        get
        {
            return infoPoint_list.FirstOrDefault(s => s.name == "backgroundPoint");
        }
    }

    public Transform getIcon_Board_Value_Tips
    {
        get
        {
            return infoPoint_list.FirstOrDefault(s => s.name == "icon+board+value+tips");
        }
    }

    public Transform getIcon_Bard_ValueTips2
    {
        get
        {
            return infoPoint_list.FirstOrDefault(s => s.name == "icon+board+value+tips2");
        }
    }

    public Transform getIcon_Board_Name
    {
        get
        {
            return infoPoint_list.FirstOrDefault(s => s.name == "icon+board+levelname");
        }
    }

    public Transform getIcon_list
    {
        get
        {
            return infoPoint_list.FirstOrDefault(s => s.name == "listPoint");
        }
    }

    #endregion

    #region 暂停 ，继续
    public void ExcutePause()
    {
        pause = true;
    }
    public void ExcuteConsume()
    {
        pause = false;
    }
    #endregion


    #region 获取从左到右的连续点
    private List<Transform> continuityPointList;
    public List<Transform> fromLeftToRightPoint
    {
        get
        {
            if (continuityPointList == null)
            {
                List<Transform> list = null;
                string name = "point";
                for (int i = 0; i < 6; i++)
                {
                    if (list == null) list = new List<Transform>();
                    string n = name + (i + 1);
                    list.Add(infoPoint_list.FirstOrDefault(s => s.name == n));
                }
                continuityPointList = list;
            }
            return continuityPointList;
        }
    }
    #endregion

    #region 获取从右至左的连续点
    private List<Transform> continuityPointList2;
    public List<Transform> fromRightToLeftPoint
    {
        get
        {
            if (continuityPointList2 == null)
            {
                List<Transform> list = null;
                string name = "point";
                for (int i = 6; i >0; i--)
                {
                    if (list == null) list = new List<Transform>();
                    string n = name + i;
                    list.Add(infoPoint_list.FirstOrDefault(s => s.name == n));
                }
                continuityPointList2 = list;
            }
            return continuityPointList2;
        }


    }

    #endregion
  
    #region 设置点
    public void SetNameToPoint(Transform target)
    {
        target.SetInto(getNamePoint);
    }
    public void SetDesToBotPoint(Transform target)
    {
        target.SetInto(getDesPoint);
    }

    public void SetToTopPoint2(Transform target)
    {
        target.SetInto(getNamePoint2);
    }
    public void SetToListPoint(Transform target)
    {
        target.SetInto(getIcon_list);
    }
    public void SetToIcon_Board_Value_Tips(Transform target)
    {
        target.SetInto(getIcon_Board_Value_Tips);
    }
    public void SetToIcon_Board_Value_Tips2(Transform target)
    {
        target.SetInto(getIcon_Bard_ValueTips2);
    }

    public void SetToIcon_Board_LevelName(Transform target)
    {
        target.SetInto(getIcon_Board_Name);
    }

    /// <summary>
    /// 连续添加：从左至右
    /// </summary>
    public void SetContinuityPoint(Transform target)
    {
        target.SetInto(fromLeftToRightPoint[currentSetpointIndex]);
        currentSetpointIndex += 1;
    }
    /// <summary>
    /// 连续添加，从右至左
    /// </summary>
    public void SetContinuityPoint2(Transform target)
    {
        target.SetInto(fromRightToLeftPoint[currentSetpointIndex]);
        currentSetpointIndex += 1;
    }
    #endregion

    public override void InitValue()
    {
        base.InitValue();
        currentSetpointIndex = 0;
        pause = false;
    }

    #region 跟随
    public void SetEqualFollow(Transform _folTarget)
    {
        followTarget = _folTarget;
        excuteFollow = true;
        infoPoint_list = list_board.GetChildList();
    }

    /// <summary>
    /// 执行跟随
    /// </summary>
    public void ExcuteFollow()
    {
        if (excuteFollow)
        {
            Vector3 point = followTarget == null ? followTargetPoint : followTarget.position;
            Vector3 targetWithNGUIScreenPosition =
            point.ConvertWorldPostionToNGUIPosition();
            bool isFrontCamera = point.IsInFrontOfCamera();
            if (isFrontCamera)
            {
                board.gameObject.SetTargetActiveOnce(true);
                board.position = targetWithNGUIScreenPosition;
            }
            else
            {
                board.gameObject.SetTargetActiveOnce(false);
            }
        }
    }

    #endregion
    public override void OnUpdate()
    {
        base.OnUpdate();
        if (pause) return;
        if (followTarget != null)
        {
            ExcuteFollow();
        }
    }
    
}
