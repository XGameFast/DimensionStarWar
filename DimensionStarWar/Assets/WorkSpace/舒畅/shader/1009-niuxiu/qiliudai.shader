// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33273,y:32700,varname:node_4013,prsc:2|emission-8381-OUT,alpha-3008-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32689,y:32513,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:9848,x:32527,y:33054,varname:node_9848,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3008,x:32769,y:33010,varname:node_3008,prsc:2|A-4233-R,B-9848-A;n:type:ShaderForge.SFN_Tex2d,id:4233,x:32339,y:32882,ptovrint:False,ptlb:node_4233,ptin:_node_4233,varname:node_4233,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7a81ed2593c1a4a4fa50a521e2ffd90e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3255,x:32574,y:32691,varname:node_3255,prsc:2|A-2807-R,B-4233-R;n:type:ShaderForge.SFN_Add,id:8832,x:32747,y:32691,varname:node_8832,prsc:2|A-3255-OUT,B-4233-R;n:type:ShaderForge.SFN_Panner,id:1114,x:32159,y:32616,varname:node_1114,prsc:2,spu:0.1,spv:-0.3|UVIN-482-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:482,x:31972,y:32616,varname:node_482,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:2807,x:32366,y:32640,ptovrint:False,ptlb:node_2807,ptin:_node_2807,varname:node_2807,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-1114-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8381,x:32959,y:32691,varname:node_8381,prsc:2|A-1304-RGB,B-8832-OUT;proporder:1304-4233-2807;pass:END;sub:END;*/

Shader "Shader Forge/qiliudai" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        _node_4233 ("node_4233", 2D) = "white" {}
        _node_2807 ("node_2807", 2D) = "white" {}
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
            uniform sampler2D _node_4233; uniform float4 _node_4233_ST;
            uniform sampler2D _node_2807; uniform float4 _node_2807_ST;
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
                float4 node_9778 = _Time;
                float2 node_1114 = (i.uv0+node_9778.g*float2(0.1,-0.3));
                float4 _node_2807_var = tex2D(_node_2807,TRANSFORM_TEX(node_1114, _node_2807));
                float4 _node_4233_var = tex2D(_node_4233,TRANSFORM_TEX(i.uv0, _node_4233));
                float3 emissive = (_Color.rgb*((_node_2807_var.r*_node_4233_var.r)+_node_4233_var.r));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(_node_4233_var.r*i.vertexColor.a));
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
