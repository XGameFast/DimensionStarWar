using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Monster_1000 : MonsterBasic {

    public Transform topBody;
    public Transform botBody;
    private float tmpheight;
    public Renderer shenti_ren;
    public Renderer weijin_ren;

    private Texture2D[] texture2Ds;
    private Material[] materials = new Material[2];

    private int curSkinType = -1;

    public Material[] normalMat;
    public Material[] holoMat;
    public Material[] growupMat;

    private AndaObjectBasic skingrowUpEffect ;
    private Transform skingrowUpEffectChild;

   

}
