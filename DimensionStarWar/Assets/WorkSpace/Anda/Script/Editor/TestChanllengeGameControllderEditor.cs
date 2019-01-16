using UnityEngine;
using UnityEngine.UI;
using UnityEditor;
using System;
using System.Collections.Generic;

[CustomEditor(typeof(TestChallengeGameController))] 
public class TestChanllengeGameControllderEditor : Editor {


    [SerializeField]//必须要加
    protected List<int> useCustomSkillArchievemntLimit = new List<int>();

    public override void OnInspectorGUI() 
    {

        EditorGUILayout.LabelField("------- 场景配置 ------- ]",EditorStyles.largeLabel );

        TestChallengeGameController test = (TestChallengeGameController) target;

        test.enemyPower = EditorGUILayout.ObjectField("敌人血条UI", test.enemyPower, typeof(Text), true) as Text;

        test.minePower = EditorGUILayout.ObjectField("我方血条UI", test.minePower, typeof(Text), true) as Text;

        test.enemyMakePower = EditorGUILayout.ObjectField("敌人造成的伤害UI", test.enemyMakePower, typeof(Text), true) as Text;

        test.mineMakePower = EditorGUILayout.ObjectField("我放造成伤害的UI", test.mineMakePower, typeof(Text), true) as Text;

        test.mineMonsterPowerSlider = EditorGUILayout.ObjectField("我方宠物的意志力Slider", test.mineMonsterPowerSlider, typeof(Slider), true) as Slider;

        test.enemyMonsterPowerSlider = EditorGUILayout.ObjectField("敌方方宠物的意志力Slider", test.enemyMonsterPowerSlider, typeof(Slider), true) as Slider;


        test.GameCamera = EditorGUILayout.ObjectField("游戏相机",test.GameCamera,typeof(Camera),true) as Camera ;

        test.UICamera = EditorGUILayout.ObjectField("UI相机",test.UICamera,typeof(Camera),true) as Camera ;

        test.ARWorldTrans = EditorGUILayout.ObjectField("ARWolrd",test.ARWorldTrans,typeof(Transform),true) as Transform ;

        test.enemyPoint = EditorGUILayout.ObjectField("敌方宠物位置", test.enemyPoint, typeof(Transform), true) as Transform;


        EditorGUILayout.LabelField("------- 配置敌方宠物 ]",EditorStyles.largeLabel);


        test.minePiont = EditorGUILayout.ObjectField("我放宠物位置", test.minePiont, typeof(Transform), true) as Transform;


        test._selectEnemyID = (TestChallengeGameController.SelectMonsterID)EditorGUILayout.EnumPopup("选择敌方上场宠物",test._selectEnemyID,GUILayout.ExpandWidth(true));

        test.enmeyMaxPower = EditorGUILayout.IntField("输入宠物的最大意志力",test.enmeyMaxPower);

        test.enemyNormalSkill = (TestChallengeGameController.NormallAttackID)EditorGUILayout.EnumPopup("选择普通攻击",test.enemyNormalSkill,GUILayout.ExpandWidth(true));

        test.useCustomSkillArchievemntLimit = EditorGUILayout.Toggle("自定义普攻熟练度区间", test.useCustomSkillArchievemntLimit);

        if(test.useCustomSkillArchievemntLimit )
        {
            var t = this.serializedObject.FindProperty("normalSkilArchiRangelValue");
            EditorGUI.indentLevel++;
            t.arraySize = EditorGUILayout.DelayedIntField("准备为普攻成就分多少级", t.arraySize);
            EditorGUI.indentLevel++;

            // 设置元素个数

            // 绘制元素
            for (int i = 0, size = t.arraySize; i < size; i++)
            {
                // 检索属性数组元素
                var oo = t.GetArrayElementAtIndex(i);
                test.normalSkilArchiRangelValue[i] = EditorGUILayout.IntField("到达" + (i + 2) + "级需要的成就值",oo.intValue); 
             //   EditorGUILayout.PropertyField(oo,new GUILayoutOption[]{ });

            }
            // 重置缩进
            EditorGUI.indentLevel-=2;

            //test.normalSkillLevelCount = EditorGUILayout.IntField("准备为普攻分多少级", test.normalSkillLevelCount);

            //第二个参数必须为true，否则无法显示子节点即List内容
            //EditorGUILayout.PropertyField("分级",useCustomSkillArchievemntLimit, true);

            // test.normalSkilArchiRangelValue = EditorGUILayout.IntField("到达需要多少成就值", test.normalSkilArchiRangelValue);
            // test.normalSkilArchiRangelValue =  EditorGUILayout.
        }


        test.useCustomNormalSkillArchi = EditorGUILayout.Toggle("自定义普攻伤害", test.useCustomNormalSkillArchi);

        if (test.useCustomNormalSkillArchi)
        {
            test.enemyNormalSkillArchievment = EditorGUILayout.IntSlider("普通攻击熟练度", test.enemyNormalSkillArchievment, 0, 9600);
        }
        test.useCustomDefenseSkillArchi = EditorGUILayout.Toggle("自定义防御熟练度", test.useCustomDefenseSkillArchi);

        if (test.useCustomDefenseSkillArchi)
        {
            test.enemyDefenseSkill = (TestChallengeGameController.DefenseSkillID)EditorGUILayout.EnumPopup("选择防御攻击", test.enemyDefenseSkill, GUILayout.ExpandWidth(true));

        }
        test.useCustomSpecialSkillArchi = EditorGUILayout.Toggle("自定义大招熟练度", test.useCustomSpecialSkillArchi);

        if (test.useCustomSpecialSkillArchi)
        {
            test.enemyDefenseArchievment = EditorGUILayout.IntSlider("防御技能熟练度", test.enemyDefenseArchievment, 0, 9600);
        }

        test.enemySpecialSkill = (TestChallengeGameController.SpecialSkillID)EditorGUILayout.EnumPopup("选择特殊攻击",test.enemySpecialSkill,GUILayout.ExpandWidth(true));

        test.enemySpecialSkillArchievment = EditorGUILayout.IntSlider("特殊技能熟练度" , test.enemySpecialSkillArchievment,0,9600);

        test.allowThink = EditorGUILayout.Toggle("允许星宿思考", test.allowThink);

        test.allowNormallAttack = EditorGUILayout.Toggle("允许星宿使用普通攻击", test.allowNormallAttack);

        test.allowDefense = EditorGUILayout.Toggle("允许星宿使用防御", test.allowDefense);

        test.allowSpecialSkill = EditorGUILayout.Toggle("允许星宿大招", test.allowSpecialSkill);

        test.allowMove = EditorGUILayout.Toggle("允许星宿位移", test.allowMove);
        test.allowEnemyMonsterPlayBati = EditorGUILayout.Toggle("允许敌方星宿开启霸体(无僵直)", test.allowEnemyMonsterPlayBati);



        EditorGUILayout.LabelField("------- 选择玩家的宠物------- ]",EditorStyles.largeLabel);

        test.playerStrongholdIndex = EditorGUILayout.IntField("选择玩家的据点游标",test.playerStrongholdIndex);

        test.tmpMonsterPower = EditorGUILayout.IntSlider("为我方宠物添加血量", test.tmpMonsterPower, 0, 9600);


        test._selectMonsterID = (TestChallengeGameController.SelectMonsterID)EditorGUILayout.EnumPopup("选择我放上场宠物",test._selectMonsterID,GUILayout.ExpandWidth(true));

        test.allowMineMonsterPlayBati = EditorGUILayout.Toggle("允许我方星宿开启霸体(无僵直)", test.allowMineMonsterPlayBati);


        serializedObject.ApplyModifiedProperties ();

        
    }
}
