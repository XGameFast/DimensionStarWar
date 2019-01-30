// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:True,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33131,y:31987,varname:node_9361,prsc:2|custl-113-OUT,clip-9410-OUT;n:type:ShaderForge.SFN_TexCoord,id:7196,x:31619,y:32207,varname:node_7196,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:1226,x:32524,y:32209,varname:node_1226,prsc:2,spu:-0.01,spv:-0.02|UVIN-1261-OUT;n:type:ShaderForge.SFN_Tex2d,id:812,x:32696,y:32209,ptovrint:False,ptlb:xingkong,ptin:_xingkong,varname:node_812,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8b81f48942262204699c7f57a7342604,ntxv:0,isnm:False|UVIN-1226-UVOUT;n:type:ShaderForge.SFN_Slider,id:9410,x:32745,y:32377,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_9410,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Add,id:1261,x:32348,y:32209,varname:node_1261,prsc:2|A-7196-UVOUT,B-5114-OUT;n:type:ShaderForge.SFN_Power,id:128,x:32180,y:32672,varname:node_128,prsc:2|VAL-6160-OUT,EXP-5204-OUT;n:type:ShaderForge.SFN_Vector1,id:5204,x:32008,y:32805,varname:node_5204,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5114,x:32173,y:32295,varname:node_5114,prsc:2|A-554-G,B-2111-OUT;n:type:ShaderForge.SFN_Slider,id:2111,x:31831,y:32445,ptovrint:False,ptlb:niuqu intensity,ptin:_niuquintensity,varname:node_2111,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:6400,x:31804,y:32255,varname:node_6400,prsc:2|A-7196-UVOUT,B-9256-OUT;n:type:ShaderForge.SFN_Vector2,id:9256,x:31619,y:32365,varname:node_9256,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_TexCoord,id:4854,x:31493,y:32576,varname:node_4854,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:6303,x:31661,y:32576,varname:node_6303,prsc:2,spu:0.05,spv:-0.08|UVIN-4854-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9525,x:32696,y:32470,varname:node_9525,prsc:2|A-554-R,B-1626-OUT,C-240-RGB;n:type:ShaderForge.SFN_Color,id:240,x:32505,y:32509,ptovrint:False,ptlb:Offset color,ptin:_Offsetcolor,varname:node_240,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.751724,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:113,x:32902,y:32209,varname:node_113,prsc:2|A-812-RGB,B-9525-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:8122,x:31493,y:32745,ptovrint:False,ptlb:Offset tex,ptin:_Offsettex,varname:node_8122,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1277,x:31841,y:32577,varname:node_1277,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-6303-UVOUT,TEX-8122-TEX;n:type:ShaderForge.SFN_Panner,id:108,x:31661,y:32745,varname:node_108,prsc:2,spu:-0.03,spv:-0.15|UVIN-4854-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8090,x:31841,y:32745,varname:node_8090,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-108-UVOUT,TEX-8122-TEX;n:type:ShaderForge.SFN_Clamp01,id:1626,x:32508,y:32672,varname:node_1626,prsc:2|IN-9330-OUT;n:type:ShaderForge.SFN_Multiply,id:6160,x:32008,y:32672,varname:node_6160,prsc:2|A-1277-B,B-8090-B;n:type:ShaderForge.SFN_Multiply,id:9330,x:32342,y:32672,varname:node_9330,prsc:2|A-128-OUT,B-5204-OUT;n:type:ShaderForge.SFN_Tex2d,id:554,x:31988,y:32255,ptovrint:False,ptlb:blend tex,ptin:_blendtex,varname:node_554,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:55076780a388d534080027b27f42f90e,ntxv:0,isnm:False|UVIN-6400-OUT;proporder:812-9410-2111-240-8122-554;pass:END;sub:END;*/

Shader "Shader Forge/shujuxingtai" {
    Properties {
        _xingkong ("xingkong", 2D) = "white" {}
        _Alpha ("Alpha", Range(0, 1)) = 1
        _niuquintensity ("niuqu intensity", Range(0, 1)) = 1
        [HDR]_Offsetcolor ("Offset color", Color) = (0,0.751724,1,1)
        _Offsettex ("Offset tex", 2D) = "white" {}
        _blendtex ("blend tex", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
            "CanUseSpriteAtlas"="True"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _xingkong; uniform float4 _xingkong_ST;
            uniform float _Alpha;
            uniform float _niuquintensity;
            uniform float4 _Offsetcolor;
            uniform sampler2D _Offsettex; uniform float4 _Offsettex_ST;
            uniform sampler2D _blendtex; uniform float4 _blendtex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                clip(_Alpha - 0.5);
////// Lighting:
                float4 node_63 = _Time;
                float2 node_6400 = (i.uv1*float2(2,2));
                float4 _blendtex_var = tex2D(_blendtex,TRANSFORM_TEX(node_6400, _blendtex));
                float2 node_1226 = ((i.uv1+(_blendtex_var.g*_niuquintensity))+node_63.g*float2(-0.01,-0.02));
                float4 _xingkong_var = tex2D(_xingkong,TRANSFORM_TEX(node_1226, _xingkong));
                float2 node_6303 = (i.uv1+node_63.g*float2(0.05,-0.08));
                float4 node_1277 = tex2D(_Offsettex,TRANSFORM_TEX(node_6303, _Offsettex));
                float2 node_108 = (i.uv1+node_63.g*float2(-0.03,-0.15));
                float4 node_8090 = tex2D(_Offsettex,TRANSFORM_TEX(node_108, _Offsettex));
                float node_5204 = 2.0;
                float3 finalColor = (_xingkong_var.rgb+(_blendtex_var.r*saturate((pow((node_1277.b*node_8090.b),node_5204)*node_5204))*_Offsetcolor.rgb));
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
            Cull Back
            
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
            uniform float _Alpha;
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
            float4 frag(VertexOutput i) : COLOR {
                clip(_Alpha - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
