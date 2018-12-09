using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShootingTrainingView : UIBasic2
{
     //public UITool_Press selectMonsterbtn;
    private ShootingTrainingController shootingTrainingController;
  //  private System.Action<float> callbackOnPressSelectMonsterBtn;

    public Image countDownImage;
    public Sprite[] countdownNumSprites;

    public GameObject comfirmBtn;

   
    public override void InitMenu(BaseController _baseController)
    {
        base.InitMenu(_baseController);

        shootingTrainingController = _baseController as ShootingTrainingController;
       
    }

  

    public void StartCountDown(System.Action callback)
    {
        countDownImage.gameObject.SetTargetActiveOnce(true);
        StartCoroutine(ReadCountDown(callback));
    }
    private IEnumerator ReadCountDown(System.Action callback)
    {
        int  count = 3 ;
        float time = 1;
        Color color  = Color.white;
        while(count > 0)
        {
            countDownImage.sprite = countdownNumSprites[count -1];
            countDownImage.transform.localScale = Vector3.one*2;
            color  = Color.white;
            time = 1;
            while(time>0)
            {
                time -= Time.deltaTime;
                countDownImage.transform.localScale = Vector3.one * time * 2;
                color.a = time;
                countDownImage.color = color;
                yield return null;
            }
            yield return null;

            count -= 1;
        }
        callback();
        countDownImage.gameObject.SetTargetActiveOnce(false);
    }


    public void OpenComfirmBtn(bool isOpen)
    {
        comfirmBtn.gameObject.SetTargetActiveOnce(isOpen);
    }
   

    public void ClickConfirm()
    {
        shootingTrainingController.ClickComfirmThisMonster();
    }
}
