using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
public class ObjdataManager : MonoBehaviour {

    public GameObject TempBox;
    /*public enum objdataType
    {
       menu = 0,
       other = 1,
       monster =2,
       skill =3,
       room,
       consumables,
       state,
    }*/
    public Dictionary<OTYPE.ObjectsIDType, string> folderPathDic;
    private void Awake()
    {
        AndaDataManager.Instance.objdataManager = this;
        InitValue();
    }

    private List<Pool> pools;
    private List<AndaObjectBasic> destroyItemList;
    private List<int> indexlist;//每三个字段一组数据

    //对应的池，当前已经是几个了
    private Dictionary<OTYPE.ObjectsIDType, int> pool_index;

    public void InitValue()
    {
        InitPools();
        /*
        InitIndexDic();
        InitFolderPathDic();
        InitMenuList();
        InitOtherobjList();
        InitMonsterpoolList();
        InitSkillpoolList();
        InitConsumablespoolList();
        */

    }

    #region 初始化池

    private void InitPools()
    {
        if(pools == null)
        {
            pools = new List<Pool>();

        }else
        {
            InitPool(OTYPE.ObjectsIDType.monster);
            InitPool(OTYPE.ObjectsIDType.skill);
            InitPool(OTYPE.ObjectsIDType.menu);
            InitPool(OTYPE.ObjectsIDType.other);
            InitPool(OTYPE.ObjectsIDType.consumable);
        }
    }

    #endregion


    #region 初始化名字列表
    private void InitFolderPathDic()
    {
        if (folderPathDic == null)
        {
            folderPathDic = new Dictionary<OTYPE.ObjectsIDType, string>();
            folderPathDic.Add(OTYPE.ObjectsIDType.menu, "UI/");
            folderPathDic.Add(OTYPE.ObjectsIDType.other, "Other/");
            folderPathDic.Add(OTYPE.ObjectsIDType.monster, "Monster/");
            folderPathDic.Add(OTYPE.ObjectsIDType.skill, "Skill/");
            folderPathDic.Add(OTYPE.ObjectsIDType.consumable, "Consumables/");
        }
       
    }
    #endregion

    #region 初始化 游标池
    private void InitIndexDic()
    {
        if (pool_index == null)
        {
            pool_index = new Dictionary<OTYPE.ObjectsIDType, int>();
            pool_index.Add(OTYPE.ObjectsIDType.menu, 0);
            pool_index.Add(OTYPE.ObjectsIDType.other, 0);
            pool_index.Add(OTYPE.ObjectsIDType.monster, 0);
            pool_index.Add(OTYPE.ObjectsIDType.skill, 0);
            pool_index.Add(OTYPE.ObjectsIDType.consumable, 0);
        }
        else
        {
            pool_index[OTYPE.ObjectsIDType.menu] = 0;
            pool_index[OTYPE.ObjectsIDType.other] = 0;
            pool_index[OTYPE.ObjectsIDType.monster] = 0;
            pool_index[OTYPE.ObjectsIDType.skill] = 0;
            pool_index[OTYPE.ObjectsIDType.consumable] = 0;
        }
    }
    #endregion

   
    #region 初始化对应的池

    private void InitPool(OTYPE.ObjectsIDType objectsIDType)
    {
        Pool p = pools.FirstOrDefault(s => s.poolKeys == objectsIDType);
        if (p == null) return;
        foreach (var go in p.poolItems)
        {
            foreach (var goo in go.items)
            {
                Destroy(goo.gameObject);
                go.items.Remove(goo);
            }
            p.poolItems.Remove(go);
        }
        pools.Remove(p);
    }


    #endregion


    #region 实例化

    public AndaObjectBasic SimpleGetAsset(string name , OTYPE.ObjectsIDType objectsIDType)
    {
        AndaObjectBasic andaObject = BuildAndaObject(name,objectsIDType);
        andaObject.gameObject.SetTargetActiveOnce(true);
        andaObject.OnSpawn();
        return andaObject;
    }


