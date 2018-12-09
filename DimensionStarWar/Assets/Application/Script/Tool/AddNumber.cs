using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddNumber : ToolBasic {

    public enum AddType
    {
        linear,
        random,

    }
    private AddType currentAddType = AddType.linear;
    private bool isStartAdd = false;
    private float loadTime;
    private float waitTimer;
    private int startValue;
    private int targetValue;
    private float addTimer;
    private float addSpeed;
    private float runTime;
    private float runTimeLimit;
    public System.Action<string> AddNumberLinearFunc;


    public void SetValue(int _startValue,int _endValue , float _waitTimer ,float _addSpeed ,AddType addType)
    {
        startValue = _startValue;
        targetValue = _endValue;
        waitTimer = _waitTimer;
        addSpeed = _addSpeed;
        addTimer = 9;
        isStartAdd = true;
    }

    public void SetValue(int _targetValue, float _runTimeLimit , AddType addType)
    {
        runTime = Time.time;
        loadTime = Time.time;
        runTimeLimit = _runTimeLimit;
        targetValue = _targetValue;
        isStartAdd = true;

    }

    
    /// <summary>
    /// 线性增加
    /// </summary>
    private void PlayLinearAddNumber()
    {
        int number = startValue;
        if (startValue != targetValue)
        {
            addTimer += Time.deltaTime;
            number = (int)Mathf.Lerp(startValue, targetValue, addTimer / addSpeed);
            if (AddNumberLinearFunc != null)
            {
                string content = number + "/" + targetValue;
                AddNumberLinearFunc(content);
            }
            else isStartAdd = false;
        }
        else
        {
            isStartAdd = false;
        }
    }

    private void PlayRandomAddNumber()
    {
        int number = 0;
        if (Time.time - runTime < runTimeLimit)
        {
            number = Random.Range(10000, 80000);
        }
        else
        {
            number = targetValue;
            isStartAdd = false;
        }
        AddNumberLinearFunc(number.ToString());
    }

    public override void OnUpdate2()
    {
        base.OnUpdate2();
        if (!isStartAdd) return;
        if (Time.time - loadTime < waitTimer) return;

        if (currentAddType == AddType.linear)
        {
            PlayLinearAddNumber();
        }
        if (currentAddType == AddType.random)
        {
            PlayRandomAddNumber();
        }
    }
}
