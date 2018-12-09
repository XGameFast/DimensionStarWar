using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NetworkTranStructure
{

}

public class NetworkReturnData
{
    public string content { get; set; }
    public bool success { get; set; }

    public string log { get; set; }
}

public class LocationRangeUserData
{
    public List<PlayerData> otherPlayerData { get; set; }
    public List<BusinessData> businessData { get; set; }
}

