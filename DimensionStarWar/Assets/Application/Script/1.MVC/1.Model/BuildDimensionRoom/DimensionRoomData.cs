using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class DimensionRoomData{


    public DimensionMonsterInfoHologarmScreen getDimensionMonsterInfoHologarmScreen
    {
        get {
            if(monsterInfoBar == null)
            {
                BuildDimensionMonsterInfomationBar(dimensionRoom.hologarmScreenPoint.transform);
            }
            return monsterInfoBar;
        }
    }
    public AndaObjectBasic getDimensionBox
    {
        get { return dimensionBox; }
    }

    private AndaObjectBasic dimensionBox;
    private DimensionRoom dimensionRoom;
    private DimensionMonsterInfoHologarmScreen monsterInfoBar;


    public void BuildData(DimensionRoom _dimensionroom)
    {
        dimensionRoom = _dimensionroom;
        InitData();
    }

    public void InitData()
    {
        RemoveDimensionBox();
        RemoveDimensionInformaitonBar();
    }

    public void RemoveDimensionBox()
    {
        if(dimensionBox!=null)
        {
            dimensionBox.DestroyByAndaDataManager();
        }
    }

    public void RemoveDimensionInformaitonBar()
    {
        if(monsterInfoBar!=null)
        {
            monsterInfoBar.DestroyByAndaDataManager();
        }
    }

    public void BuildDimensionBox()
    {
        if (dimensionBox == null)
        {
            dimensionBox = AndaDataManager.Instance.InstantiateOtherObj(ONAME.DimensionRoomBox);
            dimensionBox.SetInto(dimensionRoom.transform);
            dimensionBox.transform.localScale *= 3;
            dimensionBox.transform.localPosition = dimensionRoom.transform.up * 1.4f;
        }
    }

    public void BuildDimensionMonsterInfomationBar(Transform point)
    {
        if(monsterInfoBar == null)
        {
            monsterInfoBar = AndaDataManager.Instance.InstantiateMenu<DimensionMonsterInfoHologarmScreen>(ONAME.DimensionMonsterInfomaitonHologarmBar);
            monsterInfoBar.SetInto(point.GetChild(0).transform);

        }

        Vector3 vector3 = ARMonsterSceneDataManager.Instance.GetCameraPositionWihtSelfY(point.transform.position.y);

        Vector3 fwd = vector3 - point.position;

        point.forward = -fwd;

       
        //point.transform.LookAt(vector3);
    }
}
