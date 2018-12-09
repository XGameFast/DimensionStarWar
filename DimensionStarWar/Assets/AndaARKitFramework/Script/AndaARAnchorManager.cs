using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.iOS;
using System.Linq;
using Collections.Hybrid.Generic;
public class AndaARAnchorManager{

    public LinkedListDictionary<string, ARPlaneAnchorGameObject> planeAnchorMap;
	public AndaARAnchorManager(GameObject planePrefab)
    {
		//UnityARUtility.InitializePlanePrefab(planePrefab);
        AndaARKitUtility.InitializePlanePrefab(planePrefab);
        planeAnchorMap = new LinkedListDictionary<string, ARPlaneAnchorGameObject>();
       
    }

    public void Register()
    {
        RegisterFindAnchor();//添加 锚点
        UnityARSessionNativeInterface.ARAnchorUpdatedEvent += UpdateAnchor;
        UnityARSessionNativeInterface.ARAnchorRemovedEvent += RemoveAnchor;
    }


    public void AddAnchor(ARPlaneAnchor arPlaneAnchor)
    {
        GameObject go = AndaARKitUtility.CreatePlaneInScene(arPlaneAnchor,false);
        go.AddComponent<DontDestroyOnLoad>();  //this is so these GOs persist across scene loads
        ARPlaneAnchorGameObject arpag = new ARPlaneAnchorGameObject();
        arpag.planeAnchor = arPlaneAnchor;
        arpag.gameObject = go;
        planeAnchorMap.Add(arPlaneAnchor.identifier, arpag);

        //找到一个平面后，注销 回调
         CancelFindAnchor();
    }

    public void RemoveAnchor(ARPlaneAnchor arPlaneAnchor)
    {
        if (planeAnchorMap.ContainsKey(arPlaneAnchor.identifier))
        {
            ARPlaneAnchorGameObject arpag = planeAnchorMap[arPlaneAnchor.identifier];
            GameObject.Destroy(arpag.gameObject);
            planeAnchorMap.Remove(arPlaneAnchor.identifier);
        }
    }

    public void UpdateAnchor(ARPlaneAnchor arPlaneAnchor)
    {
        if (planeAnchorMap.ContainsKey(arPlaneAnchor.identifier))
        {
            ARPlaneAnchorGameObject arpag = planeAnchorMap[arPlaneAnchor.identifier];

            bool isNeedChangeFilter = false;

            AndaARKitUtility.UpdatePlaneWithAnchorTransform(arpag.gameObject, arPlaneAnchor, isNeedChangeFilter);
           // UnityARUtility.UpdatePlaneWithAnchorTransform();
            arpag.planeAnchor = arPlaneAnchor;
            planeAnchorMap[arPlaneAnchor.identifier] = arpag;
        }
    }

    public void UnsubscribeEvents()
    {
        UnityARSessionNativeInterface.ARAnchorAddedEvent -= AddAnchor;
        UnityARSessionNativeInterface.ARAnchorUpdatedEvent -= UpdateAnchor;
        UnityARSessionNativeInterface.ARAnchorRemovedEvent -= RemoveAnchor;
       
    }

    public void DestroyPlane()
    {
        foreach (ARPlaneAnchorGameObject arpag in GetCurrentPlaneAnchors())
        {
            GameObject.Destroy(arpag.gameObject);
        }

        planeAnchorMap.Clear();
    }

    public void RegisterFindAnchor()
    {
        UnityARSessionNativeInterface.ARAnchorAddedEvent += AddAnchor;
    }

    public void CancelFindAnchor()
    {
        UnityARSessionNativeInterface.ARAnchorAddedEvent -= AddAnchor;
    }


    public LinkedList<ARPlaneAnchorGameObject> GetCurrentPlaneAnchors()
    {
        return planeAnchorMap.Values;
    }

	public void HidenPlane()
	{
		foreach (var go in planeAnchorMap.Values)
		{
			go.gameObject.SetActive(false);
		}
	}

	public void DisplayPlane()
	{
		foreach (var go in planeAnchorMap.Values)
        {
			go.gameObject.SetActive(true);
        }
	}

}
