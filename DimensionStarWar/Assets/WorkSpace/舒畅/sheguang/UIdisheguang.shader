// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33295,y:32681,varname:node_9361,prsc:2|custl-3974-OUT;n:type:ShaderForge.SFN_Panner,id:1089,x:32206,y:32925,varname:node_1089,prsc:2,spu:-0.3,spv:0|UVIN-8353-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8353,x:31820,y:32923,varname:node_8353,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:7428,x:32343,y:33110,varname:node_7428,prsc:2|A-8353-U,B-7958-OUT;n:type:ShaderForge.SFN_OneMinus,id:7958,x:32176,y:33130,varname:node_7958,prsc:2|IN-8353-U;n:type:ShaderForge.SFN_Vector1,id:3723,x:32366,y:33252,varname:node_3723,prsc:2,v1:4;n:type:ShaderForge.SFN_Clamp01,id:8318,x:32690,y:33119,varname:node_8318,prsc:2|IN-2752-OUT;n:type:ShaderForge.SFN_Multiply,id:3974,x:32950,y:32943,varname:node_3974,prsc:2|A-6222-OUT,B-8318-OUT,C-717-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:2130,x:32206,y:32760,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2130,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:36f5ab1f25dbcf34d87edfb20993740f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5654,x:32413,y:32925,varname:node_5654,prsc:2,tex:36f5ab1f25dbcf34d87edfb20993740f,ntxv:0,isnm:False|UVIN-1089-UVOUT,TEX-2130-TEX;n:type:ShaderForge.SFN_Tex2d,id:3368,x:32401,y:32573,varname:node_3368,prsc:2,tex:36f5ab1f25dbcf34d87edfb20993740f,ntxv:0,isnm:False|UVIN-9998-UVOUT,TEX-2130-TEX;n:type:ShaderForge.SFN_Panner,id:9998,x:32206,y:32573,varname:node_9998,prsc:2,spu:-0.1,spv:0|UVIN-5540-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9037,x:32609,y:32664,varname:node_9037,prsc:2|A-3368-R,B-7428-OUT;n:type:ShaderForge.SFN_Add,id:6222,x:32763,y:32801,varname:node_6222,prsc:2|A-9037-OUT,B-5654-R;n:type:ShaderForge.SFN_Panner,id:5540,x:31989,y:32639,varname:node_5540,prsc:2,spu:0,spv:1|UVIN-8353-UVOUT,DIST-9693-OUT;n:type:ShaderForge.SFN_Vector1,id:9693,x:31785,y:32787,varname:node_9693,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Multiply,id:2752,x:32520,y:33119,varname:node_2752,prsc:2|A-7428-OUT,B-3723-OUT;n:type:ShaderForge.SFN_Color,id:717,x:32763,y:32960,ptovrint:False,ptlb:Main color,ptin:_Maincolor,varname:node_717,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09558821,c2:0.6631847,c3:1,c4:1;proporder:2130-717;pass:END;sub:END;*/

Shader "Shader Forge/UIdisheguang" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_Maincolor ("Main color", Color) = (0.09558821,0.6631847,1,1)
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
            Blend One One
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Maincolor;
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
                float4 node_8126 = _Time;
                float2 node_9998 = ((i.uv0+0.4*float2(0,1))+node_8126.g*float2(-0.1,0));
                float4 node_3368 = tex2D(_MainTex,TRANSFORM_TEX(node_9998, _MainTex));
                float node_7428 = (i.uv0.r*(1.0 - i.uv0.r));
                float2 node_1089 = (i.uv0+node_8126.g*float2(-0.3,0));
                float4 node_5654 = tex2D(_MainTex,TRANSFORM_TEX(node_1089, _MainTex));
                float3 node_3974 = (((node_3368.r*node_7428)+node_5654.r)*saturate((node_7428*4.0))*_Maincolor.rgb);
                float3 finalColor = node_3974;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
