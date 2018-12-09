// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32407,y:32645,varname:node_9361,prsc:2|custl-5384-OUT,alpha-3965-OUT;n:type:ShaderForge.SFN_TexCoord,id:2141,x:31571,y:32897,varname:node_2141,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6797,x:31886,y:32937,varname:node_6797,prsc:2|A-2141-V,B-3445-OUT,C-9264-OUT;n:type:ShaderForge.SFN_OneMinus,id:3445,x:31727,y:32965,varname:node_3445,prsc:2|IN-2141-V;n:type:ShaderForge.SFN_Vector1,id:9264,x:31727,y:33089,varname:node_9264,prsc:2,v1:4;n:type:ShaderForge.SFN_Multiply,id:3965,x:32050,y:32852,varname:node_3965,prsc:2|A-9313-R,B-6797-OUT,C-3392-A;n:type:ShaderForge.SFN_Panner,id:5588,x:31477,y:32691,varname:node_5588,prsc:2,spu:0,spv:-6|UVIN-4584-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4584,x:31315,y:32691,varname:node_4584,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:9313,x:31599,y:32506,ptovrint:False,ptlb:node_9313,ptin:_node_9313,varname:node_9313,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:85a5b2a10952c9c469476dcb64a2eda5,ntxv:0,isnm:False|UVIN-5588-UVOUT;n:type:ShaderForge.SFN_VertexColor,id:3392,x:32018,y:33022,varname:node_3392,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5384,x:32233,y:32703,varname:node_5384,prsc:2|A-3392-RGB,B-9313-R;proporder:9313;pass:END;sub:END;*/

Shader "Shader Forge/chixupianyi" {
    Properties {
        _node_9313 ("node_9313", 2D) = "white" {}
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
            uniform sampler2D _node_9313; uniform float4 _node_9313_ST;
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
                float4 node_4395 = _Time;
                float2 node_5588 = (i.uv0+node_4395.g*float2(0,-6));
                float4 _node_9313_var = tex2D(_node_9313,TRANSFORM_TEX(node_5588, _node_9313));
                float3 finalColor = (i.vertexColor.rgb*_node_9313_var.r);
                fixed4 finalRGBA = fixed4(finalColor,(_node_9313_var.r*(i.uv0.g*(1.0 - i.uv0.g)*4.0)*i.vertexColor.a));
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
