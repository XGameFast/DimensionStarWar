using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WarringTips : MonoBehaviour {

    public Transform moveTarget;
    public UI2DSprite targetUI;
    public Transform arrow;
    private Vector2 screenPoint01;
    private Vector2 screenPoint02;
    private Vector2 screenPoint03;
    private Vector2 screenPoint04;
    private Color gray;
    private Color colorful;
    [HideInInspector]
    public Transform target;
    public Animator tsAni;
    public GameObject infoBoard;
    public GameObject tipsObj;
    private void Awake()
    {
        screenPoint01 = new Vector2(0, 0);//左下角
        screenPoint02 = new Vector2(Screen.width, 0);//右下角
        screenPoint03 = new Vector2(Screen.width, Screen.height);//右上角
        screenPoint04 = new Vector2(0, Screen.height);//左上角
        colorful = Color.white;
        gray = Color.gray;
        gray.a = 0.3f;
    }
    public void Init(Transform _target)
    {

        target = _target;
        StartCoroutine(UIFollowTarget());
    }
    public void StopFollow()
    {
        StartCoroutine(WaitForFadeOut());
    }
    private IEnumerator WaitForFadeOut()
    {
        tsAni.Play("fadeOut");
        target = null;
        yield return new WaitForSeconds(0.15f);
        gameObject.SetActive(false);
    }
    
    private IEnumerator UIFollowTarget()
    {
        tsAni.Play("fadeIn");
        Transform camera_pos = Camera.main.transform;
        //运行判断条件自行判断，我这里假定这个敌人一直存在的。就无限制跑下去了
        while (target != null)
        {
            Vector2 enemyPositionWithUI = GetEnemyPositionWithUI(target.transform.position);
            //这里有点绕。仔细理解一下应该没问题。先把物体世界坐标转为NGUI的坐标。
            //上面的坐标是NGUI的世界坐标。并不是屏幕上的。需要再转换成屏幕坐标，用于计算是否在矩形范围内
            Vector2 toNGUIScreenPoint = UICamera.mainCamera.WorldToScreenPoint(enemyPositionWithUI);
            bool isInRect = IsInRect(toNGUIScreenPoint);
            bool isInFront = IsFrontOfCamera(target.transform.position, camera_pos);
            if (isInRect)
            {
                tsAni.Play("fadeIn");
                arrow.gameObject.SetActive(false);
                infoBoard.gameObject.SetActive(true);
             
            }
            else
            {
                tsAni.Play("fadeOut");
                arrow.gameObject.SetActive(true);
                infoBoard.gameObject.SetActive(false);
            }
            if (isInFront)
            {
               
                if (targetUI.color != colorful) targetUI.color = colorful;
                if (toNGUIScreenPoint.x < 0) toNGUIScreenPoint.x = targetUI.width / 2;
                else if (toNGUIScreenPoint.x > Screen.width) toNGUIScreenPoint.x = Screen.width - targetUI.width / 2;

                if (toNGUIScreenPoint.y < 0) toNGUIScreenPoint.y = targetUI.width / 2;
                else if (toNGUIScreenPoint.y > Screen.height) toNGUIScreenPoint.y = Screen.height - targetUI.height / 2;
            }
            else
            {
               
                if (targetUI.color != gray) targetUI.color = gray;
                //在背后，要反一下
                if (toNGUIScreenPoint.x < Screen.width / 2) toNGUIScreenPoint.x = Screen.width - targetUI.width / 2;
                else if (toNGUIScreenPoint.x >= Screen.width / 2) toNGUIScreenPoint.x = targetUI.width / 2;

                if (toNGUIScreenPoint.y < Screen.height / 2) toNGUIScreenPoint.y = Screen.height - targetUI.height / 2;
                else if (toNGUIScreenPoint.y >= Screen.height / 2) toNGUIScreenPoint.y = targetUI.height / 2;
            }
            //转回去
            Vector2 finalPoint = UICamera.mainCamera.ScreenToWorldPoint(toNGUIScreenPoint);
            int dir = isInFront ? 1 : -1;
            Vector2 v2dir = enemyPositionWithUI - finalPoint;
            v2dir = v2dir * dir;
            arrow.transform.up = new Vector3(v2dir.x, v2dir.y, 0);

            moveTarget.position = finalPoint;
            yield return null;//注意添加每次都等一帧，否则会崩溃
        }
       // DestroyImmediate(gameObject);
    }
    private Vector3 GetEnemyPositionWithUI(Vector3 targetPosition)
    {
        //这里转换一下屏幕坐标，网上有些其他人乱转载，把别人错误的敌方也转载过来，给很多造成不必要的困扰。
        //这里时正确的坐标，把世界坐标转到NGUI的坐标上
        var tmp = Camera.main.WorldToScreenPoint(targetPosition);
        tmp.z = 0;
        tmp = UICamera.mainCamera.ScreenToWorldPoint(tmp);
        return tmp;
    }
    //这里指再玩家视野范围内，如果再矩形内，但是再背后，也算视野范围外
    bool IsInRect(Vector3 point)
    {
        //叉乘，不用管他。要想深究也可以。反正只要这样两条条件就可以判断出目标是否在这个矩形内
        return Multiply(point.x, point.y, screenPoint01.x, screenPoint01.y, screenPoint02.x, screenPoint02.y)
            *
            Multiply(point.x, point.y, screenPoint04.x, screenPoint04.y, screenPoint03.x, screenPoint03.y)
            <= 0

            &&

            Multiply(point.x, point.y, screenPoint04.x, screenPoint04.y, screenPoint01.x, screenPoint01.y)
            *
            Multiply(point.x, point.y, screenPoint03.x, screenPoint03.y, screenPoint02.x, screenPoint02.y)
            <= 0;
    }


    private float Multiply(float p1x, float p1y, float p2x, float p2y, float p0x, float p0y)
    {
        return ((p1x - p0x) * (p2y - p0y) - (p2x - p0x) * (p1y - p0y));
    }
    private bool IsFrontOfCamera(Vector3 targetPosition, Transform cameraTrans)
    {
        Vector2 viewPos = Camera.main.WorldToViewportPoint(targetPosition);
        Vector3 dir = (targetPosition - cameraTrans.position).normalized;

        float dot = Vector3.Dot(cameraTrans.forward, dir);//判断物体与相机之间的方向   和 相机当前的方向 
        if (dot > 0)
            return true;
        else
            return false;
    }
}
