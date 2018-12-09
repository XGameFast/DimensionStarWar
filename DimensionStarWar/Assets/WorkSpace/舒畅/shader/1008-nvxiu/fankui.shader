// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32831,y:33320,varname:node_9361,prsc:2|custl-9100-R,alpha-5223-OUT;n:type:ShaderForge.SFN_Tex2d,id:9100,x:32130,y:33534,ptovrint:False,ptlb:node_9100,ptin:_node_9100,varname:node_9100,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4e7dfe6e134d4434b82b0ae8f3c02265,ntxv:0,isnm:False|UVIN-5403-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3621,x:31699,y:33537,varname:node_3621,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:5403,x:31906,y:33537,varname:node_5403,prsc:2,spu:0,spv:-1|UVIN-3621-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1199,x:32203,y:33746,varname:node_1199,prsc:2|A-3621-V,B-3974-OUT,C-477-OUT;n:type:ShaderForge.SFN_OneMinus,id:3974,x:31856,y:33780,varname:node_3974,prsc:2|IN-3621-V;n:type:ShaderForge.SFN_OneMinus,id:8929,x:32009,y:33947,varname:node_8929,prsc:2|IN-3621-U;n:type:ShaderForge.SFN_Power,id:9992,x:32347,y:33954,varname:node_9992,prsc:2|VAL-9094-OUT,EXP-6734-OUT;n:type:ShaderForge.SFN_Multiply,id:9094,x:32190,y:33928,varname:node_9094,prsc:2|A-8929-OUT,B-6734-OUT;n:type:ShaderForge.SFN_Vector1,id:6734,x:32051,y:34094,varname:node_6734,prsc:2,v1:5;n:type:ShaderForge.SFN_Multiply,id:5223,x:32597,y:33721,varname:node_5223,prsc:2|A-9100-R,B-3183-OUT,C-1199-OUT;n:type:ShaderForge.SFN_Clamp01,id:3183,x:32507,y:34003,varname:node_3183,prsc:2|IN-9992-OUT;n:type:ShaderForge.SFN_Vector1,id:477,x:32034,y:33842,varname:node_477,prsc:2,v1:4;proporder:9100;pass:END;sub:END;*/

Shader "Shader Forge/fankui" {
    Properties {
        _node_9100 ("node_9100", 2D) = "white" {}
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
            uniform sampler2D _node_9100; uniform float4 _node_9100_ST;
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
                float4 node_825 = _Time;
                float2 node_5403 = (i.uv0+node_825.g*float2(0,-1));
                float4 _node_9100_var = tex2D(_node_9100,TRANSFORM_TEX(node_5403, _node_9100));
                float3 finalColor = float3(_node_9100_var.r,_node_9100_var.r,_node_9100_var.r);
                float node_6734 = 5.0;
                fixed4 finalRGBA = fixed4(finalColor,(_node_9100_var.r*saturate(pow(((1.0 - i.uv0.r)*node_6734),node_6734))*(i.uv0.g*(1.0 - i.uv0.g)*4.0)));
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
