using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using GoogleARCore;
public class DeviceCheckTool : MonoBehaviour {

    public bool CheckDevice()
    {
#if !UNITY_EDITOR && UNITY_IPHONE
        return IphoneLogic();
#elif !UNITY_EDITOR && UNITY_ANDROID
        return AndroidLogic();
#else
        return PCLoigc();
#endif
    }

    private bool IphoneLogic()
    { 
        return IPHONEDEVICELIST.Contains(CurrentDeviceModel());
    }

    private bool AndroidLogic()
    {

        int count = ANDROIDDEVICELIST.Count;
        string name = CurrentDeviceModel();
        for (int i = 0 ; i< count; i++)
        {
            if(name.Contains(ANDROIDDEVICELIST[i]))
            {
                return true;
            }
        }

        return false;
    }

    private bool PCLoigc()
    {
        return true;
    }

    private string CurrentDeviceModel()
    {
        JIRVIS.Instance.PlayTips(SystemInfo.deviceName);
        return SystemInfo.deviceModel;
    }

    private List<string> IPHONEDEVICELIST  = new List<string>
    {
        "iPhone8,1",/*6s*/
        "iPhone8,2",/*6s plus*/
        "iPhone8,4",/*SE*/
        "iPhone9,1",/*7*/
        "iPhone9,2",/*7plus*/
        "iPhone9,3",/*美版 7*/
        "iPhone9,4",/*美版 7p*/
        "iPhone10,1",/*国行 8*/
        "iPhone10,4",/*美版 8*/
        "iPhone10,2",/*国行 8 plus*/
        "iPhone10,5",/*美版 8 plus*/
        "iPhone10,3",/*国行 日 iphonex*/
        "iPhone10,6", /*美版 iphonex*/
        "iPhone11,2", /*xs*/
        "iPhone11,6",/*XS MAX*/
        "iPhone11,8",/*XR*/
    };

    private List<string> ANDROIDDEVICELIST = new List<string>
    {
        "EML-AL00",
        "EML-TL00",
        "CLT-TL01",
        "CLT-TL00",
        "CLT-AL01",
        "CLT-AL00l",
        "CLT-AL00",
        "NEO-AL00",
        "MI Mix 2S",
        "MI 8",
        "MI 8 SE",
    };
}
