using System.Collections;
using System.Collections.Generic;
using Mapbox.Utils;
using System;
using UnityEngine;
using Mapbox.Unity.Utilities;
using Mapbox.Map;
using Mapbox.Unity.Map;
using Mapbox.Unity;
using Mapbox.Unity.Location;
using Mapbox.Unity.MeshGeneration.Data;
using System.Linq;
public class AndaMapController : MonoBehaviour {

    public AbstractMap abstractMap;

    public Transform Root;
    private System.Action CallBackFinishbuildMap;
    private System.Action FinishBuildMap;
    private bool isBuildedMap =false;

    private void Awake()
    {
        AndaMap.Instance.SetController(this);
    }

    public void BuildMap(Vector2d latlon)
    {
        if(!isBuildedMap)
        {
            abstractMap.Initialize(latlon , 14);
            isBuildedMap = true;
        }else
        {
            abstractMap.UpdateMap(latlon);   
        }  
    }

    public void BuildVVMapConfgi()
    {

    }

    public void BuildARMapConfig()
    {

    }

    public void CloseMap()
    {
        
    }

    public void TileState(bool isDisplay)
    {
        List<Transform> ts = abstractMap.transform.GetChildList();
        int count =  ts.Count;
        for(int i = 0; i < count; i++)
        {
            ts[i].gameObject.SetActive(isDisplay);
        }
    }

    public Vector3 GeoToWorldPosition(Vector2d vector2d)
    {
        return abstractMap.GeoToWorldPosition(vector2d);
    }
    public Vector2d WorldToGeoPosition(Vector3 pose)
    {
        return abstractMap.WorldToGeoPosition(pose);
    }


    public void UpdateTilesMaterialCenterPose(Vector3 pose)
    {
        //if(tiles ==null || tiles.Count == 0)return;
       /* foreach(var go in _mapVisualizer.ActiveTiles.Values)
        {
            Vector4 vector4 = new Vector4(pose.x,0,pose.z,0);
            go.MeshRenderer.material.SetVector("_Center",vector4);
        }*/
    }

    #region 定位



    #endregion
}
