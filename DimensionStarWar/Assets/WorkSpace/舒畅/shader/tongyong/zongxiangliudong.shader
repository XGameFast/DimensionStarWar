// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33591,y:32716,varname:node_9361,prsc:2|custl-4773-OUT,alpha-2509-OUT;n:type:ShaderForge.SFN_Tex2d,id:4071,x:32538,y:32944,ptovrint:False,ptlb:node_4071,ptin:_node_4071,varname:node_4071,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8e74affc173e245458802e6a382dde59,ntxv:0,isnm:False|UVIN-7465-UVOUT;n:type:ShaderForge.SFN_Panner,id:7465,x:32381,y:32951,varname:node_7465,prsc:2,spu:0,spv:-1|UVIN-4164-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4164,x:32162,y:32951,varname:node_4164,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1930,x:32538,y:33175,varname:node_1930,prsc:2|A-4164-V,B-4927-OUT;n:type:ShaderForge.SFN_OneMinus,id:4927,x:32301,y:33204,varname:node_4927,prsc:2|IN-4164-V;n:type:ShaderForge.SFN_Multiply,id:2960,x:32692,y:33192,varname:node_2960,prsc:2|A-1930-OUT,B-1186-OUT;n:type:ShaderForge.SFN_Vector1,id:1186,x:32524,y:33298,varname:node_1186,prsc:2,v1:4;n:type:ShaderForge.SFN_Power,id:9636,x:32881,y:33158,varname:node_9636,prsc:2|VAL-2960-OUT,EXP-4356-OUT;n:type:ShaderForge.SFN_Vector1,id:4356,x:32676,y:33328,varname:node_4356,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:8728,x:33029,y:33009,varname:node_8728,prsc:2|A-4071-R,B-9636-OUT;n:type:ShaderForge.SFN_VertexColor,id:1744,x:33041,y:33158,varname:node_1744,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2509,x:33310,y:33091,varname:node_2509,prsc:2|A-8728-OUT,B-1744-A;n:type:ShaderForge.SFN_Multiply,id:4773,x:33386,y:32937,varname:node_4773,prsc:2|A-8728-OUT,B-1744-RGB;proporder:4071;pass:END;sub:END;*/

Shader "Shader Forge/zongxiangliudong" {
    Properties {
        _node_4071 ("node_4071", 2D) = "white" {}
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
            uniform sampler2D _node_4071; uniform float4 _node_4071_ST;
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
                float4 node_641 = _Time;
                float2 node_7465 = (i.uv0+node_641.g*float2(0,-1));
                float4 _node_4071_var = tex2D(_node_4071,TRANSFORM_TEX(node_7465, _node_4071));
                float node_8728 = (_node_4071_var.r*pow(((i.uv0.g*(1.0 - i.uv0.g))*4.0),2.0));
                float3 finalColor = (node_8728*i.vertexColor.rgb);
                fixed4 finalRGBA = fixed4(finalColor,(node_8728*i.vertexColor.a));
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
