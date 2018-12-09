// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33985,y:32694,varname:node_4013,prsc:2|emission-3541-OUT,alpha-7185-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:8466,x:32661,y:32941,ptovrint:False,ptlb:node_8466,ptin:_node_8466,varname:node_8466,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3292,x:32951,y:32722,varname:node_3292,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-396-UVOUT,TEX-8466-TEX;n:type:ShaderForge.SFN_Tex2d,id:7384,x:32949,y:33102,varname:node_7384,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-5254-UVOUT,TEX-8466-TEX;n:type:ShaderForge.SFN_Panner,id:396,x:32661,y:32723,varname:node_396,prsc:2,spu:0.2,spv:0.3|UVIN-3035-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3035,x:32400,y:32927,varname:node_3035,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:5254,x:32661,y:33135,varname:node_5254,prsc:2,spu:-0.35,spv:-0.1|UVIN-3035-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3593,x:33134,y:32908,varname:node_3593,prsc:2|A-3292-R,B-7384-R;n:type:ShaderForge.SFN_VertexColor,id:1398,x:33134,y:33063,varname:node_1398,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7185,x:33659,y:32912,varname:node_7185,prsc:2|A-3593-OUT,B-1398-A;n:type:ShaderForge.SFN_Multiply,id:3541,x:33556,y:32599,varname:node_3541,prsc:2|A-3593-OUT,B-1856-RGB;n:type:ShaderForge.SFN_Color,id:1856,x:33351,y:32417,ptovrint:False,ptlb:node_1856,ptin:_node_1856,varname:node_1856,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2647059,c2:0.4827586,c3:1,c4:1;proporder:8466-1856;pass:END;sub:END;*/

Shader "Shader Forge/niuqupan" {
    Properties {
        _node_8466 ("node_8466", 2D) = "white" {}
        [HDR]_node_1856 ("node_1856", Color) = (0.2647059,0.4827586,1,1)
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
            uniform sampler2D _node_8466; uniform float4 _node_8466_ST;
            uniform float4 _node_1856;
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
                float4 node_992 = _Time;
                float2 node_396 = (i.uv0+node_992.g*float2(0.2,0.3));
                float4 node_3292 = tex2D(_node_8466,TRANSFORM_TEX(node_396, _node_8466));
                float2 node_5254 = (i.uv0+node_992.g*float2(-0.35,-0.1));
                float4 node_7384 = tex2D(_node_8466,TRANSFORM_TEX(node_5254, _node_8466));
                float node_3593 = (node_3292.r*node_7384.r);
                float3 emissive = (node_3593*_node_1856.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(node_3593*i.vertexColor.a));
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
