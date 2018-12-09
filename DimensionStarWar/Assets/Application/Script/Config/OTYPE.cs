using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class OTYPE  {


    public enum CameraType 
    {
        ARCamera,
        GameCamera,
        UICamera,
        UI3DCamera,
    }

    /// <summary>
    /// ui多种多样的运动方式
    /// </summary>

    public enum UIActiveType
    {
        equls,
        linear,
    }


    public enum GameDisplayType
    {
        VV =0,
        AR =1,
    }

    public enum UIFadeType
    {
        slider
    }

    public enum JirvisBtnType
    {
        none = 0,
        monster = 1,
        dimensionroom = 2
    }

    public enum Tipscontent
    {
        none =-1,
        recognise = 0,
        buidingDimensionRoom = 1,
        welcomeDimensionRoom = 2,
        welcomeRealityWorld =3,
        loginfaild=4,
        loging =5,
        welcometologinmenu =6,
        changeOne= 7,
        buildStrongholdButnotOnRange=8,//在建立据点的时候，没有在已经拥有的任何一哥据点的范围内，会发出这个提示
        helptoSelectRightStrongholddraw = 9,//根据玩家的当前的位置自动筛选出合适的据点建造图纸
        checkBuildstronghold=10,//确认在这里构建据点吗
        checkUploadstronghold=11,//确认已经编辑信息完成，会上传至服务器
        startDimensionworld =12,//立刻开占星庭
        challegeStronghold=13,//是否立刻挑战据点
        protectStronghold = 14,//是否离开包保卫据点
        screenBestMonster =15,//筛选出最适合挑战的宠物
        changeStrongholdStatu =16,//筛选出最适合挑战的宠物,
        newPlayer =17,//新玩家，
        oldPlayer = 18, //欢迎回来
    }

    public enum TipsType
    {
        none =-1,
        normalTips = 0 , 
        chooseTips = 2,
        onlyOneChooseTips =1 ,

    }

    public enum PayType
    {
        none = -1,
        coin = 0,
        stone = 1,
        task = 2,
        rmb= 3,
        archi = 4,

    }
    //战斗的模式。挑战模式还是保卫模式
    public enum GameFightType
    {
        protect,
        chanllenge,
    }
    
    /// <summary>
    /// 常见转跳的效果种类
    /// </summary>
    public enum SceneTranslationType
    {
        Galitch,
        LinearBlur,
    }
    public enum WolrdType
    {
        none = -1,
        Reality=0,
        Virtual =1,
    }

    //宠物的当前状态，会保存在服务器上。与宠物战斗的时候的状态有去别的。这是一个总状态区分
    public enum MonsterStateType 
    {
        none = -1,
        leisure = 0,//悠闲，没有事情做
        fight = 1,//战斗状态
        treasure =2,//正在探险中
        clean = 3,//正在打扫中
    }
    
    public enum MonsterActiveStateType
    {
        none = -1,
        idle = 100,
        mood = 200,
        move = 300,
        attack = 400,
        clean = 500,
        tresure= 600,
        hit = 700,
        dead = 800
    }
    public enum MonsterMoodStateType
    {
        none,
        happy,
        sad,
        excited,
    }
    public enum PlayerType
    {
        user = 0,
        otherPlayer = 1 ,
        businessPlayer = 2
    }
    public enum StrongholdType
    {
        playerPrivateSH,
        otherPrivateSH,
        businessSH
    }

    /// <summary>
    /// ID区间
    /// </summary>
    public enum ObjectsIDType
    {
        none = -1,
        state = 0,//状态（0 ，199）
        mood = 500,//表情 （500, 799）
        monster = 1000,//怪兽（1000 ， 1999）
        star = 2000,
        skill = 10000,//技能 （10000， 14999）
        magical = 15000,//魔法技能 （15000， 19999）
        objects = 20000,//固定物品 永久（20000，29999）
        stronghold = 30000,//据点（30000.39999）
        consumable = 40000,//消耗品（40000 ，49999）
        menu = 50000,//(50000 - 50999)菜单
        room = 60000,//(60000 - 60999)房间壁纸
        other = 80000,//(80000 - 89999)其他为分类的
    }

    public enum FixedObjectsIDType
    {
        none =-1,
        medel = 1000,//1000,1999(21000)
    }
    
    //这里的消耗品是给宠物的
    public enum ConsumableForIDType
    {
        none =-1,
        expBlock = 0 ,//经验精粹（0，19）
        strengthBlock = 20,//体力精粹(20 ,39)
        bloodBlock = 40,//血量精粹(40,59)
        energyBlock = 60 ,//能量精粹（60， 79）,
        dimensionDoor = 2000,// 传送门 2000 - 2009 （4 2000- 4 2009）
        strongholdDrawing = 2010,//据点建设图纸 2010 - 2019 (42010 - 42019)
        detector = 2020,// 探测器 ， 2020 - 2029 （42020，42029）
        currency = 2030, // 货币 2030 - 2059 （42030 ， 42059）
        monstersearch= 2060,//星宿探测器 2060-2069（42060 - 42069）
        //monsterCapsule = 2060 ,//星宿胶囊 2060-2069（42060 - 42069）
        playerSpirit = 2070,//精神锁链 2070- 2079 （42070-42079）
        smallerPop = 3000,//散落的小物件，3000 - 3999 (43000, 43999)
        moodPop = 4000,//提高心情的小道具。 4000 - 4499(44000,44999)
    }

    //据点种类 ID 集 分布 
    public enum StrongholdSmallIDType
    {
        playerStronghold = 0,
        bussinessStronghold = 1000,
        tradingStation = 2000,
    }
   
    public static int GetStrongholdSmallIDType(int smallID)
    {
        if(smallID>=0 && smallID < (int)StrongholdSmallIDType.bussinessStronghold) return (int )StrongholdSmallIDType.playerStronghold;
        else  return  (int)StrongholdSmallIDType.bussinessStronghold ;//if(smallID >= (int)StrongholdSmallIDType.playerStronghold )
    }

    /// <summary>
    /// 信息面板图形种类
    /// </summary>
    public enum InfoShapesType
    {
        none = -1,
        circle00 = 0 ,
        circle01 = 1 ,
        line00 = 0 ,
        line01 = 1,
    }
    
    public static  bool CheckConsumableIsExpBlock(int id)
    {
        return id - (int)ObjectsIDType.consumable < (int)ConsumableForIDType.strengthBlock;
    }

    public static GameFightType GetFightType(StrongholdType shType)
    {
        switch (shType)
        {
            case StrongholdType.businessSH:
                return OTYPE.GameFightType.protect;
            case StrongholdType.otherPrivateSH:
                return OTYPE.GameFightType.chanllenge;
            default:
                return OTYPE.GameFightType.protect;
        }
    }

    public static ObjectsIDType GetObjectsIDType(int id)
    {
        if (id >= (int)ObjectsIDType.state && id < 200)
            return ObjectsIDType.state;
        else if (id >= (int)ObjectsIDType.mood && id < 800)
            return ObjectsIDType.mood;
        else if (id >= (int)ObjectsIDType.monster && id < 5000)
            return ObjectsIDType.monster;
        else if (id >= (int)ObjectsIDType.skill && id < 15000)
            return ObjectsIDType.skill;
        else if (id >= (int)ObjectsIDType.magical && id < 20000)
            return ObjectsIDType.magical;
        else if (id >= (int)ObjectsIDType.objects && id < 30000)
            return ObjectsIDType.objects;
        else if (id >= (int)ObjectsIDType.stronghold && id < 40000)
            return ObjectsIDType.stronghold;
        else if (id >= (int)ObjectsIDType.consumable && id < 50000)
            return ObjectsIDType.consumable;
        else if (id >= (int)ObjectsIDType.menu && id < 50999)
            return ObjectsIDType.menu;
        else if (id >= (int)ObjectsIDType.room && id < 60999)
            return ObjectsIDType.room;
        else if (id >= (int)ObjectsIDType.other && id < 89999)
            return ObjectsIDType.other;
        else
            return ObjectsIDType.none;
    }
    #region 获取给宠物使用的消耗品的 细分 Type
   
    public static ConsumableForIDType GetConsumableforIDType(int smallID)
    {
        if (smallID >= (int)ConsumableForIDType.expBlock && smallID < (int)ConsumableForIDType.strengthBlock)
            return ConsumableForIDType.expBlock;
        else if (smallID >= (int)ConsumableForIDType.strengthBlock && smallID < (int)ConsumableForIDType.bloodBlock)
            return ConsumableForIDType.strengthBlock;
        else if (smallID >= (int)ConsumableForIDType.bloodBlock && smallID < (int)ConsumableForIDType.energyBlock)
            return ConsumableForIDType.bloodBlock;
        else if(smallID >= (int)ConsumableForIDType.energyBlock && smallID < 80 ) 
            return ConsumableForIDType.energyBlock;
        else if (smallID >= (int)ConsumableForIDType.dimensionDoor && smallID < (int)ConsumableForIDType.strongholdDrawing)
            return ConsumableForIDType.dimensionDoor;
        else if (smallID >= (int)ConsumableForIDType.strongholdDrawing && smallID <  (int)ConsumableForIDType.detector)
            return ConsumableForIDType.strongholdDrawing;
        else if (smallID >=  (int)ConsumableForIDType.detector && smallID < (int)ConsumableForIDType.currency)
            return ConsumableForIDType.detector;
        else if (smallID >= (int)ConsumableForIDType.currency && smallID < 2060)
            return ConsumableForIDType.currency;
        else if (smallID >= (int)ConsumableForIDType.monstersearch && smallID < 2069)
            return ConsumableForIDType.monstersearch;
        else if(smallID >= (int)ConsumableForIDType.smallerPop && smallID< 4000)
            return ConsumableForIDType.smallerPop;
        else if(smallID >= (int)ConsumableForIDType.moodPop && smallID< 5000)
            return ConsumableForIDType.moodPop;
        else 
            return ConsumableForIDType.none;

    }
    #endregion
   

    /// <summary>
    /// 获取细分的基础ID 例如 =  40020 体力
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static int GetObjectsBaseID(int id)
    {
        ObjectsIDType baseID = GetObjectsIDType(id);

        int smallID = id - (int)baseID;
        switch (baseID)
        {
            case ObjectsIDType.consumable:
                return (int)baseID + (int)GetConsumableforIDType(smallID);
            default:
                return -1;
        }
    }


    public static int GetSmallSmallID(int bigID)
    {
        ObjectsIDType objectsIDType = GetObjectsIDType(bigID);
        int smallID = bigID - (int)objectsIDType;
        int smallBaseID = -1;
        switch(objectsIDType)
        {
            case ObjectsIDType.stronghold:
                smallBaseID =  GetStrongholdSmallIDType(smallID);
                break;
            case ObjectsIDType.monster:
                break;
            case ObjectsIDType.consumable:
                break;

        }

        //返回的是每个物件区间内的的游标
        return smallID - smallBaseID ;
    }


    #region 获取状态图标的名字
    
    public static string GetMosnterTreasureStateIconName(int monsterTreasureStateType)
    {
        return null;
    }

    #endregion


    #region 工具 。检测是否为某一类
    public static bool CheckIDTypeIsConsumable(int id)
    {
        return GetObjectsIDType(id) == ObjectsIDType.consumable;
    }
    public static bool CheckIDTypeIsObjets(int id)
    {
        return GetObjectsIDType(id) == ObjectsIDType.objects;
    }

    public static bool CheckIDTypeIsStrongholdDraw(int id)
    {
        ObjectsIDType baseID = GetObjectsIDType(id);
        if(baseID != ObjectsIDType.consumable)return false;
        else
        {
            int smallID = id - (int)baseID;
            ConsumableForIDType consumableForUserIDType =  GetConsumableforIDType(smallID);
            return consumableForUserIDType == ConsumableForIDType.strongholdDrawing;
        }
    }
    #endregion
}
