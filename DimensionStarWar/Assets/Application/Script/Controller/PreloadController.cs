using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PreloadController : BaseController {


    /*
     * Dev:AndaChen
     * Data:2018.2.1
     * 预加载控制器 ，负责从服务器更新配置文件 和其他需要提前加载的东西
     */

    public GameObject downloadCube;
    public Transform dropPoint;
    private AndaObjectBasic aob;
    private const string DownloadCubeName  = "DownloadCube";
    public override void StartController()
    {
        base.StartController();
        DownloadMallData();
        //StartCoroutine(WaitForDownload());
        //arWorld.OpenGround(true);
        // arWorld.OpenPreloadScene(true);

        arWorld.OpenTranlatePoint(true);

        TestBuildMonster(); 
    }

    private void TestBuildMonster()
    {
        MonsterBasic mb = AndaDataManager.Instance.InstantiateMonster<MonsterBasic>("1005");
        mb.transform.position = arWorld.transform.position;
        mb.SkinHologarm();
    }
    
    private void DownLoadNPCData()
    {

    }

    private void DownloadMallData()
    {
        AndaDataManager.Instance.SetMallData();
    }

    public override void EndController()
    {
        base.EndController();
        arWorld.OpenTranlatePoint(false);
        // AndaDataManager.Instance.DestorySameObj(aob);
    }

    private IEnumerator WaitForDownload()
    {
        int i = 0;
        while (i < 10)
        {
            i += 1;
            aob = AndaDataManager.Instance.InstantiateOtherObj(DownloadCubeName);
           // aob.transform.eulerAngles = new Vector3(12,0,30);
            aob.transform.position = new Vector3(dropPoint.position.x + Random.Range(-0.01f, 0.01f), ARMonsterSceneDataManager.Instance.arCameraPosition.y +0.2f , dropPoint.position.z);
            ((DownloadCube)aob).Init((i * 10).ToString()) ; 
            yield return new WaitForSeconds(Random.Range(0.5f, 0.8f));
        }
        AndaObjectBasic t = AndaDataManager.Instance.InstantiateOtherObj(DownloadCubeName);
        t.transform.eulerAngles = new Vector3(0,0,30);
        t.transform.position = dropPoint.position;
        ((DownloadCube)t).Init("加载完成!") ;

        AndaDataManager.Instance.DestorySameObj(aob);
        arWorld.OpenTranlatePoint(true);
       // callbackFinishController(ARMonsterMainController.LOGINCONTROLLER);
        /* yield return new WaitForSeconds(2f);
         if (callbackFinishController != null)
         {
             callbackFinishController(ARMonsterMainController.LOGINCONTROLLER);
         }*/
    }
}
