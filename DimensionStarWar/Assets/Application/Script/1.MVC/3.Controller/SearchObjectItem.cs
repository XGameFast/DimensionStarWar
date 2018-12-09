using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;


public class SearchObjectItem : AndaObjectBasic {

    public SearchMenu searchMenu;
    public SearchController searchController;
    public SearchObject searchObject;
    public Renderer rendererObj;

    public void Click()
    {
        //searchMenu.ShowObjectDetail(this);
        searchController.ClickPickUpItem(this);
       // Debug.Log("查看物品:"+ searchObject.objectID);
    }

    public void SetID(int id)
    {
       // transform.GetComponentInChildren<TextMesh>().text = id.ToString();
    }
    public void SetController(SearchController _searchController)
    {
        searchController = _searchController;
    }
    public void SetMenu(SearchMenu _menu)
    {
        searchMenu = _menu;
    }
    public void SetObjectInfo(SearchObject _searchObejct)
    {
        searchObject = _searchObejct;
    }

    public void SetAlpah(float i)
    {
        rendererObj.material.SetFloat("_Alpha" , i);
    }


}
