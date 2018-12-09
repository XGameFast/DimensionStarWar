using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class ObjectDataValue
{
    public ObjectBasic self;
    public int objectBaseBlood;
    public CD_ObjAttr objectsAtrriute;
    /// <summary>
    /// 数据ID
    /// </summary>
    public int objectID;

    public int currentObjectBlood;

    public void DownloadMessage(ObjectBasic ob)
    {
        self = ob;
        currentObjectBlood = objectBaseBlood = 0;
    }

    public void BuildData(int _objectID)
    {
        objectsAtrriute = MonsterGameData.GetObjectAttribute(_objectID);
        //objectBaseBlood = objectsAtrriute.objectBlood;
        currentObjectBlood = objectBaseBlood;
        objectID = _objectID;
    }



    /// <summary>
    /// 增减血量
    /// </summary>
    /// <param name="value"></param>
    public int UpdateBlodd(int value)
    {
        if (currentObjectBlood <= 0) return -1;
        var tmp = currentObjectBlood + value;
        if (tmp < 0)
            currentObjectBlood = 0;
        else if (tmp >= objectBaseBlood)
            currentObjectBlood = objectBaseBlood;
        else
            currentObjectBlood += value;
        return currentObjectBlood;
    }
}
