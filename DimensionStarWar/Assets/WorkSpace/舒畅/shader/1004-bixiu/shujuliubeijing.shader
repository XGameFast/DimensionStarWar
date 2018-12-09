// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33686,y:32682,varname:node_4013,prsc:2|custl-5781-OUT,alpha-7376-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:33191,y:32698,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1176471,c2:0.6713997,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:501,x:32596,y:32880,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_501,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:95554fd564047f3498fb2040ba9cc0d3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:545,x:32963,y:32841,varname:node_545,prsc:2,tex:95554fd564047f3498fb2040ba9cc0d3,ntxv:0,isnm:False|UVIN-8768-UVOUT,TEX-501-TEX;n:type:ShaderForge.SFN_Tex2d,id:9110,x:32963,y:33039,varname:node_9110,prsc:2,tex:95554fd564047f3498fb2040ba9cc0d3,ntxv:0,isnm:False|UVIN-431-UVOUT,TEX-501-TEX;n:type:ShaderForge.SFN_Panner,id:8743,x:32596,y:33039,varname:node_8743,prsc:2,spu:0,spv:1|UVIN-135-UVOUT,DIST-8036-OUT;n:type:ShaderForge.SFN_Panner,id:8768,x:32596,y:32723,varname:node_8768,prsc:2,spu:1,spv:0|UVIN-135-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:135,x:32231,y:32922,varname:node_135,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:7376,x:33191,y:32931,varname:node_7376,prsc:2|A-545-R,B-9110-R,C-6975-R,D-6031-R;n:type:ShaderForge.SFN_Panner,id:431,x:32796,y:33039,varname:node_431,prsc:2,spu:-1,spv:0|UVIN-8743-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6975,x:32963,y:33239,varname:node_6975,prsc:2,tex:95554fd564047f3498fb2040ba9cc0d3,ntxv:0,isnm:False|UVIN-1886-UVOUT,TEX-501-TEX;n:type:ShaderForge.SFN_Rotator,id:6285,x:32395,y:33238,varname:node_6285,prsc:2|UVIN-135-UVOUT,ANG-1580-OUT;n:type:ShaderForge.SFN_Vector1,id:8036,x:32231,y:33070,varname:node_8036,prsc:2,v1:0.2307692;n:type:ShaderForge.SFN_Panner,id:1886,x:32596,y:33238,varname:node_1886,prsc:2,spu:1,spv:0|UVIN-6285-UVOUT;n:type:ShaderForge.SFN_Panner,id:5285,x:32598,y:33425,varname:node_5285,prsc:2,spu:0,spv:1|UVIN-6285-UVOUT,DIST-2056-OUT;n:type:ShaderForge.SFN_Tex2d,id:6031,x:32963,y:33425,varname:node_6031,prsc:2,tex:95554fd564047f3498fb2040ba9cc0d3,ntxv:0,isnm:False|UVIN-4736-UVOUT,TEX-501-TEX;n:type:ShaderForge.SFN_Panner,id:4736,x:32771,y:33425,varname:node_4736,prsc:2,spu:-1,spv:0|UVIN-5285-UVOUT;n:type:ShaderForge.SFN_Vector1,id:2056,x:32395,y:33450,varname:node_2056,prsc:2,v1:0.1741125;n:type:ShaderForge.SFN_Vector1,id:1580,x:32231,y:33272,varname:node_1580,prsc:2,v1:1.575254;n:type:ShaderForge.SFN_Multiply,id:5781,x:33425,y:32792,varname:node_5781,prsc:2|A-1304-RGB,B-7376-OUT;proporder:1304-501;pass:END;sub:END;*/

Shader "Shader Forge/shujuliubeijing" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.1176471,0.6713997,1,1)
        _MainTex ("MainTex", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
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
                float4 node_5775 = _Time;
                float2 node_8768 = (i.uv0+node_5775.g*float2(1,0));
                float4 node_545 = tex2D(_MainTex,TRANSFORM_TEX(node_8768, _MainTex));
                float2 node_431 = ((i.uv0+0.2307692*float2(0,1))+node_5775.g*float2(-1,0));
                float4 node_9110 = tex2D(_MainTex,TRANSFORM_TEX(node_431, _MainTex));
                float node_6285_ang = 1.575254;
                float node_6285_spd = 1.0;
                float node_6285_cos = cos(node_6285_spd*node_6285_ang);
                float node_6285_sin = sin(node_6285_spd*node_6285_ang);
                float2 node_6285_piv = float2(0.5,0.5);
                float2 node_6285 = (mul(i.uv0-node_6285_piv,float2x2( node_6285_cos, -node_6285_sin, node_6285_sin, node_6285_cos))+node_6285_piv);
                float2 node_1886 = (node_6285+node_5775.g*float2(1,0));
                float4 node_6975 = tex2D(_MainTex,TRANSFORM_TEX(node_1886, _MainTex));
                float2 node_4736 = ((node_6285+0.1741125*float2(0,1))+node_5775.g*float2(-1,0));
                float4 node_6031 = tex2D(_MainTex,TRANSFORM_TEX(node_4736, _MainTex));
                float node_7376 = (node_545.r+node_9110.r+node_6975.r+node_6031.r);
                float3 finalColor = (_Color.rgb*node_7376);
                fixed4 finalRGBA = fixed4(finalColor,node_7376);
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
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
