using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ARMonsterMainData {

    /*
     * 用于 主控制 器 产生的数据交互 和 临时保存
     */
    public BaseController currentController;
    public Dictionary<string, BaseController> controller_dic;
    public OTYPE.WolrdType lastSceneWorldType = OTYPE.WolrdType.none;
    public OTYPE.WolrdType currentSceneWorldType = OTYPE.WolrdType.none;

    public string getCurControllerName {get {return curControllerName ;}}
    public string getLastControllerName { get {return  lastControllerName ;} } 
    private string lastControllerName ;
    private string curControllerName;
    private BaseController mainCtrl;
    
    public ARMonsterMainData(BaseController _mainCtrl,System.Action<string> callback)
    {
        mainCtrl = _mainCtrl;
        currentController = null;
        InitControllerDictionary();
        RegisterCallBack(callback);
    }
    private void InitControllerDictionary()
    {
        if (controller_dic == null)
        {
            controller_dic = new Dictionary<string, BaseController>();
            var controller_list = mainCtrl.transform.GetComponentsInChildren<BaseController>();
            foreach (var go in controller_list)
            {
                controller_dic.Add(go.name, go);
            }
        }
    }

    private void RegisterCallBack(System.Action<string> callback)
    {
        foreach (var go in controller_dic.Values)
        {
            go.callbackFinishController = callback;
        }
    }

    public void SetCurrentController(string ctrlName)
    {
        currentController = controller_dic[ctrlName];

       
    }

    public void SetLastSceneWorldType()
    {
        if (currentController != null)
        {
            lastSceneWorldType = currentController.worldType; ;
        }
    }

    public void SetCurrentSceneWorldType()
    {
        if (currentController != null)
        {
            currentSceneWorldType = currentController.worldType; ;
        }
    }


    public void SetActiveController(bool isActive)
    {
        if (currentController != null)
        {
            currentController.gameObject.SetActive(isActive);
        }
    }

    public void ExcuteController(bool isExcute)
    {
        if (currentController != null)
        {
            if (isExcute) currentController.StartController();
            else currentController.EndController();
        }
    }

    public void CloseCurrentController()
    {
        
        ExcuteController(false);
        SetActiveController(false);
        SetLastSceneWorldType();
        //关闭当前控制器的时候，记录一下，之后可以用于返回上一个控制
        lastControllerName = curControllerName;
    }
    /// <summary>
    /// 设置当前的控制器，打开控制器脚本，设置控制器对应的世界标签
    /// </summary>
    /// <param name="curCtrlName"></param>
    public void SwitchCurrentController(string curCtrlName)
    {
        //记录一下当前控制的名字
        curControllerName = curCtrlName;
        SetCurrentController(curCtrlName);
        OpenCurrentController();
        SetCurrentSceneWorldType();
    }

    public void OpenCurrentController()
    {
        SetActiveController(true);
        ExcuteController(true);
    }

   
}
