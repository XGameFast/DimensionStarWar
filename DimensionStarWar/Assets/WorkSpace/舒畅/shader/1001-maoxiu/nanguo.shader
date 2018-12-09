// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33467,y:32691,varname:node_9361,prsc:2|emission-5261-OUT,alpha-2511-OUT;n:type:ShaderForge.SFN_Tex2d,id:6689,x:32424,y:33024,ptovrint:False,ptlb:node_6689,ptin:_node_6689,varname:node_6689,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:068ce1583ba0d794681c528cdc63e910,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4966,x:32424,y:32672,ptovrint:False,ptlb:node_4966,ptin:_node_4966,varname:node_4966,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:54a9e93bd528c7046a2c76a0d41e9907,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4192,x:32424,y:32845,ptovrint:False,ptlb:node_4192,ptin:_node_4192,varname:node_4192,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:63f90b1b6bdfc1d46956a292097d6f22,ntxv:0,isnm:False|UVIN-2506-UVOUT;n:type:ShaderForge.SFN_Panner,id:2506,x:32260,y:32845,varname:node_2506,prsc:2,spu:0,spv:1|UVIN-1317-UVOUT,DIST-1849-A;n:type:ShaderForge.SFN_TexCoord,id:1317,x:32091,y:32845,varname:node_1317,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:2886,x:32616,y:32689,varname:node_2886,prsc:2|A-4966-R,B-4192-R;n:type:ShaderForge.SFN_VertexColor,id:1849,x:32635,y:33230,varname:node_1849,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2511,x:33272,y:33021,varname:node_2511,prsc:2|A-8087-OUT,B-1849-A;n:type:ShaderForge.SFN_Color,id:3613,x:32424,y:32497,ptovrint:False,ptlb:node_3613,ptin:_node_3613,varname:node_3613,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9038,x:32913,y:32599,varname:node_9038,prsc:2|A-3613-RGB,B-2886-OUT;n:type:ShaderForge.SFN_Clamp01,id:8477,x:32852,y:33041,varname:node_8477,prsc:2|IN-7874-OUT;n:type:ShaderForge.SFN_Subtract,id:7874,x:32659,y:33041,varname:node_7874,prsc:2|A-6689-R,B-2886-OUT;n:type:ShaderForge.SFN_Multiply,id:2188,x:33025,y:32787,varname:node_2188,prsc:2|A-8477-OUT,B-1849-RGB;n:type:ShaderForge.SFN_Add,id:8087,x:33045,y:33021,varname:node_8087,prsc:2|A-2886-OUT,B-8477-OUT;n:type:ShaderForge.SFN_Add,id:5261,x:33191,y:32669,varname:node_5261,prsc:2|A-9038-OUT,B-2188-OUT;proporder:4966-4192-6689-3613;pass:END;sub:END;*/

Shader "Shader Forge/nanguo" {
    Properties {
        _node_4966 ("node_4966", 2D) = "white" {}
        _node_4192 ("node_4192", 2D) = "white" {}
        _node_6689 ("node_6689", 2D) = "white" {}
        _node_3613 ("node_3613", Color) = (0,0,0,1)
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
            uniform sampler2D _node_6689; uniform float4 _node_6689_ST;
            uniform sampler2D _node_4966; uniform float4 _node_4966_ST;
            uniform sampler2D _node_4192; uniform float4 _node_4192_ST;
            uniform float4 _node_3613;
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
                float4 _node_4966_var = tex2D(_node_4966,TRANSFORM_TEX(i.uv0, _node_4966));
                float2 node_2506 = (i.uv0+i.vertexColor.a*float2(0,1));
                float4 _node_4192_var = tex2D(_node_4192,TRANSFORM_TEX(node_2506, _node_4192));
                float node_2886 = (_node_4966_var.r*_node_4192_var.r);
                float4 _node_6689_var = tex2D(_node_6689,TRANSFORM_TEX(i.uv0, _node_6689));
                float node_8477 = saturate((_node_6689_var.r-node_2886));
                float3 emissive = ((_node_3613.rgb*node_2886)+(node_8477*i.vertexColor.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((node_2886+node_8477)*i.vertexColor.a));
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
