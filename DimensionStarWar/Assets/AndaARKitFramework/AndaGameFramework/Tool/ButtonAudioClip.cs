using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonAudioClip : MonoBehaviour {
    public string soundsName;
    public void ClickPlaySounds()
    {
        AndaAudioManager.Instance.PlayUISounds(soundsName);
    }
}
