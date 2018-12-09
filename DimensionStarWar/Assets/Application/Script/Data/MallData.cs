using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MallData {
    public List<LD_Commodity> commodityList;
    public void InitValue()
    {

    }

    public void BuildData()
    {
        List<CD_Mall> list = MonsterGameData.cd_Mall;
        foreach (var go in list)
        {
            if (commodityList == null) commodityList = new List<LD_Commodity>();
            commodityList.Add(ConvertTool.ConvertMallData(go));
        }
    }



    #region 获取数据
    public List<LD_Commodity> GetAllCommodity()
    {
        return commodityList;
    }

    public List<LD_Commodity> GetConsumalfForMonster()
    {
        List<LD_Commodity> list = new List<LD_Commodity>();
        foreach (var go in commodityList)
        {
            if (OTYPE.CheckIDTypeIsConsumable(go.c_id))
            {
                list.Add(go);
            }
        }
        return list;
    }
    public List<LD_Commodity> GetConsumalForUser()
    {
        List<LD_Commodity> list = new List<LD_Commodity>();
        foreach (var go in commodityList)
        {
            if (OTYPE.CheckIDTypeIsObjets(go.c_id))
            {
                list.Add(go);
            }
        }
        return list;
    }
    #endregion
}
