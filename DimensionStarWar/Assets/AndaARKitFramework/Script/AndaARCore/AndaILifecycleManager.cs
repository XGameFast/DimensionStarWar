namespace GoogleARCoreInternal
{
    using System;
    using System.Diagnostics.CodeAnalysis;
    using GoogleARCore;
    [SuppressMessage("UnityRules.UnityStyleRules", "US1101:NonPublicFieldsMustHavePrefixM",
                  Justification = "This is an interface so fields are already public.")]

    internal interface AndnILifecycleManager
    {
        event Action EarlyUpdate;

        SessionStatus SessionStatus { get; }

        AndaARCoreSession SessionComponent {get ; }

        NativeSession NativeSession { get; }

        AsyncTask<ApkAvailabilityStatus> CheckApkAvailability();

        AsyncTask<ApkInstallationStatus> RequestApkInstallation(bool userRequested);

        void CreateSession(AndaARCoreSession session);

        void EnableSession();

        void DisableSession();

        void ResetSession();
    }
}

