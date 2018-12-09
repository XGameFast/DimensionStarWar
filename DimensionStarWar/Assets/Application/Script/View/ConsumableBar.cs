using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConsumableBar : SelectItemBar
{
    public GameObject itemPrefab;
    private List<LD_Objs> consumableList;
    private List<ConsuableItem> consuableItemList;
    public override void InitValue()
    {
        base.InitValue();
        if (consuableItemList != null)
        {
            foreach (var go in consuableItemList)
            {
                Destroy(go);
            }
        }
    }
    public override void BuildItem(object data)
    {
        base.BuildItem(data);
        consumableList = data as List<LD_Objs>;
        consuableItemList = new List<ConsuableItem>();
        foreach (var go in consumableList)
        {
            var item = itemPrefab.Clone();
            var t = item.GetComponent<ConsuableItem>();
            t.SetValue(go);
            item.transform.SetParent(uiGrid.transform);
            item.ResetTran();
            consuableItemList.Add(t);
        }
        uiGrid.Reposition();
        itemBoard.SetActive(true);
    }

    public void UpdateContent(LD_Objs pca)
    {
        consuableItemList[currentIndex].UpdateValue(pca.lessCount);
    }

}
