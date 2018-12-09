// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32736,y:32363,varname:node_9361,prsc:2|custl-4694-OUT,alpha-5564-OUT;n:type:ShaderForge.SFN_Tex2d,id:8617,x:32309,y:32538,ptovrint:False,ptlb:Maintex,ptin:_Maintex,varname:node_8617,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:51064f1d1f97bac48a13873ed85952e8,ntxv:0,isnm:False|UVIN-3464-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:546,x:31422,y:32562,ptovrint:False,ptlb:niuqu tex,ptin:_niuqutex,varname:node_546,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3680,x:31791,y:32321,varname:node_3680,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-9682-UVOUT,TEX-546-TEX;n:type:ShaderForge.SFN_Tex2d,id:1696,x:31781,y:32756,varname:node_1696,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-7800-UVOUT,TEX-546-TEX;n:type:ShaderForge.SFN_Panner,id:9682,x:31612,y:32321,varname:node_9682,prsc:2,spu:0.6,spv:0.8|UVIN-5906-UVOUT;n:type:ShaderForge.SFN_Panner,id:7800,x:31615,y:32756,varname:node_7800,prsc:2,spu:-0.5,spv:-0.6|UVIN-5906-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5906,x:31207,y:32548,varname:node_5906,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:5561,x:31952,y:32538,varname:node_5561,prsc:2|A-3680-R,B-1696-R,C-2401-OUT;n:type:ShaderForge.SFN_Add,id:3464,x:32118,y:32538,varname:node_3464,prsc:2|A-5561-OUT,B-2456-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2456,x:31934,y:32688,varname:node_2456,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:2401,x:31791,y:32582,varname:node_2401,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:5564,x:32540,y:32675,varname:node_5564,prsc:2|A-8617-R,B-4123-A;n:type:ShaderForge.SFN_VertexColor,id:4123,x:32309,y:32737,varname:node_4123,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4694,x:32574,y:32547,varname:node_4694,prsc:2|A-4302-OUT,B-8617-R,C-4123-RGB;n:type:ShaderForge.SFN_ValueProperty,id:4302,x:32309,y:32458,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_4302,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:8617-546-4302;pass:END;sub:END;*/

Shader "Shader Forge/niuqubao" {
    Properties {
        _Maintex ("Maintex", 2D) = "white" {}
        _niuqutex ("niuqu tex", 2D) = "white" {}
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
            uniform sampler2D _Maintex; uniform float4 _Maintex_ST;
            uniform sampler2D _niuqutex; uniform float4 _niuqutex_ST;
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
                float4 node_7030 = _Time;
                float2 node_9682 = (i.uv0+node_7030.g*float2(0.6,0.8));
                float4 node_3680 = tex2D(_niuqutex,TRANSFORM_TEX(node_9682, _niuqutex));
                float2 node_7800 = (i.uv0+node_7030.g*float2(-0.5,-0.6));
                float4 node_1696 = tex2D(_niuqutex,TRANSFORM_TEX(node_7800, _niuqutex));
                float2 node_3464 = ((node_3680.r*node_1696.r*0.1)+i.uv0);
                float4 _Maintex_var = tex2D(_Maintex,TRANSFORM_TEX(node_3464, _Maintex));
                float3 finalColor = (_Intensity*_Maintex_var.r*i.vertexColor.rgb);
                fixed4 finalRGBA = fixed4(finalColor,(_Maintex_var.r*i.vertexColor.a));
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
