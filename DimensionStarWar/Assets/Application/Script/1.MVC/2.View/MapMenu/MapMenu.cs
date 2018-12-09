using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class MapMenu : UIBasic2 {
    public Transform itemBox;
    public GridLayoutGroup grid;
    public ScrollRect scrollRect;
    public RectTransform maskRect;
    public RectTransform contentRect;
    public Transform tmpBox;//用于把item 移除出去的一个临时存放的地方

    private List<MonsterPorItem> mineStrongholdList;
    private List<MonsterPorItem> otherStrongholdList;


    public List<MapUIItem_icon_lvBoard_Name> bussniessItem;
    public List<MapUIItem_icon_lvBoard_Name> playerItem;

    public override void InitValue()
    {
        base.InitValue();
    }

    public override void OnDispawn()
    {
        int count = bussniessItem.Count;
        for(int i = 0 ; i < count; i ++ )
        {
            AndaDataManager.Instance.RecieveItem(bussniessItem[i]);
        }
        bussniessItem.Clear();
        count = playerItem.Count;
        for(int i = 0; i < count; i++)
        {
            AndaDataManager.Instance.RecieveItem(playerItem[i]);
        }
        playerItem.Clear();

        base.OnDispawn();
    }



   

    public void BuildMapItemForMineAndAnotherStronghold(List<PlayerStrongholdAttribute> otherList, List<PlayerStrongholdAttribute> mineList)
    {
        int count = otherList.Count + mineList.Count;
        for(int i = 0 ; i < count ; i ++)
        {
            PlayerStrongholdAttribute _psa = new PlayerStrongholdAttribute();
            if (i < otherList.Count)
            {
                _psa = otherList[i];
            }
            else
            {
                _psa = mineList[i];
            }
           


            PlayerStrongholdConfigAttribute strongholdBaseAttribution = MonsterGameData.GetStrongBasedAttribute();

            int limit = strongholdBaseAttribution.playerStrongholdGrowUpExp[_psa.strongholdLevel];//(_psa.strongholdLevel);//(pma.monsterMaxPower , monsterBaseConfig);

            float per = (float)_psa.strongholdGloryValue / limit;

            MonsterPorItem monsterPor = AndaDataManager.Instance.InstantiateMenu<MonsterPorItem>("ShporMonsterPorItem");

            monsterPor.transform.SetUIInto(transform);

            Color color = AndaGameExtension.GetLevelColor(_psa.strongholdLevel);

            monsterPor.SetStrongholdInfo(_psa.medalLevel, _psa.statueID, per, color);
            //map camera world to screen
            Vector2 screenPose = ARMonsterSceneDataManager.Instance.MapCamera.WorldToScreenPoint(_psa.strongholdInMapPosition);
            //screen to world
            Vector3 p = ARMonsterSceneDataManager.Instance.UICamera.ScreenToWorldPoint(screenPose);

            monsterPor.transform.position = p;

        }

       

    }



    public void SetToGrid(Transform rect)
    {
        rect.SetUIInto(grid.transform);
    }

    /// <summary>
    /// Sets to out.
    /// </summary>
    public void SetToOutGrid(Transform rect)
    {
        rect.gameObject.SetTargetActiveOnce(false);
        rect.SetUIInto(tmpBox);
    }
     

    public void ShowItem(RectTransform rect)
    {
        //获取一点Item脚本，然后加载
        rect.GetComponent<StrongholdInformation_MapItem>().ShowInfo();
        //居中
        CenterOnItem(rect,scrollRect,maskRect,contentRect);
    }

   
}
