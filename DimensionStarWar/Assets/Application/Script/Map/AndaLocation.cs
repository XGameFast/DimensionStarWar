using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Mapbox.Unity.Map;
using Mapbox.Unity.Location;
using Mapbox.Utils;
using System;
using Mapbox.Geocoding;
using Mapbox.Unity;
public class AndaLocaltion  {

    private static AndaLocaltion _instance = null;
    public static AndaLocaltion Instance
    {
        get
        {
            if (_instance == null)
            {

                _instance = new AndaLocaltion();
            }
            return _instance;
        }
    }

    public List<double> getLocationForDoublelist
    {
        get 
        {
            return new List<double>{currentLocation.LatitudeLongitude.x,currentLocation.LatitudeLongitude.y};
        }
    }

    private bool isRegisterReq;
    public ILocationProvider _locationProvider;
    public AbstractMap map;
    public Location currentLocation;
    public Vector2d currentMapLocation;//当前想要查看的坐标位置
    public ReverseGeocodeResponse curReverseGeocodeResponse;
    public System.Action<Location> callBackLocation;
    public List<string> administratorInfomation;
    private bool isAlwayslocation;

    public void GetLocationOnce(System.Action<Location> callBack)
    {
        if(_locationProvider != null)
        {
            callBack(currentLocation);
            return;
        }

      // yield return new  WaitForEndOfFrame();


        AndaUIManager.Instance.OpenWaitBoard("正在建立星域定位图，请稍等，先来看一段魔性舞蹈八");
       
        if(_locationProvider == null)
        {
            _locationProvider = LocationProviderFactory.Instance.DefaultLocationProvider;
        }
       
        _locationProvider.OnLocationUpdated += LocationProvider_OnFirstLocationUpdate;
        if(callBack == null)
        {
            callBackLocation = null;
        }else
        {
            callBackLocation = callBack;
        }
    }

    void LocationProvider_OnFirstLocationUpdate(Location location)
    {
        _locationProvider.OnLocationUpdated -= LocationProvider_OnFirstLocationUpdate;
        currentLocation = location;
        currentMapLocation = location.LatitudeLongitude;
        AndaUIManager.Instance.CloseWaitBoard();
        if (callBackLocation!=null)
        {
            callBackLocation(location);
        }
    }


    private void CallBackFinishLoaction(Location _location)
    {
        if(!isAlwayslocation)
        {
            if(_locationProvider!=null)
            {
                _locationProvider.OnLocationUpdated -= CallBackFinishLoaction;
            }
        }

        currentLocation = _location;
        Debug.Log("currentLocation" +currentLocation.LatitudeLongitude);


        currentMapLocation = currentLocation.LatitudeLongitude;
        callBackLocation(_location);
    }

    ReverseGeocodeResource _resource;
    Geocoder _geocoder;
    private System.Action<ReverseGeocodeResponse> CallBackFinishLoadFeatureName;

    public void GetAdnimitratorAreaInfomation(System.Action<ReverseGeocodeResponse> rsgr)
    {
        CallBackFinishLoadFeatureName = rsgr;
        if (_resource == null)
        {
            _resource = new ReverseGeocodeResource(currentMapLocation);
        }
        if (_geocoder == null)
        {
            _geocoder = MapboxAccess.Instance.Geocoder;
        }
        
        _geocoder.Geocode(_resource, CallBackReverseGeocodeResponse);
    }



    private System.Action <string> callbackFeartureInfo;

    public void GetFeartureInfo(System.Action<string> infos)
    {
        AndaUIManager.Instance.OpenWaitBoard("正在与星域技术局通信，请稍等，先欣赏一段磨人的舞蹈八");
        callbackFeartureInfo =infos;

        if (_resource == null)
        {
            _resource = new ReverseGeocodeResource(currentMapLocation);
        }
        if (_geocoder == null)
        {
            _geocoder = MapboxAccess.Instance.Geocoder;
        }

        _geocoder.Geocode(_resource, CallBackReverseGeocodeResponse);
    }



    private void CallBackReverseGeocodeResponse(ReverseGeocodeResponse rsgr)
    {
        curReverseGeocodeResponse = rsgr;
        if(callbackFeartureInfo!=null)
        {
            if (curReverseGeocodeResponse.Features.Count < 3)
            {
                callbackFeartureInfo("China");
            }
            else
            callbackFeartureInfo(curReverseGeocodeResponse.Features[2].PlaceName);
         
        }
        AndaUIManager.Instance.CloseWaitBoard();
    }



    //获取当前定位的Poi名字
    public string GetGeocodelocationName()
    {
        string contetnt = "";
        contetnt =  curReverseGeocodeResponse.Features[2].PlaceName;
        return contetnt;
    }


}
