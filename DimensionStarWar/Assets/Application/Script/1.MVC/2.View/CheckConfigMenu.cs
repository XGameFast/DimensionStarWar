using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class CheckConfigMenu : UIBasic2 {

    //public Animator blackhole;
    public GameObject monster;
    public float progress = 0f;
    public Text progressText;
    public Slider progressSlider;

    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);


        //blackhole.Play("FadeInScale");
       //monster.gameObject.SetActive(true);
       
        StartCoroutine(LoadProgress());

        Invoke("InvokeFadeInMenu", 1.65f);

        //AndaObjectBasic andaObjectBasic = AndaDataManager.Instance.InstantiateOtherObj("Logo2");
        //andaObjectBasic.SetInto(transform);
    }

    private void InvokeFadeInMenu()
    {
        FadeIn();
    }

    public IEnumerator LoadProgress()
    {
        while(isActive)
        {
            if (progress < 90)
            {
                progress += Time.deltaTime * 10;
                progressText.text = progress.FloatToInt() + "%";
               
            }
            else if (progress < 98)
            {
                progress += Time.deltaTime;
                progressText.text = progress.FloatToInt() + "%";
            }
            if (progress.Equals(100))
            {
                progressText.text = "100%";
                SetProgressTextToSkipTips();
                yield break;
            }
            float t = Mathf.Clamp01(progress / 100f);
            progressSlider.value = t;
            yield return null;
        }

       

    }

    public void SetProgressTextToSkipTips()
    {
        progressText.text = "跳过";
    }

    public void ClickSkip()
    {
        if(progressText.text != "跳过")return;
        //只要视频停止就会立刻跳转界面
        ARMonsterSceneDataManager.Instance.aRWorld.OpenStartVideo(false);
    }

}