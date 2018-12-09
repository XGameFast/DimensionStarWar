// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33676,y:32772,varname:node_4013,prsc:2|emission-4413-OUT,alpha-6380-R;n:type:ShaderForge.SFN_Color,id:1304,x:33098,y:32724,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.04411763,c2:0.3275862,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:7094,x:31871,y:32744,ptovrint:False,ptlb:node_7094,ptin:_node_7094,varname:node_7094,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:203f5a90c24fae44b8b8c16787e35431,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7365,x:32545,y:32754,varname:node_7365,prsc:2,tex:203f5a90c24fae44b8b8c16787e35431,ntxv:0,isnm:False|UVIN-6025-UVOUT,TEX-7094-TEX;n:type:ShaderForge.SFN_Tex2d,id:9583,x:32541,y:33147,varname:node_9583,prsc:2,tex:203f5a90c24fae44b8b8c16787e35431,ntxv:0,isnm:False|UVIN-5099-UVOUT,TEX-7094-TEX;n:type:ShaderForge.SFN_Panner,id:6025,x:32371,y:32754,varname:node_6025,prsc:2,spu:-0.3,spv:0.2|UVIN-6943-OUT;n:type:ShaderForge.SFN_TexCoord,id:8597,x:32034,y:32744,varname:node_8597,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6943,x:32201,y:32754,varname:node_6943,prsc:2|A-8597-UVOUT,B-4074-OUT;n:type:ShaderForge.SFN_Vector2,id:4074,x:32034,y:32895,varname:node_4074,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_Panner,id:5099,x:32291,y:33147,varname:node_5099,prsc:2,spu:0.1,spv:-0.25|UVIN-9230-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9230,x:32019,y:33145,varname:node_9230,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9679,x:32753,y:33019,varname:node_9679,prsc:2|A-7365-R,B-9583-R;n:type:ShaderForge.SFN_Add,id:157,x:32988,y:32992,varname:node_157,prsc:2|A-9679-OUT,B-36-OUT;n:type:ShaderForge.SFN_TexCoord,id:5340,x:32701,y:33234,varname:node_5340,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:36,x:32929,y:33234,varname:node_36,prsc:2|A-5340-UVOUT,B-5091-OUT;n:type:ShaderForge.SFN_Vector2,id:5091,x:32701,y:33388,varname:node_5091,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_Tex2d,id:6380,x:33345,y:32988,ptovrint:False,ptlb:node_6380,ptin:_node_6380,varname:node_6380,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0525f5ac47fca9c4eb41c0acfe31e574,ntxv:0,isnm:False|UVIN-157-OUT;n:type:ShaderForge.SFN_Multiply,id:4413,x:33388,y:32823,varname:node_4413,prsc:2|A-1304-RGB,B-6380-R;n:type:ShaderForge.SFN_Panner,id:8668,x:33175,y:32988,varname:node_8668,prsc:2,spu:0.1,spv:0.2|UVIN-157-OUT;proporder:1304-7094-6380;pass:END;sub:END;*/

Shader "Shader Forge/shuijinmian" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.04411763,0.3275862,1,1)
        _node_7094 ("node_7094", 2D) = "white" {}
        _node_6380 ("node_6380", 2D) = "white" {}
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
            uniform sampler2D _node_7094; uniform float4 _node_7094_ST;
            uniform sampler2D _node_6380; uniform float4 _node_6380_ST;
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
                float4 node_3450 = _Time;
                float2 node_6025 = ((i.uv0*float2(2,2))+node_3450.g*float2(-0.3,0.2));
                float4 node_7365 = tex2D(_node_7094,TRANSFORM_TEX(node_6025, _node_7094));
                float2 node_5099 = (i.uv0+node_3450.g*float2(0.1,-0.25));
                float4 node_9583 = tex2D(_node_7094,TRANSFORM_TEX(node_5099, _node_7094));
                float2 node_157 = ((node_7365.r*node_9583.r)+(i.uv0*float2(2,2)));
                float4 _node_6380_var = tex2D(_node_6380,TRANSFORM_TEX(node_157, _node_6380));
                float3 emissive = (_Color.rgb*_node_6380_var.r);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,_node_6380_var.r);
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
