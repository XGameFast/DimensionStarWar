using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaAudioManager  {

    private static AndaAudioManager _instance = null;
    public static AndaAudioManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new AndaAudioManager();
            }
            return _instance;
        }
    }

    private const string treasureTipsName = "Finding";
    private const string foundTreasure = "FoundTreasure";

    public void PlayUISounds(string clip)
    {
        AndaDataManager.Instance.PlayAudio(clip, AudiodataManager.AudioType.ui);
    }

    public void PlayTreasureTipsSounds()
    {
        PlayTipsSounds(treasureTipsName);
    }
    public void PlayFoundTreasureSounds()
    {
        PlayTipsSounds(foundTreasure);
    }


    public void PlayTipsSounds(string clip)
    {
        AndaDataManager.Instance.PlayAudio(clip, AudiodataManager.AudioType.tips);
    }
}
