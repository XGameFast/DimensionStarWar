  Shader "CoffeecatGame/Hologram" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
      _BumpMap ("Bumpmap", 2D) = "bump" {}
      // 边缘颜色
        _RimColor("Rim Color", Color) = (0.26,0.7,1.0,0.0)
      // 边缘颜色强度
        _RimPower("Rim Power", Range(0.1,8.0)) = 3.0
      // 像素 颜色强度系数
        _RimIntensity("Rim Intensity", Range(0.1,8.0)) = 3.0
      // 条纹粗细
        _ClipPower("Clip Power", Range(0.0,301.0)) = 200.0
        _Brightness("Brightness",Range(0.0,30)) = 1.5
        _Alpha("Alpha", Range(0.0,1.0)) = 0.0
      // 条纹颜色插值系数
        _Crackle("Crackle", Range(0.0, 1.0)) = 0.0
    }
    SubShader {
      //"RenderType" = "Transparent"  半透明着色器
      //"Queue"="Transparent" 半透明物体渲染队列
      //"IgnoreProjector"="True"  忽略投影
      Tags { "RenderType" = "Transparent"  "Queue"="Transparent" "IgnoreProjector"="True"}

     Pass {
       //ZWrite On  深度写入 开启
       //ColorMask 0 设置颜色写遮罩 关闭所有颜色通道渲染
        ZWrite On
        ColorMask 0
       }

      CGPROGRAM
      //Lambert，声明了表面着色器，并指定了光照模型。
      #pragma surface surf Lambert alpha 
      struct Input {
          float2 uv_MainTex;
          float2 uv_BumpMap;
          float3 viewDir;
          float3 worldPos;    
          float4 screenPos;      
      };
      sampler2D _MainTex;
      sampler2D _BumpMap;

      float4 _RimColor;
      float _RimPower;
      float _ClipPower;
      float _Brightness;
      float _Alpha;
      float _RimIntensity;
      float _Crackle;

      void surf (Input IN, inout SurfaceOutput o) 
      {
          float2 screenUV = IN.screenPos.xy / IN.screenPos.w;
          // 扩散系数
          float _DiffuseAmount = 1;
          // 在贴图颜色与RimColor之间做插值
          half4 basecol = lerp(tex2D(_MainTex, IN.uv_MainTex), _RimColor, _Crackle);
          // 获取贴图颜色对应的灰度图
          half3 graycol = dot(basecol.rgb, float3(0.3, 0.59, 0.11));
          // frac 返回小数部分
          if (frac(screenUV.y * _ClipPower) - 0.5 > 0)
            _DiffuseAmount = 1;
          else 
            _DiffuseAmount = 0;

          if (_ClipPower == 0)
          {
            _DiffuseAmount = 1;
          }
          // 像素的颜色 
          o.Albedo = lerp(graycol, basecol, _DiffuseAmount);
          // 从凹凸纹理提取法线信息
          o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
          // 从_RimColor参数获取自发光颜色（_Brightness是增强因子）
          half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
          o.Emission = lerp(_RimColor.rgb * pow (rim, _RimPower) * _Brightness, basecol, _DiffuseAmount) * _Brightness;

          o.Alpha = _Alpha;
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }
