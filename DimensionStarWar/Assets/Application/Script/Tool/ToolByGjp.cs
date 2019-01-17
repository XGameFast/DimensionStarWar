using System;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;

public class ToolByGjp
{
    public static string GetDisTime(int dis)
    {
        TimeSpan ts = new TimeSpan(0, 0, Convert.ToInt32(dis));
        string str = "";
        if (ts.Days > 0) { str = ts.Days.ToString() + "天 " + ts.Hours.ToString() + "小时 " + ts.Minutes.ToString() + "分钟 " + ts.Seconds + "秒"; }
        if (ts.Days == 0 && ts.Hours > 0) { str = ts.Hours.ToString() + "小时 " + ts.Minutes.ToString() + "分钟 " + ts.Seconds + "秒"; }
        if (ts.Hours == 0 && ts.Minutes > 0) { str = ts.Minutes.ToString() + "分钟 " + ts.Seconds + "秒"; }
        if (ts.Hours == 0 && ts.Minutes == 0) { str = ts.Seconds + "秒"; }
        return str;
    }
    #region 时间戳管理
    /// <summary>
    /// 日期转换成unix时间戳
    /// </summary>
    /// <returns></returns>
    public static int GetTimestamp()
    {
        DateTime dateTime = DateTime.Now;
        var start = new DateTime(1970, 1, 1, 0, 0, 0, dateTime.Kind);
        return Convert.ToInt32((dateTime - start.AddHours(8)).TotalSeconds);
    }
    /// <summary>
    /// 日期转换成unix时间戳
    /// </summary>
    /// <returns></returns>
    public static int GetTimestamp(DateTime dateTime)
    {
        var start = new DateTime(1970, 1, 1, 0, 0, 0, dateTime.Kind);
        return Convert.ToInt32((dateTime - start.AddHours(8)).TotalSeconds);
    }
    /// <summary>
    /// unix时间戳转换成日期
    /// </summary>
    /// <param name="timestamp">时间戳(秒)</param>
    /// <returns></returns>
    public static DateTime UnixTimestampToDateTime(long timestamp)
    {
        DateTime target = DateTime.Now;
        var start = new DateTime(1970, 1, 1, 8, 0, 0, target.Kind);
        return start.AddSeconds(timestamp);
    }
    #endregion

    public static Sprite Base64ToImg(string base64)
    {
        byte[] bytes = Convert.FromBase64String(base64);
        Texture2D tex2D = new Texture2D(1024, 512);
        tex2D.LoadImage(bytes);
        Sprite s = Sprite.Create(tex2D, new Rect(0, 0, tex2D.width, tex2D.height),
            new Vector2(0.5f, 0.5f));
        return  s;
    }

    public class AESEncryptor
    {
        /// <summary>
        /// 加密
        /// </summary>
        /// <param name="plainText"></param>
        /// <param name="AESKey"></param>
        /// <returns></returns>
        public static string Encrypt(string plainText, string AESKey)
        {
            using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
            {

                byte[] inputByteArray = Encoding.UTF8.GetBytes(plainText);
                des.Key = ASCIIEncoding.ASCII.GetBytes(AESKey.Substring(0, 8));
                des.IV = ASCIIEncoding.ASCII.GetBytes(AESKey.Substring(0, 8));
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                using (CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    cs.Close();
                }
                string str = Convert.ToBase64String(ms.ToArray());
                ms.Close();
                return str;
            }
        }
        /// <summary>
        /// 解密
        /// </summary>
        /// <param name="showText"></param>
        /// <param name="AESKey"></param>
        /// <returns></returns>
        public static string Decrypt(string showText, string AESKey)
        {
            byte[] inputByteArray = Convert.FromBase64String(showText);
            using (DESCryptoServiceProvider des = new DESCryptoServiceProvider())
            {
                des.Key = ASCIIEncoding.ASCII.GetBytes(AESKey.Substring(0, 8));
                des.IV = ASCIIEncoding.ASCII.GetBytes(AESKey.Substring(0, 8));
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                using (CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    cs.Close();
                }
                string str = Encoding.UTF8.GetString(ms.ToArray());
                ms.Close();
                return str;
            }
        }
    }

}
