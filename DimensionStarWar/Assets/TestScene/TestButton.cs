using System.Collections;
using System.Collections.Generic;
using Mapbox.Unity.Map;
using UnityEngine;

public class TestButton : MonoBehaviour {
    public AbstractMap _map;
    public string pose ;

    public GameObject player;
    Mapbox.Utils.Vector2d vector2D;



    private void Start()
    {
     //   _map.OnUpdated+=SnapMapToTarget;
    }

    public void ClickNingbo()
    {
        /*vector2D = Mapbox.Unity.Utilities.Conversions.StringToLatLon(pose);
       
        _map.UpdateMap(vector2D);
        _map.transform.position = _map.GeoToWorldPosition(vector2D);
       // _map.SetCenterMercator(vector2D);
        Invoke("UpdatePlayerPose",1.5f);*/


        //_map.Initialize();
    }


    public void UpdatePlayerPose()
    {


       
       //_map.TileProvider.Initialize();
       // _map.TileProvider.UpdateTileExtent();
        //Mapbox.Utils.Vector2d center = Mapbox.Unity.Utilities.Conversions.GeoFromGlobePosition(_map.transform.position,1);
      
       // player.transform.localPosition = _map.GeoToWorldPosition(vector2D);

       // _map.transform.position
    }
}
