using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class MonsterPorItem : AndaObjectBasic {


    //据点的 也可以用这个

    private AndaObjectBasic levelBoardItem;
    private AndaObjectBasic stuteItem;
    public Button boardButton;

    public override void OnDispawn()
    {
        if (stuteItem != null)
        {
            AndaDataManager.Instance.RecieveItem(stuteItem);
            stuteItem = null;
        }

        if (levelBoardItem!=null)
        {
            AndaDataManager.Instance.RecieveItem(levelBoardItem);
            levelBoardItem = null;
        }

        base.OnDispawn();
    }

    public void SetStrongholdExpSlider(float value , Color color)
    {

        levelBoardItem.GetComponentInChildren<Slider>().value = value;
        levelBoardItem.GetComponentInChildren<Image>().color = color;
       
    }
    public void SetMonsterExpSlider(float value ,Color color)
    {
        levelBoardItem.GetComponentInChildren<Slider>().value = value;
        levelBoardItem.GetComponentInChildren<Image>().color = color;
    }

    public void SetStrongholdInfo(int level, int stuteID , float gloryExp , Color color)
    {
        if(levelBoardItem!=null)AndaDataManager.Instance.RecieveItem(levelBoardItem);
        levelBoardItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("strongholdLevelBoard" + level);
        boardButton = levelBoardItem.GetComponentInChildren<Button>();
        levelBoardItem.SetInto(transform);
        if(stuteItem!=null)AndaDataManager.Instance.RecieveItem(stuteItem);
        stuteItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("strongholdPor" + stuteID);
//      stuteItem.GetComponent<Button>().enabled =false;
        stuteItem.SetInto(levelBoardItem.transform);
        SetStrongholdExpSlider(gloryExp , color);
    }

    public void SetBussinessStrongholdInfo(int _bsSHIndex,int _level, string headImg, ItemScrollStruct itemScrollStruct)
    {
        if (levelBoardItem != null) AndaDataManager.Instance.RecieveItem(levelBoardItem);
        levelBoardItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("bussinessLevelBoard" + _level);
        boardButton = levelBoardItem.GetComponentInChildren<Button>();
        levelBoardItem.SetInto(transform);
        if (stuteItem != null) AndaDataManager.Instance.RecieveItem(stuteItem);
        stuteItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("spritePor_2");
        stuteItem.SetInto(levelBoardItem.transform);
        Material mt = stuteItem.GetComponent<Image>().material;
        mt.SetVector("_Center" , new Vector4(itemScrollStruct.center.x, itemScrollStruct.center.y, itemScrollStruct.center.z,0) );
        mt.SetFloat("_HeightLimit" , itemScrollStruct.distance);
        AndaDataManager.Instance.GetStrongholdImg(_bsSHIndex , headImg , SetStrongholdPor);
    }

    public void SetExchangeInfo(int _bsSHIndex, string headImg, ItemScrollStruct itemScrollStruct)
    {
        if (levelBoardItem != null) AndaDataManager.Instance.RecieveItem(levelBoardItem);
        levelBoardItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("exchangeLevelBoard0");
        boardButton = levelBoardItem.GetComponentInChildren<Button>();
        levelBoardItem.SetInto(transform);
        if (stuteItem != null) AndaDataManager.Instance.RecieveItem(stuteItem);
        stuteItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("spritePor_3");
        stuteItem.SetInto(levelBoardItem.transform);
        Material mt = stuteItem.GetComponent<Image>().material;
        mt.SetVector("_Center", new Vector4(itemScrollStruct.center.x, itemScrollStruct.center.y, itemScrollStruct.center.z, 0));
        mt.SetFloat("_HeightLimit", itemScrollStruct.distance);
        AndaDataManager.Instance.GetStrongholdImg(_bsSHIndex, headImg, SetStrongholdPor);
    }

    private void SetStrongholdPor(int index ,Sprite _sprite)
    {
        stuteItem.GetComponent<Image>().sprite = _sprite;
    }

    public void SetMonsterInfo(int level, int monsterID, float gloryExp, Color color)
    {
        if (levelBoardItem != null) AndaDataManager.Instance.RecieveItem(levelBoardItem);
        levelBoardItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("monsterLevelBoard" + level);
        boardButton = levelBoardItem.GetComponentInChildren<Button>();
        levelBoardItem.SetInto(transform);
        if (stuteItem != null) AndaDataManager.Instance.RecieveItem(stuteItem);
        stuteItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("monsterPor" + monsterID);
      
        //stuteItem.GetComponent<Button>().enabled = false;
        stuteItem.SetInto(levelBoardItem.transform);
        SetMonsterExpSlider(gloryExp, color);
    }

    //构建商家据点按钮
  /*  public void SetBussinessInfo(int level, string imgPath)
    {
        if (levelBoardItem != null) AndaDataManager.Instance.RecieveItem(levelBoardItem);
        levelBoardItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("bussinessLevelBoard" + level);
        boardButton = levelBoardItem.GetComponentInChildren<Button>();
        levelBoardItem.SetInto(transform);
        if (stuteItem != null) AndaDataManager.Instance.RecieveItem(stuteItem);
        stuteItem = AndaDataManager.Instance.InstantiateMenu<AndaObjectBasic>("monsterPor" + monsterID);
        //stuteItem.GetComponent<Button>().enabled = false;
        stuteItem.SetInto(levelBoardItem.transform);
        //SetMonsterExpSlider(gloryExp, color);
    }*/

}
