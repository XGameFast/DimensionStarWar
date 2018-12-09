using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
public static class FingerEvent  {

    #region drag

    public static System.Action<int> HoriDrag;
    //拽动 获取 速度
    public static System.Action<float,float,bool> HoriDragGetSpeed;

    private static float horiDragGetTimer;

    public static System.Action<int> VeriDrag;
    private static Vector2 mousePose;
    private static  float dragInterval = 5;
    #endregion
    // int = finger count , vector2 = sliderDelta
    public static System.Action<int , Vector2> sliderForXY;
    public static System.Action<float,bool> slierForX;
    public static System.Action<float> sliderVeri;

    public static System.Action clickEvent;
    //长安事件
    public static System.Action<bool> longPressEvent;
    //选择物件
    public static System.Action<Transform> clickSelectItemEvent;
    //3DUICamera的选择物件事件
    public static System.Action<Transform> clickSelectItemEvent3DUICamera;
    //
    public static System.Action SliderOver;

    private static string selectItemKey;

    private static float pressTimer; //长按时间

    private static bool isTriggerPress = false;


    public static System.Action<Vector3> RotateItemEvent;
    public static System.Action<Vector3> ScaleItemEvent;
    public static System.Action<Vector3> doubleFingerRotateEvent;
    public static System.Action<float> doubleFingerDragSameDirection;//双指同向滑动

    public static System.Action<float> singleFingerDragHorizion;//单指横行滑动

    public static System.Action<Vector2> singleFingerDragHorizionVertic;//单指横纵滑动
    static Vector3 oldRotate;


