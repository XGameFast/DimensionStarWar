using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skill12003DanTou : MonoBehaviour {

    public float random;
    public bool shrink;//是否收缩
    public float effect;
    public float timeShrink;
    // Use this for initialization
    void Start () {
        random = 0;
        timeShrink = 0.1f;
        effect = 3;
    }
	
	// Update is called once per frame
	void Update () {
        timeShrink -= Time.deltaTime;
        random -= Time.deltaTime * 2 * effect;
        //if (timeShrink > 0)
        //    return;
        //if (shrink)
        //{
        //    random -= Time.deltaTime * 2 * effect;
        //    if (random <= 0)
        //        shrink = false;
        //}
        //else
        //{
        //    random += Time.deltaTime * 2 * effect;
        //    if (random >= 1)
        //        shrink = true;
        //}

        transform.localPosition = new Vector3()
        {
            x = Mathf.Sin(random),
            y = Mathf.Sin(random),
            z = 0,
        };
	}
}
