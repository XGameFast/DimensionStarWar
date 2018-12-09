using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;
using System.Linq;

public class MallMenuData : ControllerData
{

    public MallDetail mallDetail;

    public List<CD_Mall> cd_Malls;
    public List<CD_MallDetail> cd_MallDetails;
    public int getCurOpenType
    {
        get { return curOpenType; }
    }
    #region 局部变量
    private MallController menuController;
    private MallMenu mallMenu;

    // type = 1药水 2传送门 3图纸 4探测器 5货币 6小物件 7幸运物
    private int curOpenType = 1;
    #endregion

    //初始化数据
    public void InitValue()
    {
        if (mallMenu != null)
        {
            AndaDataManager.Instance.RecieveItem(mallMenu);
            m_Menu = null;
        }

        curOpenType = -1;
    }
    public override void BuildData(BaseController _baseController)
    {
        base.BuildData(_baseController);
        menuController = baseController as MallController;
        InitValue();
    }

    public override void BuildMenu(string menuname)
    {
        base.BuildMenu(menuname);
        mallMenu = getm_Menu as MallMenu;
    }
    public void BuildData()
    {
        //if (cd_Malls == null)
        //{
        //    string jsonstr = PlayerPrefs.GetString("MallConfig.txt");
        //    Debug.Log(jsonstr);
        //    cd_Malls = JsonMapper.ToObject<List<CD_Mall>>(jsonstr);
        //}

        //if (cd_MallDetails == null)
        //    cd_MallDetails = new List<CD_MallDetail>();
        //从服务器中拉取限时限量的数据
        AndaDataManager.Instance.MallDetail(callBack);
    }
    public void callBack(List<CD_MallDetail> list)
    {
        Debug.Log(list.Count);
        cd_MallDetails = list;

        switch (curOpenType)
        {
            case 1:
                mallMenu.BuildConsumableItem(cd_MallDetails.Where(o => o.objectID >= 40000 && o.objectID < 41000).ToList());
                break;
            case 2:
                mallMenu.BuildConsumableItem(cd_MallDetails.Where(o => o.objectID >= 42000 && o.objectID <= 42009).ToList());
                break;
            case 3:
                mallMenu.BuildConsumableItem(cd_MallDetails.Where(o => o.objectID >= 42010 && o.objectID <= 42019).ToList());
                break;
            case 4:
                mallMenu.BuildConsumableItem(cd_MallDetails.Where(o => (o.objectID >= 42020 && o.objectID <= 42029)||(o.objectID>=42060 && o.objectID <= 42069)).ToList());
                break;
            case 5:
                mallMenu.BuildConsumableItem(cd_MallDetails.Where(o => o.objectID >= 42030 && o.objectID <= 42059).ToList());
                break;
            case 6:
                mallMenu.BuildConsumableItem(cd_MallDetails.Where(o => o.objectID >= 43000 && o.objectID <= 43999).ToList());
                break;
            case 7:
                mallMenu.BuildConsumableItem(cd_MallDetails.Where(o => o.objectID >= 44000 && o.objectID <= 44999).ToList());
                break;
        }
    }
    public void BuildConsumableItem()
    {
        //加载数据
        BuildData();
        //加载列表
        mallMenu.BuildConsumableItem(cd_MallDetails);
    }
    public void BuildTypeObject()
    {
        //加载数据
        BuildData();
        //加载列表
    }



    public void SetCurOpenType(int _type)
    {
        curOpenType = _type;
    }

    public void ShowMallDetail(CD_MallDetail info)
    {
        if (mallDetail == null)
        {
            mallDetail = AndaDataManager.Instance.InstantiateMenu<MallDetail>(ONAME.MallDetail);
            mallDetail.FadeIn();
        }
        mallDetail.BuildData(info, CloseMallDetail, mallMenu);
        mallDetail.SetInfo();
        mallDetail.transform.SetUIInto(getm_Menu.transform);
    }
    public void CloseMallDetail()
    {
        AndaDataManager.Instance.RecieveItem(mallDetail);
        mallDetail = null;
    }
}