    /// <summary>
    /// 实例化obj
    /// </summary>
    /// <param name="name"></param>
    /// <param name="objdataType"></param>
    /// <returns></returns>

    public AndaObjectBasic InstantiateObj(string name , OTYPE.ObjectsIDType objdataType)
    {
        //Debug.Log("GetAssetCount");
        return GetAsset(name ,objdataType);
    }

    private AndaObjectBasic GetAsset(string assetName, OTYPE.ObjectsIDType objType)
    {
        Pool _pool = CheckPool(objType);
        PoolItem _poolItem = CheckPoolItem(ref _pool,assetName);
        AndaObjectBasic _aob = GetAndaObject(ref _poolItem, assetName, objType);
        _aob.SetTargetActiveOnce(true);
        _aob.isActive = true;
        _aob.OnSpawn();
        return _aob;
    }

    private Pool CheckPool(OTYPE.ObjectsIDType objType)
    {
        Pool _pool = GetPool(objType);
        if(_pool == null)
        {
            _pool = BuildPool(objType);
            pools.Add(_pool);
        }

        return _pool;
    }

    private PoolItem CheckPoolItem(ref Pool _pools, string _assetName)
    {
        PoolItem _poolItem = GetPoolItem(ref _pools ,_assetName);
        if(_poolItem == null)
        {
            _poolItem = BuildPoolItem(_assetName);
            _pools.poolItems.Add(_poolItem);
        }
        return _poolItem;
    }


    private Pool GetPool(OTYPE.ObjectsIDType objType)
    {
        return pools.FirstOrDefault(s => s.poolKeys == objType);
    }

    private PoolItem GetPoolItem(ref Pool _pools , string _assetName)
    {
       return  _pools.poolItems.FirstOrDefault(s => s.key == _assetName);
    }
    //查找是否有可用的Item，没有就新建一个Item
    private AndaObjectBasic GetAndaObject(ref PoolItem _poolitem,string _objName,OTYPE.ObjectsIDType _objectsIDType)
    {
        foreach(var go in _poolitem.items)
        {
            if(!go.isActive)
            {
               // Debug.Log("herererererereererere?");
                return go;
            }
        }
        //---如果没有可以用的，那么就新建一个
         
        AndaObjectBasic andaObject = BuildAndaObject(_objName,_objectsIDType);
        _poolitem.items.Add(andaObject);
        return andaObject;
        /*
        //先判断是这个池里的item数量是否为零 
        if(_poolitem.items.Count == 0)
        {
            Debug.Log("new item");
            AndaObjectBasic andaObject = BuildAndaObject(_objName,_objectsIDType);
            _poolitem.items.Add(andaObject);
            return andaObject;
        }else
        {
            GameObject andaObject =  _poolitem.items[0].gameObject.Clone(); //.Clone().GetComponent<AndaObjectBasic>();
            AndaObjectBasic andaObjectBasic = andaObject.GetComponent<AndaObjectBasic>();
            Debug.Log("Hash" + andaObjectBasic.GetHashCode());
            //andaObject.InitValue();
            _poolitem.items.Add(andaObjectBasic);
            return andaObjectBasic;
        }*/
    }

    //private ResourceRequest getAsset;
    private AndaObjectBasic curAsset;
    private IEnumerator<AndaObjectBasic> GetA ( OTYPE.ObjectsIDType objectsIDType , string assetName)
    {
        ResourceRequest getAsset = Resources.LoadAsync<GameObject>(ONAME.GetResourcesPath(objectsIDType) + assetName);
        yield return curAsset;
        GameObject newItem = getAsset.asset as GameObject;
        newItem = newItem.Clone();
        newItem.SetTargetActiveOnce(false);
        curAsset = newItem.GetComponent<AndaObjectBasic>();
        curAsset.objType = objectsIDType;
        curAsset.objectID = assetName;
        //yield return curAsset;
    }

