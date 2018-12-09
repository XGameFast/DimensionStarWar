// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33658,y:32689,varname:node_4013,prsc:2|emission-1452-OUT,alpha-243-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:4604,x:32454,y:32720,ptovrint:False,ptlb:node_4604,ptin:_node_4604,varname:node_4604,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:627c197522a23124f9ad524d03f3229f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:771,x:32823,y:32900,varname:node_771,prsc:2,tex:627c197522a23124f9ad524d03f3229f,ntxv:0,isnm:False|UVIN-6999-UVOUT,TEX-4604-TEX;n:type:ShaderForge.SFN_Tex2d,id:5597,x:32823,y:33059,varname:node_5597,prsc:2,tex:627c197522a23124f9ad524d03f3229f,ntxv:0,isnm:False|UVIN-2805-UVOUT,TEX-4604-TEX;n:type:ShaderForge.SFN_Panner,id:6999,x:32638,y:32900,varname:node_6999,prsc:2,spu:0.1,spv:4|UVIN-1501-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1501,x:32454,y:32900,varname:node_1501,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:2805,x:32638,y:33059,varname:node_2805,prsc:2,spu:-0.2,spv:3|UVIN-1501-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3551,x:33045,y:32952,varname:node_3551,prsc:2|A-5597-R,B-771-R;n:type:ShaderForge.SFN_Multiply,id:1452,x:33356,y:32852,varname:node_1452,prsc:2|A-2707-RGB,B-3551-OUT,C-1824-OUT;n:type:ShaderForge.SFN_VertexColor,id:2707,x:32770,y:32649,varname:node_2707,prsc:2;n:type:ShaderForge.SFN_Multiply,id:243,x:33427,y:33037,varname:node_243,prsc:2|A-3551-OUT,B-2707-A;n:type:ShaderForge.SFN_Multiply,id:1824,x:33058,y:32709,varname:node_1824,prsc:2|A-2707-A,B-3356-OUT;n:type:ShaderForge.SFN_Vector1,id:3356,x:32809,y:32812,varname:node_3356,prsc:2,v1:3;proporder:4604;pass:END;sub:END;*/

Shader "Shader Forge/nenglianghuan" {
    Properties {
        _node_4604 ("node_4604", 2D) = "white" {}
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
            uniform sampler2D _node_4604; uniform float4 _node_4604_ST;
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
                float4 node_2255 = _Time;
                float2 node_2805 = (i.uv0+node_2255.g*float2(-0.2,3));
                float4 node_5597 = tex2D(_node_4604,TRANSFORM_TEX(node_2805, _node_4604));
                float2 node_6999 = (i.uv0+node_2255.g*float2(0.1,4));
                float4 node_771 = tex2D(_node_4604,TRANSFORM_TEX(node_6999, _node_4604));
                float node_3551 = (node_5597.r*node_771.r);
                float3 emissive = (i.vertexColor.rgb*node_3551*(i.vertexColor.a*3.0));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(node_3551*i.vertexColor.a));
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
