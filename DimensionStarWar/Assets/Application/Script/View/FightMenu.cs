using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FightMenu :  UIBasic{

    public WarringTips SU;
    public List<UI2DSprite> monsterIconPoint;
    public List<TweenAlpha> monsterIconTweenAlpha;
    public List<TweenAlpha> ligthList;
    public GameObject iconBoardParent;
    public GameObject monsterIconItem;
    public BoxCollider selectMonsterBtn;
    public TweenAlpha talpha;
    //public FightController fightController;
    public GameObject arrow;
    private bool isTriggerEnter;


    private System.Action<int> callBackSelectMonster;
    private System.Action<bool> callBackTriggerSelectEvent;
    public override void InitMenu()
    {
        base.InitMenu();
        BuildSelectMonsterListenerEvent();
    }

    public void BuildListenerEvent(System.Action<int> _cbSelectMonster ,System.Action<bool> _cbTriggerSelectEvent)
    {
        callBackSelectMonster = _cbSelectMonster;
        callBackTriggerSelectEvent = _cbTriggerSelectEvent;
    }

    private void BuildSelectMonsterListenerEvent()
    {
        UIEventListener ue = UIEventListener.Get(selectMonsterBtn.gameObject);
        ue.onPress += OnPressSelectMonsterBtn;
    }

    public void BuildMonseterIconsList(List<PlayerMonsterAttribute> pmaList)
    {
        for (int i = 0; i < pmaList.Count; i ++ )
        {
            monsterIconPoint[i].sprite2D = AndaDataManager.Instance.GetMonsterIconSprite(pmaList[i].monsterID.ToString());
        }
    }


    private bool isPressingSelectMonsterBtn;
    private float pressLoadTime;
    private float pressTimeLimit;
    private void OnPressSelectMonsterBtn(GameObject btn,bool isPress)
    {
        if (isPress)
        {
            talpha.PlayForward();
            foreach (var go in monsterIconTweenAlpha)
            {
                go.PlayForward();
            }
            isPressingSelectMonsterBtn = true;
            pressLoadTime = Time.time;
            pressTimeLimit = 0.35f;
            StartCoroutine(PressEvent());
        }
        else
        {
            lastSelectIndex = tmpIndex;
            callBackTriggerSelectEvent(false);
            isTriggerEnter = false;
            arrow.gameObject.SetActive(false);
            //iconBoardParent.gameObject.SetActive(false);
            talpha.PlayReverse();
            foreach (var go in monsterIconTweenAlpha)
            {
                go.PlayReverse();
            }
            ligthList[lastSelectIndex].PlayReverse();
            isPressingSelectMonsterBtn = false;

            if (lastSendSelectIndex == lastSelectIndex)
            {
                return;
            }
            else
            {
                //fightController.PlayerSelectMonster(lastSelectIndex);
                if (callBackSelectMonster != null)
                {
                    callBackSelectMonster(lastSelectIndex);
                }
                lastSendSelectIndex = lastSelectIndex;
            }
        }
    }
    private int lastSendSelectIndex;
    private int lastSelectIndex = 0;
    int dir = 1;
    int tmpIndex;
    private IEnumerator PressEvent()
    {
        Vector2 startV = new Vector2();
      
        Vector2 v1 = monsterIconPoint[1].transform.position - arrow.transform.position;

        Vector3 v0 = arrow.transform.eulerAngles;
        tmpIndex = lastSelectIndex;
        while (isPressingSelectMonsterBtn)
        {

            if (Time.time - pressLoadTime > pressTimeLimit && !isTriggerEnter)
            {
                callBackTriggerSelectEvent(true);
                arrow.gameObject.SetActive(true);
                ligthList[lastSelectIndex].PlayForward();
                isTriggerEnter = true;
                startV = Input.mousePosition;
                AndaGameExtension.ShakeDeviece(3);
            }

            if (isTriggerEnter)
            {
                if (Input.mousePosition.x - startV.x > 20)
                {
                    tmpIndex += 1;
                    dir = -1;
                    startV = Input.mousePosition;
                }
                else
                if (Input.mousePosition.x - startV.x < -20)
                {
                    tmpIndex -= 1;
                    dir = 1;
                    startV = Input.mousePosition;
                }
                else
                {
                    //startV = Input.mousePosition;
                    yield return null;
                    continue;
                }

                
                if (tmpIndex < 0) tmpIndex = 0;
                else if(tmpIndex >2) tmpIndex = 2;
                if (lastSelectIndex == tmpIndex)
                {
                    yield return null;
                    continue;
                }

                ligthList[tmpIndex].PlayForward();

                ligthList[lastSelectIndex].PlayReverse();

                lastSelectIndex = tmpIndex;

                Vector2 v2 = monsterIconPoint[tmpIndex].transform.position - arrow.transform.position;
                float angle = Vector2.Angle(v1, v2 );
                v0.z = angle * dir ;

                arrow.transform.eulerAngles  = v0 ;

                AndaGameExtension.ShakeDeviece(2);
                yield return null;
               
            }

            
            yield return null;
        }
       
    }
    
}