    private void PreadditionItem(ref PoolItem _poolitem,string _objName,OTYPE.ObjectsIDType _objectsIDType)
    {
        if (_poolitem.items.Count == 0)
        {
            AndaObjectBasic andaObject = BuildAndaObject(_objName, _objectsIDType);
            _poolitem.items.Add(andaObject);
        }
    }
   

    private Pool BuildPool(OTYPE.ObjectsIDType _objType)
    {
        Pool _pool = new Pool();
        _pool.poolKeys = _objType;
        _pool.poolItems = new List<PoolItem>();
        return _pool;
    }

    private PoolItem BuildPoolItem(string _key)
    {
        PoolItem poolItem = new PoolItem();
        poolItem.key = _key;
        poolItem.items = new List<AndaObjectBasic>();
        return poolItem;
    }


    private AndaObjectBasic BuildAndaObject(string _key , OTYPE.ObjectsIDType _objType)
    {
        GameObject newItem = Resources.Load<GameObject>(ONAME.GetResourcesPath(_objType) + _key);
        newItem = newItem.Clone();
        newItem.SetTargetActiveOnce(false);
        AndaObjectBasic andaObject = newItem.GetComponent<AndaObjectBasic>();
        andaObject.objType = _objType;
        andaObject.objectID = _key;
        return andaObject;
    }

    private AndaObjectBasic NewOtherObj(AndaObjectBasic _obj, Dictionary<int, AndaObjectBasic> dic, OTYPE.ObjectsIDType objType,string objName)
    {
        int index = pool_index[objType]+=1;
        dic.Add(index, _obj);
        _obj.index = index;
        _obj.objectID = objName;
        _obj.objType = objType;
        return _obj;
    }


    private void AddObjtoMemery(Dictionary<int , AndaObjectBasic> pool,OTYPE.ObjectsIDType objType,string objName)
    {
        if (pool_index[objType] != 0)return;
        GameObject item = Resources.Load<GameObject>(folderPathDic[objType] + objName);
        AndaObjectBasic andaObject = item.Clone().GetComponent<AndaObjectBasic>();
        andaObject.index = 0;
        pool.Add(0, andaObject);
    }

    #endregion

    #region 回收


    public void ReceiveItem(AndaObjectBasic _item)
    {
        _item.OnDispawn();
        _item.SetInto(TempBox.transform);
    }

    #endregion


    #region 清理池

    #region Clear Single Item
    public void ClearPoolItem_ForSingleItem(AndaObjectBasic obj)
    {
        Pool pool = GetPool(obj.objType); 
        if(pool == null)
        {
            Destroy(obj.gameObject);
            return;
        }
        PoolItem poolItem = GetPoolItem(ref pool,obj.objectID);
        if(poolItem == null)
        {
            Destroy(obj.gameObject);
            return;
        }

        AndaObjectBasic andaObject = poolItem.items.FirstOrDefault(s=>s == obj);
        if(andaObject == null)
        {
            Destroy(obj.gameObject);
            return ;
        }
        Destroy(andaObject.gameObject);
        obj = null;
    }
    #endregion

    #region Clear Item List
    public void ClearPoolItem_ForItemList(AndaObjectBasic obj)
    {
        Pool _pool = GetPool(obj.objType);
        if(_pool == null) { Destroy(obj.gameObject); return ; }
        PoolItem _poolItem = GetPoolItem(ref _pool , obj.objectID);
        if(_poolItem == null) {Destroy(obj.gameObject) ; return ;}
        foreach(AndaObjectBasic go in _poolItem.items)
        {
            Destroy(go.gameObject);
        }
        //移除出 总的对象池
        _pool.poolItems.Remove(_poolItem);
        _poolItem = null;
    }
    #endregion

