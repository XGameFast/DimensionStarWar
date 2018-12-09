using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mapbox.Utils;
using Mapbox.Unity.Location;
public class AndaMap  {

    private static AndaMap _instance = null;

    public static AndaMap Instance
    {
        get 
        {
            if(_instance == null)
            {
                _instance = BuildAndamap();
            }
            return _instance;
        }
    }

    public AndaMapController andaMapController ;
    public AndaMapData andaMapData;
    private System.Action FinishBuildMap;
    public Vector2d curMapLatlon = Vector2d.zero;
    public Vector2d latMapLatlon;
    public void SetController(AndaMapController _andaMapController)
    {
        andaMapController = _andaMapController;
    }

    public static AndaMap BuildAndamap()
    {
        AndaMap andaMap = new AndaMap();
        andaMap.BuildMapdata();
        return andaMap;
    }



    private void BuildMapdata()
    {
        if(andaMapData == null)
        {
            andaMapData = new AndaMapData();
        }
        andaMapData.BuildData();
    }

    public void BuildVVMap()
    {
       // andaMapController.BuildMap
    }

    public void BuildARMap()
    {

    }

    public void BuildMap(System.Action finish)
    {
        
        andaMapController.BuildMap(andaMapData.GetMapCenterVector2d);

        if (finish != null)
        {
            finish();
        }
        /*
        //AndaTips: 如果 curMapLatlon = zero，代表需要定位
        if (curMapLatlon.Equals(Vector2d.zero))
        {
            FinishBuildMap = finish;
            andaMapController.StartCoroutine(AndaLocaltion.Instance.GetLocationOnce(FinishGetLocation));


        }else
        {
            if(curMapLatlon.Equals(Vector2d.zero))return;
            latMapLatlon = curMapLatlon;
            NewBuildMap(finish);
        }*/
    }

    private void NewBuildMap(System.Action finish)
    {
        andaMapController.BuildMap(curMapLatlon);
        if(finish!=null)
        {
            finish();
        }
    }

    private void FinishGetLocation(Location location)
    {
        curMapLatlon = location.LatitudeLongitude;
        NewBuildMap(FinishBuildMap);
    }

  
    public void CloseMap(System.Action callback = null)
    {
       andaMapController.CloseMap();
    }

    public Vector3 GeoToWorldPoseWithCurrentLatlong()
    {
        return ConvertGeopointToGameworldpoint(andaMapData.GetMapCenterVector2d);
    }

    public Vector3 ConvertGeopointToGameworldpoint(Vector2d vector2d)
    {
       return andaMapController.GeoToWorldPosition(vector2d);

    }

    public Vector2d ConverGameworldPointToGeopoint(Vector3 vector3)
    {
        return andaMapController.WorldToGeoPosition(vector3);
    }

    public Vector3 GetCurrentlocationtoWorldpoint()
    {
     return andaMapController.GeoToWorldPosition(AndaLocaltion.Instance.currentMapLocation);
    }

    public void UpdatemapTileCenterPoint(Vector3 camerapose)
    {
        andaMapController.UpdateTilesMaterialCenterPose(camerapose);
    }

    public void UpdateMapLatlon(Vector2d latlog)
    {
        curMapLatlon = latlog;
    }



   
}

