// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33495,y:32718,varname:node_9361,prsc:2|custl-2163-OUT,alpha-9057-OUT;n:type:ShaderForge.SFN_Tex2d,id:3517,x:32358,y:32743,ptovrint:False,ptlb:node_3517,ptin:_node_3517,varname:node_3517,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:745c69050ac9dca4d8e9392d505e9d49,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:2764,x:31842,y:32999,varname:node_2764,prsc:2,spu:0.2,spv:0.1|UVIN-5387-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5387,x:31649,y:32999,varname:node_5387,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:862,x:31788,y:32778,ptovrint:False,ptlb:node_862,ptin:_node_862,varname:node_862,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:82c11629ea68571479b151958a8d43d3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9422,x:32084,y:32999,varname:node_9422,prsc:2,tex:82c11629ea68571479b151958a8d43d3,ntxv:0,isnm:False|UVIN-2764-UVOUT,TEX-862-TEX;n:type:ShaderForge.SFN_Tex2d,id:5888,x:32084,y:33185,varname:node_5888,prsc:2,tex:82c11629ea68571479b151958a8d43d3,ntxv:0,isnm:False|UVIN-8530-UVOUT,TEX-862-TEX;n:type:ShaderForge.SFN_Panner,id:8530,x:31842,y:33185,varname:node_8530,prsc:2,spu:-0.3,spv:-0.05|UVIN-5387-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9982,x:32659,y:33114,varname:node_9982,prsc:2|A-660-OUT,B-3517-A;n:type:ShaderForge.SFN_Multiply,id:1266,x:32659,y:32941,varname:node_1266,prsc:2|A-3517-A,B-660-OUT;n:type:ShaderForge.SFN_Multiply,id:7731,x:32659,y:32805,varname:node_7731,prsc:2|A-3517-RGB,B-660-OUT;n:type:ShaderForge.SFN_Add,id:2163,x:32878,y:32645,varname:node_2163,prsc:2|A-3517-RGB,B-5578-OUT;n:type:ShaderForge.SFN_Add,id:7818,x:32930,y:33009,varname:node_7818,prsc:2|A-3517-A,B-1266-OUT;n:type:ShaderForge.SFN_Add,id:660,x:32335,y:33023,varname:node_660,prsc:2|A-9422-B,B-5888-B;n:type:ShaderForge.SFN_Multiply,id:5578,x:32966,y:33210,varname:node_5578,prsc:2|A-9982-OUT,B-8873-RGB;n:type:ShaderForge.SFN_Color,id:8873,x:32633,y:33260,ptovrint:False,ptlb:node_8873,ptin:_node_8873,varname:node_8873,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3823529,c2:0.5399593,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9057,x:33327,y:33053,varname:node_9057,prsc:2|A-7818-OUT,B-6319-OUT;n:type:ShaderForge.SFN_Sin,id:3817,x:33023,y:33352,varname:node_3817,prsc:2|IN-8544-T;n:type:ShaderForge.SFN_Time,id:8544,x:32848,y:33334,varname:node_8544,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:6319,x:33206,y:33334,varname:node_6319,prsc:2,frmn:-1,frmx:1,tomn:0.5,tomx:1|IN-3817-OUT;proporder:3517-862-8873;pass:END;sub:END;*/

Shader "Shader Forge/liudongguangci" {
    Properties {
        _node_3517 ("node_3517", 2D) = "white" {}
        _node_862 ("node_862", 2D) = "white" {}
        [HDR]_node_8873 ("node_8873", Color) = (0.3823529,0.5399593,1,1)
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
            uniform sampler2D _node_3517; uniform float4 _node_3517_ST;
            uniform sampler2D _node_862; uniform float4 _node_862_ST;
            uniform float4 _node_8873;
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
                float4 _node_3517_var = tex2D(_node_3517,TRANSFORM_TEX(i.uv0, _node_3517));
                float4 node_1755 = _Time;
                float2 node_2764 = (i.uv0+node_1755.g*float2(0.2,0.1));
                float4 node_9422 = tex2D(_node_862,TRANSFORM_TEX(node_2764, _node_862));
                float2 node_8530 = (i.uv0+node_1755.g*float2(-0.3,-0.05));
                float4 node_5888 = tex2D(_node_862,TRANSFORM_TEX(node_8530, _node_862));
                float node_660 = (node_9422.b+node_5888.b);
                float3 finalColor = (_node_3517_var.rgb+((node_660*_node_3517_var.a)*_node_8873.rgb));
                float4 node_8544 = _Time;
                fixed4 finalRGBA = fixed4(finalColor,((_node_3517_var.a+(_node_3517_var.a*node_660))*(sin(node_8544.g)*0.25+0.75)));
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