    #region 清除某一类的池
    public void ClearPool(OTYPE.ObjectsIDType objectsIDType)
    {
        //获取 这个 类的 池
        Pool _pool = GetPool(objectsIDType);
        if(_pool == null)return;
        //遍历池里的每一个细分类的item，并删除
        foreach(PoolItem go in _pool.poolItems)
        {
            foreach(var goo in go.items)
            {
                goo.OnDispawn();
                Destroy(goo.gameObject);
            }
        }
        pools.Remove(_pool);
        _pool = null;
    }
    #endregion

    public void ClearPools()
    {
        if(pools == null) { pools = new List<Pool>(); return;}
        foreach(Pool _pool in pools)
        {
            foreach(PoolItem _poolItem in _pool.poolItems)
            {
                foreach(AndaObjectBasic aob in _poolItem.items)
                {
                    Destroy(aob.gameObject);
                }
                _poolItem.key = null;
                _pool.poolItems.Remove(_poolItem);
            }
            pools.Remove(_pool);
        }
        pools = new List<Pool> ();
    }


    /// <summary>
    /// 清除某一个池
    /// </summary>
    /// <param name="objdataType">Objdata type.</param>
    public void DestoryAllPool(OTYPE.ObjectsIDType objdataType)
    {
        InitPool(objdataType); 
    }
    /// <summary>
    /// 清除一个
    /// </summary>
    /// <param name="name">Name.</param>
    /// <param name="objdataType">Objdata type.</param>
    /// <param name="isAll">If set to <c>true</c> is all.</param>
    public void DestoryOneObj(AndaObjectBasic aob)
    {
        RecoveryItem(aob);
       /*
        if (aob == null) return;
        switch (aob.objType)
        {
            case OTYPE.ObjectsIDType.monster:
                DestroyImmediateObj(aob.index, monsterObj_pool);
                break;
            case OTYPE.ObjectsIDType.other:
                DestroyImmediateObj(aob.index, otherObj_pool);
                break;
            case OTYPE.ObjectsIDType.menu:
                DestroyImmediateObj(aob.index, menuObj_pool);
                break;
            case OTYPE.ObjectsIDType.skill:
                DestroyImmediateObj(aob.index, skillObj_pool);
                break;
            case OTYPE.ObjectsIDType.consumable:
                DestroyImmediateObj(aob.index, consumables_pool);
                break;
        }
        */
    }
    public void DestorySameObj(AndaObjectBasic aob)
    {
        
    }
    private void DestroyImmediateObj(int index , Dictionary<int,AndaObjectBasic> dic)
    {
        dic[index].OnDispawn();
        Destroy(dic[index].gameObject);
        dic.Remove(index);
    }

    private void RecoveryItem(AndaObjectBasic item)
    {
        Pool pool = pools.FirstOrDefault(s=>s.poolKeys == item.objType);
        if(pool!=null)
        {
            PoolItem poolitem =  pool.poolItems.FirstOrDefault(s=>s.key == item.name);
            pool.poolItems.Remove(poolitem);
            if(pool.poolItems.Count <= 0)pools.Remove(pool);
            Destroy(item.gameObject);
        }
    }
    private void DestorySameOtherObj(int index ,Dictionary<int,AndaObjectBasic> dic)
    {
        string sname = dic[index].name;
        OTYPE.ObjectsIDType stype = dic[index].objType;
        List<AndaObjectBasic> objlist = new List<AndaObjectBasic>();
        List<int> indexlist = new List<int>();
        foreach (var go in dic.Values)
        {
            if (go.name == sname || go.objType == stype)
            {
                objlist.Add(go);
                indexlist.Add(go.index);
            }
        }
        foreach (var go in indexlist)
        {
            dic.Remove(go);
        }
        objlist.DestoryList();
    }
    #endregion


