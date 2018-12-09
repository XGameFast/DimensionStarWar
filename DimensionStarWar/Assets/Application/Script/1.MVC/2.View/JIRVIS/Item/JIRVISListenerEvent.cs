using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class JIRVISListenerEvent  {


    /// <summary>
    /// 关闭四级面板
    /// </summary>
    public static System.Action JIRVISEvnt_CloseFourthBar;

    /// <summary>
    /// 关闭三级面板
    /// </summary>
    public static System.Action JIRVISEvnt_CloseThirdBar;

    /// <summary>
    /// 监听关闭2级面板
    /// </summary>
    public static System.Action JIRVISEvent_CloseSecondBar;



    /// <summary>
    /// 特殊事件，监听物品详情表关闭
    /// </summary>
    public static System.Action SpecialEvent_CloseConsumableInfoBar;

    /// <summary>
    /// 特殊事件，监听宠物编辑面变关闭
    /// </summary>
    public static System.Action SpecialEvent_CloseMonsterEditorInfoBar;

}
