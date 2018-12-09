using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossLogic2002 : BossLogic {

    private int rotateHeadTimes = 0 ;
    private float attackTime;
    private Boss2002 bossBasic;
    private bool isBigElgunTime =false;
    public override void BuildBossLogic(BossBasic _bossBasic)
    {
        bossBasic = _bossBasic as Boss2002;
    }

    protected override void Logic()
    {
        base.Logic();
        if(bossBasic.bossData.getCurBossActiveState  == BossActiveState.think)
        {
            Think();
        }else if(bossBasic.bossData.getCurBossActiveState == BossActiveState.finding)
        {
            ExcuteFining();

        }else if(bossBasic.bossData.getCurBossActiveState == BossActiveState.moving)
        {
            Moveing();
        }else if(bossBasic.bossData.getCurBossActiveState == BossActiveState.attack)
        {
            AttackPlayer();
        }else if(bossBasic.bossData.getCurBossActiveState == BossActiveState.magicl)
        {
            RealeseMagical();
        }

        if(!isBigElgunTime)
        {
            //计算是否要发射电磁炮
            CaculElgunShotTime();
        }
       
       
    }

    public void Attack()
    {
            
    }

    //如果同时存在 正 负 级电磁炮，那么开启大招！！！！
    public void CheckDifferrenceElguns()
    {
        int t = 0;
        int count = bossBasic.getBossData2002.getElgunObjsList.Count;
        for(int i = 0 ; i < count; i++)
        {
            if(bossBasic.getBossData2002.getElgunObjsList[i]!=null)
            {
                if(t == 0)
                {
                    t = bossBasic.getBossData2002.getElgunObjsList[i].getSkillID;
                }else
                {
                    if(bossBasic.getBossData2002.getElgunObjsList[i].getSkillID!=t)
                    {
                        if(bossBasic.bossData.getIsEndOfAttack)
                        {
                            isBigElgunTime = true;
                            bossBasic.getBossData2002.getBossSkillLogic2002.PlayAttack(bossBasic.getBossData2002.getBigElgun,bossBasic.shotPont);
                            ControlElgunsToHeadPoint();
                            Debug.Log("准备大招啦！！！！");
                            bossBasic.ControlAttack();
                            bossBasic.bossData.SetCurBossActiveState(BossActiveState.attack);
                            //在释放多级的时候去清空一下 正负级 能量炮
                            //ControlElgunsToHeadPoint();
                            Vector3 targetDir = bossBasic.bossData.getCurrentEnemy.selfPostion - bossBasic.head.position;//    - bossBasic.selfPostion;
                            Quaternion quaternion = Quaternion.LookRotation(targetDir);
                            bossBasic.ControlRotateHead(quaternion);
                            bossBasic.bossData.SetEndOfAttack(false); 
                        }
                    }
                }
            }
        }
    }


    //private void 




    private void ControlElgunsToHeadPoint()
    {
        bossBasic.StartCoroutine(ExcuteControlElgunsToHeadPoint());
    }

    private IEnumerator ExcuteControlElgunsToHeadPoint()
    { 
        float time = 0;
        int count = bossBasic.getBossData2002.getElgunObjsList.Count;
        List<Vector3> startPoint = new List<Vector3>();
        for(int i = 0 ; i < count; i++)
        {
            if(bossBasic.getBossData2002.getElgunObjsList[i]!=null)
            {
                startPoint.Add(bossBasic.getBossData2002.getElgunObjsList[i].selfPostion);
            }
        }

        int t = 0;
        float per = 0 ;
        while(per<1)
        {
            time +=Time.deltaTime;
            per  = time/0.5f;
            for(int i = 0; i < count; i++)
            {
                if(bossBasic.getBossData2002.getElgunObjsList[i]!=null)
                {
                    bossBasic.getBossData2002.getElgunObjsList[i].selfPostion = Vector3.Lerp(startPoint[t] , bossBasic.shotPont.position,per);
                    t+=1;
                    if(t>=startPoint.Count)
                    {
                        t=0;
                    }
                 
                }

            }
            yield return null;
        }

        //清空电磁炮
        bossBasic.getBossData2002.ClearElgunObjList();

    }



    #region 生成电磁炮 和 释放电磁炮

    //【生成电磁炮】 会进入到 magical状态，生成动画完成
    private void InstanceElgun()
    {
        Transform setPoint = bossBasic.getBossData2002.GetNextElPoint();
        PlayerSkillAttribute playerSkillAttribute = bossBasic.getBossData2002.GetNextElAttribute();
        bossBasic.getBossData2002.getBossSkillLogic2002.InstanceElectromagneticGun(playerSkillAttribute,setPoint);
        bossBasic.getBossData2002.SetStartElGunTime();
        bossBasic.getBossData2002.getBossAnimation20002.PlayRealeseMgical();
        bossBasic.getBossData2002.SetEndOfRealseMagicalState(false);

        CheckDifferrenceElguns();
    }

    //[生成电磁炮的过程]结束后 会进入思考。
    public override void RealeseMagical()
    {
        base.RealeseMagical();
        if(bossBasic.getBossData2002.getIsEndOfRealeseMagical)
        {
            ReadThink();
        }
    }

    //【释放电磁炮】释放完电磁炮会进入 Attacking 等待释放动画播放完成
    private void CaculElgunShotTime()
    {
        if(!bossBasic.getBossData2002.getIsEndOfRealeseMagical)return;//正在生成能量圈。就不计算这里了
        if(bossBasic.getBossData2002.getElgunObjsList == null)return;
        for(int  i = 0 ; i <bossBasic.getBossData2002.getElgunObjsList.Count;i++)
        {
            if(bossBasic.getBossData2002.getElgunObjsList[i] == null)continue;
            if(bossBasic.getBossData2002.getInstancElgunTimeList[i].Equals(-1f))continue;

            float offsetTime = Time.time - bossBasic.getBossData2002.getInstancElgunTimeList[i];
            if(offsetTime> bossBasic.elGun_lifeTime)
            {
                if(bossBasic.bossData.getIsEndOfAttack)
                {
                    Vector3 targetDir = bossBasic.bossData.getCurrentEnemy.selfPostion - bossBasic.head.position;//    - bossBasic.selfPostion;
                    Quaternion quaternion = Quaternion.LookRotation(targetDir);
                    bossBasic.ControlRotateHead(quaternion);
                    bossBasic.bossData.SetCurSkillObj(bossBasic.getBossData2002.getElgunObjsList[i]);
                    bossBasic.ControlAttack();
                    bossBasic.bossData.SetCurBossActiveState(BossActiveState.attack);
                    bossBasic.getBossData2002.RemovelgunObjTolist(i);
                    bossBasic.bossData.SetEndOfAttack(false);
                }
            }
        }
    }

    //【释放电磁炮的过程】完成后，会进入思考
    public override void AttackPlayer()
    {
        base.AttackPlayer();

        if(bossBasic.bossData.getIsEndOfAttack)
        {
            if(isBigElgunTime)isBigElgunTime=false;
            bossBasic.bossData.SetCurBossActiveState(BossActiveState.think);
        }else
        {
            Debug.Log("is wait for attack end");
        }
    }

    #endregion


   
    #region 移动 目标点 或者 移动向敌人
    //[巡逻下一个点]
    public void NextPointMove()
    {
        Vector3 headForwad = bossBasic.headFwdPint.forward;// TransformDirection(bossBasic.head.forward);//(Vector3.forward);
        headForwad.y = 0;
        Vector3 targetPoint = bossBasic.selfPostion + headForwad.normalized * Random.Range(10f,20f);
        bossBasic.bossData.SetCurLookPoint(targetPoint);
        Vector3 targetDir = targetPoint - bossBasic.selfPostion;
        Quaternion quaternion = Quaternion.LookRotation(targetDir);// Quaternion.FromToRotation(bossBasic.transform.forward, targetDir.normalized);
        bossBasic.ControlMoveForward(targetPoint);
        bossBasic.bossData.SetCurBossActiveState(BossActiveState.moving);
    }

    //[发现敌人，移动至敌人位置]
    public void MoveToEnemy()
    {
        Debug.Log("移动向敌人!!!");
        Vector3 targetPoint = bossBasic.bossData.getCurrentEnemy.selfPostion;
        bossBasic.bossData.SetCurLookPoint(targetPoint);
        bossBasic.ControlMoveForward(targetPoint,1.5f);
        bossBasic.bossData.SetCurBossActiveState(BossActiveState.moving);
    }

    public override void Moveing()
    {
        if( bossBasic.bossData.getBossActive.getMoveProgress >= 1)
        {
            ReadThink();
        }else
        {
            
            Vector3 targetDir = new Vector3(bossBasic.bossData.getCurLookPoint .x, bossBasic.head.position.y , bossBasic.bossData.getCurLookPoint .z) - bossBasic.head.position;//    - bossBasic.selfPostion;
            Quaternion quaternion = Quaternion.LookRotation(targetDir);
            bossBasic.ControlRotateHead(quaternion);
            Vector3 targetDirForBody = bossBasic.bossData.getCurLookPoint - bossBasic.selfPostion;
            Quaternion quaternionBody =  Quaternion.LookRotation(targetDirForBody);
            bossBasic.ControlRotate(quaternion);
        }
        base.Moveing();
    }

    #endregion

    #region 寻找逻辑

    public override void FindPlayer()
    {
        Debug.Log("寻找 寻找!!!");
        float tmpAnlge = Random.Range(80 , 150);
        int dir = Random.Range(0,2) == 0? 1:-1;
        float angle = tmpAnlge * dir;
        Quaternion _quaternion =  Quaternion.AngleAxis(angle, bossBasic.headFwdPint.up) * bossBasic.headFwdPint.rotation;//.rotation;
        bossBasic.ControlRotateHead(_quaternion);
        bossBasic.bossData.SetCurBossActiveState(BossActiveState.finding);
        base.FindPlayer();
    }

    public void ExcuteFining()
    {
        if(bossBasic.bossData.getBossActive.getRotateHeadProgress >= 1)
        {
            if(rotateHeadTimes<2)
            {
                FindPlayer();
                rotateHeadTimes++;
            }else
            { 
                NextPointMove();
                bossBasic.bossData.SetCurBossActiveState(BossActiveState.moving);
                rotateHeadTimes = 0;
            }
           
        }else
        {
            CheckEnemy();
        }

      
    }
    private void Found()
    {
        bossBasic.bossData.SetIsFoundEnemy(true);
        MoveToEnemy();
    }

    #endregion

   

    #region 思考

    public void ReadThink()
    {
        Debug.Log("思考一下!!!");
        bossBasic.bossData.SetThinkTime();
        bossBasic.bossData.SetCurBossActiveState(BossActiveState.think);
        bossBasic.ControlIdle();
    }


    public override void Think()
    {
        base.Think();
        if(!bossBasic.bossData.getIsFoundEnemy)
        {
            if(Time.time - bossBasic.bossData.getStartThinkTime > bossBasic.bossData.getThinkTime)
            {
                FindPlayer();
            }else
            {
                if(bossBasic.bossData.getWithEnemyDistance <= bossBasic.nearDistance)
                {
                    Found();
                }
            }
        }else
        {
            float distance = Vector3.Distance(bossBasic.selfPostion , bossBasic.bossData.getCurrentEnemy.selfPostion);
            if(distance < bossBasic.nearDistance)
            {
                if(Time.time - bossBasic.getBossData2002.getStartInstanceElgunTime > bossBasic.elGun_interval)
                {
                    InstanceElgun();
                }else
                {
                        
                }
                //Vector3 targetDir = bossBasic.bossData.getCurrentEnemy.selfPostion - bossBasic.head.position;//    - bossBasic.selfPostion;
                //Quaternion quaternion = Quaternion.LookRotation(targetDir);
                //bossBasic.ControlRotateHead(quaternion);
                //Attack();

            }else if(distance >= bossBasic.nearDistance && distance < bossBasic.farDistance)
            {
                MoveToEnemy();
            }else
            {
                bossBasic.bossData.SetIsFoundEnemy(false);
                ReadThink();
            }

        }

    }
    #endregion

    #region 在巡逻的时候，检测是否找到目标

    private void CheckEnemy()
    {
        
        Quaternion r= bossBasic.headFwdPint.rotation;
        Vector3 left =  (bossBasic.headFwdPint.position  + (r * Vector3.left) * bossBasic.safeDistance);

        Debug.DrawLine(bossBasic.headFwdPint.position ,left,Color.red);

        Vector3 right =  (bossBasic.headFwdPint.position + (r *Vector3.right) * bossBasic.safeDistance);
        Debug.DrawLine(bossBasic.headFwdPint.position,right,Color.red);

        Vector3 leftEnd = (left  + (r *Vector3.forward) * bossBasic.safeDistance);
        Debug.DrawLine(left,leftEnd,Color.red);

        Vector3 rightEnd = (right  + (r *Vector3.forward) * bossBasic.safeDistance);
        Debug.DrawLine(right,rightEnd,Color.red);

        Debug.DrawLine(leftEnd,rightEnd,Color.red);

        Vector3 point = bossBasic.bossData.getCurrentEnemy.transform.position;
        if(isINRect(point,leftEnd,rightEnd,right,left))
        {
            Found();

        }else 
        {
            Debug.Log("cube not in this !!!");
        }

    }

    #endregion


    #region Tool

private float Multiply(float p1x , float p1y, float p2x,float p2y, float p0x,float p0y)
{
    return ((p1x - p0x) * (p2y - p0y) - (p2x - p0x) * (p1y - p0y));
}

bool isINRect(Vector3 point,Vector3 v0,Vector3 v1,Vector3 v2,Vector3 v3)
{
    float x = point.x;
    float y = point.z;

    float v0x = v0.x;
    float v0y = v0.z;

    float v1x = v1.x;
    float v1y = v1.z;

    float v2x = v2.x;
    float v2y = v2.z;

    float v3x = v3.x;
    float v3y = v3.z;

    if (Multiply(x,y, v0x,v0y, v1x,v1y) * Multiply(x,y, v3x,v3y, v2x,v2y) <= 0 && Multiply(x,y, v3x,v3y, v0x,v0y) * Multiply(x,y, v2x,v2y, v1x,v1y) <= 0)
        return true;
    else
        return false;

}
    #endregion

}
