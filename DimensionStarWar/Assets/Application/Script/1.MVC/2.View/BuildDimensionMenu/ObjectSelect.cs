using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ObjectSelect : MonoBehaviour {


    public int typeID;
    public int selectObjectIndex;
    public int selectObjectID;
    public Image selectObjectImage;
    private Sprite baseSprit; 
    public Text nameText;
    public void SetInfo(int _selectObjectIndex,int _selectObjectID,Sprite sprite,string _nameText="")
    {
        if (baseSprit == null)
            baseSprit = selectObjectImage.sprite;
        selectObjectImage.sprite = sprite;
        selectObjectIndex = _selectObjectIndex;
        selectObjectID = _selectObjectID;
        nameText.text = _nameText;
    }
    public void InitValue()
    {
        selectObjectImage.sprite = baseSprit;
        selectObjectIndex = 0;
        selectObjectID = 0;
        nameText.text = "";
    }
}
