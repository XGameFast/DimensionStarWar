using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FaceToCamera : MonoBehaviour {

    private Transform _camera;
    public Transform camera
    {
        get
        {
            if (_camera == null)
            {
                _camera = Camera.main.transform;
            }
            return _camera;
        }
    }
    private void Update()
    {
        transform.forward = camera.position - transform.position;
    }
}
