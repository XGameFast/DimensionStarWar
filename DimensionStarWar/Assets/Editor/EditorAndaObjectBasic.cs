/*using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(AndaObjectBasic),true)] //编辑对应的脚本
public class EditorAndaObjectBasic : Editor {
    

    public override void OnInspectorGUI()
    {
        AndaObjectBasic t = (AndaObjectBasic)target;
        t.initializationScale = EditorGUILayout.FloatField("initializationScale", t.initializationScale);
        t.autoDestory = EditorGUILayout.Toggle("autoDestory", t.autoDestory);
        if(t.autoDestory)
        {
            t.waitTimer = EditorGUILayout.FloatField("WaitTimer", t.waitTimer);
        }

    }
}*/
