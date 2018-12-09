
namespace GoogleARCoreInternal
{
    using System;
    using GoogleARCore;
    using UnityEngine;
    internal class AndaLifecycleManager
    {
        private static AndnILifecycleManager s_Instance ;

        public static AndnILifecycleManager Instance
        {
            get 
            {
                s_Instance = null;

                return s_Instance;
            }

        }
    }
}

