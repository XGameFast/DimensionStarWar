using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActiveTools : MonoBehaviour {
    
    
    /// <summary>
    /// 
    /// </summary>
    /// <param name="roSpeed">旋转速度</param>
    /// <param name="style">播放一次 0 ， 循环 1 ，来回 2</param>
    /// <param name="roTarget"></param>
    public void PlayRotate(Transform t, float roSpeed , int style , Vector3 roTarget)
    {
        TweenRotation tweenRotation = t.GetComponent<TweenRotation>();
        if (tweenRotation == null)
        {
            tweenRotation = t.gameObject.AddComponent<TweenRotation>();
        }
        tweenRotation.from = Vector3.zero;
        tweenRotation.to = roTarget;
        tweenRotation.style = (UITweener.Style)style;
        tweenRotation.duration = roSpeed;
        tweenRotation.PlayForward();
    }

    public void PlayScale(Transform t, float speed, int style, Vector3 targetScale)
    {
        TweenScale tweenScale = t.GetComponent<TweenScale>();
        if (tweenScale == null)
        {
            tweenScale = t.gameObject.AddComponent<TweenScale>();
        }
        tweenScale.from = Vector3.one;
        tweenScale.to = targetScale;
        tweenScale.style = (UITweener.Style)style;
        tweenScale.duration = speed;
        tweenScale.PlayForward();
    }

    public void PlayMove()
    {

    }


    private IEnumerator ExcuteRotate(float speed)
    {
        while (true)
        {
            transform.Rotate(0, 0, speed);
            yield return null;
        }
    }


   

}
