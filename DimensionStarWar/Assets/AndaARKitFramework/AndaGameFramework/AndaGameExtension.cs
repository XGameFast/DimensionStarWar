using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;
using LitJson;
using System;
using UnityEngine.UI;
public static class AndaGameExtension {
    [DllImport("__Internal")]
    public static extern void _ShakeDevice(int type);

    public static bool isShaking = false;

    public static void ShakeDeviece(int type)
    {
#if !UNITY_EDITOR && UNITY_IOS
        _ShakeDevice( type);
#endif
#if  UNITY_ANDROID
        //Handheld.Vibrate();
#endif
    }
    //短震动
    public static void ImpactFeedbackStyleLight()
    {
        ShakeDeviece(1);
    }

    //zhong震动
    public static void UIImpactFeedbackStyleMedium()
    {
        ShakeDeviece(2);
    }

    //重震动
    public static void UIImpactFeedbackStyleHeavy()
    {
        ShakeDeviece(3);
    }
    
    public static IEnumerator Shaking(float interval, int shakeType, int shaketimes)
    {
        yield return null;
#if !UNITY_EDITOR
        if (isShaking) yield break ;
        isShaking = true;
        if (shaketimes == -1)
        {
            while (isShaking)
            {
                _ShakeDevice(shakeType);
                yield return new WaitForSeconds(interval);
            }
        }
        else
        {
            while (shaketimes > 0)
            {
                shaketimes -= 1;
                _ShakeDevice(shakeType);
                yield return new WaitForSeconds(interval);
            }
            isShaking = false;
        }
#endif
    }
    /// <summary>
    /// 实例化
    /// </summary>
    /// <param name="obj"></param>
    /// <returns></returns>
    public static GameObject Clone(this GameObject obj)
    {
        GameObject ob = GameObject.Instantiate(obj);
        ob.name = obj.name;
        return ob;
    }

    public static T Clone<T>(this GameObject aob)where T :Component
    {
        GameObject ob = GameObject.Instantiate(aob);
        ob.name = aob.name;
        return ob.GetComponent<T>();
    }

    public static GameObject Clone(this AndaObjectBasic aob)
    {
        GameObject ob = GameObject.Instantiate(aob.self);
        ob.name = aob.name;
        return ob;
    }
    public static T Clone<T>(this AndaObjectBasic aob)where T :Component
    {
        GameObject ob = GameObject.Instantiate(aob.self);
        ob.name = aob.name;
        return ob.GetComponent<T>();
    }

    public static void SetInto(this GameObject obj, Transform target)
    {
        obj.transform.SetInto(target);
    }
    public static void SetInto(this AndaObjectBasic aob, Transform target)
    {
        aob.transform.SetInto(target);
    }
    public static void SetInto(this Transform obj, Transform target)
    {
        obj.parent = target;
        obj.ResetTran();
    }
    public static void SetUIInto(this Transform obj,Transform _parent)
    {
        RectTransform rectTransform = obj.GetComponent<RectTransform>();
        rectTransform.parent = _parent;
        rectTransform.localScale = Vector3.one;
        rectTransform.localPosition = Vector3.zero;

      
        //rectTransform.del
    }
    public static List<Transform> GetChildList(this Transform board)
    {
        List<Transform> list = null;
        int count = board.childCount;
        for (int i = 0; i < count; i++)
        {
            if (list == null) list = new List<Transform>();
            list.Add(board.GetChild(i));
        }

        return list;
    }


    public static void RemoveComponemont<T>(this GameObject obj) where T : Component
    {
        GameObject.Destroy(obj.GetComponent<T>());
    }


    /// <summary>
    /// 把字符串中想插入要填的数值
    /// </summary>
    /// <param name="t"></param>
    /// <param name="convertContent"></param>
    /// <param name="index"></param>
    /// <returns></returns>
    public static string ConverString(this string t, string convertContent, int index = 0)
    {
       return t.Replace("x", convertContent);
    }

