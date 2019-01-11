using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using ZXing;
using ZXing.QrCode;

public class QRcodeDrawTool  {

   
    //定义方法生成二维码   
    private static Color32[] Encode(string textForEncoding, int width, int height)
    {
        var writer = new BarcodeWriter
        {
            Format = BarcodeFormat.QR_CODE,
            Options = new QrCodeEncodingOptions
            {
                Height = height,
                Width = width
            }
        };
        return writer.Write(textForEncoding);
    }
    public static Texture2D ShowCode(string textForEncoding)
    {
        Texture2D encoded = new Texture2D(256, 256);
        if (textForEncoding != null)
        {            //二维码写入图片          

            var color32 = Encode(textForEncoding, encoded.width, encoded.height);
            encoded.SetPixels32(color32);
            encoded.Apply();
         
            //重新赋值一张图，计算大小,避免白色边框过大
            Texture2D encoded1;
            encoded1 = new Texture2D(190, 190);
            //创建目标图片大小          
            encoded1.SetPixels(encoded.GetPixels(32, 32, 190, 190));
            encoded1.Apply();
            return encoded1;
        }
        else {
            return null;
        }
    }

}
