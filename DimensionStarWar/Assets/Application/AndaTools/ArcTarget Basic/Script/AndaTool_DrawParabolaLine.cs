using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndaTool_DrawParabolaLine : AndaPhysicToolsBaisc {
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
    private bool isStartBuildLine = false;
    //——-------
    public void SetLine(Transform _startPoint,float _startSize, float _endSize, Color _startColor, Color _endColor,int _sectionDetail =10 , float _arcHeight = 5f , float _arcDelay = 2.5f,float _targetDelay = 2.5f )
    {
        SetStartPoint(_startPoint); ;
        SetBetweenSize(_startSize,_endSize);
        SetBetweenColor(_startColor,_endColor);
        SetSectionDetail(_sectionDetail);
        SetArcHeight(_arcHeight);
        SetArcDelay(_arcDelay);
        SetTargetDelay(_targetDelay);
    }
    public void SetBetweenSize(float _startSize, float _endSize)
    {
        SetStartSize(_startSize);
        SetEndSize(_endSize);
    }
    public void SetBetweenColor(Color _startColor, Color _endColor)
    {
        SetStartColor(_startColor);
        SetEndColor(_endColor);
    }
    
    //----数值都可以独立设置
    public void SetStartPoint(Transform _startPoint)
    {
        StartPoint = _startPoint;
    }
    public void SetStartSize(float _startSize)
    {
        StartSize = _startSize;
    }
    public void SetEndSize(float _endSize)
    {
        EndSize = _endSize;
    }

    public void SetStartColor(Color _startColor)
    {
        StartColor = _startColor;
    }
    public void SetEndColor(Color _endColor)
    {
        EndColor = _endColor;
    }
    public void SetSectionDetail(int _detailcount)
    {
        SectionDetail = _detailcount;
    }
    public void SetArcHeight(float _height)
    {
        ArcHeight = _height;
    }

    public void SetArcDelay(float _delayTime)
    {
        ArcDelay = _delayTime;
    }
    public void SetTargetDelay(float _delayTime)
    {
        TargetDelay = _delayTime;
    }

    public void SetLine()
    {
        isStartBuildLine = true;
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
                TargetDecal.GetComponent<Renderer>().material.color = EndColor;
                TargetDecal.GetComponent<Renderer>().material.SetColor("_TintColor", EndColor);
            }
        }

        if (!TargetDecal)
            Debug.Log("Target object has not been assigned, Please drag item into TargetDecal field.");

       // if (!StartPoint)
        //     Debug.Log("Start object has not been assigned, Please drag item into Start field.");

        if (TargetDirection == "x" || TargetDirection == "y" || TargetDirection == "z" || TargetDirection == "X" || TargetDirection == "Y" || TargetDirection == "Z")
        {
        }
        else
        {
            TargetDirection = "x";
            Debug.Log("Direction can only be X, Y or Z");
        }
    }


    //--@Excute


    protected override void OnFixedUpdate()
    {
        base.OnFixedUpdate();
        if (!isStartBuildLine) return;
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
            TargetDir = StartPoint.up ;
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
                    rot = Quaternion.FromToRotation(TargetDir, hit.normal);
                    TargetDecal.gameObject.SetActive(true);
                    MousePos = hit.point;
                }
                TargetDecal.transform.position = Vector3.Slerp(TargetDecal.transform.position, hit.point + hit.normal * DecalOffset, Time.deltaTime * TargetDelay);
                TargetDecal.transform.rotation = rot;

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
            lineRenderer.SetPosition(i, Mathf.Pow(1 - g, 2) * StartPoint.position + 2 * g * (1 - g) * middle + Mathf.Pow(g, 2) * end);
        }
    }
}
