// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33170,y:32657,varname:node_9361,prsc:2|custl-2346-OUT;n:type:ShaderForge.SFN_TexCoord,id:8002,x:31322,y:32837,varname:node_8002,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:453,x:31622,y:32623,varname:node_453,prsc:2,spu:-1.5,spv:0|UVIN-8002-UVOUT;n:type:ShaderForge.SFN_Tex2dAsset,id:2624,x:31284,y:32612,ptovrint:False,ptlb:node_2624,ptin:_node_2624,varname:node_2624,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d91662f891091ee409e6b784b403d37d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2979,x:31871,y:32655,varname:node_2979,prsc:2,tex:d91662f891091ee409e6b784b403d37d,ntxv:0,isnm:False|UVIN-453-UVOUT,TEX-2624-TEX;n:type:ShaderForge.SFN_Tex2d,id:3382,x:31871,y:32837,varname:node_3382,prsc:2,tex:d91662f891091ee409e6b784b403d37d,ntxv:0,isnm:False|UVIN-776-UVOUT,TEX-2624-TEX;n:type:ShaderForge.SFN_Panner,id:776,x:31591,y:32835,varname:node_776,prsc:2,spu:-2,spv:0|UVIN-8002-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6131,x:32090,y:32760,varname:node_6131,prsc:2|A-2979-R,B-3382-R;n:type:ShaderForge.SFN_Multiply,id:9040,x:32265,y:32760,varname:node_9040,prsc:2|A-6131-OUT,B-1733-R;n:type:ShaderForge.SFN_Tex2d,id:1733,x:32112,y:33038,ptovrint:False,ptlb:node_1733,ptin:_node_1733,varname:node_1733,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:80d05b2d86a7d874bb7d0ba6caab47d8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3182,x:32469,y:32809,varname:node_3182,prsc:2|A-1733-R,B-9040-OUT;n:type:ShaderForge.SFN_Multiply,id:2200,x:32444,y:33068,varname:node_2200,prsc:2|A-1733-R,B-8786-OUT;n:type:ShaderForge.SFN_Vector1,id:8786,x:32254,y:33187,varname:node_8786,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Add,id:8804,x:32662,y:32925,varname:node_8804,prsc:2|A-3182-OUT,B-2200-OUT;n:type:ShaderForge.SFN_Multiply,id:2346,x:32919,y:32820,varname:node_2346,prsc:2|A-6090-RGB,B-8804-OUT,C-8683-OUT,D-6090-A;n:type:ShaderForge.SFN_VertexColor,id:6090,x:32682,y:33141,varname:node_6090,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:8683,x:32615,y:32676,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_8683,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:2624-1733-8683;pass:END;sub:END;*/

Shader "Shader Forge/piaodai" {
    Properties {
        _node_2624 ("node_2624", 2D) = "white" {}
        _node_1733 ("node_1733", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
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
            uniform sampler2D _node_2624; uniform float4 _node_2624_ST;
            uniform sampler2D _node_1733; uniform float4 _node_1733_ST;
            uniform float _Intensity;
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
                float4 _node_1733_var = tex2D(_node_1733,TRANSFORM_TEX(i.uv0, _node_1733));
                float4 node_1195 = _Time;
                float2 node_453 = (i.uv0+node_1195.g*float2(-1.5,0));
                float4 node_2979 = tex2D(_node_2624,TRANSFORM_TEX(node_453, _node_2624));
                float2 node_776 = (i.uv0+node_1195.g*float2(-2,0));
                float4 node_3382 = tex2D(_node_2624,TRANSFORM_TEX(node_776, _node_2624));
                float node_8804 = ((_node_1733_var.r*((node_2979.r*node_3382.r)*_node_1733_var.r))+(_node_1733_var.r*0.1));
                float3 finalColor = (i.vertexColor.rgb*node_8804*_Intensity*i.vertexColor.a);
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