    public Sprite GetSprite(string id, OTYPE.ObjectsIDType objdataType)
    {
        switch (objdataType)
        {
            case OTYPE.ObjectsIDType.skill:
                return Resources.Load<Sprite>("Sprite/Skill/" + id);
            case OTYPE.ObjectsIDType.monster:
                return Resources.Load<Sprite>("Sprite/Monster/" + id);
            case OTYPE.ObjectsIDType.other:
                return Resources.Load<Sprite>("Sprite/Other/" + id);
            case OTYPE.ObjectsIDType.consumable:
                return Resources.Load<Sprite>("Sprite/Consumables/" + id);
            case OTYPE.ObjectsIDType.objects:
                return Resources.Load<Sprite>("Sprite/Objects/" + id);
            case OTYPE.ObjectsIDType.state:
                return Resources.Load<Sprite>("Sprite/State/" + id);
            case OTYPE.ObjectsIDType.star:
                return Resources.Load<Sprite>("Sprite/Star/" + id);
            case OTYPE.ObjectsIDType.stronghold:
                return Resources.Load<Sprite>("Sprite/Stronghold/" + id);
            case OTYPE.ObjectsIDType.menu:
                return Resources.Load<Sprite>("Sprite/UI/" + id);
            default:
                return null;
        }
    }

    public GameObject GetSpriteItem(string id, OTYPE.ObjectsIDType objdataType)
    {
        switch (objdataType)
        {
            case OTYPE.ObjectsIDType.skill:
                return Resources.Load<GameObject>("Sprite/Skill/" + id);
            case OTYPE.ObjectsIDType.monster:
                return Resources.Load<GameObject>("Sprite/Monster/" + id);
            case OTYPE.ObjectsIDType.other:
                return Resources.Load<GameObject>("Sprite/Other/" + id);
            case OTYPE.ObjectsIDType.consumable:
                return Resources.Load<GameObject>("Sprite/Consumables/" + id);
            case OTYPE.ObjectsIDType.objects:
                return Resources.Load<GameObject>("Sprite/Objects/" + id);
            case OTYPE.ObjectsIDType.state:
                return Resources.Load<GameObject>("Sprite/State/" + id);
            case OTYPE.ObjectsIDType.star:
                return Resources.Load<GameObject>("Sprite/Star/" + id);
            case OTYPE.ObjectsIDType.stronghold:
                return Resources.Load<GameObject>("Sprite/Stronghold/" + id);
            case OTYPE.ObjectsIDType.menu:
                return Resources.Load<GameObject>("Sprite/UI/" + id);
            default:
                return null;
        }
    }


    public Sprite GetSkillBoardSprite(int type)
    {
        return Resources.Load<Sprite>("Sprite/Skill/Level/" + type);
    }
    public Sprite GetMonsterLevevlBoardSprite(int level)
    {
        return Resources.Load<Sprite>("Sprite/Monster/Level/" + level);
    }
    public Sprite GetStrongholdLeveLSprite(int level)
    {
        return Resources.Load<Sprite>("Sprite/Stronghold/Level/" + level);
    }
    public Sprite GetBussinessStrongholdLevelSprite(int level)
    {
        return Resources.Load<Sprite>("Sprite/BussinessStronghold/Level/" + level);
    }
    public Texture GetTexture(string id, OTYPE.ObjectsIDType objdataType)
    {
        switch (objdataType)
        {
            case OTYPE.ObjectsIDType.room:
                return Resources.Load<Texture>("Texture/Room/" + id);
            case OTYPE.ObjectsIDType.monster:
                return Resources.Load<Texture>("Texture/Monster/" +id);
            default:
                return null;
        }

    }

    public Texture2D[] GetTextures(string id, OTYPE.ObjectsIDType objectsIDType)
    {
        switch (objectsIDType)
        {
            case OTYPE.ObjectsIDType.monster:
                return Resources.LoadAll<Texture2D>("Texture/Monster/" + id +"/");
            default:
                return null;
        }
    }

