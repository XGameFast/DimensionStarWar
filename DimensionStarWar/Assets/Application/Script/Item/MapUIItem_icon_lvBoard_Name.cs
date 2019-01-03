using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
//地图上的据点UI专用
public class MapUIItem_icon_lvBoard_Name : AndaObjectBasic {

    public Image userPorImg;
    public Image porImg;
    public Image levelboard;
    public Text shName;
    public Text withDistance;
    public int dataIndex;
    private  int shDataType;
    private StrongholdBaseAttribution strongholdBaseAttribution;
    private System.Action<StrongholdBaseAttribution> clickCallBack;
    private System.Action<Exchange> clickExchage;
    private Exchange exchange;
    private Vector3 worldPose;
    private MapController mapController;

    public override void OnDispawn()
    {
        mapController = null;
        base.OnDispawn();
    }

    public void SetController(MapController _mapController)
    {
        mapController = _mapController;
    }

    public void SetInfo(Exchange _exchange,Vector3 _worldPose)
    {
        worldPose = _worldPose;
        exchange = _exchange;
        shName.text = _exchange.ExchangeName;
        AndaDataManager.Instance.GetOtherPlayerPorImg(_exchange.userIndex,_exchange.headImg, UpdatePorImage );
    }

    public void SetInfo(StrongholdBaseAttribution _shAttr)
    {
        strongholdBaseAttribution = _shAttr;
        worldPose = _shAttr.strongholdInMapPosition;
        shDataType = _shAttr.hostType;
        dataIndex = _shAttr.strongholdIndex;
        switch(shDataType)
        {
            case 0:
                Sprite imgPor = AndaDataManager.Instance.GetStrongholdPorSprite(_shAttr.statueID.ToString());
                Sprite levelBoard = AndaDataManager.Instance.GetStrongholdLevelBoardSprite(_shAttr.strongholdLevel);
                UpdatePorImage(imgPor);
                levelboard.sprite = levelBoard;
                AndaDataManager.Instance.GetPlayerPorImg(SetUserPor);
                break;
            case 1:
               //Sprite imgPor = AndaDataManager.Instance AndaDataManager.Instance.GetStrongholdPorSprite(p.statueID.ToString());

               levelboard.sprite = AndaDataManager.Instance.GetBussinessLevelBoardSprite(_shAttr.strongholdLevel);
                break;
            case 2:

                break;
        }

        float d = AndaGameExtension.GetLatlonDistance(_shAttr.strongholdPosition[0], _shAttr.strongholdPosition[1] , AndaLocaltion.Instance.currentLocation.LatitudeLongitude.x, AndaLocaltion.Instance.currentLocation.LatitudeLongitude.y).DoubleToFloat();
         
        withDistance.text = "距您" + d.FloatToFloat() + "米";

        shName.text = _shAttr.strongholdNickName;
    }
    public void SetUserPor(Sprite _sp)
    {
        userPorImg.sprite = _sp;
    }
    public void RegisterClickCallBack(System.Action<StrongholdBaseAttribution> callback)
    {
        clickCallBack = callback;
    }

    public void RegisterClickCallBack(System.Action<Exchange> callback)
    {
        clickExchage = callback;
    }

    public void UpdatePorImage(Sprite sp)
    {
        porImg.sprite = sp;
    }

    public void ClickItem()
    {
        if(clickCallBack!=null)
        {
            clickCallBack(strongholdBaseAttribution);
        }

        if(clickExchage!=null)
        {
            clickExchage(exchange);
        }
    }

    public void UpdatePose(Vector3 v)
    {
        transform.position = v;
    }

    public void UpdateScale(float v)
    {
        transform.localScale = Vector3.one*v;
    }
    private float baseScaleDistance = 1800;

    public void Update()
    {
        if(mapController!=null)
        {
            Vector2 vector2 = mapController.data.GetCurCamera.WorldToScreenPoint(worldPose);
            Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(new Vector3(vector2.x, vector2.y, 90));
            UpdatePose(p);
            float scale = baseScaleDistance / Vector3.Distance(worldPose, mapController.data.GetCurCamera.transform.position);
            scale = (float)Mathf.Clamp(scale, 0.3f, 2.5f);
            UpdateScale(scale);
        }
    }
}
