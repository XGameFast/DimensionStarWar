// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33658,y:32689,varname:node_4013,prsc:2|emission-3016-OUT,alpha-4233-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32823,y:32714,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4121703,c2:0.07352942,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:4604,x:32454,y:32720,ptovrint:False,ptlb:node_4604,ptin:_node_4604,varname:node_4604,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:771,x:32823,y:32900,varname:node_771,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-6999-UVOUT,TEX-4604-TEX;n:type:ShaderForge.SFN_Tex2d,id:5597,x:32823,y:33059,varname:node_5597,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-2805-UVOUT,TEX-4604-TEX;n:type:ShaderForge.SFN_Panner,id:6999,x:32638,y:32900,varname:node_6999,prsc:2,spu:0.2,spv:0.4|UVIN-1501-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1501,x:32454,y:32900,varname:node_1501,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:2805,x:32638,y:33059,varname:node_2805,prsc:2,spu:-0.3,spv:-0.1|UVIN-8017-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8017,x:32454,y:33059,varname:node_8017,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:3089,x:33276,y:32990,varname:node_3089,prsc:2|A-771-R,B-5597-R;n:type:ShaderForge.SFN_Multiply,id:3551,x:33028,y:32900,varname:node_3551,prsc:2|A-1304-RGB,B-771-R;n:type:ShaderForge.SFN_Slider,id:8691,x:33164,y:33238,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_8691,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:4637,x:32823,y:33229,ptovrint:False,ptlb:node_4637,ptin:_node_4637,varname:node_4637,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.3793104,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1452,x:33028,y:33143,varname:node_1452,prsc:2|A-5597-R,B-4637-RGB;n:type:ShaderForge.SFN_Add,id:3016,x:33276,y:32826,varname:node_3016,prsc:2|A-3551-OUT,B-1452-OUT;n:type:ShaderForge.SFN_Multiply,id:4233,x:33443,y:33020,varname:node_4233,prsc:2|A-3089-OUT,B-8691-OUT;proporder:1304-4604-8691-4637;pass:END;sub:END;*/

Shader "Shader Forge/yinbozhuti" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.4121703,0.07352942,1,1)
        _node_4604 ("node_4604", 2D) = "white" {}
        _alpha ("alpha", Range(0, 1)) = 1
        [HDR]_node_4637 ("node_4637", Color) = (0,0.3793104,1,1)
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
            uniform sampler2D _node_4604; uniform float4 _node_4604_ST;
            uniform float _alpha;
            uniform float4 _node_4637;
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
////// Emissive:
                float4 node_6753 = _Time;
                float2 node_6999 = (i.uv0+node_6753.g*float2(0.2,0.4));
                float4 node_771 = tex2D(_node_4604,TRANSFORM_TEX(node_6999, _node_4604));
                float2 node_2805 = (i.uv0+node_6753.g*float2(-0.3,-0.1));
                float4 node_5597 = tex2D(_node_4604,TRANSFORM_TEX(node_2805, _node_4604));
                float3 emissive = ((_Color.rgb*node_771.r)+(node_5597.r*_node_4637.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((node_771.r+node_5597.r)*_alpha));
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
