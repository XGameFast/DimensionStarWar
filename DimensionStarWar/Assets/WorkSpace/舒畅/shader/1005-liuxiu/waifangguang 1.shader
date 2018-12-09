// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33233,y:32791,varname:node_4013,prsc:2|emission-9225-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6078,x:32011,y:33025,ptovrint:False,ptlb:node_6078,ptin:_node_6078,varname:node_6078,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2badf92760f742c4f8840a2a7c34a8fb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8303,x:32432,y:32994,varname:node_8303,prsc:2,tex:2badf92760f742c4f8840a2a7c34a8fb,ntxv:0,isnm:False|UVIN-432-UVOUT,TEX-6078-TEX;n:type:ShaderForge.SFN_Tex2d,id:7071,x:32432,y:33199,varname:node_7071,prsc:2,tex:2badf92760f742c4f8840a2a7c34a8fb,ntxv:0,isnm:False|UVIN-3106-UVOUT,TEX-6078-TEX;n:type:ShaderForge.SFN_Panner,id:432,x:32247,y:32994,varname:node_432,prsc:2,spu:0.15,spv:0|UVIN-9373-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9373,x:32011,y:33223,varname:node_9373,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:3106,x:32247,y:33199,varname:node_3106,prsc:2,spu:-0.1,spv:0|UVIN-9373-UVOUT;n:type:ShaderForge.SFN_Add,id:4650,x:32636,y:33099,varname:node_4650,prsc:2|A-8303-R,B-7071-R;n:type:ShaderForge.SFN_Multiply,id:9225,x:33047,y:33086,varname:node_9225,prsc:2|A-4327-OUT,B-7035-A;n:type:ShaderForge.SFN_ValueProperty,id:4123,x:32636,y:33278,ptovrint:False,ptlb:node_4123,ptin:_node_4123,varname:node_4123,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:7035,x:32610,y:32944,varname:node_7035,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4327,x:32847,y:33128,varname:node_4327,prsc:2|A-7035-RGB,B-4650-OUT,C-4123-OUT;proporder:6078-4123;pass:END;sub:END;*/

Shader "Shader Forge/waifangguang 1" {
    Properties {
        _node_6078 ("node_6078", 2D) = "white" {}
        _node_4123 ("node_4123", Float ) = 1
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
            uniform sampler2D _node_6078; uniform float4 _node_6078_ST;
            uniform float _node_4123;
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
////// Emissive:
                float4 node_7755 = _Time;
                float2 node_432 = (i.uv0+node_7755.g*float2(0.15,0));
                float4 node_8303 = tex2D(_node_6078,TRANSFORM_TEX(node_432, _node_6078));
                float2 node_3106 = (i.uv0+node_7755.g*float2(-0.1,0));
                float4 node_7071 = tex2D(_node_6078,TRANSFORM_TEX(node_3106, _node_6078));
                float3 emissive = ((i.vertexColor.rgb*(node_8303.r+node_7071.r)*_node_4123)*i.vertexColor.a);
                float3 finalColor = emissive;
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
