// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33422,y:32693,varname:node_4013,prsc:2|custl-1036-OUT,alpha-6815-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32803,y:32498,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2941176,c2:0.8247464,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:2431,x:32052,y:32683,ptovrint:False,ptlb:node_2431,ptin:_node_2431,varname:node_2431,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:940,x:32285,y:32523,varname:node_940,prsc:2,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False|UVIN-490-UVOUT,TEX-2431-TEX;n:type:ShaderForge.SFN_Tex2d,id:1553,x:32278,y:32840,varname:node_1553,prsc:2,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False|UVIN-2077-UVOUT,TEX-2431-TEX;n:type:ShaderForge.SFN_Tex2d,id:8654,x:32803,y:32679,ptovrint:False,ptlb:node_8654,ptin:_node_8654,varname:node_8654,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ba89c33a350b2ba4cb3f09415dd2fcb3,ntxv:0,isnm:False|UVIN-7185-OUT;n:type:ShaderForge.SFN_Panner,id:490,x:32052,y:32523,varname:node_490,prsc:2,spu:0.1,spv:0.1|UVIN-1329-UVOUT;n:type:ShaderForge.SFN_Panner,id:2077,x:32052,y:32840,varname:node_2077,prsc:2,spu:-0.1,spv:-0.1|UVIN-1329-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1329,x:31876,y:32683,varname:node_1329,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:7973,x:32453,y:32679,varname:node_7973,prsc:2|A-940-R,B-1553-R,C-7507-OUT;n:type:ShaderForge.SFN_Add,id:7185,x:32627,y:32679,varname:node_7185,prsc:2|A-7973-OUT,B-1329-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7497,x:33080,y:32609,varname:node_7497,prsc:2|A-1304-RGB,B-8654-R;n:type:ShaderForge.SFN_ValueProperty,id:7507,x:32278,y:33007,ptovrint:False,ptlb:niuqudaxiao,ptin:_niuqudaxiao,varname:node_7507,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.01;n:type:ShaderForge.SFN_Slider,id:6815,x:32589,y:32952,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_6815,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:7789,x:32591,y:32137,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7789,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:1036,x:33267,y:32715,varname:node_1036,prsc:2|A-5855-OUT,B-7497-OUT,C-4760-OUT;n:type:ShaderForge.SFN_Color,id:4095,x:32591,y:32318,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_4095,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5855,x:32911,y:32339,varname:node_5855,prsc:2|A-4095-RGB,B-7789-RGB;n:type:ShaderForge.SFN_Tex2d,id:4937,x:32827,y:33072,ptovrint:False,ptlb:node_4937,ptin:_node_4937,varname:node_4937,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6a340f64d0c419d44982d6cae286affe,ntxv:0,isnm:False|UVIN-7185-OUT;n:type:ShaderForge.SFN_Multiply,id:4760,x:33077,y:33060,varname:node_4760,prsc:2|A-9579-RGB,B-4937-R;n:type:ShaderForge.SFN_Color,id:9579,x:32827,y:33251,ptovrint:False,ptlb:wei color,ptin:_weicolor,varname:node_9579,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1407332,c2:0.5770316,c3:1,c4:1;proporder:1304-2431-8654-7507-6815-7789-4095-4937-9579;pass:END;sub:END;*/

Shader "Shader Forge/beijing" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.2941176,0.8247464,1,1)
        _node_2431 ("node_2431", 2D) = "white" {}
        _node_8654 ("node_8654", 2D) = "white" {}
        _niuqudaxiao ("niuqudaxiao", Float ) = 0.01
        _alpha ("alpha", Range(0, 1)) = 1
        _MainTex ("MainTex", 2D) = "white" {}
        _MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _node_4937 ("node_4937", 2D) = "white" {}
        _weicolor ("wei color", Color) = (0.1407332,0.5770316,1,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _node_2431; uniform float4 _node_2431_ST;
            uniform sampler2D _node_8654; uniform float4 _node_8654_ST;
            uniform float _niuqudaxiao;
            uniform float _alpha;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _MainColor;
            uniform sampler2D _node_4937; uniform float4 _node_4937_ST;
            uniform float4 _weicolor;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_7208 = _Time;
                float2 node_490 = (i.uv0+node_7208.g*float2(0.1,0.1));
                float4 node_940 = tex2D(_node_2431,TRANSFORM_TEX(node_490, _node_2431));
                float2 node_2077 = (i.uv0+node_7208.g*float2(-0.1,-0.1));
                float4 node_1553 = tex2D(_node_2431,TRANSFORM_TEX(node_2077, _node_2431));
                float2 node_7185 = ((node_940.r*node_1553.r*_niuqudaxiao)+i.uv0);
                float4 _node_8654_var = tex2D(_node_8654,TRANSFORM_TEX(node_7185, _node_8654));
                float4 _node_4937_var = tex2D(_node_4937,TRANSFORM_TEX(node_7185, _node_4937));
                float3 finalColor = ((_MainColor.rgb*_MainTex_var.rgb)+(_Color.rgb*_node_8654_var.r)+(_weicolor.rgb*_node_4937_var.r));
                fixed4 finalRGBA = fixed4(finalColor,_alpha);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
