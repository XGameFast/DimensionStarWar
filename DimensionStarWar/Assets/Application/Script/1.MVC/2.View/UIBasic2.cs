using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
public class UIBasic2 : AndaObjectBasic {


    public int menuLayer = 0;
    //基础组，用于统一控制 Alpha
    public CanvasGroup baseGroup;
    protected BaseController baseController;
    public bool isExcuteFadeIn=false;


    public override void OnSpawn()
    {
        base.OnSpawn();
        menuLayer =0;
        isExcuteFadeIn = false;
    }
   
   
    public virtual void InitMenu(BaseController _baseController)
    {
        baseController = _baseController;
    }

    public virtual void FadeIn(System.Action callback = null)
    {
        if(isExcuteFadeIn)return;
        isExcuteFadeIn=true;
        StartCoroutine(ExcuteFadeIn(callback));
    }

    public virtual void FadeOut(System.Action callback = null)
    {
        if(!isExcuteFadeIn)return;
        isExcuteFadeIn=false;
        StartCoroutine(ExcuteFadeOut(callback));
    }



    private IEnumerator ExcuteFadeIn(System.Action action)
    {
        while(baseGroup.alpha <1 )
        {
            baseGroup.alpha+=Time.deltaTime*2f;
            yield return null;
        }

        if(action!=null)
        {
            action();
        }
    }
    /// <summary>
    /// 完成淡入，内部函数
    /// </summary>
    protected virtual void FinishFadeIn()
    {

    }


    private IEnumerator ExcuteFadeOut(System.Action callback)
    {
        while(baseGroup.alpha>0)
        {
            baseGroup.alpha-=Time.deltaTime;
            yield return null;
        }
        if(callback == null)yield break;
        callback();
    }
	
    public virtual void OnUpdate()
    {
        
    }

    public override void OnDispawn()
    {
        switch(menuLayer)
        {
            case 1:
               
                break;
            case 2:
                if (JIRVISListenerEvent.JIRVISEvent_CloseSecondBar!=null)
                {
                    JIRVISListenerEvent.JIRVISEvent_CloseSecondBar();
                }
                break;
            case 3:
                if(JIRVISListenerEvent.JIRVISEvnt_CloseThirdBar != null)
                {
                    JIRVISListenerEvent.JIRVISEvnt_CloseThirdBar();
                }
                break;
        }
        isExcuteFadeIn=false;
        if(baseGroup !=null)
        {
            baseGroup.alpha = 0;
        }
       
        base.OnDispawn();

    }

    public int GetMenuLayerAddOne()
    {
        return menuLayer + 1;
    }


    public void SetFullScreen()
    {
        transform.GetComponent<RectTransform>().sizeDelta = new Vector2(0, 0);
     
    }


    #region 快递定位列表里的某一个item

    public void CenterOnItem(RectTransform target ,ScrollRect scrollRect , RectTransform viewMaskRect, RectTransform contentRect)
    {
        //currentItemInde = gridLayoutGroup.transform.GetChildList().IndexOf(target);


        var itemCenterPositionInScroll = GetWorldPointInWidget( scrollRect.GetComponent<RectTransform>(), GetWidgetWorldPoint( target));

        //Debug .Log( "Item Anchor Pos In Scroll: " + itemCenterPositionInScroll);
        // But must be here
        var targetPositionInScroll = GetWorldPointInWidget( scrollRect.GetComponent<RectTransform>(), GetWidgetWorldPoint( viewMaskRect));
        //Debug .Log( "Target Anchor Pos In Scroll: " + targetPositionInScroll);
        // So it has to move this distance
        var difference = targetPositionInScroll - itemCenterPositionInScroll;
        difference .z = 0f ;

        var newNormalizedPosition = new Vector2(difference .x / (contentRect.rect.width - viewMaskRect.rect.width ),
                                                difference .y / (contentRect.rect .height - viewMaskRect. rect.height ));

        newNormalizedPosition = scrollRect.normalizedPosition - newNormalizedPosition;

        newNormalizedPosition .x = Mathf.Clamp01(newNormalizedPosition.x );
        newNormalizedPosition .y = Mathf.Clamp01(newNormalizedPosition.y );

        DOTween .To(() => scrollRect.normalizedPosition , x=>scrollRect.normalizedPosition = x , newNormalizedPosition, 0.5f);


        //DOTween.to
    }

    Vector3 GetWidgetWorldPoint (RectTransform target)
    {
        //pivot position + item size has to be included
        var pivotOffset = new Vector3(
            (0.5f - target .pivot. x) * target .rect. size.x ,
            (0.5f - target .pivot. y) * target .rect. size.y ,
            0f);
        var localPosition = target.localPosition + pivotOffset ;
        return target.parent.TransformPoint (localPosition);
    }

    Vector3 GetWorldPointInWidget (RectTransform target, Vector3 worldPoint)
    {
        return target.InverseTransformPoint(worldPoint );
    }
    #endregion

}
