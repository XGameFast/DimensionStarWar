using System.Collections.Generic;
using UnityEngine;

public class HandbookController : BaseController {
    /*
     *图鉴
     * 图鉴控制器，用于展示 怪兽信息，游戏物品信息等等。
     * 控制产生模型，产生数据面板，以及相对于的语音和动画反馈
     */
    public GameObject starItem;
    public HandBookMenu handbookMenu;
    private Color gray;
    private Color white;
    private Transform hitLastTarget;
    private Transform lastHitGalaxyArea;//上一次的区域
    private bool startCheckHit;
    public GameObject startBox;
    public Transform starPositionParent;
    private List<Transform> starPositionList;
    private bool isStartShotRay = false;
    
    public override void InitValue()
    {
        base.InitValue();
        if (starPositionList != null) starPositionList.Clear();
        handbookMenu.SetController(this);
        handbookMenu.InitValue();
        handbookMenu.DidplayAlpha();
    }
    public override void StartController()
    {
        base.StartController();
        base.worldType = OTYPE.WolrdType.Virtual;
        gray = Color.gray;
        white = Color.white;
        BuildStarPosition();
        OpenHandbookScene();
        CloseDimensionWorld();
        //  BuildStarsHandbook();
    }



    public override void EndController()
    {
        base.EndController();
        ARMonsterSceneDataManager.Instance.currentSceneMonster.DestroyByAndaDataManager();
    }

    private void BuildStarPosition()
    {
        for (int i = 0; i < starPositionParent.childCount; i++)
        {
            if (starPositionList == null) starPositionList = new List<Transform>();
            starPositionList.Add(starPositionParent.GetChild(i).transform);
        }
    }

    private void OpenHandbookScene()
    {
        arWorld.OpenHanbookScene(true);
        arWorld.SetHandbookScenePosition();
    }
    private void CloseHandbookScene()
    {
        arWorld.OpenHanbookScene(false);
    }

    private void CloseDimensionWorld()
    {
        arWorld.SetMainCameraTrans(false, OTYPE.SceneTranslationType.LinearBlur, FinishCloseDimensionWorld);
    }

    private void FinishCloseDimensionWorld(bool isFinish)
    {
        arWorld.SetCameraToBlackBackGround();
        ARMonsterSceneDataManager.Instance.SetLayerMask(LayerMask.NameToLayer("Stars"));

        startCheckHit = true;
    }

    public void HandbookBackToAstrology()
    {
        CloseHandbookScene();
        callbackFinishController(ONAME.ASTROLOGYLOBBY);
        arWorld.SetCameraToReadworldTexture();
    }
    private void BuildStarsHandbook()
    {
        Vector3 center = ARMonsterSceneDataManager.Instance.arCameraPosition;
        starPositionParent.transform.position = center;
        List<StarsStructure> starList = MonsterGameData.startAttribute;
        for (int i = 0; i < starList.Count; i++)
        {
            float angle = (float)(-360 / 28) * (i + 1);
            float x = (float)(center.x + 20 * Mathf.Cos(angle * Mathf.PI / 180));
            float z = (float)(center.z + 20 * Mathf.Sin(angle * Mathf.PI / 180));

            GameObject tmpStar = starItem.Clone();
            tmpStar.name = starList[i].idName;
            string name = starList[i].dir + "/" + starList[i].idName;
            SpriteRenderer sr = tmpStar.GetComponent<SpriteRenderer>();
            sr.sprite = AndaDataManager.Instance.GetStarSprite(name);
            sr.color = gray;
            tmpStar.SetTargetActiveOnce(true);
            //tmpStar.transform.SetParent(startBox.transform);
            tmpStar.transform.SetParent(starPositionList[i].transform);
            tmpStar.ResetTran();
            //tmpStar.transform.position = new Vector3(x, starPositionList[i].position.y, z);
            tmpStar.transform.forward = -(center - tmpStar.transform.position);
        }
        BuildFinish();
    }

    private void BuildFinish()
    {

    }

