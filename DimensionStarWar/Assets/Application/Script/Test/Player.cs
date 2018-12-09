using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {

    public PlayerStatus playerStatus;

    private PlayerStatus lastPlayerStatus;

    private void Start()
    {
        playerStatus = PlayerStatus.Idle;
    }

    private void Update()
    {

        if (playerStatus != lastPlayerStatus)
        {
            OnStatusChange(playerStatus);
        }
        lastPlayerStatus = playerStatus;
    }

    public void OnStatusValueChange(int value)
    {
        Debug.Log(value);
        if (value == 1)
        {
            playerStatus = PlayerStatus.Fighting;
        }
        else
        {
            playerStatus = PlayerStatus.Idle;
        }
    }
    public void OnStatusChange(PlayerStatus status)
    {
        Move move = transform.GetComponent<Move>();
        switch (status)
        {
            case PlayerStatus.Idle:
                if (move != null)
                {
                    move.enabled = false;
                }
                break;
            case PlayerStatus.Fighting:
                move = transform.GetComponent<Move>();
                if (move != null)
                {
                    move.enabled = true;
                }
                break;
        }
    }
}

public enum PlayerStatus
{
    Idle,
    Fighting
}