    static Vector3 returnDoubleRotateValue;
    private static void EditorLogic()
    {

        #region 监听旋转事件

        if (RotateItemEvent != null)
        {
            if (Input.touchCount == 1)
            {
                Touch touch = Input.GetTouch(0);
                Vector2 deltaPos = touch.deltaPosition;

                if (Mathf.Abs(deltaPos.x) > 2)
                {
                    oldRotate.y += Time.deltaTime * -deltaPos.x * 2.5f;
                    RotateItemEvent(oldRotate);
                }
            }
        }

        #endregion

        # region 监听缩放事件
        if (ScaleItemEvent != null)
        {
            if (Input.touchCount == 2)
            {
                Touch newTouch1 = Input.GetTouch(0);
                Touch newTouch2 = Input.GetTouch(1);
                if (newTouch2.phase == TouchPhase.Began)
                {
                    oldTouch2 = newTouch2;
                    oldTouch1 = newTouch1;
                    return;

                }


                //计算老的两点距离和新的两点间距离，变大要放大模型，变小要缩放模型
                float oldDistance = Vector2.Distance(oldTouch1.position, oldTouch2.position);
                float newDistance = Vector2.Distance(newTouch1.position, newTouch2.position);

                //两个距离之差，为正表示放大手势， 为负表示缩小手势
                float offset = newDistance - oldDistance;

                //放大因子， 一个像素按 0.01倍来算(100可调整)
                float scaleFactor = offset / 100f;
                Vector3 localScale = oldScale;
                Vector3 scale = new Vector3(localScale.x + scaleFactor,
                                            localScale.y + scaleFactor,
                                            localScale.z + scaleFactor);
                oldScale = scale;
                //最小缩放到 0.3 倍
                if (scale.x > 0.1f && scale.y > 0.1f && scale.z > 0.1f)
                {
                    ScaleItemEvent(scale);
                }

                //记住最新的触摸点，下次使用
                oldTouch1 = newTouch1;
                oldTouch2 = newTouch2;
            }

        }


        #endregion




        #region 监听双指旋转事件

        if (doubleFingerRotateEvent != null)
        {
            if (Input.touchCount == 2)
            {
                Touch touch1 = Input.GetTouch(0);
                Touch touch2 = Input.GetTouch(1);

                //启用双指，尚未旋转
                if (touch2.phase == TouchPhase.Began)
                {
                    oldTouch2 = touch2;
                    oldTouch1 = touch1;
                    return;
                }
                if (touch1.phase == TouchPhase.Moved || touch2.phase == TouchPhase.Moved)
                {
                    Vector2 curVec = touch2.position - touch1.position;
                    Vector2 oldVec = oldTouch2.position - oldTouch1.position;
                    float angle = Vector2.Angle(oldVec, curVec);
                    angle *= Mathf.Sign(Vector3.Cross(oldVec, curVec).z);
                    doubleFingerRotateEvent(new Vector3(0, angle, 0));
                    oldTouch1 = touch1;
                    oldTouch2 = touch2;
                }
            }

        }


        #endregion

        #region 监听双指同向滑动
        if (doubleFingerDragSameDirection != null)
        {
            if (Input.touchCount == 2)
            {
                Touch touch1 = Input.GetTouch(0);
                Touch touch2 = Input.GetTouch(1);
                //启用双指，尚未移动
                if (touch2.phase == TouchPhase.Began)
                {
                    oldTouch2 = touch2;
                    oldTouch1 = touch1;
                    return;
                }
                if (touch1.phase == TouchPhase.Moved )
                {
                    if(touch1.deltaPosition.x < 2)
                    {
                        float t = touch1.position.y - oldTouch1.deltaPosition.y;
                        doubleFingerDragSameDirection(t);
                    }

                }

                oldTouch1 = touch1;
                oldTouch2 = touch2;
            }

        }
        #endregion

        #region 监听单指横向滑动

        if (singleFingerDragHorizion != null)
        {
            if (Input.touchCount == 1)
            {

                Touch touch = Input.GetTouch(0);
                Vector2 deltaPos = touch.deltaPosition;
                Debug.Log("deltaPos" + deltaPos);
                if (Mathf.Abs(deltaPos.x) > 2)
                {
                    singleFingerDragHorizion(deltaPos.x);
                }
            }
        }


        #endregion

        #region 监听单指 横纵 滑动
        if (singleFingerDragHorizionVertic != null)
        {
            if (Input.touchCount == 1)
            {
                Touch touch = Input.GetTouch(0);
                singleFingerDragHorizionVertic(touch.deltaPosition);
            }
        }
        #endregion

        //if (EventSystem.current.IsPointerOverGameObject())return;
        if (Input.GetMouseButtonDown(0))
        {
            mousePose = Input.mousePosition;

            if(clickSelectItemEvent!=null)
            {
                // 0 = clickDown
                ClickSelectItemEvent(0);
            }
            if(clickSelectItemEvent3DUICamera!=null)
            {
                ClickSelectItemEvent3DUI(0);
            }

            if(longPressEvent!=null)
            {
                pressTimer = Time.time;
                isTriggerPress = false;
            }
            if(HoriDragGetSpeed != null)
            {
                horiDragGetTimer = Time.time;
            }

        }

        if(Input.GetMouseButtonUp(0))
        {
            if(clickSelectItemEvent!=null)
            {
                // 1 = clickUp
                ClickSelectItemEvent(1);
            }
            if(clickSelectItemEvent3DUICamera!=null)
            {
                ClickSelectItemEvent3DUI(1);
            }
            if(HoriDrag!=null)
            {
                DragHoriEvent();       
            }
            if(VeriDrag!=null)
            {
                DragVeriEvent();
            }
            if(longPressEvent!=null)
            {
                isTriggerPress = false;
                longPressEvent(false);
            }

            if(HoriDragGetSpeed != null)
            {
                DragHoriBySpeed(false);
            }

            if(slierForX!=null)
            {
                SliderHoriForX(false);
            }

        }else if(Input.GetMouseButtonUp(1))
        {
            
            if(HoriDrag!=null)
            {
                DragHoriEvent();       
            }
            if(VeriDrag!=null)
            {
                DragVeriEvent();
            }
        }

        if(Input.GetMouseButton(0))
        {  
            if(sliderForXY!=null)
            {
                SliderEventXY(1);
                mousePose = Input.mousePosition;
            }

            if(longPressEvent!=null)
            {
                if(!isTriggerPress)
                {
                    if(Time.time - pressTimer > 0.85f)
                   {
                        isTriggerPress = true;
                        longPressEvent(true);
                   }
                }
            }

            if(HoriDragGetSpeed!=null)
            {
                
                DragHoriBySpeed(true);
               
            }

            if(slierForX!=null)
            {
                SliderHoriForX(true);
                mousePose = Input.mousePosition;
            }


        }else if(Input.GetMouseButton(1))
        { 
            if(sliderForXY!=null)
            {
                SliderEventXY(2);
            }
        }

       // mousePose = Input.mousePosition;
    }
    static Touch oldTouch1;
    static Touch oldTouch2;
    static Vector3 oldScale = Vector3.one;
    private static void MoblieLogic()
    {

        #region 监听旋转事件

        if(RotateItemEvent!=null)
        {
            if (Input.touchCount == 1)
            {
                Touch touch = Input.GetTouch(0);
                Vector2 deltaPos = touch.deltaPosition;

                if(Mathf.Abs(deltaPos.x) > 2)
                {
                    oldRotate.y += Time.deltaTime * -deltaPos.x * 2.5f;
                    RotateItemEvent(oldRotate);
                }
            }
        }

        #endregion

        # region 监听缩放事件
        if(ScaleItemEvent!=null)
        {
            if(Input.touchCount == 2)
            {
                Touch newTouch1 = Input.GetTouch(0);
                Touch newTouch2 = Input.GetTouch(1);
                if (newTouch2.phase == TouchPhase.Began)
                {
                    oldTouch2 = newTouch2;
                    oldTouch1 = newTouch1;
                    return;

                }


                //计算老的两点距离和新的两点间距离，变大要放大模型，变小要缩放模型
                float oldDistance = Vector2.Distance(oldTouch1.position, oldTouch2.position);
                float newDistance = Vector2.Distance(newTouch1.position, newTouch2.position);

                //两个距离之差，为正表示放大手势， 为负表示缩小手势
                float offset = newDistance - oldDistance;

                //放大因子， 一个像素按 0.01倍来算(100可调整)
                float scaleFactor = offset / 100f;
                Vector3 localScale = oldScale;
                Vector3 scale = new Vector3(localScale.x + scaleFactor,
                                        localScale.y + scaleFactor,
                                        localScale.z + scaleFactor);
                oldScale = scale;
                //最小缩放到 0.3 倍
                if (scale.x > 0.1f && scale.y > 0.1f && scale.z > 0.1f)
                {
                    ScaleItemEvent(scale);
                }

                //记住最新的触摸点，下次使用
                oldTouch1 = newTouch1;
                oldTouch2 = newTouch2;
            }
           
        }


        #endregion



        #region 监听双指旋转事件

        if (doubleFingerRotateEvent != null)
        {
            if (Input.touchCount == 2)
            {
                Touch touch1 = Input.GetTouch(0);
                Touch touch2 = Input.GetTouch(1);

                //启用双指，尚未旋转
                if (touch2.phase == TouchPhase.Began)
                {
                    oldTouch2 = touch2;
                    oldTouch1 = touch1;
                    return;
                }
                if (touch1.phase == TouchPhase.Moved || touch2.phase == TouchPhase.Moved)
                {
                    Vector2 curVec = touch2.position - touch1.position;
                    Vector2 oldVec = oldTouch2.position - oldTouch1.position;
                    float angle = Vector2.Angle(oldVec, curVec);
                    angle *= Mathf.Sign(Vector3.Cross(oldVec, curVec).z);
                    doubleFingerRotateEvent(new Vector3(0, angle, 0));
                    oldTouch1 = touch1;
                    oldTouch2 = touch2;
                }
            }

        }


        #endregion

        #region 监听双指同向滑动
        if (doubleFingerDragSameDirection != null)
        {
            if (Input.touchCount == 2)
            {
                Touch touch1 = Input.GetTouch(0);
                Touch touch2 = Input.GetTouch(1);
                //启用双指，尚未移动
                if (touch2.phase == TouchPhase.Began)
                {
                    oldTouch2 = touch2;
                    oldTouch1 = touch1;
                    return;
                }

                if (touch1.phase == TouchPhase.Moved && touch2.phase == TouchPhase.Moved)
                {
                    float t = touch1.position.y - oldTouch1.position.y;
                    doubleFingerDragSameDirection(t);
                    oldTouch1 = touch1;
                    oldTouch2 = touch2;
                }
            }

        }
        #endregion

        #region 监听单指横向滑动

        if (singleFingerDragHorizion != null)
        {
            if (Input.touchCount == 1)
            {

                Touch touch = Input.GetTouch(0);
                Vector2 deltaPos = touch.deltaPosition;
                Debug.Log("deltaPos" + deltaPos);
                if (Mathf.Abs(deltaPos.x) > 2)
                {
                    singleFingerDragHorizion(deltaPos.x);
                }
            }
        }


        #endregion
        #region 监听单指 横纵 滑动
        if (singleFingerDragHorizionVertic != null)
        {
            if (Input.touchCount == 1)
            {
                Touch touch = Input.GetTouch(0);
                singleFingerDragHorizionVertic(touch.deltaPosition);
            }
        }
        #endregion

        if (Input.GetMouseButtonDown(0))
        {


            mousePose = Input.mousePosition;

            #region 点击item
            if(clickSelectItemEvent!=null)
            {
                // 0 = clickDown
                ClickSelectItemEvent(0);
            }

            #endregion

            #region 3dCamera 点击Item
            if(clickSelectItemEvent3DUICamera!=null)
            {
                ClickSelectItemEvent3DUI(0);
            }
            #endregion

            #region 长按事件

            if(longPressEvent !=null )
            {
                isTriggerPress =false;
                pressTimer = Time.time;
               
            }
            #endregion

        }

        if(Input.GetMouseButton(0))
        {
            switch(Input.touchCount)
            {
                case 1:
                    #region 在XY上滑动
                    if(sliderForXY!=null)
                    {
                        SliderEventXY(1);
                        mousePose = Input.mousePosition;
                    }
                    #endregion

                    #region 长按事件
                    if(longPressEvent !=null )
                    {
                        if(!isTriggerPress)
                        {
                            if(Time.time - pressTimer >0.85f)
                            {
                                isTriggerPress=true;
                                longPressEvent(true);
                           
                            }
                        }
                       
                    }
                    #endregion


                    #region 只在X上滑动
                    if(slierForX!=null)
                    {
                        SliderHoriForX(true);
                        mousePose = Input.mousePosition;
                    }

                     #endregion
                    break;
                case 2:

                    #region 双指在xy 上滑动
                    if(sliderForXY!=null)
                    {
                        SliderEventXY(2);
                        mousePose = Input.mousePosition;
                    }
                    #endregion
                    break;
            }
        }

        if(Input.GetMouseButtonUp(0))
        { 
            #region 竖直滑动

            if(VeriDrag!=null)
            {
                DragVeriEvent();
            }

            #endregion

            #region 横向滑动

            if(HoriDrag!=null)
            {
                DragHoriEvent();
            }

            #endregion 


            #region 点击Item
            if(clickSelectItemEvent!=null)
            {
                // 1 = clickUp
                ClickSelectItemEvent(1);
            }
            #endregion


            #region 3dCamera 点击事件
            if(clickSelectItemEvent3DUICamera!=null)
            {
                ClickSelectItemEvent3DUI(1);
            }


            #endregion

            #region 长按时间
            if(longPressEvent!=null)
            {
                isTriggerPress=false;
                longPressEvent(false);
            }

            #endregion


            #region 在X 上滑动
            if(slierForX!=null)
            {
                SliderHoriForX(false);
            }

            #endregion
            switch(Input.touchCount)
            {
                case 0:

                    break;
                case 2:

                    break;
            }

           



        }    
       
       // mousePose =Input.mousePosition;
    }

