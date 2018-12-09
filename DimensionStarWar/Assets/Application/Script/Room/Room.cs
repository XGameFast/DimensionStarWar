using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Room : AndaObjectBasic {

    public Renderer[] rendererList;
    public List<TextMesh> roomNameTextMesh;
    public Transform monsterShowCasePoint;
    public Transform expBallShowCasePoint;
    public GameObject board;
    public List<Transform> cleanRootList = new List<Transform>();
    public override void InitValue()
    {
        base.InitValue();
        rendererList = GetComponentsInChildren<Renderer>();
        //BuildRoot();
    }

    private void BuildRoot()
    {
        int count = board.transform.childCount;
        for (int i = 0; i < count; i++)
        {
            cleanRootList.Add(board.transform.GetChild(i));
        }
    }
    public void SetValue(PlayerStrongholdAttribute PlayerStrongholdAttribute)
    {
        int roomID = PlayerStrongholdAttribute.playerStrongholdRoomID;
        Texture t = AndaDataManager.Instance.GetRoomTexture("room" + roomID);
      
        foreach (var go in rendererList)
        {
            go.material.SetTexture("_MainTex", t); 
        }
        BuildRoot();
        // SetRoomName(PlayerStrongholdAttribute.strongholdNickName);
    }

    public void SetRoomName(string name)
    {
        foreach (var go in roomNameTextMesh)
        {
            go.text = name;
        }
    }
    public void SetMonsterToShowCase(Transform monster)
    {
        monster.SetParent(monsterShowCasePoint);
        monster.ResetTran();
        monster.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(monster.position);
    }

    public void SetExpBallToShowCase(Transform expBall)
    {
        expBall.SetParent(expBallShowCasePoint);
        expBall.ResetTran();
    }
}
