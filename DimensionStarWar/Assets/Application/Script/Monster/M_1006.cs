using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_1006 : MonsterBasic {
    public List<Renderer> renderers;

    public override void SetAlpha(float v)
    {
        base.SetAlpha(v);
        //for (int i = 0; i < renderers.Count; i++)
        //{
        //    renderers[i].material.SetFloat("_alpha", v);
        //}
    }
    public override void SetRongjie(float v)
    {
        base.SetRongjie(v);
        for (int i = 0; i < renderers.Count; i++)
        {
            foreach (var m in renderers[i].materials)
            {
                m.SetFloat("_rongjie", v);
            }
          
        }
    }
}
