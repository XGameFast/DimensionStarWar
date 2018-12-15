using UnityEngine;
using UnityEditor;


[CustomEditor(typeof(TestToolDownloadConfig))] 
public class TestToolDownloadConfigEditor : Editor {

   
    //在这里方法中就可以绘制面板。
    public override void OnInspectorGUI() 
    {


        //得到Test对象
        TestToolDownloadConfig test = (TestToolDownloadConfig) target;

        test.Account = EditorGUILayout.TextField("账号", test.Account);

        test.isAutoExcute = EditorGUILayout.Toggle("自动执行脚本",
                                                      test.isAutoExcute);

        test.MonsterConfigDownload = EditorGUILayout.Toggle("更新MonsterConfig",
                                                            test.MonsterConfigDownload);

        test.SkillConfigDownload = EditorGUILayout.Toggle("更新技能配置文件",
                                                          test.SkillConfigDownload);

        test.BussinesStrongholdConfigFileNameDownload = EditorGUILayout.Toggle("更新商家据点配置文件",
                                                                               test.BussinesStrongholdConfigFileNameDownload);

        test.ChanllengeGameConfigFileNameDownload = EditorGUILayout.Toggle("更新挑战模式的配置文件",
                                                                           test.ChanllengeGameConfigFileNameDownload);

        test.MallConfigFileNameDownload = EditorGUILayout.Toggle("更新商店配置文件",
                                                                 test.MallConfigFileNameDownload);

        test.MedalConfigFileNameDownload = EditorGUILayout.Toggle("更新徽章配置文件",
                                                                  test.MedalConfigFileNameDownload);

        test.NameConfigFileNameDownload = EditorGUILayout.Toggle("更新账号的随机名字配置文件",
                                                                 test.NameConfigFileNameDownload);

        test.ObjectsConfigFileNameDownload = EditorGUILayout.Toggle("更新物件配置文件",
                                                                    test.ObjectsConfigFileNameDownload);

        test.ProtectGameConfigFileNameDownload = EditorGUILayout.ToggleLeft("更新保卫模式的配置文件",
                                                                        test.ProtectGameConfigFileNameDownload);

        test.StrongholdConfigFileNameDownload = EditorGUILayout.Toggle("更新据点配置文件",
                                                                       test.StrongholdConfigFileNameDownload);

        test.StarConfigFileNameDownload = EditorGUILayout.Toggle("更新星宿配置文件",
                                                                 test.StarConfigFileNameDownload);

        test.SkillArchievementValueFileNameDownload = EditorGUILayout.Toggle("更新技能成就值配置文件",
                                                                             test.SkillArchievementValueFileNameDownload);


        test.isNeedGetUserData = EditorGUILayout.Toggle("是否模拟登录获取accgjp的账号数据",
                                                        test.isNeedGetUserData);
        //绘制一个贴图槽
       // test.texture =  EditorGUILayout.ObjectField("增加一个贴图",test.texture,typeof(Texture),true) as Texture;
        if (GUI.changed)
        {
            EditorUtility.SetDirty(target);
        }
    }
}
