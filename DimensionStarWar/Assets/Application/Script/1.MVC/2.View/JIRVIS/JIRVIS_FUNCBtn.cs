using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class JIRVIS_FUNCBtn : JIRVISButtonItemBase {

    public Image btnSprite;
    public Text btnLabel;
    private System.Action CallBackClickBtn;
    private GameObject spriteItem;
    public Transform itemPoint1;
    public Transform itemPoint2;
    public override void OnDispawn()
    {
        if(spriteItem !=null)
        {
            Destroy(spriteItem);
        }
        base.OnDispawn();
    }

    public void SetInfo(int _index , string btn_name,string btnIconName,System.Action callback)
    {

        transform.name = btn_name;
        CallBackClickBtn = callback;
        btnLabel.text = btn_name;
        //Debug.Log("btnIconName" + btnIconName);
        spriteItem = AndaDataManager.Instance.GetSpritePerfab(btnIconName);
        spriteItem = Instantiate(spriteItem);
        spriteItem.transform.SetUIInto(transform);
        spriteItem.gameObject.SetActive(false);

        if (_index % 2 == 0)
        {
            itemPoint2.gameObject.SetTargetActiveOnce(true);
            itemPoint1.gameObject.SetTargetActiveOnce(false);
            spriteItem.SetInto(itemPoint2);
          
        }
        else
        {
            itemPoint2.gameObject.SetTargetActiveOnce(false);
            itemPoint1.gameObject.SetTargetActiveOnce(true);
            spriteItem.SetInto(itemPoint1);
        }
    }



    public override void SetFadeInEffect(int type)
    {
        base.SetFadeInEffect(type);
        Invoke("InvokOpenItem" , 0.2f);
    }

    private void InvokOpenItem()
    {
        spriteItem.gameObject.SetActive(true);
    }

    public override void ClickItem()
    {
        base.ClickItem();
        CallBackClickBtn();

    }
}