    public static bool isRun =false;
    public static void StopUpdate()
    {
        if(isRun)isRun =false;
    }
    public static void OnUpdate()
    {
        if(!isRun)
        {
            isRun = true;
        }
        #if UNITY_EDITOR
        EditorLogic();
        #else
        MoblieLogic();
        #endif

    }
    /// <summary>
    /// 0= 向右滑动 ， index--  ；  1= 向左滑动 index++
    /// </summary>
    private static void DragHoriEvent()
    {
        
        if(Input.mousePosition.x - mousePose.x > dragInterval)
        {
            HoriDrag(-1);//向右边

          //  Debug.Log("DragRightDragRightDragRightDragRightDragRightDragRightDragRightDragRightDragRightDragRightDragRightDragRightDragRight");

        }else if(Input.mousePosition.x - mousePose.x < -dragInterval)
        {
            HoriDrag(1);//向左边
            //Debug.Log("DragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeftDragLeft");
        }else
        {
            if(clickEvent!=null)
            {
                ClickEvent();
            }
        }
    }

    private static void DragVeriEvent()
    {
        if(Input.mousePosition.y - mousePose.y > dragInterval)
        {
            VeriDrag(0);//向下拽

        }else if(Input.mousePosition.x - mousePose.x < -dragInterval)
        {
            VeriDrag(1);//向上拽
        }else
        {
            if(clickEvent!=null)
            {
                ClickEvent();
            }
        }
    }

   

