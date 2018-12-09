using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StrongholdDataValue {
    public StrongholdBaseController self;
    public StrongholdBaseAttribution sh_dataValue;

    public void DownloadMessage(StrongholdBaseController sbc)
    {
        self = sbc;
    }
    public void SetData(StrongholdBaseAttribution sba)
    {
        sh_dataValue = sba;
    }
}
