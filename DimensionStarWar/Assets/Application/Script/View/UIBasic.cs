using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIBasic : AndaObjectBasic {

    public UIWidget widget;
    public Animator animator;
    

    public virtual void InitMenu()
    {

    }
    public virtual void SetController(BaseController baseController)
    {

    }

    public virtual void PlayeAniFadeIn()
    {
        if(animator!=null) animator.Play("FadeIn");
    }

    public virtual void PlayAniFadeOut()
    {
        if (animator != null)  animator.Play("FadeOut");
    }

    public void FadeInAnimationEvent()
    {
        
    }
    private void FadeOutAnimationEvent()
    {
        gameObject.SetTargetActiveOnce(false);
    }

    public virtual void DidplayAlpha(float speed = 0.5f)
    {
        StartCoroutine(RunAlpha(true, speed));
    }
    public virtual void CloseAlpha(float speed = 0.5f)
    {
        StartCoroutine(RunAlpha(false, speed));
    }

    private IEnumerator RunAlpha(bool display, float speed)
    {
        if (display)
        {
            while (widget.alpha < 1)
            {
                widget.alpha += speed * Time.deltaTime;
                yield return null;
            }

            widget.alpha = 1;
        }
        else
        {
            while (widget.alpha > 0)
            {
                widget.alpha -= speed * Time.deltaTime;
                yield return null;
            }
            widget.alpha = 0;
        }
    }

    public virtual void OnUpdate()
    {

    }
}
