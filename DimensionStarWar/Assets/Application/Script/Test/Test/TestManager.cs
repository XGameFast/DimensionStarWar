using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestManager {
  
    private static TestManager _instance =null;

    public static TestManager Instance
    {
        get
        {
            if(_instance == null)
            {
                _instance = new TestManager();
            }

            return  _instance;
        }
    }

    public bool isTestLoadinglocalData =false;
    public bool isClearConfig =false;
}