    /// <summary>
    /// 归零处理
    /// </summary>
    /// <param name="obj"></param>
    public static void ResetTran(this GameObject obj,float scale =1 )
    {
        obj.transform.localPosition = Vector3.zero;
        obj.transform.localScale = Vector3.one * scale;
    }
    public static void ResetTran(this AndaObjectBasic obj)
    {
        obj.transform.localPosition = Vector3.zero;
        obj.transform.localScale = Vector3.one;
        obj.transform.localRotation = Quaternion.identity;
    }
    public static void ResetTran(this Transform obj)
    {
        obj.localPosition = Vector3.zero;
        obj.localScale = Vector3.one;
        obj.localRotation = Quaternion.identity;
    }
    public static void ResetPos(this AndaObjectBasic obj)
    {
        obj.transform.localPosition = Vector3.zero;
    }
    public static void DestoryList(this List<AndaObjectBasic> list)
    {
        foreach(var go in list)
        {
            go.OnDispawn();
            GameObject.Destroy(go);
        }
        list.Clear();
    }
    /// <summary>
    /// 数组初始化，为空则new，不为空则清楚
    /// </summary>
    /// <param name="list"></param>
    public static void AOListInit(this List<AndaObjectBasic> list)
    {
        if (list == null)
            list = new List<AndaObjectBasic>();
        else
        {
            list.DestroyListByAndaData();
        }
    }

    //走AndaDataManager接口过
    public static void DestroyListByAndaData(this List<AndaObjectBasic> list)
    {
        foreach (var go in list)
        {
            AndaDataManager.Instance.DestoryObj(go);
        }
    }
    public static  void RecieveListByAndaData(this List<AndaObjectBasic> list)
    {
        if(list == null)return;
        foreach(var go in list)
        {
            AndaDataManager.Instance.RecieveItem(go);
        }
        list = null;
    }
    public static void RecieveListByAndaDta(this List<TowerBase> list)
    {
        if(list == null)return;
        foreach(var go in list)
        {
            AndaDataManager.Instance.RecieveItem(go);
        }
        list.Clear();
    }


    public static void DestroyByAndaDataManager(this AndaObjectBasic obj)
    {
        if (obj != null) obj.OnDispawn();
          //  AndaDataManager.Instance.DestoryObj(obj);
    }
    
    public static string DoubleToString(this double value)
    {
        return value.ToString("0.0");
    }
    public static float FloatToFloat(this float value)
    {
        return float.Parse( value.ToString("0.0"));
    }
    public static float DoubleToFloat(this double value)
    {
        return float.Parse(value.DoubleToString());
    }
    public static int FloatToInt(this float value)
    {
        return (int)value;
    }

    public static void SetLayer(this GameObject obj , string layerName)
    {
        if(LayerMask.LayerToName(obj.layer) == layerName)return;
        foreach(Transform tran in obj.transform.GetComponentsInChildren<Transform>())
        {
            //遍历当前物体及其所有子物体
            tran.gameObject.layer =  LayerMask.NameToLayer(layerName);
        }

    }

    public static string ToTime(this int value)
    {
        if (value < 10) return "0" + value;
        else return value.ToString();
    }
    public static string UnixCovertToTime(this int value)
    {
        string timer = "";
        string hh = ((int)(value / 3600)).ToTime();
        string mm = ((int)(value / 60)).ToTime();
        string ss = ((int)(value % 3600)).ToTime();
        return timer = hh + ":" + mm + ":" + ss;

    }
    public static bool isCurTimeGreat(this int targetValue)
    {
        return GetCurrentUnixTime() >= targetValue;
    }

    public static Vector3 GetTargetPointWithSelfY(this Vector3 targetPoint, float selfY)
    {
        return new Vector3(targetPoint.x, selfY, targetPoint.z);
    }

    public static bool IsInRange(this Vector3 selfPoint , Vector3 targetPoint , float range)
    {
        float distance = Vector3.Distance(selfPoint,targetPoint);
        return distance<= range;
    }

    public static bool IsInFront(this AndaObjectBasic self ,Vector3 targetPosition)
    {
        Vector3 dir = (targetPosition - self.selfPostion).normalized;

        float dot = Vector3.Dot(self.transform.forward, dir);//判断物体与相机之间的方向   和 相机当前的方向 
        if (dot > 0)
            return true;
        else
            return false;
    }

    public static bool IsInFront(this Transform self, Vector3 targetPosition)
    {
        Vector3 dir = (targetPosition - self.position).normalized;

        float dot = Vector3.Dot(self.forward, dir);//判断物体与相机之间的方向   和 相机当前的方向 
        if (dot > 0)
            return true;
        else
            return false;
    }
    public static bool IsInFrontOfCamera(this Transform self)
    {
        Vector3 dir = (self.position - Camera.main.transform.position).normalized;
        float dot = Vector3.Dot(Camera.main.transform.forward, dir);
        return dot > 0;
    }

