using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaArcTargetBaisc : AndaObjectBasic {

    public Transform StartPoint;
    public bool UseMousePos = false;
    public float ArcDelay = 1.0f;
    public float TargetDelay = 1.0f;
    public float HitDistance = 200f;

    public float DecalOffset = 0.5f;
    public GameObject TargetDecal;
    public string TargetDirection = "X";
    public Color StartColor = Color.yellow;
    public Color EndColor = Color.red;

    public int SectionDetail = 10;
    public float StartSize = 1;
    public float EndSize = 1f;
    public float ArcHeight = 10f;


    public Vector3[] pointlist;
    public Vector3 getEndPoint
    {
        get { return MousePos; }
    }

    private LineRenderer lineRenderer;
    private Vector3 MousePos;
    private Ray ray = new Ray(Vector3.zero, new Vector3(0, 1, 0));
    private RaycastHit hit;
    private Vector3 middle;
    private Vector3 end;
    private Quaternion rot;
    private bool TargetTypeLight = false;
    private Light TargetLight;
    private float g;
    private float dist;
    private int i;

    public void BuildLine(Transform _startpoint,float _startSize,float _endSize,Color _startColor,Color _endColor)
    {
        StartPoint = _startpoint;
        StartSize = _startSize;
        EndSize = _endSize;
        StartColor = _startColor;
        EndColor = _endColor;
        //
        pointlist = new Vector3[SectionDetail];
        //
        SetLine();
    }
    public void SetLine()
    {
        pointlist = new Vector3[SectionDetail];
        lineRenderer = GetComponent<LineRenderer>();
        if (lineRenderer.material == null)
            lineRenderer.material = new Material(Shader.Find("Particles/Additive"));
        if (TargetDecal)
        {
            if (TargetDecal.GetComponent<Light>())
            {
                TargetTypeLight = true;
                TargetLight = TargetDecal.GetComponent<Light>();
                TargetLight.color = EndColor;
            }
            else
            {
              //  TargetDecal.GetComponent<Renderer>().material.color = EndColor;
             //   TargetDecal.GetComponent<Renderer>().material.SetColor("_TintColor", EndColor);
            }
        }

        if (!TargetDecal)
            Debug.Log("Target object has not been assigned, Please drag item into TargetDecal field.");

        if (!StartPoint)
            Debug.Log("Start object has not been assigned, Please drag item into Start field.");

        if (TargetDirection == "x" || TargetDirection == "y" || TargetDirection == "z" || TargetDirection == "X" || TargetDirection == "Y" || TargetDirection == "Z")
        {
        }
        else
        {
            TargetDirection = "x";
            Debug.Log("Direction can only be X, Y or Z");
        }
    }

    private void Update()
    {
        lineRenderer.startWidth = StartSize;
        lineRenderer.endWidth = EndSize;

        lineRenderer.startColor = StartColor;
        lineRenderer.endColor = EndColor;

        lineRenderer.positionCount = SectionDetail;
        if (SectionDetail < 2)
        {
            SectionDetail = 2;
        }

        Vector3 TargetDir;
        if (TargetDirection == "x" || TargetDirection == "X")
        {
            TargetDirection = "X";
            TargetDir = StartPoint.right;
        }
        else if (TargetDirection == "y" || TargetDirection == "Y")
        {
            TargetDirection = "Y";
            TargetDir = StartPoint.up;
        }
        else if (TargetDirection == "z" || TargetDirection == "Z")
        {
            TargetDirection = "Z";
            TargetDir = StartPoint.forward;
        }
        else
        {
            TargetDir = StartPoint.up;
        }
        if (UseMousePos)
        {
            ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        }
        else
        {
            ray = Camera.main.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
        }


        if (Physics.Raycast(ray, out hit, HitDistance))
        {
            //Debug.DrawLine (ray.origin, hit.point, Color.red);
            lineRenderer.enabled = true;

            //Check if Target Decal is Light
            if (TargetDecal)
            {
                if (TargetTypeLight)
                {
                    rot = Quaternion.FromToRotation(-Vector3.forward, hit.normal);
                    TargetLight.gameObject.SetActive(true);
                    MousePos = hit.point;
                }
                else
                {
                    rot = Quaternion.FromToRotation(Vector3.up, hit.normal);
                    TargetDecal.gameObject.SetActive(true);
                    if (TargetDecal.transform.parent = transform)
                    {
                        TargetDecal.transform.parent = null;
                    }
                    MousePos = hit.point;
                   // TargetDecal.transform.position = hit.point;
                    
                    //---
                     
                }
                TargetDecal.transform.position = Vector3.Slerp(TargetDecal.transform.position, hit.point + hit.normal * DecalOffset, Time.deltaTime * TargetDelay);
                TargetDecal.transform.rotation = rot;
                // TargetDecal.transform.rotation = rot;

            }//End Target Check
        }
        else
        {
            if (TargetDecal)
            {
                if (TargetTypeLight)
                {
                    TargetDecal.gameObject.SetActive(false);
                    MousePos = StartPoint.position;
                }
                else
                {
                    TargetDecal.gameObject.SetActive(false);
                    MousePos = StartPoint.position;
                }

                TargetDecal.transform.position = StartPoint.position;
            }

            lineRenderer.enabled = false;

        }// End RayCast


        dist = Vector3.Distance(StartPoint.position, MousePos);
        middle = Vector3.Lerp(StartPoint.position, MousePos, .5f) + new Vector3(0, ArcHeight * dist / 5, 0);
        end = Vector3.Slerp(end, MousePos, Time.deltaTime * ArcDelay);


        for (i = 0; i < SectionDetail * 1f; i++)
        {
            g = i / (SectionDetail * 1f - 1);
            Vector3 point = Mathf.Pow(1 - g, 2) * StartPoint.position + 2 * g * (1 - g) * middle + Mathf.Pow(g, 2) * end;

            pointlist[i] = point;

            lineRenderer.SetPosition(i, point);
        }

    }
    public override void OnSpawn()
    {
        base.OnSpawn();
        TargetDecal.SetActive(true);
    }
    public override void OnDispawn()
    {
        base.OnDispawn();
        TargetDecal.SetActive(false);
    }

   
    private void OnDrawGizmos()
    {
        Gizmos.DrawIcon(transform.position, "ArcIcon.png", true);
    }


}
