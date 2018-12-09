using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaTool_FingerEvent : ToolBasic {

    private FingerState currentFingerState= FingerState.fingerup;

    public enum FingerState
    {
        fingerup = 0,
        fingerdown = 1,
        fingerstay = 2,
        fingerdrag =3,
    }
    private DragDirType currentDragDirType;
    private Vector3 startDragPoint;
    private Vector3 currentFingerPoint;
    public enum DragDirType
    {
        all = 0,

        vertical = 1,
        verticalUp =2,
        verticalDown =3,
        horizon = 4,
        horizonLeft = 5,
        horizonRight = 6 ,
    }

    private bool isStartCheck = false;

    private System.Action CallBackFinishDrag;
    

    public void SetListenererticalDragEvent(int checkType, System.Action callback)
    {
        CallBackFinishDrag = callback;
        currentDragDirType = (DragDirType)checkType;
        isStartCheck = true;
    }

    private void ListenHorizonDragEvent()
    {
        if (currentFingerState == FingerState.fingerup) return;
        float dragDst = currentFingerPoint.x - startDragPoint.x;
        switch (currentDragDirType)
        {
            case DragDirType.horizon:
                if (Mathf.Abs(dragDst) > 300) CallBackFinishDrag();
                break;
            case DragDirType.horizonLeft:
                if (dragDst < -300) CallBackFinishDrag();
                break;
            case DragDirType.horizonRight:
                if (dragDst > 300) CallBackFinishDrag();
                break;
        }
    }

    private void ListenVerticalDragEvent()
    {
        if (currentFingerState == FingerState.fingerup) return;
        float dragDst = currentFingerPoint.y - startDragPoint.y;
        switch (currentDragDirType)
        {
            case DragDirType.vertical:
                if (Mathf.Abs(dragDst) > 500) CallBackFinishDrag();
                break;
            case DragDirType.verticalDown:
                if (dragDst < -500) CallBackFinishDrag();
                break;
            case DragDirType.verticalUp:
                if (dragDst > 500)
                {
                    CallBackFinishDrag();
                    startDragPoint = currentFingerPoint;
                }
                break;
        }
    }

    private void ListenAnyDirDragEvent()
    {

    }

    


    protected override void OnUpdate()
    {
        base.OnUpdate2();
        if (!isStartCheck) return;
        ListenFingerState();
        //---Anda---//
        if (currentDragDirType == DragDirType.vertical || currentDragDirType == DragDirType.verticalDown || currentDragDirType == DragDirType.verticalUp)
        {
            ListenVerticalDragEvent();
        }
        else
        if (currentDragDirType == DragDirType.horizon || currentDragDirType == DragDirType.horizonRight || currentDragDirType == DragDirType.horizonLeft)
        {
            ListenHorizonDragEvent();
        }
        else
        {
            ListenAnyDirDragEvent();
        }
    }

    private void ListenFingerState()
    {

        if (Input.GetMouseButtonDown(0))
        {
            currentFingerState = FingerState.fingerdown;
            startDragPoint = Input.mousePosition;
        }

        if (Input.GetMouseButtonUp(0))
        {
            currentFingerState = FingerState.fingerup;
        }

        if (Input.GetMouseButton(0))
        {
            currentFingerPoint = Input.mousePosition;
        }

        return;
#if UNITY_EDITOR


        if (Input.GetMouseButtonDown(0))
        {
            currentFingerState = FingerState.fingerdown;
        }

        if (Input.GetMouseButtonUp(0))
        {
            currentFingerState = FingerState.fingerup;
        }

       

#else
        if (Input.touchCount != 0)
        {
          currentFingerState = FingerState.fingerdown;
        }else
        {
            currentFingerState = FingerState.fingerup;
        }
#endif
    }
}