    public static bool IsInFrontOfCamera(this Vector3 self)
    {
        Vector3 dir = (self - Camera.main.transform.position).normalized;
        float dot = Vector3.Dot(Camera.main.transform.forward, dir);
        return dot > 0;
    }

    public static bool IsInFrontOfCamera(this Vector3 self,Camera camera)
    {
        Vector3 dir = (self - camera.transform.position).normalized;
        float dot = Vector3.Dot(camera.transform.forward, dir);
        return dot > 0;
    }

    public static bool IsInRect(this Vector3 point, float x = 0, float y = 0)
    {
        
        float px = Screen.width / x;
        float py = Screen.height / y;

        //叉乘，不用管他。要想深究也可以。反正只要这样两条条件就可以判断出目标是否在这个矩形内
        return Multiply(point.x, point.y, px, py, Screen.width - px, Screen.height - py)
            *
            Multiply(point.x, point.y, px, Screen.height - py, Screen.width - px, Screen.height - py)
            <= 0

            &&

            Multiply(point.x, point.y, px, Screen.height - py, px,py)
            *
            Multiply(point.x, point.y, Screen.width -px , Screen.height - py , Screen.width - px, py)
            <= 0;

    }
    public static bool IsInScreenViewport(this Vector3 point , Camera camera)
    {
        Vector2 vector2 = camera.WorldToScreenPoint(point);
        return vector2.x>= 200  && vector2.x <= Screen.width-200 && vector2.y >= 200 && vector2.y <=Screen.height-200;
    }
    public static bool IsInScreenViewPort(this Vector3 point , Camera camera , Vector2 rect)
    {
        Vector2 vector2 = camera.WorldToScreenPoint(point);
        return vector2.x>= rect.x  && vector2.x <= Screen.width-rect.x && vector2.y >= rect.y && vector2.y <=Screen.height-rect.y;
    }
    //[在相机前面 并且在视窗内]
    public static bool IsInFrontOfScreenViewPort(this Vector3 point, Camera camera)
    {
        if(IsInFrontOfCamera(point,camera))
        {
            return IsInScreenViewport(point,camera);
        }
        return false;
    }
    public static bool IsInFrontOfScreenViewPort(this Vector3 point, Camera camera , Vector2 rect)
    {
        if(IsInFrontOfCamera(point,camera))
        {
            return point.IsInScreenViewPort(camera,rect);
        }
        return false;
    }


    private static float Multiply(float p1x, float p1y, float p2x, float p2y, float p0x, float p0y)
    {
        return ((p1x - p0x) * (p2y - p0y) - (p2x - p0x) * (p1y - p0y));
    }

    public static Vector2 ConvertWorldPostionToNGUIPosition(this Vector3 position)
    {
        var tmp = Camera.main.WorldToScreenPoint(position);
        tmp.z = 0;
        tmp = UICamera.mainCamera.ScreenToWorldPoint(tmp);
        return tmp;
    }

    public static void SetActiveOnceWhenTargetIsUnActive(this GameObject target)
    {
        if (!target.activeSelf)
        {
            target.gameObject.SetActive(true);
        }
    }
    public static void SetUnactiveOnceWhenTargetIsActive(this GameObject target)
    {
        if (target.activeSelf)
        {
            target.gameObject.SetActive(false);
        }
    }

    public static void SetTargetActiveOnce(this GameObject target, bool isActive)
    {
        if (target != null)
        {
            if (isActive)
            {
                target.SetActiveOnceWhenTargetIsUnActive();
            }
            else
            {
                target.SetUnactiveOnceWhenTargetIsActive();
            }
        }
    }


    public static void SetTargetActiveOnce(this AndaObjectBasic target, bool isActive)
    {
        if (target != null)
        {
            if (isActive)
            {
                target.gameObject.SetActiveOnceWhenTargetIsUnActive();
            }
            else
            {
                target.gameObject.SetUnactiveOnceWhenTargetIsActive();
            }
        }
    }

    

    public static void SetActiveAllTure(this List<AndaObjectBasic> list)
    {
        foreach (var go in list)
        {
            go.gameObject.SetTargetActiveOnce(true);
        }
    }
    

