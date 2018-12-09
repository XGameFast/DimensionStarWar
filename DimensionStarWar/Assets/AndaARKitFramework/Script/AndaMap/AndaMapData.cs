using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mapbox.Utils;
public class AndaMapData {
    public Vector3 getMapcenterGameworldPose
    {
        get {return mapCenterGameworldPose ;}
    }
    private Vector3 mapCenterGameworldPose;

    public List<double> GetMapCenterLatlon {get {return  mapCenterLatlon ;}}

    public Vector2d GetMapCenterVector2d { get {return new Vector2d(mapCenterLatlon[0],mapCenterLatlon[1]);}}
	
    private List<double> mapCenterLatlon;

    public void BuildData()
    {
        
    }

    public void SetMapCenterForGameWorld(Vector3 _mapCenterPose)
    {
        mapCenterGameworldPose = _mapCenterPose;
    }

    #region 设置当前地图中心经纬度，用于构建地图 和 获取周围POI 数据
    public void SetCurrentMapCenterLatlong(List<double> _v)
    {
        mapCenterLatlon = _v;
    }

    #endregion
}
