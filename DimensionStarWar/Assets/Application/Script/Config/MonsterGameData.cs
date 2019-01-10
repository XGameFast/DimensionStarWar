using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using LitJson;
public static class MonsterGameData
{
    /*
     * ReadMe
     * 
     */

    public static string selfStorngHoldName = "SelfStrongHold";
    public static string businessStrongholdName = "BusinessStrongHold";
    public static string privateStrongHoldName = "PrivateStrongHold";

    public static string InfoBarForLabelForward = "InfoBarForLabel_Forward";
    public static string GameTipsObj = "GameTips";

    public static string arrow01 = "Arrow01";

    public static string StrongholdInfomationBaseBar = "StrongholdInfomationBaseBar";

    #region 信息板
    public static string InfoBarForPrivateStornghold = "InfoBarForPrivateStrongholdBar";
    public static string InfoBarForSelfStronghold = "InfoBarForSelfStronghold";
    public static string InforBarForBusinessStronghold = "BusinessStrongholdInformationBar";
    #endregion

    public enum SkillType
    {
        attack,
        defens,
        magic,
        displacement,
        treatment
    }
    public enum AttackType
    {
        normalAttack,
        combinationAttack,
        magic,
        displacement
    }

    public enum StrongHoldType
    {
        SelfStrongHold,
        OtherStrongHold,
        BusinessStronghold,
    }

    public enum FightType
    {
        protect,
        challenge,
    }
    public enum PlayerType
    {
        player = 0,
        business = 1,
    }
    public enum SlideType
    {
        none,
        hor,
        vet,
    }
    public enum ChallengeFightType
    {
        vs1,
        vs2,
        vs3,
    }

    #region 快速获取数据

