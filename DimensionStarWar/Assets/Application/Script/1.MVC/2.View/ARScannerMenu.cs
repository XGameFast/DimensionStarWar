using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ARScannerMenu : UIBasic2 {

    public AndaARWorldController andaARWorldController;
    public GameObject TowerPoint;
    public GameObject MonsterPoint;
    public GameObject MedalPoint;

    public void SetController(AndaARWorldController _andaARWorldController)
    {
        andaARWorldController = _andaARWorldController;
    }

    public void SetItemtoScreenPoint(AndaObjectBasic aob)
    {
        OTYPE.ObjectsIDType objectsIDType = OTYPE.GetObjectsIDType(int.Parse(aob.objectID));
        switch(objectsIDType)
        {
            case OTYPE.ObjectsIDType.monster:
                aob.gameObject.SetInto(MonsterPoint.transform);
                break;
            case OTYPE.ObjectsIDType.stronghold:
                aob.gameObject.SetInto(TowerPoint.transform);
                break;
        }
       
    }

    public void SetItemToMedalPoint(Transform _item)
    {
        _item.SetInto(MedalPoint.transform);
    }
   
}
