using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WebManager  {

    private static WebManager _instance = null;

    public static WebManager Instance 
    {
        get 
        {
            if(_instance == null)
            {
                _instance = new WebManager();
            }

            return _instance;
        }
    }

    public GameObject webUIObj;

    private UniWebView _uniWebView =null;
    public UniWebView uniWebView 
    {
        get
        {
            if(_uniWebView == null)
            {
                _uniWebView = webUIObj.gameObject.AddComponent<UniWebView>();
                _uniWebView.Build();
            }
            return _uniWebView;
        }
    }

    public void OpenWeb(string url)
    {
        uniWebView.SetURL(url);
    }

}
