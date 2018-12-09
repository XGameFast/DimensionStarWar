// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33477,y:32658,varname:node_9361,prsc:2|custl-1753-OUT,alpha-7267-OUT;n:type:ShaderForge.SFN_TexCoord,id:6330,x:32448,y:32870,varname:node_6330,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:7348,x:32635,y:32870,ptovrint:False,ptlb:1,ptin:_1,varname:node_7348,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5e6d4679045bd5b4583f123909ddfbfb,ntxv:0,isnm:False|UVIN-6330-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9881,x:32635,y:33069,ptovrint:False,ptlb:node_9881,ptin:_node_9881,varname:node_9881,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eface21f3d925b14db56d7481fda443b,ntxv:0,isnm:False|UVIN-5734-UVOUT;n:type:ShaderForge.SFN_Panner,id:5734,x:32467,y:33069,varname:node_5734,prsc:2,spu:0,spv:1|UVIN-6449-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6449,x:32296,y:33069,varname:node_6449,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:6411,x:33010,y:32892,varname:node_6411,prsc:2|A-7348-R,B-4175-OUT;n:type:ShaderForge.SFN_Multiply,id:4175,x:32831,y:32979,varname:node_4175,prsc:2|A-7348-R,B-9881-R,C-8489-OUT;n:type:ShaderForge.SFN_VertexColor,id:4379,x:33010,y:32760,varname:node_4379,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:8489,x:32635,y:33262,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_8489,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:1753,x:33262,y:32760,varname:node_1753,prsc:2|A-4379-RGB,B-6411-OUT;n:type:ShaderForge.SFN_Multiply,id:7267,x:33286,y:32907,varname:node_7267,prsc:2|A-4379-A,B-6411-OUT;proporder:7348-9881-8489;pass:END;sub:END;*/

Shader "Shader Forge/touchui" {
    Properties {
        _1 ("1", 2D) = "white" {}
        _node_9881 ("node_9881", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1.5
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
            uniform sampler2D _1; uniform float4 _1_ST;
            uniform sampler2D _node_9881; uniform float4 _node_9881_ST;
            uniform float _Intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 _1_var = tex2D(_1,TRANSFORM_TEX(i.uv1, _1));
                float4 node_9479 = _Time;
                float2 node_5734 = (i.uv0+node_9479.g*float2(0,1));
                float4 _node_9881_var = tex2D(_node_9881,TRANSFORM_TEX(node_5734, _node_9881));
                float node_6411 = (_1_var.r+(_1_var.r*_node_9881_var.r*_Intensity));
                float3 finalColor = (i.vertexColor.rgb*node_6411);
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*node_6411));
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
