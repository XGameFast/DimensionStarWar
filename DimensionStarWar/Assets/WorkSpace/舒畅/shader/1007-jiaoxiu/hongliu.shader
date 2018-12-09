// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34461,y:32537,varname:node_9361,prsc:2|custl-9931-OUT,alpha-1170-OUT;n:type:ShaderForge.SFN_Tex2d,id:8481,x:33408,y:32922,ptovrint:False,ptlb:maskTex,ptin:_maskTex,varname:node_8481,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c196117898ed97045928df82293354a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:288,x:33156,y:32563,varname:node_288,prsc:2,spu:-5,spv:1|UVIN-1130-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1130,x:32788,y:32613,varname:node_1130,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:9745,x:33158,y:32731,varname:node_9745,prsc:2,spu:-3,spv:-0.7|UVIN-1130-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4506,x:33512,y:32687,varname:node_4506,prsc:2|A-8442-R,B-5845-R;n:type:ShaderForge.SFN_Multiply,id:3785,x:33689,y:32739,varname:node_3785,prsc:2|A-4506-OUT,B-8481-R,C-3104-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1611,x:33156,y:32399,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1611,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:891299afa2f689743bbec498e582a78c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8442,x:33355,y:32563,varname:node_8442,prsc:2,tex:891299afa2f689743bbec498e582a78c,ntxv:0,isnm:False|UVIN-288-UVOUT,TEX-1611-TEX;n:type:ShaderForge.SFN_Tex2d,id:5845,x:33355,y:32731,varname:node_5845,prsc:2,tex:891299afa2f689743bbec498e582a78c,ntxv:0,isnm:False|UVIN-9745-UVOUT,TEX-1611-TEX;n:type:ShaderForge.SFN_Add,id:3371,x:33903,y:32624,varname:node_3371,prsc:2|A-3785-OUT,B-8481-R;n:type:ShaderForge.SFN_VertexColor,id:2575,x:33783,y:33076,varname:node_2575,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1170,x:33984,y:32925,varname:node_1170,prsc:2|A-5876-OUT,B-2575-A;n:type:ShaderForge.SFN_Multiply,id:2982,x:33142,y:33052,varname:node_2982,prsc:2|A-1130-U,B-8853-OUT,C-5904-OUT;n:type:ShaderForge.SFN_OneMinus,id:8853,x:32923,y:32922,varname:node_8853,prsc:2|IN-1130-U;n:type:ShaderForge.SFN_Vector1,id:5904,x:32993,y:33137,varname:node_5904,prsc:2,v1:4;n:type:ShaderForge.SFN_Multiply,id:5876,x:33585,y:32981,varname:node_5876,prsc:2|A-8481-R,B-2982-OUT;n:type:ShaderForge.SFN_Multiply,id:9931,x:34234,y:32629,varname:node_9931,prsc:2|A-3371-OUT,B-2575-RGB,C-5800-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5800,x:33903,y:32564,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_5800,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:3104,x:33685,y:32906,varname:node_3104,prsc:2,v1:3;proporder:8481-1611-5800;pass:END;sub:END;*/

Shader "Shader Forge/hongliu" {
    Properties {
        _maskTex ("maskTex", 2D) = "white" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
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
            uniform sampler2D _maskTex; uniform float4 _maskTex_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_8354 = _Time;
                float2 node_288 = (i.uv0+node_8354.g*float2(-5,1));
                float4 node_8442 = tex2D(_MainTex,TRANSFORM_TEX(node_288, _MainTex));
                float2 node_9745 = (i.uv0+node_8354.g*float2(-3,-0.7));
                float4 node_5845 = tex2D(_MainTex,TRANSFORM_TEX(node_9745, _MainTex));
                float4 _maskTex_var = tex2D(_maskTex,TRANSFORM_TEX(i.uv0, _maskTex));
                float3 finalColor = ((((node_8442.r*node_5845.r)*_maskTex_var.r*3.0)+_maskTex_var.r)*i.vertexColor.rgb*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,((_maskTex_var.r*(i.uv0.r*(1.0 - i.uv0.r)*4.0))*i.vertexColor.a));
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
