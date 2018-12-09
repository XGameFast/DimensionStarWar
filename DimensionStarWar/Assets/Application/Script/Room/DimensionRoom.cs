using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DimensionRoom : AndaObjectBasic {


    public GameObject hologarmScreenPoint;
    public float loadingSpeed;
    //
    public List<Renderer> rendList;

    public List<Renderer> floor;

    private List<Material> matList;
    private List<Material> floorMat;
    [HideInInspector]
    public DimensionRoomData dimensionRoomData;


    #region 回调

    private System.Action CallBack_FinishBuildDimensionRoom;
    private System.Action CallBack_FinishDestoryDimensionRoom;
  

    #endregion

    //开始构建次元空间
    public void StartBuildDimensionRoom(System.Action callback)
    {
        CallBack_FinishBuildDimensionRoom = callback;
        BuildDimensionRoomData();
        BuildMatList();
        SetWallPose();
        SetFloorPose();
        StartCoroutine(ExcuteBuild());
    }

    public void DestroyDimensionRoom(System.Action callback)
    {
        //设置回调
        CallBack_FinishDestoryDimensionRoom = callback;
         //移除空间盒子
        dimensionRoomData.RemoveDimensionBox();
        //执行拆除
        StartCoroutine(ExcuteDestroy());
    }




    //让次元空间消失
    public IEnumerator ExcuteDestroy()
    {
        //欢迎回到现实，tips
        //JIRVIS.Instance.PlayTips(OTYPE.TipsType.welcomeRealityWorld);
        //分解空间
        yield return StartCoroutine(LoadingWall(false));

        //然后拆分地板

        yield return StartCoroutine(LoadingFloor(false));


        CallBack_FinishDestoryDimensionRoom();
        //结束拆除
        FinishDestroy();
    }


    private IEnumerator ExcuteBuild()
    {
        JIRVIS.Instance.PlayTips(OTYPE.Tipscontent.buidingDimensionRoom);
        ResetFloorDissvo();
        ResetWallDissvo();
        //先加载地板
        yield return StartCoroutine(LoadingFloor(true));

        //加载周围的墙
        yield return StartCoroutine(LoadingWall(true));

        FinishBuildRoom();



    }

    private void FinishBuildRoom()
    {
        //把盒子加载出来
        BuildDimensionBox();
        //让噪点有点变化
        //StartCoroutine(ChangeNosieSpeed());
    }

    private void FinishDestroy()
    {
        
    }

    private void BuildDimensionRoomData()
    {
        if (dimensionRoomData == null)
        {
            dimensionRoomData = new DimensionRoomData();
            dimensionRoomData.BuildData(this);
        }
    }

    private void BuildMatList()
    {
        if (matList == null)
        {
            matList = new List<Material>();
            for (int i = 0; i < rendList.Count; i++)
            {
                matList.Add(rendList[i].material);
            }
        }
        if (floorMat == null)
        {
            floorMat = new List<Material>();
            foreach (var go in floor)
            {
                floorMat.Add(go.material);
            }
        }
    }

    //设置地板位置
    private void SetFloorPose()
    {
        Vector4 v4 = new Vector4(selfPosX, selfPosY, selfPosZ, 0);
        foreach (var go in floorMat)
        {
            go.SetVector("_Center", v4);
        }
    }

    //设置墙的位置
    private void SetWallPose()
    {
        Vector4 v4 = new Vector4(selfPosX, selfPosY, selfPosZ, 0);
        for (int i = 0; i < matList.Count; i++)
        {
            matList[i].SetVector("_Center", v4);
        }
    }

    //加载 和 拆解 地板
    private IEnumerator LoadingFloor(bool buildroom)
    {
       // ResetFloorDissvo();
        if(buildroom)
        {
            float v = 0;
            while (v < 1)
            {
                v += Time.deltaTime * loadingSpeed;
                floorMat[0].SetFloat("_Diss", v);
                yield return null;
            }
        }else
        {
            float v = 1;
            while(v>0)
            {
                v -= Time.deltaTime * loadingSpeed;
                floorMat[0].SetFloat("_Diss", v);
                yield return null;
            }
        }
       
    }
    // 加载 和 拆解 墙
    private IEnumerator LoadingWall(bool buildWall)
    {
      //  ResetWallDissvo();
        //打开 加载特效
       
        if(buildWall)
        {
            float v = 0;
            while (v < 1)
            {
                float value = Time.deltaTime * loadingSpeed;

                v += value;
                for (int i = 0; i < matList.Count; i++)
                {
                    matList[i].SetFloat("_Diss", v);
                    // Vector3 pv3= upPartcal[i].transform.position;
                    //pv3.y += value;
                    // upPartcal[i].transform.position = pv3;
                }

                //  var t = v / 2;
                floorMat[1].SetFloat("_Diss", v);

                yield return null;
            }
        }else
        {
            float v = 1;
            while(v>0)
            {
                float value = Time.deltaTime * loadingSpeed;
                v -= value;
                for (int i = 0; i < matList.Count; i++)
                {
                    matList[i].SetFloat("_Diss", v);
                    // Vector3 pv3= upPartcal[i].transform.position;
                    //pv3.y += value;
                    // upPartcal[i].transform.position = pv3;
                }

                //  var t = v / 2;
                floorMat[1].SetFloat("_Diss", v);

                yield return null;
            }
        }
        


       
       
    }

    private void ResetWallDissvo()
    {
        for (int i = 0; i < matList.Count; i++)
        {
            matList[i].SetFloat("_Diss", 0);
        }
    }
    private void ResetFloorDissvo()
    {
        foreach(var go in floorMat)
        {
            go.SetFloat("_Diss", 0);
        }
    }


    private IEnumerator ChangeNosieSpeed()
    {
        float speed = 0.5f;
        while (true)
        {
            //float time = Random.Range(4, 9);
            yield return new WaitForSeconds(4);
            foreach (var go in matList)
            {
                if (speed < 0.6f)
                {
                    go.SetFloat("_RamdonNoise", speed += 0.01f);
                }
                else
                {
                    speed = 0.5f;
                    go.SetFloat("_RamdonNoise", speed);
                }
            }
        }
    }


    #region 设置显示的怪兽数据
    public void SetMonsterInfomation(PlayerMonsterAttribute _pma)
    {
        if(dimensionRoomData.getDimensionMonsterInfoHologarmScreen!=null)
        {
            Debug.Log("SetDimensionRomm MonsterData");
            dimensionRoomData.getDimensionMonsterInfoHologarmScreen.DisplayMonsterInformation(_pma);
        }else
        {
            Debug.Log("DimensionRoomData.getDimensionMonsterInfoHologarmScreen == null");
        }
    }
    #endregion

    #region 构建按钮完毕
    //怪兽按钮
    private void FinishBuildMonsterBtn()
    {
        
    }
    //据点那妞

    //功能按钮
    #endregion


    //房间构建完毕后，把次元盒子构建出来，
    private void BuildDimensionBox()
    {
        dimensionRoomData.BuildDimensionBox();

        //dimensionRoomData.BuildDimensionMonsterInfomationBar(hologarmScreenPoint.transform);

        Debug.Log("BuildingDimensionScrren");
        //dimensionRoomData.getDimensionMonsterInfoHologarmScreen.PlayFadeIn();

        //告诉控制器，房间已经加载完毕了
        CallBack_FinishBuildDimensionRoom();

    }
}
