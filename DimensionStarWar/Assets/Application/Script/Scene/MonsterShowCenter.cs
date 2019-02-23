using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterShowCenter : AndaObjectBasic {
    private ShowCenterMonsterBasic  monsterBasic;
    public Camera showCamera;
    public Transform monsterPoint;

    public override void OnDispawn()
    {
        Clear();
        base.OnDispawn();
    }

    public void Clear()
    {
        if (monsterBasic != null)
        {
            AndaDataManager.Instance.RecieveItem(monsterBasic);
        }
    }

    public void SetMonster(string monsterID)
    {
        if(monsterBasic!=null)
        {
            AndaDataManager.Instance.RecieveItem(monsterBasic);
        }
        monsterBasic = AndaDataManager.Instance.InstantiateMonster<ShowCenterMonsterBasic>("MonsterShowCenter" + monsterID);
        monsterBasic.SetInto(monsterPoint);
        monsterBasic.FadeIn();
    }

    public void SetMonsterHello()
    {
        if(monsterBasic!=null)
        {
            monsterBasic.PlayHelloAnimation();
        }
    }

    private RaycastHit hit;
    public void FixedUpdate()
    {
        if(monsterBasic!=null)
        {
            if (Input.GetMouseButtonDown(0))
            {
                Ray ray = showCamera.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out hit, 20, 1 << LayerMask.NameToLayer(ONAME.LayerDeafualt)))
                {
                    if (hit.transform == monsterBasic.transform)
                    {
                        monsterBasic.PlayRequestAnimation();
                    }
                }
            }
        }

    }
}
