using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoBar_Icon_Board_List : AndaObjectBasic {
    /*构建多个item
     * 每个item 的 icon ,board 都可以独立赋值
     */
    public GameObject item;
    public UIGrid grid;
    public void SetValue(List<int> idList, List<int> boardIDList)
    {
        for (int i = 0; i < idList.Count; i++)
        {
            var t = item.Clone();
            t.SetTargetActiveOnce(true);
            t.GetComponent<Item_Icon_board>().SetValue(idList[i], boardIDList[i]);
            t.SetInto(grid.transform);
        }
        grid.Reposition();
    }
}
