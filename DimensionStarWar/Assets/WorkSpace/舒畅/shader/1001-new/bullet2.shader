// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33872,y:32677,varname:node_9361,prsc:2|custl-4094-OUT,alpha-3003-OUT;n:type:ShaderForge.SFN_Tex2d,id:5392,x:32774,y:32780,ptovrint:False,ptlb:node_5392,ptin:_node_5392,varname:node_5392,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:80d05b2d86a7d874bb7d0ba6caab47d8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:4624,x:32357,y:33189,ptovrint:False,ptlb:node_4624,ptin:_node_4624,varname:node_4624,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d91662f891091ee409e6b784b403d37d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9875,x:32595,y:33016,varname:node_9875,prsc:2,tex:d91662f891091ee409e6b784b403d37d,ntxv:0,isnm:False|UVIN-9670-UVOUT,TEX-4624-TEX;n:type:ShaderForge.SFN_Tex2d,id:2564,x:32613,y:33361,varname:node_2564,prsc:2,tex:d91662f891091ee409e6b784b403d37d,ntxv:0,isnm:False|UVIN-8522-UVOUT,TEX-4624-TEX;n:type:ShaderForge.SFN_Panner,id:9670,x:32357,y:33006,varname:node_9670,prsc:2,spu:-1,spv:0|UVIN-8100-UVOUT;n:type:ShaderForge.SFN_Panner,id:8522,x:32381,y:33351,varname:node_8522,prsc:2,spu:-0.8,spv:0|UVIN-8100-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8100,x:32141,y:33208,varname:node_8100,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:2919,x:32835,y:33212,varname:node_2919,prsc:2|A-9875-R,B-2564-R;n:type:ShaderForge.SFN_Multiply,id:6663,x:33045,y:33056,varname:node_6663,prsc:2|A-5392-R,B-2919-OUT,C-6775-OUT;n:type:ShaderForge.SFN_Vector1,id:6775,x:32990,y:33246,varname:node_6775,prsc:2,v1:2;n:type:ShaderForge.SFN_Lerp,id:1746,x:33206,y:32976,varname:node_1746,prsc:2|A-5392-R,B-6663-OUT,T-273-OUT;n:type:ShaderForge.SFN_Slider,id:273,x:32833,y:32992,ptovrint:False,ptlb:node_273,ptin:_node_273,varname:node_273,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7521365,max:1;n:type:ShaderForge.SFN_Power,id:7159,x:33119,y:32726,varname:node_7159,prsc:2|VAL-5392-R,EXP-709-OUT;n:type:ShaderForge.SFN_Vector1,id:709,x:32908,y:32741,varname:node_709,prsc:2,v1:5;n:type:ShaderForge.SFN_Add,id:5191,x:33400,y:32976,varname:node_5191,prsc:2|A-7159-OUT,B-1746-OUT;n:type:ShaderForge.SFN_Multiply,id:4094,x:33660,y:32824,varname:node_4094,prsc:2|A-2163-RGB,B-5191-OUT;n:type:ShaderForge.SFN_Color,id:2163,x:33413,y:32727,ptovrint:False,ptlb:node_2163,ptin:_node_2163,varname:node_2163,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5336028,c2:0.9779412,c3:0.1725778,c4:1;n:type:ShaderForge.SFN_Step,id:3003,x:33660,y:33009,varname:node_3003,prsc:2|A-8299-OUT,B-5191-OUT;n:type:ShaderForge.SFN_Slider,id:8299,x:33287,y:33139,ptovrint:False,ptlb:node_8299,ptin:_node_8299,varname:node_8299,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4017099,max:1;proporder:5392-4624-273-2163-8299;pass:END;sub:END;*/

Shader "Shader Forge/bullet2" {
    Properties {
        _node_5392 ("node_5392", 2D) = "white" {}
        _node_4624 ("node_4624", 2D) = "white" {}
        _node_273 ("node_273", Range(0, 1)) = 0.7521365
        [HDR]_node_2163 ("node_2163", Color) = (0.5336028,0.9779412,0.1725778,1)
        _node_8299 ("node_8299", Range(0, 1)) = 0.4017099
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
            uniform sampler2D _node_5392; uniform float4 _node_5392_ST;
            uniform sampler2D _node_4624; uniform float4 _node_4624_ST;
            uniform float _node_273;
            uniform float4 _node_2163;
            uniform float _node_8299;
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
                float4 _node_5392_var = tex2D(_node_5392,TRANSFORM_TEX(i.uv0, _node_5392));
                float4 node_7343 = _Time;
                float2 node_9670 = (i.uv0+node_7343.g*float2(-1,0));
                float4 node_9875 = tex2D(_node_4624,TRANSFORM_TEX(node_9670, _node_4624));
                float2 node_8522 = (i.uv0+node_7343.g*float2(-0.8,0));
                float4 node_2564 = tex2D(_node_4624,TRANSFORM_TEX(node_8522, _node_4624));
                float node_5191 = (pow(_node_5392_var.r,5.0)+lerp(_node_5392_var.r,(_node_5392_var.r*(node_9875.r*node_2564.r)*2.0),_node_273));
                float3 finalColor = (_node_2163.rgb*node_5191);
                fixed4 finalRGBA = fixed4(finalColor,step(_node_8299,node_5191));
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
