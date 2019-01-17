using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillTriggerEvent : MonoBehaviour {
    private System.Action<AndaObjectBasic ,string > HitTarget;
    public BoxCollider boxCollider;
    private List<string> hitLyaer;

    private string tagStr;
    private bool isTag = false;
    private System.Action<Transform> hitCallBack;
    public void RegisterEvent(System.Action<AndaObjectBasic , string> callBack, List<string> _tag ,int type)
    {
        isTag =false;
        hitLyaer = _tag;
        if (hitLyaer.Contains("Monster"))
        {
            hitLyaer.Add("Boss");
        }
        HitTarget = callBack ;
        if(boxCollider!=null) boxCollider.enabled = true;
    }

    public void RegisterTagEvent(string tag,System.Action<Transform> callback)
    {
        isTag= true;
        tagStr = tag;
        hitCallBack = callback;
    }

    private void OnTriggerEnter(Collider other)
    {
        //Debug.Log(other.name);
        if (isTag)
        {
            //Debug.Log(1);
            if (other.tag == tagStr)
            {
                //Debug.Log(2);
                if (hitCallBack!=null)
                {
                   // Debug.Log(3);
                    hitCallBack(other.transform);
                }
            }
        }else
        {
           // Debug.Log(4);
            if (hitLyaer == null)
                return;
            foreach (var go in hitLyaer)
            {
                //Debug.Log(5);
                if (other.gameObject.layer == LayerMask.NameToLayer(go))
                {
                   // Debug.Log(6);
                    HitTarget(other.GetComponent<AndaObjectBasic>(), go);
                }
            }
        }
        //Debug.Log(other.name);
      
    }
}
