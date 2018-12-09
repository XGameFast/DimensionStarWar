using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterFightValueBarItem : MonoBehaviour {

    public UILabel content;
    public AddNumber addNumber;
    public UI2DSprite sprite;
    public void InitValue(int targetValue,int itemID , AddNumber.AddType type ,float runtTimerLimit)
    {
        if (addNumber.AddNumberLinearFunc == null)
        {
            addNumber.AddNumberLinearFunc = UpdateContent;
        }

        switch (type)
        {
            case AddNumber.AddType.linear:
                addNumber.SetValue(0,targetValue,0,2, AddNumber.AddType.linear);
                break;

            case AddNumber.AddType.random:
                addNumber.SetValue(targetValue,2,AddNumber.AddType.random);
                break;
        }
    }

    

    private void UpdateContent(string _content)
    {
        content.text = _content;
    }
    
}
