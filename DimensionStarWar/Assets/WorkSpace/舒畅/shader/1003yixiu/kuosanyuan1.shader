// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33727,y:32505,varname:node_4013,prsc:2|emission-6733-OUT,alpha-194-OUT;n:type:ShaderForge.SFN_TexCoord,id:5136,x:32368,y:32743,varname:node_5136,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:8349,x:32368,y:32878,varname:node_8349,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:7975,x:32546,y:32743,varname:node_7975,prsc:2|A-5136-UVOUT,B-8349-OUT;n:type:ShaderForge.SFN_Divide,id:5142,x:32748,y:32850,varname:node_5142,prsc:2|A-7975-OUT,B-1173-OUT;n:type:ShaderForge.SFN_OneMinus,id:6036,x:32912,y:32850,varname:node_6036,prsc:2|IN-5142-OUT;n:type:ShaderForge.SFN_VertexColor,id:9596,x:33167,y:32746,varname:node_9596,prsc:2;n:type:ShaderForge.SFN_Step,id:4378,x:33167,y:32893,varname:node_4378,prsc:2|A-9596-A,B-6036-OUT;n:type:ShaderForge.SFN_Add,id:7821,x:33017,y:33215,varname:node_7821,prsc:2|A-9596-A,B-2912-OUT;n:type:ShaderForge.SFN_Step,id:2775,x:33194,y:33147,varname:node_2775,prsc:2|A-7821-OUT,B-6036-OUT;n:type:ShaderForge.SFN_Subtract,id:194,x:33393,y:32990,varname:node_194,prsc:2|A-4378-OUT,B-2775-OUT;n:type:ShaderForge.SFN_Vector1,id:3741,x:32639,y:33252,varname:node_3741,prsc:2,v1:0.24;n:type:ShaderForge.SFN_Multiply,id:2912,x:32841,y:33235,varname:node_2912,prsc:2|A-9596-A,B-3741-OUT;n:type:ShaderForge.SFN_Vector1,id:1173,x:32546,y:32884,varname:node_1173,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:6733,x:33493,y:32746,varname:node_6733,prsc:2|A-9596-RGB,B-194-OUT,C-2957-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2957,x:33402,y:32547,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_2957,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;proporder:2957;pass:END;sub:END;*/

Shader "Shader Forge/kuosanyuan1" {
    Properties {
        _liangdu ("liangdu", Float ) = 0
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
            uniform float _liangdu;
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
                float node_6036 = (1.0 - (distance(i.uv0,float2(0.5,0.5))/0.5));
                float node_194 = (step(i.vertexColor.a,node_6036)-step((i.vertexColor.a+(i.vertexColor.a*0.24)),node_6036));
                float3 emissive = (i.vertexColor.rgb*node_194*_liangdu);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,node_194);
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
