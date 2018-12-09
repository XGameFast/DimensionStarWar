using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_2002 : MonsterBasic {

    public Transform topBody;
    public Transform botBody;
    private float tmpheight;

    public Renderer shenti_ren;

    public Material[] normalMat;
    public Material[] holoMat;
    public Material[] growupMat;

    private AndaObjectBasic skingrowUpEffect ;
    private Transform skingrowUpEffectChild;
    private int curSkinType = -1;
   
}
