using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using LitJson;

public class AndaPlayerCouponManager  {

    private static AndaPlayerCouponManager _instance = null;
    public static AndaPlayerCouponManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new AndaPlayerCouponManager();
            }
            return _instance;
        }
    }

    public PlayerCouponView playerCouponView;

    public List<PlayerCoupon> PlayerCouponData;

    public  PlayerCoupon selectPlayerCoupon;


    public  PlayerCouponDetail playerCouponDetail;




    public  void SetPlayerDetail(PlayerCoupon _selectPlayerCoupon)
    {
        selectPlayerCoupon = _selectPlayerCoupon;
        if (playerCouponDetail == null)
        {
            playerCouponDetail = AndaDataManager.Instance.InstantiateMenu<PlayerCouponDetail>(ONAME.PlayerCouponDetail);
            playerCouponDetail.SetInto(AndaUIManager.Instance.jirvis_top);
        }
        playerCouponDetail.Open(selectPlayerCoupon);
    }



    public void SetPlayerCoupon()
    {
        AndaDataManager.Instance.GetPlayerCoupon(GetPlayerCouponBack);
    }

    public void GetPlayerCouponBack(PlayerCouponsRequest res)
    {
        Debug.Log("获取优惠卷列表");
        if (res.code == "200")
        {
            //playerCouponView.SetContentPanel(res.data);
            PlayerCouponData = res.data;
            //消息列表更新
            if (PlayerCouponData !=null)
            {
                var json = JsonMapper.ToJson(PlayerCouponData);
                PlayerPrefs.SetString("PlayerCoupon", json);
            }
        }
    }

    public List<PlayerCoupon> GetPlayerCouponData(int type=-1)
    {
        if (PlayerCouponData == null)
        {
            SetPlayerCoupon();
            //var josn = PlayerPrefs.GetString("PlayerCoupon");
            //if (josn == "")
            //    PlayerCouponData = new List<PlayerCoupon>();
            //PlayerCouponData = LitJson.JsonMapper.ToObject<List<PlayerCoupon>>(josn);
        }
        if (type >= 0)
            return PlayerCouponData.Where(o => o.status == type).ToList();
        else
            return PlayerCouponData;
    }

    
}
