using UnityEngine;
using System.Collections;

public class DissolveEnvironment : MonoBehaviour {
    public Vector3 dissolveStartPoint;
    [Range(0, 1)]
    public float dissolveThreshold = 0;
    [Range(0, 1)]
    public float distanceEffect = 0.6f;

    MeshRenderer[] meshRenderers;
    void Start() {
        //计算所有子物体到消融开始点的最大距离
        MeshFilter[] meshFilters = GetComponentsInChildren<MeshFilter>();
        float maxDistance = 0;
        for (int i = 0; i < meshFilters.Length; i++)
        {
            float distance = CalculateMaxDistance(meshFilters[i].mesh.vertices);
            if (distance > maxDistance)
                maxDistance = distance;
        }
        //传值到Shader
       // meshRenderers = GetComponentsInChildren<MeshRenderer>();
        for (int i = 0; i < meshRenderers.Length; i++)
        {
            meshRenderers[i].material.SetVector("_StartPoint", dissolveStartPoint);
            meshRenderers[i].material.SetFloat("_MaxDistance", maxDistance);
        }
    }

    private void OnEnable()
    {
        GetRenderer();
    }

    public void GetRenderer()
    {
        meshRenderers = GetComponentsInChildren<MeshRenderer>();
    }

    public void Load(float value)
    {
        dissolveThreshold = value;
        for (int i = 0; i < meshRenderers.Length; i++)
        {
            meshRenderers[i].material.SetFloat("_Threshold", dissolveThreshold);
            meshRenderers[i].material.SetFloat("_DistanceEffect", distanceEffect);
        }

    }

    //计算给定顶点集到消融开始点的最大距离
    float CalculateMaxDistance(Vector3[] vertices)
    {
        float maxDistance = 0;
        for(int i = 0; i < vertices.Length; i++)
        {
            Vector3 vert = vertices[i];
            float distance = (vert - dissolveStartPoint).magnitude;
            if (distance > maxDistance)
                maxDistance = distance;
        }
        return maxDistance;
    }
}
