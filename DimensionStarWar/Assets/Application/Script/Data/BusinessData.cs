using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BusinessDataScript :UserDataBaseScript {
    public BusinessData businessData;
    public override void InitValue()
    {
        base.InitValue();
        businessData = new BusinessData();
    }

    public override void SetData(UserBaseData userBaseData)
    {
        base.SetData(userBaseData);
        businessData = userData as BusinessData;
        SetPlayerStorngholdAttribute(businessData.strongholdList);
    }

    public virtual void SetPlayerStorngholdAttribute(List<BusinessStrongholdGrowUpAttribute> list)
    {
        foreach (var go in list)
        {
            UpdateStrongholdList(go);
        }
    }
    
    public virtual void UpdateStrongholdList(BusinessStrongholdGrowUpAttribute sgb)
    {
        BusinessStrongholdAttribute value = ConvertTool.ConvertToBusinessStrongholdData(sgb);
        value.hostType = userType;
        userStrongholdList.Add(value);
    }
}
