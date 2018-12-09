using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class ObjectSelectItem : MonoBehaviour
{
    public Text countText;
    public Image image;
    public int objectID;
    public int objectIndex;
    public int objectCount;
    private Sprite sprite;

    public ObjectSelect objectSelect;
    public void SetInfo(int _objectID , int _objectIndex, int _objectCount, ObjectSelect _objectSelect)
    {
        objectID = _objectID;
        objectIndex = _objectIndex;
        objectCount = _objectCount;
        objectSelect = _objectSelect;
        sprite= AndaDataManager.Instance.GetConsumableSprite(objectID.ToString());
        gameObject.SetTargetActiveOnce(true);
        if (countText != null)
            countText.text = objectCount.ToString();
        if (image != null)
            image.sprite = sprite;
    }

    public void OnClickBack()
    {
        if (objectCount <= 0)
        {
            JIRVIS.Instance.PlayTips("物品数量不够");
            Debug.Log("物品数量不够");
            return;
        }
        if (objectSelect != null)
            objectSelect.SetInfo(objectIndex, objectID, sprite);
        else
            Debug.Log("构造不完整");
    }
}
