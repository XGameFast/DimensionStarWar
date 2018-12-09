using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

public class ServerEncryption  {

    /// <summary>
    /// MD5加密
    /// </summary>
    public class MD5Encryptor
    {
        public static string GetMD5(string data)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                string hash = GetMd5Hash(md5Hash, data);

                return hash;
            }
        }

        private static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
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
                    des.Key = ASCIIEncoding.ASCII.GetBytes(AESKey.Substring(0,8));
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