    private void CheckHitStars()
    {
        Transform hitTarget = ARMonsterSceneDataManager.Instance.AutoHitTargetGameObject();
        //判断是否点击了星域
        if (hitTarget != null)//星域
        {
            if (hitTarget.name == "north" ||
                hitTarget.name == "south" ||
                hitTarget.name == "east" ||
                hitTarget.name == "west")
                HitGalxyArea(hitTarget);
            else //不为星域
                HitStars(hitTarget);
        }
    }
    /// <summary>
    /// 指向哪块星域
    /// </summary>
    private void HitGalxyArea(Transform _galaxyArea)
    {
        if (lastHitGalaxyArea != null && _galaxyArea == lastHitGalaxyArea)
        {
            return;
        }
       
        if (lastHitGalaxyArea != null)
        {
            //进入到这一步 lastHitGalaxyArea肯定不等于 lastHitGalaxyArea
            Color g = Color.gray;
            g.a = 0.5f;
            lastHitGalaxyArea.GetComponent<SpriteRenderer>().color = g;
        }
        Color c = Color.white;
        c.a = 0.5f;
        _galaxyArea.GetComponent<SpriteRenderer>().color = c;
        lastHitGalaxyArea = _galaxyArea;
    }
    /// <summary>
    /// 指向星宿逻辑：
    /// 如果当前显示的星宿为NULL，则碰到的第一个星宿图标。就出现这个星宿对应的图标
    /// 如果当前显示的星宿不为NULL，则指向其他星宿图标的是否不会消除这个星宿。
    /// 扫出星宿的以后则出现关闭按钮。只有点击关闭按钮才会 消除扫出的星宿。
    /// </summary>
    private void HitStars(Transform _hitTarget)
    {
        //场上已经有星宿了，有就不再继续
        if (ARMonsterSceneDataManager.Instance.currentSceneMonster != null) return;
        //检测有没有扫到星宿 ,没有则不继续
        if (_hitTarget == null)
        {
            //判断hitLastTarget 是否为NULL
            if (hitLastTarget != null)
            {
                hitLastTarget.GetComponent<SpriteRenderer>().color = gray;
                hitLastTarget.transform.localScale *= 0.8f;
                hitLastTarget = null;
            }
            return;
        }
        else
        {

            if (hitLastTarget != null)
            {
                if (hitLastTarget != _hitTarget)
                {
                    hitLastTarget.GetComponent<SpriteRenderer>().color = gray;
                    hitLastTarget.transform.localScale *= 0.8f;
                    //获取星宿图鉴信息
                    StarsStructure starCfg = MonsterGameData.GetStarAttribute(_hitTarget.name);
                    //判断这个星宿是否已经开放面向玩家并且玩家已经获取到这个星宿的资料
                    if (starCfg.monsterIsPublic /*&& AndaDataManager.Instance.CheckPlayerHadThisMonster(starCfg.monsterID)*/)
                    {
                        //构建星宿实例
                        BuildMonsterObject(starCfg.monsterID);
                        handbookMenu.DisCloseStarBtn(true);
                    }

                    _hitTarget.GetComponent<SpriteRenderer>().color = white;
                    _hitTarget.transform.localScale *= 1.2f;// Vector3.one *0.08f;
                    hitLastTarget = _hitTarget;
                }

            }
            else
            {
                _hitTarget.GetComponent<SpriteRenderer>().color = white;
                _hitTarget.transform.localScale *= 1.2f;// Vector3.one *0.08f;
                hitLastTarget = _hitTarget;
            }
        }
    }


    private void BuildMonsterObject(int  monsterID)
    {
        MonsterBasic mb = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>(monsterID.ToString());
        if (mb != null)
        {
            mb.PreloadBuildComponement();
            mb.monsterInfo.BuildBaseInfoBar(monsterID);
            mb.transform.position = ARMonsterSceneDataManager.Instance.GetCameraForwardPoint(3);
            mb.transform.forward = ARMonsterSceneDataManager.Instance.FaceToCameraWithSeflY(mb.transform.position);
            mb.SkinNormal();
        }
        ARMonsterSceneDataManager.Instance.currentSceneMonster = mb;
    }

    #region 点击取消星座出现

    public void ClickHideStar()
    {
        ARMonsterSceneDataManager.Instance.currentSceneMonster.DestroyByAndaDataManager();
        hitLastTarget.GetComponent<SpriteRenderer>().color = gray;
        hitLastTarget.transform.localScale *= 0.8f;
        hitLastTarget = null;
    }
    
    #endregion

    private void CheckStarIsInScreenRange(Transform _star)
    {
        //Vector3 screentPoint = _star.position.ConvertWorldPostionToNGUIPosition();
        startCheckHit = !_star.position.IsInRect();
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        if (startCheckHit)
        {
             CheckHitStars();
        }
        //isCheckit
        if (hitLastTarget != null)
        {
            CheckStarIsInScreenRange(hitLastTarget);
        }
    }
}
