using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1009 : MonsterBasic {

   
    public LineRenderer leftLine;
    public LineRenderer rightLine;

    public GameObject leftHandP1 ;
    
    public GameObject rightHandP1;

    public GameObject headrender;


    public GameObject txtou;
    public GameObject txl;
    public GameObject txr;
    public GameObject dimian;
    public override void ControllerToIdle()
    {
        base.ControllerToIdle();
        headrender.gameObject.SetActive(true);
        SynchroLayer(headrender);
    }
    public void fankui()
    {
        txtou.SetTargetActiveOnce(true);
        txl.SetTargetActiveOnce(true);
        txr.SetTargetActiveOnce(true);
        dimian.SetTargetActiveOnce(true);
        SynchroLayer(txtou);
        SynchroLayer(txl);
        SynchroLayer(txr);
        SynchroLayer(dimian);
    }
    public override void EndOfMonsterMoodAnimation()
    {
        txtou.SetTargetActiveOnce(false);
        txl.SetTargetActiveOnce(false);
        txr.SetTargetActiveOnce(false);
        dimian.SetTargetActiveOnce(false);
        base.EndOfMonsterMoodAnimation();
    }
}
