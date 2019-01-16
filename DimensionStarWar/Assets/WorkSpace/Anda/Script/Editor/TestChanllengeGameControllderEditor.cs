using UnityEngine;
using UnityEngine.UI;
using UnityEditor;
using System;
using System.Collections.Generic;

[CustomEditor(typeof(TestChallengeGameController))] 
public class TestChanllengeGameControllderEditor : Editor {

    public override void OnInspectorGUI()
    {
        TestChallengeGameController test = (TestChallengeGameController)target;

        test.showSecneConfiger = EditorGUILayout.Foldout(test.showSecneConfiger, "场景配置");

        if(test.showSecneConfiger)
        {

            test.enemyPower = EditorGUILayout.ObjectField("敌人血条UI", test.enemyPower, typeof(Text), true) as Text;

            test.minePower = EditorGUILayout.ObjectField("我方血条UI", test.minePower, typeof(Text), true) as Text;

            test.enemyMakePower = EditorGUILayout.ObjectField("敌人造成的伤害UI", test.enemyMakePower, typeof(Text), true) as Text;

            test.mineMakePower = EditorGUILayout.ObjectField("我放造成伤害的UI", test.mineMakePower, typeof(Text), true) as Text;

            test.mineMonsterPowerSlider = EditorGUILayout.ObjectField("我方宠物的意志力Slider", test.mineMonsterPowerSlider, typeof(Slider), true) as Slider;

            test.enemyMonsterPowerSlider = EditorGUILayout.ObjectField("敌方方宠物的意志力Slider", test.enemyMonsterPowerSlider, typeof(Slider), true) as Slider;


            test.GameCamera = EditorGUILayout.ObjectField("游戏相机", test.GameCamera, typeof(Camera), true) as Camera;

            test.UICamera = EditorGUILayout.ObjectField("UI相机", test.UICamera, typeof(Camera), true) as Camera;

            test.ARWorldTrans = EditorGUILayout.ObjectField("ARWolrd", test.ARWorldTrans, typeof(Transform), true) as Transform;

            test.enemyPoint = EditorGUILayout.ObjectField("敌方宠物位置", test.enemyPoint, typeof(Transform), true) as Transform;
            test.minePiont = EditorGUILayout.ObjectField("我放宠物位置", test.minePiont, typeof(Transform), true) as Transform;

        }


        EditorGUILayout.LabelField("配置敌方的星宿", EditorStyles.whiteLargeLabel);

        test.showEditorMonsterPower = EditorGUILayout.Foldout(test.showEditorMonsterPower, "------- 配置敌方宠物的血量------- ");
        if(test.showEditorMonsterPower)
        {
            test._selectEnemyID = (TestChallengeGameController.SelectMonsterID)EditorGUILayout.EnumPopup("选择敌方上场宠物", test._selectEnemyID, GUILayout.ExpandWidth(true));

            test.enmeyMaxPower = EditorGUILayout.IntField("最大意志力", test.enmeyMaxPower);

            test.enemyCurrentPower = EditorGUILayout.IntSlider("输入宠物的当前意志力", test.enemyCurrentPower, 0, test.enmeyMaxPower);
        }
       
      
        EditorGUILayout.Space();



        #region 普攻击

        test.showEditorNormalSkill = EditorGUILayout.Foldout(test.showEditorNormalSkill, "------- 配置星宿普通攻击技能 -------");
        EditorGUI.indentLevel++;

        if (test.showEditorNormalSkill)
        {
            EditorGUILayout.BeginHorizontal();

            test.useCustomNormalSkillPower = EditorGUILayout.Toggle("是否自定义普攻伤害", test.useCustomNormalSkillPower);

            if (!test.useCustomNormalSkillPower) EditorGUILayout.HelpBox("如果不使用自定义，那么会使用已有配置文件来计算伤害，您可以根据已有的配置文件来调整当前当前熟练度", MessageType.Info);
            else EditorGUILayout.HelpBox("使用自定义数值，您可以直接定义伤害", MessageType.Info);

            EditorGUILayout.EndHorizontal();

            if (!test.useCustomNormalSkillPower)//玩家 不 使用自定义的技能伤害
            {
                test.enemyNormalSkillArchievment = EditorGUILayout.IntField("自定义普通攻击熟练度", test.enemyNormalSkillArchievment);
                EditorGUILayout.BeginHorizontal();
                test.useCustomSkillArchievemntLimit = EditorGUILayout.Toggle("自定义成就值区间", test.useCustomSkillArchievemntLimit);
                if (test.useCustomSkillArchievemntLimit)
                {
                    EditorGUILayout.HelpBox("如果使用自定义数量度配置，请在确定数值后再去调整服务器上的配置文件,调整完就再把这个勾去掉，就会有最新的配置文件", MessageType.Info);
                }
                else
                {
                    EditorGUILayout.HelpBox("不使用自定义熟练度配置，那么会使用已有的熟练度配置文", MessageType.Info);
                }

                EditorGUILayout.EndHorizontal();


                if (test.useCustomSkillArchievemntLimit) // 使用自定义的 成就值 区间
                {

                    var t = this.serializedObject.FindProperty("normalSkilArchiRangelValue");
                    //var powerRange = this.serializedObject.FindProperty("normalSkilArchiRangelValue");
                    t.arraySize = EditorGUILayout.DelayedIntField("分几个等级", t.arraySize);
                   //powerRange.arraySize = t.arraySize;

                    if (t.arraySize != 0)
                    {
                        // 绘制元素
                        for (int i = 0, size = t.arraySize; i < size; i++)
                        {
                            // 检索属性数组元素
                            var element = t.GetArrayElementAtIndex(i);
                            if(i> 0  && i < t.arraySize)
                            {
                                if (element.vector2IntValue[0] <= t.GetArrayElementAtIndex(i - 1).vector2IntValue[0])
                                {
                                    EditorGUILayout.HelpBox((i + 2) + "级需要的成就值必须大于" + (t.GetArrayElementAtIndex(i - 1).vector2IntValue[0]), MessageType.Warning);
                                   
                                   
                                }
                                else
                                {
                                    EditorGUILayout.BeginHorizontal();

                                    EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                    EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                    EditorGUILayout.EndHorizontal();

                                }
                            }else
                            {
                                EditorGUILayout.BeginHorizontal();

                                EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                EditorGUILayout.EndHorizontal();

                                // test.normalSkillPowerValuerangeMax = EditorGUILayout.IntField("max", test.normalSkillPowerValuerangeMax);
                                //test.normalSkillPowerValuerange[i] = EditorGUILayout.IntSlider("自定义伤害值", test.normalSkillPowerValuerange[i], 0, test.normalSkillPowerValuerangeMax);
                            }
                            EditorGUILayout.PropertyField(element);
                            //var element2 = powerRange.GetArrayElementAtIndex(i);
                            //Debug.Log("element2" + element2.intValue);
                            //test.normalSkillPowerValuerangeMax = EditorGUILayout.IntField("max", test.normalSkillPowerValuerangeMax);
                            //element2.intValue = EditorGUILayout.IntSlider("自定义伤害值", element2.intValue, 0, test.normalSkillPowerValuerangeMax);
                        }
                    }
                }

            }
            else
            {
               //EditorGUILayout.BeginHorizontal();
                test.normalSkillMaxPower = EditorGUILayout.IntField("max", test.normalSkillMaxPower);
                test.normalSkillPower = EditorGUILayout.IntSlider("自定义伤害值", test.normalSkillPower, 0, test.normalSkillMaxPower);
               
                //EditorGUILayout.EndHorizontal();
               
            }
        }
        EditorGUI.indentLevel--;

        #endregion



        EditorGUILayout.Space();
        EditorGUILayout.Space();


        #region 防御

        test.showEditorDefenseSkill = EditorGUILayout.Foldout(test.showEditorDefenseSkill, "------- 配置星宿防御技能 -------");
        EditorGUI.indentLevel++;

        if (test.showEditorDefenseSkill)
        {
            EditorGUILayout.BeginHorizontal();
            test.useCustomDefnseSkillPower = EditorGUILayout.Toggle("是否自定义防御值", test.useCustomDefnseSkillPower);

            if (!test.useCustomDefnseSkillPower) EditorGUILayout.HelpBox("如果不使用自定义，那么会使用已有配置文件来提供防御值，您可以根据已有的配置文件来调整当前当前熟练度", MessageType.Info);
            else EditorGUILayout.HelpBox("使用自定义数值，您可以直接定义防御值", MessageType.Info);

            EditorGUILayout.EndHorizontal();

            if (!test.useCustomDefnseSkillPower)//玩家 不 使用自定义的技能伤害
            {
                test.enemyDefenseArchievment = EditorGUILayout.IntField("自定义防御技能熟练度", test.enemyDefenseArchievment);
                EditorGUILayout.BeginHorizontal();
                test.useDefenseSkillArchievemntLimit = EditorGUILayout.Toggle("自定义防御技能成就值区间", test.useDefenseSkillArchievemntLimit);
                if (test.useDefenseSkillArchievemntLimit)
                {
                    EditorGUILayout.HelpBox("如果使用自定义数量度配置，请在确定数值后再去调整服务器上的配置文件,调整完就再把这个勾去掉，就会有最新的配置文件", MessageType.Info);
                }
                else
                {
                    EditorGUILayout.HelpBox("不使用自定义熟练度配置，那么会使用已有的熟练度配置文", MessageType.Info);
                }

                EditorGUILayout.EndHorizontal();

                if (test.useDefenseSkillArchievemntLimit) // 使用自定义的 成就值 区间
                {

                    var t = this.serializedObject.FindProperty("defenseSkilArchiRangelValue");
                    t.arraySize = EditorGUILayout.DelayedIntField("分几个等级", t.arraySize);
                    if (t.arraySize != 0)
                    {
                        // 绘制元素
                        for (int i = 0, size = t.arraySize; i < size; i++)
                        {
                            // 检索属性数组元素
                            var element = t.GetArrayElementAtIndex(i);
                            if (i > 0 && i < t.arraySize)
                            {
                                if (element.vector2IntValue[0] <= t.GetArrayElementAtIndex(i - 1).vector2IntValue[0])
                                {
                                    EditorGUILayout.HelpBox((i + 2) + "级需要的成就值必须大于" + (t.GetArrayElementAtIndex(i - 1).vector2IntValue[0]), MessageType.Warning);
                                }
                                else
                                {
                                    EditorGUILayout.BeginHorizontal();

                                    EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                    EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                    EditorGUILayout.EndHorizontal();
                                }
                            }
                            else
                            {
                                EditorGUILayout.BeginHorizontal();

                                EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                EditorGUILayout.EndHorizontal();
                            }


                            //   EditorGUILayout.IntField("到达" + (i + 2) + "级需要的成就值", element.intValue);
                            EditorGUILayout.PropertyField(element);
                        }
                    }
                }

            }
            else
            {
                //EditorGUILayout.BeginHorizontal();
                test.defenseSkillMaxPower = EditorGUILayout.IntField("max", test.defenseSkillMaxPower);
                test.denfseSkillPower = EditorGUILayout.IntSlider("自定义伤害值", test.denfseSkillPower, 0, test.defenseSkillMaxPower);

                //EditorGUILayout.EndHorizontal();

            }
        }
        EditorGUI.indentLevel--;
        #endregion


        EditorGUILayout.Space();
        EditorGUILayout.Space();


        #region 大招

        test.showEditorSpecialSkill = EditorGUILayout.Foldout(test.showEditorSpecialSkill, "------- 配置星宿特殊技能(大招) -------");
        EditorGUI.indentLevel++;

        if (test.showEditorSpecialSkill)
        {
            EditorGUILayout.BeginHorizontal();
            test.useCustomSpecialSkillPower = EditorGUILayout.Toggle("是否自定义防御值", test.useCustomSpecialSkillPower);

            if (!test.useCustomSpecialSkillPower) EditorGUILayout.HelpBox("如果不使用自定义，那么会使用已有配置文件来计算大招伤害，您可以根据已有的配置文件来调整当前当前熟练度", MessageType.Info);
            else EditorGUILayout.HelpBox("使用自定义数值，您可以直接定义大招的攻击力", MessageType.Info);

            EditorGUILayout.EndHorizontal();

            if (!test.useCustomSpecialSkillPower)//玩家 不 使用自定义的技能伤害
            {
                test.enemySpecialSkillArchievment = EditorGUILayout.IntField("自定义大招熟练度", test.enemySpecialSkillArchievment);
                EditorGUILayout.BeginHorizontal();
                test.useSpecialSkillArchievemntLimit = EditorGUILayout.Toggle("自定义大招成就值区间", test.useSpecialSkillArchievemntLimit);
                if (test.useSpecialSkillArchievemntLimit)
                {
                    EditorGUILayout.HelpBox("如果使用自定义数量度配置，请在确定数值后再去调整服务器上的配置文件,调整完就再把这个勾去掉，就会有最新的配置文件", MessageType.Info);
                }
                else
                {
                    EditorGUILayout.HelpBox("不使用自定义熟练度配置，那么会使用已有的熟练度配置文", MessageType.Info);
                }

                EditorGUILayout.EndHorizontal();

                if (test.useSpecialSkillArchievemntLimit) // 使用自定义的 成就值 区间
                {

                    var t = this.serializedObject.FindProperty("specialSkilArchiRangelValue");
                    t.arraySize = EditorGUILayout.DelayedIntField("分几个等级", t.arraySize);
                    if (t.arraySize != 0)
                    {
                        // 绘制元素
                        for (int i = 0, size = t.arraySize; i < size; i++)
                        {
                            // 检索属性数组元素
                            var element = t.GetArrayElementAtIndex(i);
                            if (i > 0 && i < t.arraySize)
                            {
                                if (element.vector2IntValue[0] <= t.GetArrayElementAtIndex(i - 1).vector2IntValue[0])
                                {
                                    EditorGUILayout.HelpBox((i + 2) + "级需要的成就值必须大于" + (t.GetArrayElementAtIndex(i - 1).vector2IntValue[0]), MessageType.Warning);
                                }
                                else
                                {
                                    EditorGUILayout.BeginHorizontal();

                                    EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                    EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                    EditorGUILayout.EndHorizontal();
                                }
                            }
                            else
                            {
                                EditorGUILayout.BeginHorizontal();

                                EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                EditorGUILayout.EndHorizontal();
                            }


                            //   EditorGUILayout.IntField("到达" + (i + 2) + "级需要的成就值", element.intValue);
                            EditorGUILayout.PropertyField(element);
                        }
                    }
                }

            }
            else
            {
                //EditorGUILayout.BeginHorizontal();
                test.speciallSkillMaxPower = EditorGUILayout.IntField("max", test.speciallSkillMaxPower);
                test.specialSkillPower = EditorGUILayout.IntSlider("自定义伤害值", test.specialSkillPower, 0, test.speciallSkillMaxPower);

                //EditorGUILayout.EndHorizontal();

            }
        }
        EditorGUI.indentLevel--;


        #endregion
        EditorGUILayout.Space();
        EditorGUILayout.Space();
        #region 状态

        test.showEnemyMonsterState = EditorGUILayout.Foldout(test.showEnemyMonsterState, "------- 配置星敌方星宿可以执行的状态-------");

        if(test.showEnemyMonsterState)
        {
            test.allowThink = EditorGUILayout.Toggle("允许星宿思考", test.allowThink);

            test.allowNormallAttack = EditorGUILayout.Toggle("允许星宿使用普通攻击", test.allowNormallAttack);

            test.allowDefense = EditorGUILayout.Toggle("允许星宿使用防御", test.allowDefense);

            test.allowSpecialSkill = EditorGUILayout.Toggle("允许星宿大招", test.allowSpecialSkill);

            test.allowMove = EditorGUILayout.Toggle("允许星宿位移", test.allowMove);
            test.allowEnemyMonsterPlayBati = EditorGUILayout.Toggle("允许敌方星宿开启霸体(无僵直)", test.allowEnemyMonsterPlayBati);
        }


        #endregion

        EditorGUILayout.Space();
        EditorGUILayout.Space();


        EditorGUILayout.LabelField("配置我方的星宿",EditorStyles.whiteLargeLabel);



       // test.playerStrongholdIndex = EditorGUILayout.IntField("选择玩家的据点游标",test.playerStrongholdIndex);

        test.mineMaxPower = EditorGUILayout.IntField("最大意志力", test.mineMaxPower);

        test.mineCurrentPower = EditorGUILayout.IntSlider("为我方宠物添加血量", test.mineCurrentPower, 0, test.mineMaxPower);

        test._selectMonsterID = (TestChallengeGameController.SelectMonsterID)EditorGUILayout.EnumPopup("选择我放上场宠物",test._selectMonsterID,GUILayout.ExpandWidth(true));


        #region 普攻击

        test.mine_showEditorNormalSkill = EditorGUILayout.Foldout(test.mine_showEditorNormalSkill, "------- 配置我放星宿普通攻击技能 -------");
        EditorGUI.indentLevel++;

        if (test.mine_showEditorNormalSkill)
        {
            EditorGUILayout.BeginHorizontal();

            test.mine_useCustomNormalSkillPower = EditorGUILayout.Toggle("是否自定义普攻伤害", test.mine_useCustomNormalSkillPower);

            if (!test.mine_useCustomNormalSkillPower) EditorGUILayout.HelpBox("如果不使用自定义，那么会使用已有配置文件来计算伤害，您可以根据已有的配置文件来调整当前当前熟练度", MessageType.Info);
            else EditorGUILayout.HelpBox("使用自定义数值，您可以直接定义伤害", MessageType.Info);

            EditorGUILayout.EndHorizontal();

            if (!test.mine_useCustomNormalSkillPower)//玩家 不 使用自定义的技能伤害
            {
                test.mine_NormalSkillArchievment = EditorGUILayout.IntField("自定义普通攻击熟练度", test.mine_NormalSkillArchievment);
                EditorGUILayout.BeginHorizontal();
                test.mine_useCustomNormalSkillArchievemntLimit = EditorGUILayout.Toggle("自定义成就值区间", test.mine_useCustomNormalSkillArchievemntLimit);
                if (test.mine_useCustomNormalSkillArchievemntLimit)
                {
                    EditorGUILayout.HelpBox("如果使用自定义数量度配置，请在确定数值后再去调整服务器上的配置文件,调整完就再把这个勾去掉，就会有最新的配置文件", MessageType.Info);
                }
                else
                {
                    EditorGUILayout.HelpBox("不使用自定义熟练度配置，那么会使用已有的熟练度配置文", MessageType.Info);
                }

                EditorGUILayout.EndHorizontal();


                if (test.mine_useCustomNormalSkillArchievemntLimit) // 使用自定义的 成就值 区间
                {

                    var t = this.serializedObject.FindProperty("mine_normalSkilArchiRangelValue");
                    t.arraySize = EditorGUILayout.DelayedIntField("分几个等级", t.arraySize);
                    if (t.arraySize != 0)
                    {
                        // 绘制元素
                        for (int i = 0, size = t.arraySize; i < size; i++)
                        {
                            // 检索属性数组元素
                            var element = t.GetArrayElementAtIndex(i);
                            if (i > 0 && i < t.arraySize)
                            {
                                if (element.vector2IntValue[0] <= t.GetArrayElementAtIndex(i - 1).vector2IntValue[0])
                                {
                                    EditorGUILayout.HelpBox((i + 2) + "级需要的成就值必须大于" + (t.GetArrayElementAtIndex(i - 1).vector2IntValue[0]), MessageType.Warning);
                                }
                                else
                                {
                                    EditorGUILayout.BeginHorizontal();

                                    EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                    EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                    EditorGUILayout.EndHorizontal();
                                }
                            }
                            else
                            {
                                EditorGUILayout.BeginHorizontal();

                                EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                EditorGUILayout.EndHorizontal();
                            }


                            //   EditorGUILayout.IntField("到达" + (i + 2) + "级需要的成就值", element.intValue);
                            EditorGUILayout.PropertyField(element);
                        }
                    }
                }

            }
            else
            {
                //EditorGUILayout.BeginHorizontal();
                test.mine_normalSkillMaxPower = EditorGUILayout.IntField("max", test.mine_normalSkillMaxPower);
                test.mine_normalSkillPower = EditorGUILayout.IntSlider("自定义伤害值", test.mine_normalSkillPower, 0, test.mine_normalSkillMaxPower);

                //EditorGUILayout.EndHorizontal();

            }
        }
        EditorGUI.indentLevel--;

        #endregion



        EditorGUILayout.Space();
        EditorGUILayout.Space();


        #region 防御

        test.mine_showEditorDefenseSkill = EditorGUILayout.Foldout(test.mine_showEditorDefenseSkill, "------- 配置星宿防御技能 -------");
        EditorGUI.indentLevel++;

        if (test.mine_showEditorDefenseSkill)
        {
            EditorGUILayout.BeginHorizontal();
            test.mine_useCustomDefnseSkillPower = EditorGUILayout.Toggle("是否自定义防御值", test.mine_useCustomDefnseSkillPower);

            if (!test.mine_useCustomDefnseSkillPower) EditorGUILayout.HelpBox("如果不使用自定义，那么会使用已有配置文件来提供防御值，您可以根据已有的配置文件来调整当前当前熟练度", MessageType.Info);
            else EditorGUILayout.HelpBox("使用自定义数值，您可以直接定义防御值", MessageType.Info);

            EditorGUILayout.EndHorizontal();

            if (!test.mine_useCustomDefnseSkillPower)//玩家 不 使用自定义的技能伤害
            {
                test.mine_DefenseArchievment = EditorGUILayout.IntField("自定义防御技能熟练度", test.mine_DefenseArchievment);
                EditorGUILayout.BeginHorizontal();
                test.mine_useDefenseSkillArchievemntLimit = EditorGUILayout.Toggle("自定义防御技能成就值区间", test.mine_useDefenseSkillArchievemntLimit);
                if (test.mine_useDefenseSkillArchievemntLimit)
                {
                    EditorGUILayout.HelpBox("如果使用自定义数量度配置，请在确定数值后再去调整服务器上的配置文件,调整完就再把这个勾去掉，就会有最新的配置文件", MessageType.Info);
                }
                else
                {
                    EditorGUILayout.HelpBox("不使用自定义熟练度配置，那么会使用已有的熟练度配置文", MessageType.Info);
                }

                EditorGUILayout.EndHorizontal();

                if (test.mine_useDefenseSkillArchievemntLimit) // 使用自定义的 成就值 区间
                {

                    var t = this.serializedObject.FindProperty("mine_defenseSkilArchiRangelValue");
                    t.arraySize = EditorGUILayout.DelayedIntField("分几个等级", t.arraySize);
                    if (t.arraySize != 0)
                    {
                        // 绘制元素
                        for (int i = 0, size = t.arraySize; i < size; i++)
                        {
                            // 检索属性数组元素
                            var element = t.GetArrayElementAtIndex(i);
                            if (i > 0 && i < t.arraySize)
                            {
                                if (element.vector2IntValue[0] <= t.GetArrayElementAtIndex(i - 1).vector2IntValue[0])
                                {
                                    EditorGUILayout.HelpBox((i + 2) + "级需要的成就值必须大于" + (t.GetArrayElementAtIndex(i - 1).vector2IntValue[0]), MessageType.Warning);
                                }
                                else
                                {

                                    EditorGUILayout.BeginHorizontal();

                                    EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                    EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                    EditorGUILayout.EndHorizontal();
                                }
                            }
                            else
                            {

                                EditorGUILayout.BeginHorizontal();

                                EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                EditorGUILayout.EndHorizontal();
                            }


                            //   EditorGUILayout.IntField("到达" + (i + 2) + "级需要的成就值", element.intValue);
                            EditorGUILayout.PropertyField(element);
                        }
                    }
                }

            }
            else
            {
                //EditorGUILayout.BeginHorizontal();
                test.mine_defenseSkillMaxPower = EditorGUILayout.IntField("max", test.mine_defenseSkillMaxPower);
                test.mine_denfseSkillPower = EditorGUILayout.IntSlider("自定义伤害值", test.mine_denfseSkillPower, 0, test.mine_defenseSkillMaxPower);

                //EditorGUILayout.EndHorizontal();

            }
        }
        EditorGUI.indentLevel--;
        #endregion


        EditorGUILayout.Space();
        EditorGUILayout.Space();


        #region 大招

        test.mine_showEditorSpecialSkill = EditorGUILayout.Foldout(test.mine_showEditorSpecialSkill, "------- 配置星宿特殊技能(大招) -------");
        EditorGUI.indentLevel++;

        if (test.mine_showEditorSpecialSkill)
        {
            EditorGUILayout.BeginHorizontal();
            test.mine_useCustomSpecialSkillPower = EditorGUILayout.Toggle("是否自定义防御值", test.mine_useCustomSpecialSkillPower);

            if (!test.mine_useCustomSpecialSkillPower) EditorGUILayout.HelpBox("如果不使用自定义，那么会使用已有配置文件来计算大招伤害，您可以根据已有的配置文件来调整当前当前熟练度", MessageType.Info);
            else EditorGUILayout.HelpBox("使用自定义数值，您可以直接定义大招的攻击力", MessageType.Info);

            EditorGUILayout.EndHorizontal();

            if (!test.mine_useCustomSpecialSkillPower)//玩家 不 使用自定义的技能伤害
            {
                test.mine_SpecialSkillArchievment = EditorGUILayout.IntField("自定义大招熟练度", test.mine_SpecialSkillArchievment);
                EditorGUILayout.BeginHorizontal();
                test.mine_useSpecialSkillArchievemntLimit = EditorGUILayout.Toggle("自定义大招成就值区间", test.mine_useSpecialSkillArchievemntLimit);
                if (test.mine_useSpecialSkillArchievemntLimit)
                {
                    EditorGUILayout.HelpBox("如果使用自定义数量度配置，请在确定数值后再去调整服务器上的配置文件,调整完就再把这个勾去掉，就会有最新的配置文件", MessageType.Info);
                }
                else
                {
                    EditorGUILayout.HelpBox("不使用自定义熟练度配置，那么会使用已有的熟练度配置文", MessageType.Info);
                }

                EditorGUILayout.EndHorizontal();

                if (test.mine_useSpecialSkillArchievemntLimit) // 使用自定义的 成就值 区间
                {

                    var t = this.serializedObject.FindProperty("mine_specialSkilArchiRangelValue");
                    t.arraySize = EditorGUILayout.DelayedIntField("分几个等级", t.arraySize);
                    if (t.arraySize != 0)
                    {
                        // 绘制元素
                        for (int i = 0, size = t.arraySize; i < size; i++)
                        {
                            // 检索属性数组元素
                            var element = t.GetArrayElementAtIndex(i);
                            if (i > 0 && i < t.arraySize)
                            {
                                if (element.vector2IntValue[0] <= t.GetArrayElementAtIndex(i - 1).vector2IntValue[0])
                                {
                                    EditorGUILayout.HelpBox((i + 2) + "级需要的成就值必须大于" + (t.GetArrayElementAtIndex(i - 1).vector2IntValue[0]), MessageType.Warning);
                                }
                                else
                                {
                                    EditorGUILayout.BeginHorizontal();

                                    EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                    EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                    EditorGUILayout.EndHorizontal();
                                }
                            }
                            else
                            {
                                EditorGUILayout.BeginHorizontal();

                                EditorGUILayout.LabelField("X:到达" + (i + 2) + "级需要的成就值", EditorStyles.centeredGreyMiniLabel);
                                EditorGUILayout.LabelField("Y:提供的伤害", EditorStyles.miniLabel);

                                EditorGUILayout.EndHorizontal();
                            }


                            //   EditorGUILayout.IntField("到达" + (i + 2) + "级需要的成就值", element.intValue);
                            EditorGUILayout.PropertyField(element);
                        }
                    }
                }

            }
            else
            {
                //EditorGUILayout.BeginHorizontal();
                test.mine_speciallSkillMaxPower = EditorGUILayout.IntField("max", test.mine_speciallSkillMaxPower);
                test.mine_specialSkillPower = EditorGUILayout.IntSlider("自定义伤害值", test.mine_specialSkillPower, 0, test.mine_speciallSkillMaxPower);

                //EditorGUILayout.EndHorizontal();

            }
        }
        EditorGUI.indentLevel--;


        #endregion


        test.allowMineMonsterPlayBati = EditorGUILayout.Toggle("允许我方星宿开启霸体(无僵直)", test.allowMineMonsterPlayBati);

        serializedObject.ApplyModifiedProperties ();

    }
}
