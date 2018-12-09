using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class HologarmCameraData  {

 public HologarmCameraView hologarmCameraView;

    private Dictionary<AndaObjectBasic,AndaObjectBasic> hologarmItemDic;

    public void BuildData()
    {
        
    }

    public void BuildMenu()
    {
        if(hologarmCameraView == null)
        {
            hologarmCameraView = AndaUIManager.Instance.PopingMenu2<HologarmCameraView>(ONAME.HologramCameraView);
        }
        hologarmCameraView.Restart();
    }

    public void BuildHologarmInfoItem(AndaObjectBasic andaObjectBasic)
    {
        if(hologarmItemDic == null)
        {
            hologarmItemDic = new Dictionary<AndaObjectBasic, AndaObjectBasic>();
        }
        OTYPE.ObjectsIDType objectsIDType = OTYPE.GetObjectsIDType(int.Parse(andaObjectBasic.objectID));
        switch(objectsIDType)
        {
            case OTYPE.ObjectsIDType.monster:
                HologarmCameraMonsterInfoItem  hologarmCameraMonsterInfoItem = AndaDataManager.Instance.InstantiateMenu<HologarmCameraMonsterInfoItem>(ONAME.HologarmCameraMonsterInfoItems);
                hologarmCameraMonsterInfoItem.SetInto(hologarmCameraView.transform);
                //赋值
                hologarmCameraMonsterInfoItem.SetObjectsData(andaObjectBasic);
                hologarmItemDic.Add(andaObjectBasic,hologarmCameraMonsterInfoItem);
                break;
        }

    }

    public void UpdateHologarmInfoItemposition(AndaObjectBasic andaObject)
    {
        Vector3 vector3 = new Vector3( andaObject.selfPosX,andaObject.selfPosY+0.3f,andaObject.selfPosZ);
        Vector2 position = ConvertTool.ConvertWorldPositionToUIPosition(ARMonsterSceneDataManager.Instance.mainCamera, vector3);
        hologarmItemDic[andaObject].UpdateWorldToScreenPoint(position);
    }

    public void RemoveHologarmInfoItem(AndaObjectBasic andaObjectBasic)
    {
        if(hologarmItemDic == null)return;
        if(!hologarmItemDic.Keys.Contains(andaObjectBasic))return;
        AndaDataManager.Instance.RecieveItem(hologarmItemDic[andaObjectBasic]);
        hologarmItemDic.Remove(andaObjectBasic);
    }



    public bool CheckHasThisObject(AndaObjectBasic andaObject)
    {
        if(hologarmItemDic == null)return false;
        return hologarmItemDic.Keys.Contains(andaObject);
    }
}
