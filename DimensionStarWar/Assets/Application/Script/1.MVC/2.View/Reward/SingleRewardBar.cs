using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using GameRequest;
public class SingleRewardBar : UIBasic2 {


    public Text rewardName;
    public Text rewardDes;
    public Text rewardCount;
    public Image rewardImage;
    public GameObject closeBtn;
    public GameObject nextBtn;
    private List<RewardData> rewardDatas;//普通奖励

    private int itemIndex;
    private int maxCount;
    public System.Action ClickCloseBar;
    public override void OnDispawn()
    {
        maxCount= 0;
        itemIndex = 0;
        if (rewardDatas != null) rewardDatas.Clear();
        rewardName.text = "";
        rewardDes.text = "";
        rewardCount.text = "";
        rewardImage.sprite = null;
        base.OnDispawn();
    }

    public void SetInfo(List<RewardData> _rewardDatas)
    {
        rewardDatas = _rewardDatas;
        maxCount = rewardDatas.Count;
        CheckBtnState();
        CheckData(_rewardDatas[itemIndex]);
    }

    private void CheckBtnState()
    {
        if(itemIndex < maxCount -1)
        {
            closeBtn.SetTargetActiveOnce(false);
            nextBtn.SetTargetActiveOnce(true);
        }
        else
        {
            closeBtn.SetTargetActiveOnce(true);
            nextBtn.SetTargetActiveOnce(false);
        }
    }

   
    private void CheckData(RewardData rewardData)
    {
        int group = AndaDataManager.Instance.GetObjectGroupID(rewardData.rewardID);
        switch (group)
        {
            case -1:
                AndaDataManager.Instance.GetStrongholdImg(rewardData.rewardCoupon.bussiIndex, rewardData.rewardCoupon.headImg, SetImage);
                SetData(rewardData.rewardCoupon.couponName, rewardData.rewardCoupon.couponDes, rewardData.rewardCoupon.count);
                break;
            case 1000:
                MonsterBaseConfig mbc = MonsterGameData.GetMonsterBaseConfig(rewardData.rewardID);
                Sprite _sp = AndaDataManager.Instance.GetMonsterIconSprite(rewardData.rewardID.ToString());
                SetData(mbc.monsterName, mbc.monsterDescription, 1);
                SetImage(_sp);
                break;
            case 40000:
                CD_ObjAttr cD_ObjAttr = MonsterGameData.GetCD_ObjAttr(rewardData.rewardID);
                int idType = AndaDataManager.Instance.GetObjTypeID(rewardData.rewardID);
                int smallID = rewardData.rewardID - idType;
                rewardName.text = cD_ObjAttr.objectName[smallID];
                rewardDes.text = cD_ObjAttr.objectDescription[smallID];
                Sprite _sprite = AndaDataManager.Instance.GetConsumableSprite(rewardData.rewardID.ToString());
                SetData(cD_ObjAttr.objectName[smallID], cD_ObjAttr.objectDescription[smallID], rewardData.rewardCount);
                SetImage(_sprite);
                break;
        }
    }

    private void SetData(string itemName, string itemDec, int itemCount)
    {
        rewardName.text = itemName;
        rewardDes.text = itemDec;
        if (itemCount <= 1)
        {
            rewardCount.text = "";
        }
        else
        {
            rewardCount.text = "x" + itemCount.ToString();
        }

    }

    private void SetImage(int shIndex, Sprite _sp)
    {
        SetImage(_sp);
    }

    private void SetImage(Sprite _sp)
    {
        rewardImage.sprite = _sp;
    }



    public void ClickNext()
    {
        if (itemIndex < maxCount)
        {
            itemIndex++;

            if (rewardDatas != null && rewardDatas.Count != 0)
            {
                CheckData(rewardDatas[itemIndex]);
            }

            CheckBtnState();
        }
    }

    public void ClickClose()
    {
        if (ClickCloseBar != null)
        {
            ClickCloseBar();
        }
        AndaDataManager.Instance.RecieveItem(this);
       
    }

}
