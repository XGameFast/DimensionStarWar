using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoginBtn : MonoBehaviour {

    public ActiveTools activeTools;

    public Transform board;
    public void Click()
    {
        activeTools.PlayRotate(board, 2.5f, 1, new Vector3(0, 0, 360));
        activeTools.PlayScale(board,1, 0, Vector3.one* 1.5f);
    }
}
