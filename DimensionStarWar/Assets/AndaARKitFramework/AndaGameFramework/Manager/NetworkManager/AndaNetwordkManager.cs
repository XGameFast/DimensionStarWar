using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RestSharp;
public class AndaNetwordkManager  {

    private static AndaNetwordkManager _instance = null;
    public static AndaNetwordkManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = BuildInstance();
            }
            return _instance;
        }
    }
    public static string backupAPIPath;
    private RestClient client;
    public static AndaNetwordkManager BuildInstance()
    {
        AndaNetwordkManager andaNetworkManager = new AndaNetwordkManager();
        andaNetworkManager.client = new RestClient(backupAPIPath);
        andaNetworkManager.client.Timeout = 20000;
        return andaNetworkManager;
    }

   

    #region Call 
    internal IEnumerator Call<T>(RestTask<T> task) where T : new()
    {
        while (true)
        {
            //TODO 等待加载
            task.client = client;
            task.Run();
            while (!task.finished)
            {
                yield return null;
            }
            if (task.response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                task.interrupted = true;
                //NGUIDebug.Log("连接已断开，请重新登陆");
                break;
            }
            else if (task.response.StatusCode != System.Net.HttpStatusCode.OK)
            {
                bool cmClosed = false;
                //NGUIDebug.Log("连接失败，请检查网络，点击确定重试");
                while (!cmClosed)
                {
                    yield return null;
                }
                task.finished = false;
                continue;
            }
            else
            {
                break;
            }
        }
    }
    #endregion
}

#region RestTask
public class RestTask<T> where T : new()
{
    public RestClient client;
    RestRequest req;
    public bool finished = false;
    public bool interrupted = false;
    public System.Exception exception;
    public IRestResponse<T> response;
    public RestTask(RestRequest req)
    {
        this.req = req;
    }

    public void Run()
    {
        System.Threading.Thread trd = new System.Threading.Thread(() =>
        {
            try
            {
                System.GC.Collect();
                // NGUIDebug.Log("Start Restful Call: " + client.BaseUrl + req.Resource);
                System.DateTime start = System.DateTime.Now;

                response = client.Execute<T>(req);
                //NGUIDebug.Log("PathAndQuery: " + response.ResponseUri.PathAndQuery);
                //NGUIDebug.Log("RPC took" + (System.DateTime.Now - start).TotalSeconds);

                //NGUIDebug.Log(response.Content);

            }
            catch (System.Exception ex)
            {
                // NGUIDebug.Log("RestCall Failed");
                // NGUIDebug.Log(ex.Message);

                exception = ex;
            }
            finished = true;
        });
        trd.Start();
    }
}

#endregion
