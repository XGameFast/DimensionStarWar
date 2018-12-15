using UnityEngine;
using UnityEngine.UI;
using UnityEditor;


[CustomEditor(typeof(TestChallengeGameController))] 
public class TestChanllengeGameControllderEditor : Editor {
    
  

    public override void OnInspectorGUI() 
    {

        EditorGUILayout.LabelField("------- 场景配置 ------- ]",EditorStyles.largeLabel );

        TestChallengeGameController test = (TestChallengeGameController) target;

        test.enemyPower = EditorGUILayout.ObjectField("敌人血条UI", test.enemyPower, typeof(Text), true) as Text;

        test.minePower = EditorGUILayout.ObjectField("我方血条UI", test.minePower, typeof(Text), true) as Text;

        test.enemyMakePower = EditorGUILayout.ObjectField("敌人造成的伤害UI", test.enemyMakePower, typeof(Text), true) as Text;

        test.mineMakePower = EditorGUILayout.ObjectField("我放造成伤害的UI", test.mineMakePower, typeof(Text), true) as Text;

        test.GameCamera = EditorGUILayout.ObjectField("游戏相机",test.GameCamera,typeof(Camera),true) as Camera ;

        test.UICamera = EditorGUILayout.ObjectField("UI相机",test.UICamera,typeof(Camera),true) as Camera ;

        test.ARWorldTrans = EditorGUILayout.ObjectField("ARWolrd",test.ARWorldTrans,typeof(Transform),true) as Transform ;

        test.enemyPoint = EditorGUILayout.ObjectField("敌方宠物位置", test.enemyPoint, typeof(Transform), true) as Transform;


        EditorGUILayout.LabelField("------- 配置敌方宠物 ]",EditorStyles.largeLabel);


        test.minePiont = EditorGUILayout.ObjectField("我放宠物位置", test.minePiont, typeof(Transform), true) as Transform;


        test._selectEnemyID = (TestChallengeGameController.SelectMonsterID)EditorGUILayout.EnumPopup("选择敌方上场宠物",test._selectEnemyID,GUILayout.ExpandWidth(true));

        test.enmeyMaxPower = EditorGUILayout.IntField("输入宠物的最大意志力",test.enmeyMaxPower);

        test.enemyNormalSkill = (TestChallengeGameController.NormallAttackID)EditorGUILayout.EnumPopup("选择普通攻击",test.enemyNormalSkill,GUILayout.ExpandWidth(true));

        test.enemyNormalSkillArchievment = EditorGUILayout.IntSlider("普通攻击熟练度" , test.enemyNormalSkillArchievment,0,9600);

        test.enemyDefenseSkill = (TestChallengeGameController.DefenseSkillID)EditorGUILayout.EnumPopup("选择防御攻击",test.enemyDefenseSkill,GUILayout.ExpandWidth(true));

        test.enemyDefenseArchievment = EditorGUILayout.IntSlider("防御技能熟练度" , test.enemyDefenseArchievment,0,9600);

        test.enemySpecialSkill = (TestChallengeGameController.SpecialSkillID)EditorGUILayout.EnumPopup("选择特殊攻击",test.enemySpecialSkill,GUILayout.ExpandWidth(true));

        test.enemySpecialSkillArchievment = EditorGUILayout.IntSlider("特殊技能熟练度" , test.enemySpecialSkillArchievment,0,9600);


       

        EditorGUILayout.LabelField("------- 选择玩家的宠物------- ]",EditorStyles.largeLabel);

        test.playerStrongholdIndex = EditorGUILayout.IntField("选择玩家的据点游标",test.playerStrongholdIndex);

        test.tmpMonsterPower = EditorGUILayout.IntSlider("为我方宠物添加血量", test.tmpMonsterPower, 0, 9600);


        test._selectMonsterID = (TestChallengeGameController.SelectMonsterID)EditorGUILayout.EnumPopup("选择我放上场宠物",test._selectMonsterID,GUILayout.ExpandWidth(true));

        serializedObject.ApplyModifiedProperties ();

        
    }
}
