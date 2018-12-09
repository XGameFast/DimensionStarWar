using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class AstologyMenu : UIBasic2 {

    public ScrollRect scrollrect;
    public RectTransform viewMaskRect;
    public RectTransform contentRect;
    public GridLayoutGroup grid;
    public CanvasGroup vvBars;
    private RaycastHit hit;
    private AstrologyController astrologyController;
    public Transform gridStrongholdMessage;
    public Transform monsterPoint;
    public Slider monsterPowerBar;
    public Text monsterPowerText;
    public Slider monsterMoodBar;

    private Transform followPoint ;
    private MonsterBasic monsterBasic;
    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);
        astrologyController = baseController as AstrologyController;
        if (gridStrongholdMessage != null)
        {
            var list = gridStrongholdMessage.GetChildList();
            if (list != null && list.Count > 0)
            {
                foreach (var m in list)
                {
                    Destroy(m.gameObject);
                }
            }
        }
    }
    private void ClickEvent(AndaObjectBasic andaObjectBasic)
    {
        andaObjectBasic.GetComponent<MonsterActivityWithPlayer>().PlayerStamp();//戳
    }

    public void CloseStrongholdMessage()
    {
        transform.Find("MessageBar").gameObject.SetActive(false);
    }

    public void CloseVVBars()
    {
        vvBars.alpha = 0;
    }
    public void OpenVVBars()
    {
        vvBars.alpha = 1;
    }

    public void UpdateMonsterPowerBar(Transform _targetPoint , PlayerMonsterAttribute _data)
    {
        followPoint = _targetPoint;
        monsterMoodBar.value = _data.mosterPower / _data.monsterMaxPower ;
        monsterPowerText.text = _data.mosterPower.ToString();
    }

    public override void OnUpdate()
    {
        monsterPowerBar.transform.position = followPoint.position;/// Vector3.up; //---
    }
}
