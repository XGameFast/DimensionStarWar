using System.Collections.Generic;
using UnityEngine;
using GoogleARCore;
using GoogleARCoreInternal;
public class AndaARCoreSession : MonoBehaviour {

    public ARCoreSessionConfig SessionConfig;

    private OnChooseCameraConfigurationDelegate m_OnChooseCameraConfiguration;

    public delegate int OnChooseCameraConfigurationDelegate(List<CameraConfig> supportedConfigurations);

    public void RegisterChooseCameraConfigurationCallback(OnChooseCameraConfigurationDelegate onChooseCameraConfiguration)
    {
        m_OnChooseCameraConfiguration = onChooseCameraConfiguration;
    }

    internal OnChooseCameraConfigurationDelegate GetChooseCameraConfigurationCallback()
    {
        return m_OnChooseCameraConfiguration;
    }
}