    public Material GetMaterial(string name, OTYPE.ObjectsIDType objdataType)
    {
        switch (objdataType)
        {
            case OTYPE.ObjectsIDType.monster:
                return Resources.Load<Material>("Material/Monster/" + name);
            default:
                return null;
               
        }
    }

    public Material GetEffectMat(string name)
    {
        return Resources.Load<Material>("Material/Effect/" + name);
    }

    public Material GetMedalMat(string name)
    {
        return Resources.Load<Material>("Material/Medal/" + name);
    }
    //预加载

    public void Preload(List<int> idList)
    {
        StartCoroutine(ExcutePrelaod(idList));
    }

    private IEnumerator ExcutePrelaod(List<int> list)
    {
        foreach(var go in  list)
        {
            OTYPE.ObjectsIDType objectsIDType = OTYPE.GetObjectsIDType(go);
            yield return AsynLoadAsset(objectsIDType, go.ToString());
        }
    }
    private ResourceRequest request;

    private IEnumerator AsynLoadAsset(OTYPE.ObjectsIDType objectsIDType , string assetName )
    {
        yield return new WaitForEndOfFrame();

        Pool _pool = GetPool(objectsIDType);
      
      
        PoolItem _poolItem = GetPoolItem(ref _pool, assetName);
       
        string path = ONAME.GetResourcesPath(objectsIDType) + assetName;
       
        request = Resources.LoadAsync(path);
       
        yield return request;

        GameObject obj = request.asset as GameObject;
        obj = obj.Clone();
        obj.SetTargetActiveOnce(false);
        AndaObjectBasic andaObject = obj.GetComponent<AndaObjectBasic>();
        andaObject.objType = objectsIDType;
        andaObject.objectID = assetName;
        _poolItem.items.Add(andaObject);
    }

    private float loadTime ;
    private bool isClear=false;
    private void FixedUpdate()
    {
        if(Time.time - loadTime > 3 && !isClear)
        {
            isClear=true;
            loadTime = Time.time;
            AutoDestroyItem();
        }
    }


    private void AutoDestroyItem()
    {
        if(destroyItemList == null)destroyItemList = new List<AndaObjectBasic>();
        if(indexlist == null)indexlist = new List<int>();
        float timer = Time.time;
        int count = pools.Count;
        for(int i = 0 ;i < count; i++)
        {
            int count01 = pools[i].poolItems.Count;
            for(int ii = 0 ; ii < count01; ii++)
            {
                int count02  = pools[i].poolItems[ii].items.Count;
                for(int iii = 0; iii<count02;iii++)
                {
                    AndaObjectBasic andaObject = pools[i].poolItems[ii].items[iii];
                    if(!andaObject.isActive)
                    {
                        if(timer - andaObject.inactiveTime > 10)
                        {
                             destroyItemList.Add(andaObject);
                             indexlist.AddRange(new List<int> {i,ii,iii});
                        }
                    }
                }
            }
        }

        int c = indexlist.Count;
        if(c != 0)
        {
            for(int i = 0 ; i < c ; i+=3)
            {
               // Debug.Log("i" + i + ":" +  pools[indexlist[i]]);
               // Debug.Log("ii" + (i+ 1) + ":" + pools[indexlist[i]].poolItems[indexlist[i+1]]);
               // Debug.Log("iii" + (i + 2));
                int index = i/3;
                pools[indexlist[i]].poolItems[indexlist[i+1]].items.Remove(destroyItemList[index]);
            }
           
            indexlist.Clear();

            c = destroyItemList.Count;

            for(int i = 0 ; i < c ; i++)
            {
                Destroy(destroyItemList[i].gameObject);
            }

            destroyItemList.Clear();
        }
        isClear=false;
    }

}



public class Pool
{
    public OTYPE.ObjectsIDType poolKeys { get; set; } //objType

    public List<PoolItem> poolItems { get; set; }   
}

public class PoolItem
{
    public string key { get; set; }//obj_id

    public List<AndaObjectBasic> items { get; set; }
}
