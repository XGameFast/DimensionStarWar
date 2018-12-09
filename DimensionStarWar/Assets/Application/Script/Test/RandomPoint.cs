using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomPoint : MonoBehaviour {

    Vector3 startPoint, endPoint;

    public RotateControl control;
	// Use this for initialization
	void Start () {
        startPoint = transform.position;
        startPoint += new Vector3(0,0.2f,0);
        // Quaternion.
        // RandomDirction();

         //InvokeRepeating("RandomDirction", 1,5);
    }

    public void RandomDirction()
    {

        int angle = Random.Range(0, 360);
        //Debug.Log(angle);
        var result = Quaternion.AngleAxis(angle,Vector3.up) * transform.forward;

        endPoint = result * 10 + transform.position;
        endPoint += new Vector3(0,0.2f, 0);

       // Vector3 rotation = new Vector3(result.y, result.x, result.z);

        transform.GetComponent<RotateControl>().LookRotation(result);
    }

    float timer;

	// Update is called once per frame
	void Update () {


         endPoint = transform.forward * 10 + transform.position;
        //Debug.DrawLine(transform.position, hitInfo.point, Color.red);
          Debug.DrawLine(transform.position, endPoint,Color.red);
        timer += Time.deltaTime;
        /*Ray ray = new Ray(transform.position, transform.forward);
        RaycastHit hitInfo;
        if (Physics.Raycast(transform.position, transform.forward, out hitInfo))
        {
            Debug.DrawLine(transform.position, hitInfo.point, Color.red);
            control.LookRotation(hitInfo.point);
        }*/
       
        //if (timer >=5)
        //{
            //timer = 0;
            Ray ray = new Ray(transform.position, transform.forward);
            RaycastHit hitInfo;
            if (Physics.Raycast(transform.position,transform.forward,out hitInfo))
            {
                Debug.DrawLine(transform.position, hitInfo.point, Color.red);
                control.LookRotation(hitInfo.point/* hitInfo.point*/);
            }
        //}
         

	}
}
