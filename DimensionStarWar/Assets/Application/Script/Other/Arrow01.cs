using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Arrow01 : AndaObjectBasic {

    public GameObject leftArrow;
    public GameObject rightArrow;
    public void OpenLeftArrow(bool isOpen)
    {
        leftArrow.SetTargetActiveOnce(isOpen);
    }
    public void OpenRightArrow(bool isOpen)
    {
        rightArrow.SetTargetActiveOnce(isOpen);
    }
}