    #endregion
    private static List<MonsterSkillAnimationConfig> _monsterSkillAnimationConfigs = null;
    public static List<MonsterSkillAnimationConfig> monsterSkillAnimationConfigs
    {
        get
        {
            if(_monsterSkillAnimationConfigs == null)
            {
                _monsterSkillAnimationConfigs = new List<MonsterSkillAnimationConfig>
                {
                    new MonsterSkillAnimationConfig
                    {
                        monsterID = 1003,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10003, skillAnimationLength = 1.333f , skillAnimationInterval = new List<float> { 10f ,30f, 40f }},
                            new SkillAnimationConfig { skillID = 11003, skillAnimationLength = 1.5f , skillAnimationInterval = new List<float> { 5f, 36f, 55f }},
                            new SkillAnimationConfig { skillID = 12003, skillAnimationLength = 3f , skillAnimationInterval = new List<float> { 57f,81f, 90f }},
                        }
                     
                    },
                    new MonsterSkillAnimationConfig
                    {
                        monsterID = 1004,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10004, skillAnimationLength = 1.267f , skillAnimationInterval = new List<float> { 18f ,25f, 38 }},
                            new SkillAnimationConfig { skillID = 11004, skillAnimationLength = 2.167f , skillAnimationInterval = new List<float> { 5f, 8f, 10f }},
                            new SkillAnimationConfig { skillID = 12004, skillAnimationLength = 0.333f , skillAnimationInterval = new List<float> { 23f,55f, 65f }},
                        }
                    },
                    new MonsterSkillAnimationConfig
                    {
                        monsterID = 1005,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10005, skillAnimationLength = 2f , skillAnimationInterval = new List<float> { 6f ,20f, 40}},
                            new SkillAnimationConfig { skillID = 11005, skillAnimationLength = 3.734f , skillAnimationInterval = new List<float> { 18f, 26f, 35f }},
                            new SkillAnimationConfig { skillID = 12005, skillAnimationLength = 1.167f , skillAnimationInterval = new List<float> { 67f,75f, 112f }},
                        }
                    }
                    ,
                     new MonsterSkillAnimationConfig
                    {
                        monsterID = 1006,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10006, skillAnimationLength = 1.067f , skillAnimationInterval = new List<float> { 9f ,18f, 32f}},
                            new SkillAnimationConfig { skillID = 11006, skillAnimationLength = 1f , skillAnimationInterval = new List<float> { 10f, 26f, 30f }},
                            new SkillAnimationConfig { skillID = 12006, skillAnimationLength = 2.6f , skillAnimationInterval = new List<float> { 34f,45f, 77f }},
                        }
                    }
                    ,
                     new MonsterSkillAnimationConfig
                    {
                        monsterID = 1007,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10007, skillAnimationLength = 1.333f , skillAnimationInterval = new List<float> { 10f ,22f, 38f}},
                            new SkillAnimationConfig { skillID = 11007, skillAnimationLength = 1.167f , skillAnimationInterval = new List<float> { 7f, 15f, 28f }},
                            new SkillAnimationConfig { skillID = 12007, skillAnimationLength = 2.067f , skillAnimationInterval = new List<float> { 15f,44f, 60f }},
                        }
                    },
                    new MonsterSkillAnimationConfig
                    {
                        monsterID = 1009,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10009, skillAnimationLength = 0.833f , skillAnimationInterval = new List<float> { 4f ,13f, 25}},
                            new SkillAnimationConfig { skillID = 11009, skillAnimationLength = 1.533f , skillAnimationInterval = new List<float> { 12f, 25f, 30f }},
                            new SkillAnimationConfig { skillID = 12009, skillAnimationLength = 1f , skillAnimationInterval = new List<float> { 24f,35f, 46f }},
                        }
                    },
                    new MonsterSkillAnimationConfig
                    {
                        monsterID = 1010,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10010, skillAnimationLength = 1.667f , skillAnimationInterval = new List<float> { 7f ,27f, 50}},
                            new SkillAnimationConfig { skillID = 11010, skillAnimationLength = 2f , skillAnimationInterval = new List<float> { 16f, 52f, 88f }},
                            new SkillAnimationConfig { skillID = 12010, skillAnimationLength = 2.601f , skillAnimationInterval = new List<float> { 13f,44f, 60f }},
                        }
                    },
                       new MonsterSkillAnimationConfig
                    {
                        monsterID = 1011,
                        skillAnimationConfigs = new List<SkillAnimationConfig>
                        {
                            new SkillAnimationConfig { skillID = 10011, skillAnimationLength = 1.4f , skillAnimationInterval = new List<float> { 14f ,30f, 42f}},
                            new SkillAnimationConfig { skillID = 11011, skillAnimationLength = 1f , skillAnimationInterval = new List<float> { 6f, 10f, 30f }},
                            new SkillAnimationConfig { skillID = 12011, skillAnimationLength = 1.8f , skillAnimationInterval = new List<float> { 21f,38f, 54f }},
                        }
                    }

                };
            }
            return _monsterSkillAnimationConfigs;
        }
    }

    private static MonsterSearchConfig _monsterSearchConfig = null;
    public static MonsterSearchConfig monsterSearchConfig
    {
        get 
        {
            if(_monsterSearchConfig == null)
            {
                _monsterSearchConfig = JsonMapper.ToObject<MonsterSearchConfig>(PlayerPrefs.GetString(ONAME.MonsterSearchConfigFileName));
            }
            return _monsterSearchConfig;
        }
    }

    //模拟玩家数据
    private static PlayerData _playerdata = null;
    public static PlayerData playerdata
    {
        get
        {
            if (_playerdata == null)
            {
                _playerdata = new PlayerData
                {
                    userIndex = 1,
                    userLevel = 2,
                    userType = 0,
                    userName = "AndaChen",
                    monsterList = new List<MonsterGrowUpAttribute>
                    {
                        new MonsterGrowUpAttribute
                        {
                            monsterID =
                            1001 ,monsterIndex = 34 ,monsterNickName =
                            "安达一号",
                            monsterMaxPower = 200,
                            monsterCurrentPower = 200,
                            monsterRecoveryStrengthFullTime = AndaGameExtension.GetCurrentUnixTime()+60,
                            finishCleanShTime = AndaGameExtension.GetCurrentUnixTime()+60,
                            currentStateType = 3,
                            finishTreasureTime = 0,
                            currentLuckyValue = 0.1f,
                            currentCleanValue = 0.15f,
                            belongStrongholdIndex = 1
                            ,monsterSkillIDList = new List<SkillGrowupAttribute>
                            {
                                
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "重重拳",
                                    skillAchievementValue = 0,
                                    skillIndex =2,
                                    skillID = 11000
                                },
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "萌萌拳",
                                    skillAchievementValue = 0,
                                    skillID =10000,
                                    skillIndex =1,
                                },
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "萌萌拳",
                                    skillAchievementValue = 0,
                                    skillID =11000,
                                    skillIndex =1,
                                },
                            }
                        },
                        new MonsterGrowUpAttribute
                        {
                            monsterID = 1002,
                            monsterIndex = 45,
                            monsterNickName =
                            "安达二号" ,
                            monsterMaxPower = 200,
                            monsterCurrentPower = 200,
                             belongStrongholdIndex = 1,
                             finishCleanShTime = 0,
                            finishTreasureTime = AndaGameExtension.GetCurrentUnixTime()+60,
                            currentStateType = 2,
                            currentLuckyValue = 0.1f,
                            currentCleanValue = 0.15f,
                            monsterSkillIDList = new List<SkillGrowupAttribute>
                            {
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "萌萌拳",
                                    skillAchievementValue = 0,
                                    skillID =11001,
                                    skillIndex = 1,
                                },
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "聚能格挡",
                                    skillAchievementValue = 0 ,
                                    skillID = 10001,
                                    skillIndex =19,
                                },
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "萌萌拳",
                                    skillAchievementValue = 0,
                                    skillID =11001,
                                    skillIndex = 1,
                                },
                            }
                        },
                        new MonsterGrowUpAttribute
                        {
                            monsterID = 1008,
                            monsterIndex = 77 ,
                            monsterNickName = "安达51号" ,
                            monsterMaxPower = 200,
                            monsterCurrentPower = 200,
                            belongStrongholdIndex = 1,
                            finishCleanShTime = 0,
                            finishTreasureTime = 0,
                            currentStateType = 0,
                            currentLuckyValue = 0.2f,
                            currentCleanValue = 0.15f,
                            monsterSkillIDList = new List<SkillGrowupAttribute>
                            {
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "萌萌拳",
                                    skillAchievementValue = 0,
                                    skillID =10000,
                                    skillIndex =1,
                                },
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "重重拳",
                                    skillAchievementValue = 0,
                                    skillIndex =2,
                                    skillID = 10001
                                },
                                new SkillGrowupAttribute()
                                {
                                    skillNickName = "咻咻咻",
                                    skillAchievementValue = 0 ,
                                    skillID = 15000,
                                    skillIndex =2,
                                }
                            }
                        }
                    },
                    storngholdList = new List<PlayerStrongHoldGrowUpAttribute>
                    {
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30002,
                            strongholdIndex = 1,
                            hostIndex = 1,
                            strongholdNickName = "Anda乐园",
                            strongholdPosition = new List<double>
                            {
                                29.8005044005,121.5396703787
                            },
                            strongholdLocationName = "南部商务区，鄞州区，宁波，浙江，中国",
                            strongholdGloryValue = 22,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int> { 34, 45,75}
                        },
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30001,
                            strongholdIndex = 2,
                            hostIndex = 1,
                            strongholdNickName = "Anda乐园2",
                            strongholdPosition = new List<double>
                            {
                                29.8066676327,121.5399385996
                            },
                            strongholdLocationName = "南部商务区，鄞州区，宁波，浙江，中国",
                            strongholdGloryValue = 11,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int> { 34, 45,75}
                        }
                    },
                    playerObjects = new List<SD_Pag4U>
                    {
                        new SD_Pag4U { objectID = 40000 , objectCount = 2 },
                        new SD_Pag4U { objectID = 40001 , objectCount = 2},
                        new SD_Pag4U { objectID = 40002 , objectCount = 2},
                        new SD_Pag4U { objectID = 40003 , objectCount = 2},
                        new SD_Pag4U { objectID = 42010 , objectCount = 2},
                        new SD_Pag4U { objectID = 42011 , objectCount = 3},
                        new SD_Pag4U { objectID = 42013 , objectCount = 2}
                    }
                };
            }
            string json = JsonMapper.ToJson(_playerdata);
            PlayerPrefs.SetString("PlayerData1", json);
            return _playerdata;
        }
    }

    //模拟其他玩家的数据而已
    private static List<PlayerData> _otherPlayerList = null;
    public static List<PlayerData> otherPlayerList
    {
        get
        {
            if (_otherPlayerList == null)
            {
                _otherPlayerList = new List<PlayerData>();
                PlayerData pd = new PlayerData
                {
                    userIndex = 2,
                    userType = 1,
                    userLevel = 2,
                    userName = "我是敌人",
                    monsterList = new List<MonsterGrowUpAttribute>
                    {
                        new MonsterGrowUpAttribute
                        {
                            monsterID = 1003 ,monsterIndex = 22 ,monsterNickName = "NPC SAMA", rareTypeGrowup =0,
                            monsterMaxPower = 1000000,
                            monsterCurrentPower = 1000000,
                            monsterSkillIDList = new List<SkillGrowupAttribute>
                            {
                                new SkillGrowupAttribute
                                {
                                    skillID = 10003,skillIndex =1,skillAchievementValue =0,
                                    skillNickName = "粒子炮"
                                },
                                new SkillGrowupAttribute
                                {
                                    skillID = 11003,skillIndex =3,skillAchievementValue =0,
                                    skillNickName = "卷土重来"
                                },
                                new SkillGrowupAttribute
                                {
                                    skillID = 12003,skillIndex =4,skillAchievementValue =0,
                                    skillNickName = "卷土重来2"
                                }

                            }
                        },
                        new MonsterGrowUpAttribute
                        {
                            monsterID = 1002 ,monsterIndex = 75 ,monsterNickName = "NPC SAMA",rareTypeGrowup =0,
                            monsterMaxPower = 200,
                            monsterCurrentPower = 200,
                            monsterSkillIDList = new List<SkillGrowupAttribute>
                            {
                                new SkillGrowupAttribute
                                {
                                    skillID = 10001,skillIndex =1,skillAchievementValue =0,
                                    skillNickName = "so cool"
                                },
                                new SkillGrowupAttribute
                                {
                                    skillID = 11001,skillIndex =1,skillAchievementValue =0,
                                    skillNickName = "so cool2"
                                }
                            }
                        }
                    },
                    storngholdList = new List<PlayerStrongHoldGrowUpAttribute>
                    {
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30001,
                            monsterCount = 1,
                            strongholdIndex = 2,
                            hostIndex =  2,
                            strongholdNickName = "无敌据点喽1",
                            strongholdPosition = new List<double>
                            {
                                29.8197739618,121.5601434826
                            },
                            strongholdLocationName = "南部商,鄞州,宁波,浙江,中国",
                            strongholdGloryValue = 220,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int>{ 22 },

                        },
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30001,
                            monsterCount = 1,
                            strongholdIndex = 15,
                            hostIndex =  2,
                            strongholdNickName = "无敌据点喽2",
                            strongholdPosition = new List<double>
                            {
                                29.8178750068,121.5521397709
                            },
                            strongholdLocationName = "南部商,鄞州,宁波,浙江,中国",
                            strongholdGloryValue = 220,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int>{ 75 },

                        },
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30001,
                            monsterCount = 1,
                            strongholdIndex = 16,
                            hostIndex =  2,
                            strongholdNickName = "无敌据点喽3",
                            strongholdPosition = new List<double>
                            {
                                29.8248190497,121.5555944561
                            },
                            strongholdLocationName = "南部商,鄞州,宁波,浙江,中国",
                            strongholdGloryValue = 220,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int>{ 22 },

                        },
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30003,
                            monsterCount = 1,
                            strongholdIndex = 17,
                            hostIndex =  2,
                            strongholdNickName = "无敌据点喽4",
                            strongholdPosition = new List<double>
                            {
                                29.8274971251,121.5655283106
                            },
                            strongholdLocationName = "南部商,鄞州,宁波,浙江,中国",
                            strongholdGloryValue = 220,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int>{ 75 },

                        },
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30001,
                            monsterCount = 1,
                            strongholdIndex = 18,
                            hostIndex =  2,
                            strongholdNickName = "无敌据点喽5",
                            strongholdPosition = new List<double>
                            {
                                29.8302469151,121.5614886783
                            },
                            strongholdLocationName = "南部商,鄞州,宁波,浙江,中国",
                            strongholdGloryValue = 220,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int>{ 22 },

                        },
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30003,
                            monsterCount = 1,
                            strongholdIndex = 19,
                            hostIndex =  2,
                            strongholdNickName = "无敌据点喽6",
                            strongholdPosition = new List<double>
                            {
                                29.8296753611,121.5575879996
                            },
                            strongholdLocationName = "南部商,鄞州,宁波,浙江,中国",
                            strongholdGloryValue = 220,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int>{ 75 },

                        },
                        new PlayerStrongHoldGrowUpAttribute
                        {
                            strongholdID = 30002,
                            monsterCount = 1,
                            strongholdIndex = 20,
                            hostIndex =  2,
                            strongholdNickName = "无敌据点喽7",
                            strongholdPosition = new List<double>
                            {
                                29.8280211814,121.5424399208
                            },
                            strongholdLocationName = "南部商,鄞州,宁波,浙江,中国",
                            strongholdGloryValue = 220,
                            playerStrongholdMedalLevel = 0,
                            strongholdFightMonsterList = new List<int>{ 22 },

                        }
                    }
                };
                _otherPlayerList.Add(pd);
            }
            return _otherPlayerList;
        }
    }
    private static List<BusinessData> _businessData = null;
    public static List<BusinessData> businessData
    {
        get
        {
            if (_businessData == null)
            {
                _businessData = new List<BusinessData>();
                BusinessData bd = new BusinessData
                {
                    userIndex = 1000,
                    userType = 2,
                    userLevel = 0,
                    userName = "麦当劳",
                    monsterList = new List<MonsterGrowUpAttribute>
                    {
                       new MonsterGrowUpAttribute()
                       {
                           monsterID = 1005,
                           monsterIndex = 21,
                           monsterNickName = "麦当劳小姐姐",
                            monsterMaxPower = 200,
                            monsterCurrentPower = 200,
                           rareTypeGrowup = 0,
                           monsterSkillIDList = new List<SkillGrowupAttribute>
                           {
                               new SkillGrowupAttribute
                               {
                                   skillID = 10000,skillIndex =1,skillNickName ="嘻嘻攻击",
                                   skillAchievementValue = 0,
                               }
                           }
                       }
                    },
                    strongholdList = new List<BusinessStrongholdGrowUpAttribute>
                    {
                        new BusinessStrongholdGrowUpAttribute
                        {
                               strongholdID = 30002,
                               strongholdIndex = 1,
                               hostIndex = 1000,
                               strongholdNickName = "麦当劳的据点",
                               strongholdPosition = new List<double>
                               {
                                    29.8109573836,121.5447440761
                               },
                               strongholdLocationName =  "南部商,鄞州,宁波,浙江,中国",
                               strongholdGloryValue = 2343,
                               strongholdFightMonsterList = new List<int>
                               {
                                   21
                               },

                        },
                        new BusinessStrongholdGrowUpAttribute
                        {
                               strongholdID = 30002,
                               strongholdIndex = 2,
                               hostIndex = 1000,
                               strongholdNickName = "麦当劳的据点",
                               strongholdPosition = new List<double>
                               {
                                    29.8284710100,121.5535928600
                               },
                               strongholdLocationName =  "南部商,鄞州,宁波,浙江,中国",
                               strongholdGloryValue =30933,
                               strongholdFightMonsterList = new List<int>
                               {
                                   21
                               }
                        },
                    }
                };
                _businessData.Add(bd);
            }
            return _businessData;
        }
    }

    private static List<TipsConfig> _tipsConfigList = null;
    public static List<TipsConfig> tipsConfigList
    {
        get
        {
            if (_tipsConfigList == null)
            {
                //string json = PlayerPrefs.GetString(ONAME.TipsConfigFileName);
                //_tipsConfigList = JsonMapper.ToObject<List<TipsConfig>>(json);

                _tipsConfigList = new List<TipsConfig>
                {
                    new TipsConfig
                    {
                        id = 0,
                        content = "请选择一个平面进行识别"
                    },
                    new TipsConfig
                    {
                        id = 1,
                        content = "正在构建专属次元空间"
                    },
                    new TipsConfig
                    {
                        id = 2,
                        content = "欢迎来到次元空间，这里是独立于现实世界的一个密闭空间，这里不受真实世界影响，尽情释放自己吧"
                    },
                    new TipsConfig
                    {
                        id = 3,
                        content = "欢迎回到地球"
                    },
                    new TipsConfig
                    {
                        id = 4,
                        content = "验证失败，检查一遍再来一次"
                    },
                    new TipsConfig
                    {
                        id = 5 ,
                        content = "正在验证....."
                    },
                    new TipsConfig
                    {
                        id = 6 ,
                        content = "哦，感谢你还记得我."
                    },
                    new TipsConfig
                    {
                        id = 7,
                        content = "选择一个吧."
                    },
                    new TipsConfig
                    {
                        id = 8,
                        content = "当前定位附近没有您的其他据点，已经自动为你挑选了合适的位置，点击确定立刻前往？您可以从右边列表中选择你觉得合适的据点位置."
                    },
                    new TipsConfig
                    {
                        id = 9,
                        content = "根据当前的数据已经为您挑选了最合适的据点建设图纸，是否立即使用？您也可以从右边列列表中选择您觉得合适的据."
                    },
                    new TipsConfig
                    {
                        id = 10,
                        content = "您确定在此处建立据点吗?"
                    },
                    new TipsConfig
                    {
                        id = 11,
                        content = "编辑完成后点击保存，我会立刻安排建立据点?"
                    },
                    new TipsConfig
                    {
                        id = 12,
                        content = "立刻开启据点"
                    },
                    new TipsConfig
                    {
                        id = 13,
                        content = "发起挑战"
                    },
                    new TipsConfig
                    {
                        id = 14,
                        content = "进行保卫"
                    },
                    new TipsConfig
                    {
                        id = 15,
                        content = "已经为你筛选出最适合本剧挑战的伙伴"
                    },
                    new TipsConfig
                    {
                        id = 16,
                        content = "请选择一个您喜欢的雕像"
                    },
                    new TipsConfig
                    {
                        id = 17,
                        content = "哦，又来一位新朋友，稍等片刻，正在问你构建次元通道"
                    },
                    new TipsConfig
                    {
                        id = 18,
                        content = "欢迎回来"
                    }
                };
            }
            return _tipsConfigList;
        }
    }



    public static List<MonsterBaseConfig> _gameBaseMonsterAttributeList = null;
    public static List<MonsterBaseConfig> gameBaseMonsterAttributeList
    {
        get 
        {
            if(_gameBaseMonsterAttributeList == null)
            {
                string json = PlayerPrefs.GetString(ONAME.MonsterConfigFileName);
                Debug.Log("monsterJson" + json);
                _gameBaseMonsterAttributeList = JsonMapper.ToObject<List<MonsterBaseConfig>>(json);
            }
            return _gameBaseMonsterAttributeList;
        }
      /* get
        {
            if (_gameBaseMonsterAttributeList == null)
            {
                _gameBaseMonsterAttributeList = new List<MonsterBaseConfig>
                {
                    new MonsterBaseConfig
                    {
                        monsterID = 1000,
                        monsterBaseBlood = 850,
                        monsterBaseEnergy = 800,
                        monsterBaseSkillList = new List<int> { 10000, 11000, 10000 },
                        monsterDescription = "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "猫",
                        monsterBaseStrength = 300,
                        monsterBaseMoveSpeed = 1,
                        bloodCoefficient = 0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient = 0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999},
                        pollution = new List<double> { 0.05f,0.1f,0.15f,0.25f,0.3f,0.4f },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                     new MonsterBaseConfig
                    {
                        monsterID = 1001,
                        monsterBaseBlood = 850,
                        monsterBaseEnergy = 800,
                        monsterBaseSkillList = new List<int> { 10000 , 11000,10000 },
                        monsterDescription = "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "傻鸡",
                        monsterBaseStrength = 300,
                        monsterBaseMoveSpeed = 1,
                        bloodCoefficient = 0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient = 0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499,999,1999,3999,7999,15999,31999},
                        pollution = new List<double>{ 0.05f,0.1f,0.15f,0.25f,0.3f,0.4f },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                    new MonsterBaseConfig
                    {
                        monsterID = 1002,
                        monsterBaseBlood = 850,
                        monsterBaseEnergy =800,
                        monsterBaseSkillList =new List<int> { 10001 , 11001,10001 },
                        monsterDescription= "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "大熊",
                        monsterBaseStrength =300,
                        monsterBaseMoveSpeed =1,
                        bloodCoefficient =0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient =0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999 },
                        pollution = new List<double>{ 0.05f,0.1f,0.15f,0.25f,0.3f, 0.4f },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                    new MonsterBaseConfig
                    {
                        monsterID = 1003,
                        monsterBaseBlood = 850,
                        monsterBaseEnergy =800,
                        monsterBaseSkillList =new List<int> { 10001 , 11001,10001 },
                        monsterDescription= "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "翼宿",
                        monsterBaseStrength =300,
                        monsterBaseMoveSpeed =1,
                        bloodCoefficient =0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient =0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999 },
                        pollution = new List<double>{ 0.05f,0.1f,0.15f,0.25f,0.3f, 0.4f },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                    new MonsterBaseConfig
                    {
                        monsterID = 1004,
                        monsterBaseBlood = 850,
                        monsterBaseEnergy = 800,
                        monsterBaseSkillList = new List<int> { 10000 },
                        monsterDescription = "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "兔子",
                        monsterBaseStrength = 300,
                        monsterBaseMoveSpeed = 1,
                        bloodCoefficient = 0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient = 0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999},
                        pollution = new List<double> {0.05f,0.1f,0.15f,0.25f,0.3f, 0.4f },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                    new MonsterBaseConfig
                    {
                        monsterID = 1005,
                        monsterBaseBlood = 10000,
                        monsterBaseEnergy = 800,
                        monsterBaseSkillList = new List<int> { 10000 },
                        monsterDescription = "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "鸟兽",
                        monsterBaseStrength = 100,
                        monsterBaseMoveSpeed = 0.8,
                        bloodCoefficient = 0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient = 0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999},
                        pollution = new List<double> { 0.05f,0.1f,0.15f,0.25f,0.3f,0.4f },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                    new MonsterBaseConfig
                    {
                        monsterID = 1006,
                        monsterBaseBlood = 850,
                        monsterBaseEnergy = 800,
                        monsterBaseSkillList = new List<int> { 10000 },
                        monsterDescription = "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "闪电小子",
                        monsterBaseStrength = 100,
                        monsterBaseMoveSpeed = 0.9,
                        bloodCoefficient = 0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient = 0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999},
                        pollution = new List<double>{0.05f,0.1f,0.15f,0.25f,0.3f,0.4f },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                    new MonsterBaseConfig
                    {
                        monsterID = 1008,
                        monsterBaseBlood = 850,
                        monsterBaseEnergy = 800,
                        monsterBaseSkillList = new List<int> { 10000 },
                        monsterDescription = "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "女宿",
                        monsterBaseStrength = 100,
                        monsterBaseMoveSpeed = 0.9,
                        bloodCoefficient = 0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient = 0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999},
                        pollution = new List<double>{0.05f,0.1f,0.15f,0.25f,0.3f, 0.4f  },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400
                    },
                    new MonsterBaseConfig
                    {
                        monsterID = 2002,
                        monsterBaseBlood = 2400,
                        monsterBaseEnergy = 2400,
                        monsterBaseStrength = 1800,
                        monsterBaseSkillList = new List<int> { 10000 },
                        monsterDescription = "东方青龙七宿之首，为青龙之角。原是星域一处重地-----“天门”的一道明火，数万年不灭，继而化身为守门人，坐镇一方，擅入者“死”。冷静,忠诚，带有浓厚的杀伐之气",
                        monsterName = "烛光",
                        monsterBaseMoveSpeed = 0.9,
                        bloodCoefficient = 0.75f,
                        energyCoefficient = 0.2f,
                        strengthCoefficient = 0.2f,
                        rareType = 0,
                        growUpEXPLimit = new List<int> { 499 , 999,1999,3999,7999,15999,31999},
                        pollution = new List<double>{0.05f,0.1f,0.15f,0.25f,0.3f, 0.4f  },
                        maxLucky = 0.65f,
                        baseCleanValue = 0.1f,
                        baseCleanTime = 5400

                    }

                };
            }
            return _gameBaseMonsterAttributeList;
        }
*/
    }


    public static List<GameAssetIDType> _gameAssetIDTypes = null;
    public static List<GameAssetIDType> gameAssetIDTypes
    {

        get 
        {
            if(_gameAssetIDTypes == null)
            {
                string json = PlayerPrefs.GetString(ONAME.GameAssetIDTypeConfig);
                _gameAssetIDTypes = JsonMapper.ToObject<List<GameAssetIDType>>(json);
            }

            return _gameAssetIDTypes;
        }
        /*
        get 
        {
            if(_gameAssetIDTypes == null)
            {
                _gameAssetIDTypes = new List<GameAssetIDType>()
                {
                    #region 宠物
                    new GameAssetIDType
                    {
                        typeName = "星宿",
                        type = 1000,
                        idRange = new List<int> { 1000, 1999 } ,
                    },
                    #endregion
                    #region 技能
                    new GameAssetIDType
                    {
                        typeName = "技能",
                        type = 10000,
                        idRange  = new List<int> {10000,19999} ,
                        subdivides = new List<GameAssetIDType>
                        {
                            new GameAssetIDType
                            {
                                typeName = "普通攻击",
                                type = 10000,
                                idRange = new List<int> {10000,10999 } ,
                            } ,
                            new GameAssetIDType
                            {
                                typeName = "闪避",
                                type =  11000,
                                idRange = new List<int> {11000,11999} ,
                            } ,new GameAssetIDType
                            {
                                typeName = "技能",
                                type = 12000,
                                idRange =new List<int> {12000,12999}

                            } ,
                            new GameAssetIDType
                            {
                                typeName = "特殊技能",
                                type =13000,
                                idRange = new List<int>{13000,13999}
                            }
                        }
                    },
                    #endregion
                    #region 徽章 &  徽章图案
                    new GameAssetIDType
                    {
                        typeName = "徽章",
                        type = 20000,
                        idRange = new List<int> {20000,20999} ,
                        subdivides = new List<GameAssetIDType>
                        {
                            new GameAssetIDType
                            {
                                type = 20000,
                                typeName = "徽章面板",
                                idRange = new List<int> {20000, 20099 }
                            } ,
                            new GameAssetIDType
                            {
                                type = 20100,
                                typeName = "据点徽章图案",
                                idRange = new List<int> {20100, 20199}
                            } ,
                            new GameAssetIDType
                            {
                                type = 20200,
                                typeName = "Boss勋章图案",
                                idRange = new List<int> {20200,20299} ,
                            } ,
                            new GameAssetIDType
                            {
                                type = 20300,
                                typeName =  "成就勋章图盘",
                                idRange = new List<int> {20300, 20399} ,
                            } ,
                            new GameAssetIDType
                            {
                                type = 20400,
                                typeName = "活动勋章",
                                idRange =new List<int> {20400,20499} ,
                            } ,
                            new GameAssetIDType
                            {
                                type = 20500,
                                typeName = "探索勋章",
                                idRange = new List<int> {20500, 20599} ,
                            } ,
                            new GameAssetIDType
                            {
                                type =20600,
                                typeName = "特殊勋章",
                                idRange = new List<int> {20600,20699} ,
                            } ,
                            new GameAssetIDType
                            {
                                type = 20700,
                                typeName = "隐秘徽章",
                                idRange = new List<int>{20700, 20799}
                            }
                        }
                    },
                    #endregion
                    #region 道具
                    new GameAssetIDType
                    {
                        type = 40000,
                        typeName = "道具",
                        idRange = new List<int> { 40000,49999} ,
                        subdivides = new List<GameAssetIDType>
                        {
                            new GameAssetIDType
                            {
                                type = 40000,
                                typeName = "药水",
                                idRange = new List<int> { 40000, 40009 }
                            },
                            new GameAssetIDType
                            {
                                type = 40010,
                                typeName = "精粹",
                                idRange = new List<int> {40010, 40019 }
                            },
                            new GameAssetIDType 
                            {
                                type = 40020,
                                typeName =  "晶体管",
                                idRange = new List<int> { 40020,40029}
                            },
                            new GameAssetIDType
                            {
                                type = 42000,
                                typeName = "传送门",
                                idRange = new List<int> {42000,42009}
                            } ,
                            new GameAssetIDType
                            {
                                type = 42010,
                                typeName = "据点图纸",
                                idRange = new List<int> {42010, 42019}
                            } ,
                            new GameAssetIDType
                            {
                                type = 42020,
                                typeName = "探测器",
                                idRange = new List<int> {42020, 42029} ,
                            } ,
                            new GameAssetIDType
                            {
                                type = 42030,
                                typeName = "星域名货币",
                                idRange = new List<int> {42030 , 42059}
                            } ,
                            new GameAssetIDType
                            {
                                type = 43000,
                                typeName =  "散落的小物件",
                                idRange = new List<int> {43000, 43999} ,
                            } ,
                            new GameAssetIDType
                            {
                                type = 44000,
                                typeName = "幸运物",
                                idRange = new List<int> {44000, 44999}
                            }
                        }
                    }
                    #endregion
                    #region Icon 一些按钮图标需要动态加载
                 
                    #endregion
                };
            }
            return _gameAssetIDTypes;
        }*/
    }





    //免费的据点徽章图像
    public static FreeStrongholdMedalList _freeStrongholdMedals = null;
    public static FreeStrongholdMedalList freeStrongholdMedals
    {
        get
        {
            if(_freeStrongholdMedals == null)
            {
                _freeStrongholdMedals = new FreeStrongholdMedalList
                {
                    medalTextureID = new List<int>
                    {
                        21001,21003,21005
                    }
                };
            }
            return _freeStrongholdMedals;
        }
    }



    public static List<SkillBaseAttribute> _gameBaseSkillAttributeList = null;

    public static List<SkillBaseAttribute> gameBaseSkillAttributeList
    {
        get {
        
            if(_gameBaseSkillAttributeList == null)
            {
            
                string json = PlayerPrefs.GetString(ONAME.SkillConfigFileName);
                _gameBaseSkillAttributeList = JsonMapper.ToObject<List<SkillBaseAttribute>>(json);
        
            }
        
            return _gameBaseSkillAttributeList;
        }
        /*get
        {
            if (_gameBaseSkillAttributeList == null)
            {
                _gameBaseSkillAttributeList = new List<SkillBaseAttribute>
                {

                   new SkillBaseAttribute
                        {
                            skillID = 10000,
                            skillIDList = new List<int>{ 10000 },
                            skillName = "测试导弹1号",
                            skillMoveSpeed = 15f,
                            skillPower = new List<int>{ 20,40,3000,4000,5000},
                            skillCosumeEenrgy = new List<int> { 1,90,80,70},
                            skillEffectID = -1,
                            skillDescription = "向前发射一枚聚气弹",
                            skillType = 0,
                            attackType = 0,
                            skillCD = new List<double>{ 0.5f ,2.75f,2f,1.5f},
                            skillArchievementLimit = new List<int> { 600, 1200, 2400, 4800, 9600 }

                        },
                        new SkillBaseAttribute
                        {
                            skillID = 10001,
                            skillIDList =  new List<int>{ 10001},
                            skillName = "粒子炮",
                            skillMoveSpeed = 15f,
                            skillPower = new List<int>{ 20,40,3000,4000,5000},
                            skillCosumeEenrgy = new List<int>{ 40,90,80,70},
                            skillEffectID = -1,
                            skillDescription = "猫的专属技能，发射2枚聚气弹后再聚集所以的所有能量，向前发射一枚大型惧聚气弹，如果击中敌方单位，会立刻从天上掉落3枚聚气弹",
                            skillType = 0,
                            attackType = 0,
                            skillCD = new List<double>{ 0.26f,1,1,1},
                            skillArchievementLimit = new List<int> { 600, 1200, 2400, 4800, 9600 }
                        },
                         new SkillBaseAttribute
                        {
                            skillID = 10002,
                            skillIDList = new List<int>{ 10002},
                            skillName = "测试导弹3号",
                            skillMoveSpeed = 50f,
                            skillPower = new List<int>{ 20,40,3000,4000,5000},
                            skillCosumeEenrgy = new List<int>{ 100,100,100,100},
                            skillEffectID = -1,
                            skillDescription = "掉落2枚大型聚气弹",
                            skillType = 0,
                            attackType = 1,
                            skillCD=new List<double>{ 5,5,5,5},
                            skillArchievementLimit = new List<int> { 600, 1200, 2400, 4800, 9600 }
                        },
                         new SkillBaseAttribute
                        {
                            skillID = 15000,
                            skillIDList = new List<int>{ 15000 },
                            skillName = "显现魔法",
                            skillMoveSpeed = 0f,
                            skillPower = new List<int>{ 0 },
                            skillCosumeEenrgy = new List<int>{ 0,0,0,0},
                            skillEffectID = -1,
                            skillDescription = "该技能为通用技能。使用这个技能，会使隐藏单位显现",
                            skillType = 4,
                            attackType = 3,
                            skillCD=new List<double>{ 0, 0, 0, 0 },
                            skillArchievementLimit = new List<int> { 600, 1200, 2400, 4800, 9600 }
                        },
                    new SkillBaseAttribute
                    {
                        skillID = 11000,
                        skillIDList = new List<int>{ 11000 },
                        skillName = "聚能格挡",
                        skillMoveSpeed = 0f,
                        skillPower = new List<int>{ 20,40,3000,4000,5000},
                        skillCosumeEenrgy = new List<int>{20,40,60,100},
                        skillEffectID = -1,
                        skillDescription = "该技能为顺发技能，抵挡同等防御值的攻击伤害",
                        skillType = 1,
                        attackType = 3 ,
                        skillCD=new List<double>{ 1f , 1f, 1f, 1f },
                        skillArchievementLimit = new List<int> { 600, 1200, 2400, 4800, 9600 }
                    },
                    new SkillBaseAttribute
                    {
                        skillID = 11001,
                        skillIDList = new List<int>{ 11001 },
                        skillName = "卷土重来",
                        skillMoveSpeed = 0f,
                        skillPower = new List<int>{ 20,40,3000,4000,5000},
                        skillCosumeEenrgy = new List<int>{20,40,60,100},
                        skillEffectID = -1,
                        skillDescription = "该技能为顺发技能，抵挡同等防御值的攻击伤害",
                        skillType = 1,
                        attackType = 3 ,
                        skillCD=new List<double>{ 1f , 1f, 1f, 1f },
                        skillArchievementLimit = new List<int> { 600, 1200, 2400, 4800, 9600 }
                    }
                };
            }
            return _gameBaseSkillAttributeList;
        }

        */
    }

    private static List<CD_ObjAttr> _objectsList = null;
    public static List<CD_ObjAttr> objectsList
    {
        get
        {
            if(_objectsList == null)
            {

                string json = PlayerPrefs.GetString(ONAME.ObjectsConfigFileName);
                _objectsList = JsonMapper.ToObject<List<CD_ObjAttr>>(json);

            }

            return _objectsList;
        }
       /* get
        {
            if (_objectsList == null)
            {
                _objectsList = new List<CD_ObjAttr>
                {
                    new CD_ObjAttr
                    {
                        objectID = 40000,
                        objectName = new List<string>
                        {
                            "200ml意志力药水" ,
                            "500ml意志力药水",
                            "1000ml意志力药水",

                        },
                        objectBlood = new List<int> { 1,1,1},
                        objectDescription = new List<string>
                        {
                              "可以立即恢复200点意志力",
                             "可以立即恢复500点意志力",
                              "可以立即恢复500点意志力",
                            
                        },
                        values =new List<int>{ 200,500,1000},

                    },
                    new CD_ObjAttr
                    {
                        objectID = 40010,
                        objectName = new List<string>
                        {
                            "意志力精粹" ,
                            "超级意志力精粹",
                        },
                        objectBlood = new List<int> { 1,1},
                        objectDescription = new List<string>
                        {
                           "可以永久提升50点最大意志力",
                            "可以永久提升100点最大意志力",
                        },
                        values =new List<int>{50,100},

                    },

                     new CD_ObjAttr
                    {
                        objectID = 40020,
                        objectName = new List<string>
                        {
                            "小号意志力精粹储存瓶",
                            "中号意志力精粹储存瓶",
                            "大号意志力精粹储存瓶",
                        },
                        objectBlood = new List<int> { 1,1,1},
                        objectDescription = new List<string>
                        {
                             "可以存储400点意志力，方便战斗时补充意志力",
                            "可以储存600点意志力，方便战斗时补充意志力",
                            "可以储存1000点意志力，方便战斗时补充意志力",
                            
                        },
                        values =new List<int>{ 200,400,1000},

                    },

                    new CD_ObjAttr
                    {
                        objectID = 42000,
                        objectName = new List<string>
                        {
                            "次元传送门（低功率）",
                            "次元传送门（高功率）",
                            "次元传送门（任意门）"
                        },
                        values = new List<int>
                        {
                            1000,1500,100000000
                        },
                        objectBlood = new List<int> { 1,1,1,1,1,1},
                        objectDescription = new List<string>
                        {
                            "可以生成穿越半径为1000米的次元门哦",
                            "可以生成穿越半径为1500米的次元门哦",
                            "可以生成穿越任意距离的次元门哦",
                        }
                    },

                    new CD_ObjAttr
                    {
                        objectID = 42010,
                        objectName = new List<string>
                        {
                            "萌新据点建设图纸",
                            "二阶据点建设图纸",
                            "三阶据点建设图纸",
                            "四阶据点建设图纸",
                            "五阶据点建设图纸",
                            "六阶据点建设图纸",

                        },
                        values  = new List<int>
                        {
                            1,1,1,1,1,1
                        },
                        objectBlood = new List<int>{ 1,1,1,1 },
                        objectDescription =new List<string>
                        {
                            "根据工程图纸可以立即建设萌新据点哦",
                            "根据工程图纸可以立即升级建造二阶据点哦",
                            "根据工程图纸可以立即升级建造三阶据点哦",
                            "根据工程图纸可以立即升级建造四阶据点哦",
                            "根据工程图纸可以立即升级建造五阶阶据点哦",
                            "根据工程图纸可以立即升级建造六阶据点哦"
                        }
                    },
                    new CD_ObjAttr
                    {
                        objectID = 42020,
                        objectName = new List<string>
                        {
                            "探测器S",
                            "探测器XS",
                            "探测器XXS",
                            "放大镜",
                            "望远镜",
                            "显微镜",
                        },
                        objectBlood = new List<int> {1,1,1,1,1,1},
                        values = new List<int> { 10,10,10,10,10,10 },//概率
                        objectDescription = new List<string>
                        {
                            "初代探测器，相对较为落后，但依然能用，能发现一些物品",
                            "是初代探测器的中期改款，性价比很高，能探测出一些稀有物品",
                            "技术全面升级，有几率发现非常稀有的物品，但价格昂贵，慎重考虑",
                            "用于宠物探索时使用，可以让宠物发现一些小物品并且带回",
                            "用于宠物探索时使用，可以让宠物发现一些小物品并且带回",
                            "用于宠物探索时使用，可以让宠物发现一些小物品并且带回",
                        }
                    },
                    new CD_ObjAttr
                    {
                        objectID = 42030,
                        objectName = new List<string>
                        {
                            "星币",
                            "星石",
                            "赤金",
                        },
                        objectBlood = new List<int>{ 1,1,1 },
                        values = new List<int>{ 600 , 1,6000 },
                        objectDescription = new List<string>
                        {
                            "次元空间中主流的货币，用于商品交易",
                            "次元空间中较稀有的货币，用于商品交易,有些物品只能通过星石兑换",
                            "合成传送门必备材料"
                        }
                    },
                    new CD_ObjAttr
                    {
                        objectID = 43000,
                        objectName = new List<string>
                        {
                            "白色星尘",
                            "黄色星尘",
                            "绿色星尘",
                            "紫色星尘",
                            "空白的图纸",
                            "星球记录盘",
                            "星系记录盘",
                            "星域记录盘",
                        },
                        values = new List<int> { 1,1,1,1,1,1,1 },
                        objectDescription = new List<string>
                        {
                            "没用的星尘，暂时没有发现可以用来干什么",
                            "没用的星尘，暂时没有发现可以用来干什么",
                            "没用的星尘，暂时没有发现可以用来干什么",
                            "没用的星尘，暂时没有发现可以用来干什么",
                            "空白的图纸，读星师用来写入神秘星域数据",
                            "记录着来自某一星球的数据",
                            "记录着来自广袤星系的数据",
                            "记录着来自神秘星域的数据",
                        }
                    },new CD_ObjAttr
                    {
                        objectID = 44000,
                        objectName = new List<string>
                        {
                            "星象幸运物(氐)",
                            "星象幸运物(昴)",
                            "星象幸运物(胃)",
                            "星象幸运物(柳)",
                            "星象幸运物(翼)",
                            "星象幸运物(亢)",
                            "星象幸运物(角)",
                            "星象幸运物(奎)",
                            "星象幸运物(毕)",
                            "星象幸运物(女)",
                            "星象幸运物(牛)",
                        },
                        objectBlood = new List<int> {1,1,1,1,1,1,1,1,1,1,1},
                        values = new List<int> { 1,1,1,1,1,1,1,1,1,1,1 },
                        objectDescription = new List<string>
                        {
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                            "佩戴可以提高星宿心情，赶紧为其搭配八",
                        }
                    }

                };
            }
            return _objectsList;
        }*/

    }

    private static List<CD_Mall> _cd_Mall = null;
    public static List<CD_Mall> cd_Mall
    {
        get
        {

            if(_cd_Mall == null)
            {

                string json = PlayerPrefs.GetString(ONAME.MallConfigFileName);
                _cd_Mall = JsonMapper.ToObject<List<CD_Mall>>(json);

            }

            return _cd_Mall;
        }
      /*  get
        {
            if (_cd_Mall == null)
            {
                _cd_Mall = new List<CD_Mall>()
                {
                    new CD_Mall
                    {
                        objectID = 40000,
                        payType = new List<int>{ -1 },
                        tips = "限售,成长小精萃只有在次元空间中领取哦",
                        count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 40001,
                        payType = new List<int>{ 0 },
                        tips = "多买优惠更多哦",
                        price = new List<int>{ 250 },
                        count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 40002,
                        payType = new List<int> { 0 , 1},
                        tips = "每日购买成长高级精粹的数量有限哦",
                        price = new List<int>{ 480,1},
                        count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 40020,
                        payType = new List<int>{ 0},
                        price = new List<int>{ 250},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 40021,
                        payType = new List<int>{ 0},
                        price = new List<int>{ 480},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID  =40022,
                        payType = new List<int> { 0},
                        price = new List<int>{ 900},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 40023,
                        payType = new List<int> { 0 ,1},
                        price = new List<int>{ 2000,4},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 20000,
                        payType = new List<int>{ 0,1},
                        price = new List<int>{ 500,1},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 20001,
                        payType = new List<int>{ 0,1},
                        price = new List<int> { 1000,2},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID =20002,
                        payType = new List<int>{ 1 },
                        price = new List<int>{ 10 },
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID= 20020,
                        payType = new List<int> { 0 ,1},
                        price = new List<int> { 8000, 16},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 20021,
                        payType = new List<int> { 0,1},
                        price = new List<int> { 16000,32},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 20022,
                        payType = new List<int>{ 0,1},
                        price = new List<int>{ 32000,64},
                         count =1,

                    },
                    new CD_Mall
                    {
                        objectID = 20023,
                        payType = new List<int>{ 0,1},
                        price = new List<int>{ 64000,128},
                         count =1,
                    },
                    new CD_Mall
                    {
                        objectID = 20060,
                        payType  =new List<int>{ 1 },
                        price =  new List<int>{ 6 },
                        count = 1000 ,
                    },
                    new CD_Mall
                    {
                        objectID = 20061,
                        payType = new List<int>{ 3},
                        price = new List<int> { 6 },
                        count = 6,
                    }
                };

            }
            return _cd_Mall;
        } */
    }

    private static PlayerStrongholdConfigAttribute _playerStrongholadAttribute = null;
    public static PlayerStrongholdConfigAttribute playerStrongholadAttribute
    {
        get 
        {
            if(_playerStrongholadAttribute ==null)
            {
                string json = PlayerPrefs.GetString(ONAME.StrongholdConfigFileName);
                _playerStrongholadAttribute = JsonMapper.ToObject<PlayerStrongholdConfigAttribute>(json);
            }

            return _playerStrongholadAttribute;
        }
       /* get
        {
            if (_playerStrongholadAttribute == null)
            {
                _playerStrongholadAttribute = new PlayerStrongholdConfigAttribute
                {
                    strongholdID = 30000,
                    playerStrongHoldFixPollution = 0.05f,
                    playerStrongholdGrowUpExp = new List<int>
                    {
                        199,699,1499,3099,6299,1000000000
                    },
                    playerStrongHoldRecoveryStrengthTime = new List<double>
                    {
                        7.5f,5f,4f,3.5f,2f,1.5f
                    },
                    playerStrongHoldCapacity = new List<int>
                    {
                        5,10,25,40,80,1000
                    },
                    playerStronghHoldExprienceBlockCount = new List<int>
                    {
                        10,20,30,40,50,60
                    },
                    //据点覆盖范围 ,倍数， 基础 是 500
                    playerStrongHoldProtectRange = new List<int>
                    {
                        2,3,4,5,6,7
                    },
                    strongholdFightType = new List<int>
                    {
                        1,2,2,3,3,3,
                    },
                    playerStrongholdExpID = new List<int>
                    {
                        0,0,1,1,2,2
                    },
                    playerStrongholdMedalLeveLName = new List<string>
                    {
                        "萌新勋章","初级勋章",
                        "中级勋章","高级勋章",
                        "宗师勋章","至尊勋章"
                    },
                    strongHoldExpUpdateTime = new List<int>
                    {
                        24,24,24,24,24,24
                    }

                };
            }
            return _playerStrongholadAttribute;
        } */
    }

    private static BusinessStrongholdConfigAttribute _businessStrongholadBaseAttribute = null;
    public static BusinessStrongholdConfigAttribute businessStrongholadBaseAttribute
    {
        get
        {
            if(_businessStrongholadBaseAttribute ==null)
            {
                string json = PlayerPrefs.GetString(ONAME.BussinesStrongholdConfigFileName);
                _businessStrongholadBaseAttribute = JsonMapper.ToObject<BusinessStrongholdConfigAttribute>(json);
            }

            return _businessStrongholadBaseAttribute;
        }
        /*get
        {
            if (_businessStrongholadBaseAttribute == null)
            {
                _businessStrongholadBaseAttribute = new BusinessStrongholdConfigAttribute
                {
                    businessStrongholdGrowupExp = new List<int>
                    {
                        6999,13999,279999,55999
                    },
                    businessStrongholdExpBlockCount = new List<int>
                    {
                        100,200,400,800
                    },
                    businessStrongholdLevelName = new List<string>
                    {
                        "初级据点","中级据点","高级据点","顶级据点"
                    },
                    strongholdFightType = new List<int>
                    {
                        1,1,1,1
                    }
                };
            }
            return _businessStrongholadBaseAttribute;
        } */
    }

    private static List<StarsStructure> _starsAttribute;
    public static List<StarsStructure> startAttribute
    {
        get 
        {
            if(_starsAttribute ==null)
            {
                string json = PlayerPrefs.GetString(ONAME.StarConfigFileName);
                _starsAttribute = JsonMapper.ToObject<List<StarsStructure>>(json);
            }

            return _starsAttribute;
        }
        /*get
        {
            if (_starsAttribute == null)
            {
                _starsAttribute = new List<StarsStructure>
                {
                    new StarsStructure
                    {
                        idName = "dou",
                        dir =  0,
                        starName = "斗宿",
                        monsterID = 1030,
                        des =  "NAN",
                        monsterIsPublic = false,
                    },
                    new StarsStructure
                    {
                        idName = "niu",
                        starName = "牛宿",
                        dir =  0,
                        monsterID = 1031,
                        des = "NAN",
                        monsterIsPublic = false,
                    },
                    new StarsStructure
                    {
                        idName = "nv",
                        starName = "女宿",
                        dir =  0,
                        monsterID = 1032,
                        des = "NAN",
                        monsterIsPublic = false,
                    },
                    new StarsStructure
                    {
                        idName = "xu",
                        starName = "虚宿",
                        dir =  0,
                        monsterID = 1033,
                        des = "NAN",
                        monsterIsPublic = false,
                    },
                    new StarsStructure
                    {
                        idName = "wei",
                        starName = "危宿",
                        dir =  0,
                        monsterID = 1004,
                        des = "NAN",
                        monsterIsPublic = true,
                    },
                    new StarsStructure
                    {
                        idName = "shi",
                        starName = "室宿",
                        dir =  0,
                        monsterID = 1035,
                        des = "NAN",
                        monsterIsPublic = false,
                    },
                    new StarsStructure
                    {
                        idName = "bi",
                        starName = "壁宿",
                        dir =  0,
                        monsterID = 1036,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "kui",
                        dir =  1,
                        starName = "奎宿",
                        monsterID = 1037,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "lou",
                        dir =  1,
                        starName = "娄宿",
                        monsterID = 1038,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "wei",
                        dir =  1,
                        starName = "胃宿",
                        monsterID = 1039,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "mao",
                        dir =  1,
                        starName = "昴宿",
                        monsterID = 1002,
                        des = "NAN",
                        monsterIsPublic = true
                    },
                    new StarsStructure
                    {
                        idName = "bi",
                        dir =  1,
                        starName = "毕宿",
                        monsterID = 1041,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "can",
                        dir =  1,
                        starName = "参宿",
                        monsterID = 1000,
                        des = "NAN",
                        monsterIsPublic = true
                    },
                    new StarsStructure
                    {
                        idName = "zi",
                        dir =  1,
                        starName = "觜宿",
                        monsterID = 1043,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "jing",
                        dir =  2,
                        starName = "井宿",
                        monsterID = 1044,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "gui",
                         dir =  2,
                        starName = "鬼宿",
                        monsterID = 1045,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "liu",
                         dir =  2,
                        starName = "柳宿",
                        monsterID = 1005,
                        des = "NAN",
                        monsterIsPublic = true
                    },
                    new StarsStructure
                    {
                        idName = "xing",
                         dir =  2,
                        starName = "星宿",
                        monsterID = 1047,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "zhang",
                         dir =  2,
                        starName = "张宿",
                        monsterID = 1048,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "yi",
                         dir =  2,
                        starName = "翼宿",
                        monsterID = 1049,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "zhen",
                         dir =  2,
                        starName = "轸宿",
                        monsterID = 1001,
                        des = "NAN",
                        monsterIsPublic = true
                    },
                    new StarsStructure
                    {
                        idName = "kang",
                         dir =  3,
                        starName = "亢宿",
                        monsterID = 1052,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                    new StarsStructure
                    {
                        idName = "jiao",
                         dir =  3,
                        starName = "角宿",
                        monsterID = 1006,
                        des = "NAN",
                        monsterIsPublic = true
                    },

                    new StarsStructure
                    {
                        idName = "di",
                         dir =  3,
                        starName = "氐宿",
                        monsterID = 1053,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                     new StarsStructure
                    {
                         idName = "fang",
                          dir =  3,
                        starName = "房宿",
                        monsterID = 1054,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                      new StarsStructure
                    {
                          idName = "xin",
                           dir =  3,
                        starName = "心宿",
                        monsterID = 1055,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                       new StarsStructure
                    {
                           idName = "wei",
                            dir =  3,
                        starName = "尾宿",
                        monsterID = 1056,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                        new StarsStructure
                    {
                            idName = "ji",
                             dir =  3,
                        starName = "箕宿",
                        monsterID = 1057,
                        des = "NAN",
                        monsterIsPublic = false
                    },
                };

            }
            return _starsAttribute;
        }*/
    }

    private static ChanllengeGame _chanllengeGame = null;
    public static ChanllengeGame chanllengeGame
    {
        get 
        {
            if(_chanllengeGame == null)
            {
                string json = PlayerPrefs.GetString(ONAME.ChanllengeGameConfigFileName);
                _chanllengeGame =  JsonMapper.ToObject<ChanllengeGame>(json);
            }

            return _chanllengeGame ;
        }
      /*  get
        {
            if(_chanllengeGame == null)
            {
                _chanllengeGame = new ChanllengeGame();
                _chanllengeGame.fixedGameWinRewards = new List<GameReward>
                {
                    new GameReward { objectID = 42030 ,randomCount = new List<int> { 100 , 200 }, randomDropPercent = new List<int> {100,100 } },
                };
                _chanllengeGame.randomGameWinRewards = new List<GameReward>
                {
                    new GameReward { objectID = 40000 ,randomCount = new List<int> { 1 , 5 }, randomDropPercent = new List<int> { 10,20 } },
                    new GameReward { objectID = 40001 ,randomCount = new List<int> { 1 , 2 }, randomDropPercent = new List<int> { 10,20 } },
                    new GameReward { objectID = 40002 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 2,5 } },
                    new GameReward { objectID = 42000 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 5,15 } },
                    new GameReward { objectID = 42001 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 2,4 } },
                    new GameReward { objectID = 42001 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 2,4 } },
                    new GameReward { objectID = 42010 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 5,15 } },
                    new GameReward { objectID = 42011 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 2,3 } },
                    new GameReward { objectID = 42012 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 1,3 } },
                    new GameReward { objectID = 42013 ,randomCount = new List<int> { 1 , 1 }, randomDropPercent = new List<int> { 1,2 } },
                };
                _chanllengeGame.fixedGameFaildRewards = new List<GameReward>
                {
                    new GameReward { objectID = 42030 ,randomCount = new List<int> { 0 , 15 }, randomDropPercent = new List<int> {100,100 } },
                };
            }
            return _chanllengeGame;
        } */
    }


    private static SkillArchievementValue _skillArchievementValue = null;
    public static  SkillArchievementValue skillArchievementValue
    {
        
        get 
        {
            if(_skillArchievementValue == null)
            {
                string json = PlayerPrefs.GetString(ONAME.SkillArchievementValueFileName);
                _skillArchievementValue =  JsonMapper.ToObject<SkillArchievementValue>(json);
            }

            return _skillArchievementValue ;
        }
        /*get
        {
            if(_skillArchievementValue == null)
            {
                _skillArchievementValue = new SkillArchievementValue
                {
                    // index= 0 为成功 ， =1 为失败 ， 成就加成
                    archievement = new List<int> { 2, 1 },

                    // 非指向性 = 0 ， 防御= 1 , 治疗=2，位移 = 3， 4 = 法术 5= 指向性
                    cucalTimes = new List<int>
                    {
                        2,2,1,2,1,1
                    }

                };
               
            }
            return _skillArchievementValue;
        }*/
    }

    public static int GetSkillArchievementValue(bool isWin)
    {
        int index = isWin?0:1;
        return skillArchievementValue.archievement[index];
    }

    public static SkillBaseAttribute GetSkillBaseAttribute(int skillID)
    {
        return gameBaseSkillAttributeList.FirstOrDefault(s => s.skillID == skillID);
    }

    public static SkillGrowupAttribute GetSkillGrowUpAttribute(int skillID)
    {
        return null;
    }
    public static MonsterBaseConfig GetMonsterBaseConfig(int monsterID)
    {
        return gameBaseMonsterAttributeList.FirstOrDefault(s => s.monsterID == monsterID);
    }
    /// 角色成长信息
    public static MonsterGrowUpAttribute GetMonsterGrowUpAttribute(int monsterIndex)
    {
        return null;
    }

    public static CD_ObjAttr GetObjectAttribute(int ID)
    {
        return objectsList.FirstOrDefault(s => s.objectID == ID);
    }

    public static PlayerStrongholdConfigAttribute GetStrongBasedAttribute()
    {
        return playerStrongholadAttribute;
    }

    public static BusinessStrongholdConfigAttribute GetBusinessStrongholddBaseAttribute()
    {
        return businessStrongholadBaseAttribute;
    }





    public static T GetObjectsAttribute<T>(int ID) where T : CD_ObjAttr
    {
        var t = objectsList.FirstOrDefault(s => s.objectID == ID);
        return t as T;
    }

    public static CD_ObjAttr GetExpObjAttribute()
    {
        int expBaseId = (int)OTYPE.ObjectsIDType.consumable + (int)OTYPE.ConsumableForIDType.expBlock;
        return GetObjectsAttribute<CD_ObjAttr>(expBaseId); ;
    }

    public static CD_ObjAttr GetStrengthBlockAttr()
    {
        int baseID = (int)OTYPE.ObjectsIDType.consumable + (int)OTYPE.ConsumableForIDType.strengthBlock;
        return GetObjectsAttribute<CD_ObjAttr>(baseID); ;
    }

    public static CD_ObjAttr GetBloodBlockAttr()
    {
        int baseID = (int)OTYPE.ObjectsIDType.consumable + (int)OTYPE.ConsumableForIDType.bloodBlock;
        return GetObjectsAttribute<CD_ObjAttr>(baseID); ;
    }

    public static CD_ObjAttr GetEnergyBlockAttr()
    {
        int baseID = (int)OTYPE.ObjectsIDType.consumable + (int)OTYPE.ConsumableForIDType.energyBlock;
        return GetObjectsAttribute<CD_ObjAttr>(baseID);
    }

    public static CD_ObjAttr GetDimensionDoorAttribute()
    {
        int baseId = (int)OTYPE.ObjectsIDType.consumable + (int)OTYPE.ConsumableForIDType.dimensionDoor;
        return GetObjectsAttribute<CD_ObjAttr>(baseId);
    }
    public static CD_ObjAttr GetShDrawingAttribute()
    {
        int baseId = (int)OTYPE.ObjectsIDType.consumable + (int)OTYPE.ConsumableForIDType.strongholdDrawing;
        return GetObjectsAttribute<CD_ObjAttr>(baseId);
    }

    public static CD_ObjAttr GetCurrencyAttribute()
    {
        int baseId = (int)OTYPE.ObjectsIDType.consumable + (int)OTYPE.ConsumableForIDType.currency;
        return GetObjectsAttribute<CD_ObjAttr>(baseId);
    }
    /// <summary>
    /// Real
    /// </summary>
    /// <returns>The cd object attr.</returns>
    /// <param name="ID">Identifier.</param>
    public static CD_ObjAttr GetCD_ObjAttr(int ID)
    {
        int baseID = OTYPE.GetObjectsBaseID(ID);
        return GetObjectAttribute(baseID);
    }


    public static string GetConsuambleObjectName(int id)
    {
        int idType = AndaDataManager.Instance.GetObjTypeID(id);
        int smallId = id - idType;
        return GetObjectAttribute(idType).objectName[smallId];
    }

    public static string GetConsumableObjectDescription(int id)
    {
        int idType = AndaDataManager.Instance.GetObjTypeID(id);
        int smallId = id - idType;
        return GetObjectAttribute(idType).objectDescription[smallId];
    }


    public static StarsStructure GetStarAttribute(string name)
    {
        return startAttribute.FirstOrDefault(s => s.idName == name);
    }

    public static string GetTipsContent(OTYPE.Tipscontent tipsType)
    {
        return tipsConfigList.FirstOrDefault(s => s.id == (int)tipsType).content;
    }

    public static CD_ObjAttr GetCD_ObjAttrs(int objectTypeID)
    {
        int count = objectsList.Count;
        for(int i= 0 ; i < count; i++)
        {
            if(objectsList[i].objectID == objectTypeID)
            {
                return objectsList[i];
            }
        }
        Debug.Log("查不到要找的物品配置信息，请确认配置文件正确");
        return null;
    }

    public static MonsterSkillAnimationConfig GetMonsterSkillAnimationConfig(int monsterID)
    {
        return monsterSkillAnimationConfigs.FirstOrDefault(s=>s.monsterID == monsterID);
    }
    
   
}