    private static void SliderEventXY(int fingerCount)
    {
        Vector2 tmp = new Vector2(Input.mousePosition.x,Input.mousePosition.y);
        if(tmp == mousePose)return;
        Vector2 delta = tmp - mousePose;
        sliderForXY(fingerCount,delta);
    }

    private static void ClickEvent()
    {
        clickEvent();
    }

    //private static RaycastHit hit;
    private static void ClickSelectItemEvent(int doneOrup)
    {
       // if(ARMonsterSceneDataManager.Instance.mainCamera == null || !ARMonsterSceneDataManager.Instance.mainCamera.gameObject.activeSelf)return;
        Ray ray =  ARMonsterSceneDataManager.Instance.GetUsedCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if(Physics.Raycast(ray, out hit , 1000))
        {
            //Debug.Log("hitTarget");
            if(hit.transform!=null)
            {
                if(doneOrup == 0)
                {
                    selectItemKey = hit.transform.name;
                }else
                if(doneOrup == 1)
                {
                    if(selectItemKey == null && selectItemKey =="") return;
                  
                    if(hit.transform.name == selectItemKey)
                    {
                        //判断2次的值相同。就代表Pick物件成功
                        clickSelectItemEvent(hit.transform);
                    }
                }
            }
        }
    }

    private static void ClickSelectItemEvent3DUI(int doneOrup)
    {
        Ray ray =  ARMonsterSceneDataManager.Instance.UI3DCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if(Physics.Raycast(ray, out hit , 100 , 1<<LayerMask.NameToLayer(ONAME.LayerHoloUI)))
        {
            if(hit.transform!=null)
            {
                if(doneOrup == 0)
                {
                    selectItemKey = hit.transform.name;
                }else
                    if(doneOrup == 1)
                {
                    if(selectItemKey == null && selectItemKey =="") return;
                    if(hit.transform.name == selectItemKey)
                    {
                        //判断2次的值相同。就代表Pick物件成功
                        clickSelectItemEvent3DUICamera(hit.transform);
                    }
                }
            }
        }
    }

    private static void DragHoriBySpeed(bool isDown)
    {
        float curTime = Time.time - horiDragGetTimer;
        //Debug.Log("curTime" + curTime);


        float delta = Input.mousePosition.x - mousePose.x ;

       // Debug.Log("delta" + delta);

        float speed =  1;
        if(curTime > 0) speed+= delta / curTime;    
      //  Debug.Log("Speed" + speed);

        HoriDragGetSpeed(delta,speed,isDown);


        mousePose = Input.mousePosition;
        horiDragGetTimer =Time.time;
    }

    private static void SliderHoriForX(bool isDown)
    {
        float offset = Input.mousePosition.x - mousePose.x;
        slierForX(offset,isDown);
    }

}