    public static int GetCurrentUnixTime()
    {
        return (int)((System.DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000);
    }

    public static void GameTimeScale(float speed)
    {
        Time.timeScale = speed;
    }

    public static string LockData(string json,string userToken)
    {
        return ServerEncryption.AESEncryptor.Encrypt(json,userToken);
    }

    public static Vector3 UGUIPointTo3DUICameraPoint(this Vector3 uGUIPoint)
    { 

        Vector3 screenpoint = RectTransformUtility.WorldToScreenPoint(AndaUIManager.Instance.canvas.worldCamera,uGUIPoint);

        return AndaUIManager.Instance.canvas.worldCamera.ScreenToWorldPoint(uGUIPoint);

    }

    public static  Color GetLevelColor(int level)
    {
        switch(level)
        {
            case 0:
                return Color.gray;
            case 1:
                return Color.white;
            case 2:
                return Color.green;
            case 3:
                return Color.blue;
            case 4:
                return new Color() { r = 160 /255f, g = 32/255f, b = 240/255f , a = 1 };// zi
            case 5:
                return new Color() { r = 1, g = 97/255f, b = 0 , a = 1 }; //cheng
            case 6:
                return Color.black;
            default:
                return Color.black;
        }
    }


    /// <summary>
    /// unix时间戳转换成日期
    /// </summary>
    /// <param name="timestamp">时间戳(秒)</param>
    /// <returns></returns>
    public static System.DateTime UnixTimestampToDateTime(long timestamp)
    {
        System.DateTime target = System.DateTime.Now;
        var start = new System.DateTime(1970, 1, 1, 8, 0, 0, target.Kind);
        return start.AddSeconds(timestamp);
    }

    public static string GetDateString(long timestamp)
    {
        return UnixTimestampToDateTime(timestamp).ToShortDateString().ToString();
    }

    //public static void _ShowAndroidToastMessage(string message)
    //{
    //    AndroidJavaClass unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
    //    AndroidJavaObject unityActivity = unityPlayer.GetStatic<AndroidJavaObject>("currentActivity");

    //    if (unityActivity != null)
    //    {
    //        AndroidJavaClass toastClass = new AndroidJavaClass("android.widget.Toast");
    //        unityActivity.Call("runOnUiThread", new AndroidJavaRunnable(() =>
    //        {
    //            AndroidJavaObject toastObject = toastClass.CallStatic<AndroidJavaObject>("makeText", unityActivity,
    //                message, 0);
    //            toastObject.Call("show");
    //        }));
    //    }
    //}


    public static string ChangeTextColorToYellow(string content)
    {
        return "<color=#00FF01FF>"+content+"</color>"; //。占星庭是读星者的个据点，用于存放和使用各种次元物品";
    }



    private const double EARTH_RADIUS = 6378137;
    /// <summary>
    /// 计算两点位置的距离，返回两点的距离，单位 米
    /// 该公式为GOOGLE提供，误差小于0.2米
    /// </summary>
    /// <param name="lat1">第一点纬度</param>
    /// <param name="lng1">第一点经度</param>
    /// <param name="lat2">第二点纬度</param>
    /// <param name="lng2">第二点经度</param>
    /// <returns></returns>
    public static double GetLatlonDistance(double lat1, double lng1, double lat2, double lng2)
    {
        double radLat1 = Rad(lat1);
        double radLng1 = Rad(lng1);
        double radLat2 = Rad(lat2);
        double radLng2 = Rad(lng2);
        double a = radLat1 - radLat2;
        double b = radLng1 - radLng2;
        double result = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) + Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2))) * EARTH_RADIUS;
        return result;
    }

    /// <summary>
    /// 经纬度转化成弧度
    /// </summary>
    /// <param name="d"></param>
    /// <returns></returns>
    private static double Rad(double d)
    {
        return (double)d * Math.PI / 180d;
    }


    #region 让图片变暗
    public static void SetBtnActive(this Button btn , bool isEnable)
    {
        btn.enabled = isEnable;
        Image[] images = btn.GetComponentsInChildren<Image>();
        int count = images.Length;
        Color color = btn.image.color;
        for (int i = 0 ; i < images.Length ;i++)
        {
            images[i].color = color;
        }
    }
    #endregion
}
