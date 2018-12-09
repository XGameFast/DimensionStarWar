using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;
public class PrintGameConfig : MonoBehaviour {

	// Use this for initialization
	void Start () {
        PrintConfig();
	}

    private void PrintConfig()
    {
        //List<MonsterBaseConfig>
       /* string json = JsonMapper.ToJson(MonsterGameData.gameBaseMonsterAttributeList); 
       // List<MonsterBaseConfig>  monsterBaseConfigs = JsonMapper.ToObject<List<MonsterBaseConfig>>(json);
        Debug.Log(json);

        //List<SkillBaseAttribute> 
        json =  JsonMapper.ToJson(MonsterGameData.gameBaseSkillAttributeList);
        Debug.Log(json);

        //List<CD_ObjAttr>
        json =  JsonMapper.ToJson(MonsterGameData.objectsList); 
        Debug.Log(json);

        //List<CD_Mall>
        json = JsonMapper.ToJson(MonsterGameData.cd_Mall);
        Debug.Log(json);

        //PlayerStrongholdConfigAttribute
        json = JsonMapper.ToJson(MonsterGameData.playerStrongholadAttribute);
        Debug.Log(json);

        //BusinessStrongholdConfigAttribute
        json = JsonMapper.ToJson(MonsterGameData.businessStrongholadBaseAttribute);
        Debug.Log(json);

        //List<StarsStructure>
        json = JsonMapper.ToJson(MonsterGameData.startAttribute);
        Debug.Log(json);
        //
        json = JsonMapper.ToJson(MonsterGameData.chanllengeGame);
        Debug.Log(json);

        json = JsonMapper.ToJson(MonsterGameData.tipsConfigList);
        Debug.Log(json);*/

        string json = JsonMapper.ToJson(MonsterGameData.skillArchievementValue);
        Debug.Log(json);
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
