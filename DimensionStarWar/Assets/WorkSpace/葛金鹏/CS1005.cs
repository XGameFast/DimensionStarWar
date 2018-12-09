using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CS1005 : MonoBehaviour {

    public void hello()
    {
        transform.parent.Find("1004").GetComponent<M_1004>().ControllerToPlayMoodForSayHello00();
    }
    public void fankui01()
    {
        transform.parent.Find("1004").GetComponent<M_1004>().ControllerToPlayMoodForHudong00();
    }
}
