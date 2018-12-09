// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33395,y:32736,varname:node_4013,prsc:2|emission-6956-OUT,alpha-2924-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32386,y:33655,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.3931034,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2d,id:596,x:32579,y:32684,ptovrint:False,ptlb:node_596,ptin:_node_596,varname:node_596,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e10090df11b9c354abf588986eed13c3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4095,x:32386,y:33454,ptovrint:False,ptlb:node_4095,ptin:_node_4095,varname:node_4095,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4b633d92ef2c9254e908b3a91367a7cd,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:9203,x:32598,y:32864,varname:node_9203,prsc:2|A-7867-OUT,B-4226-R;n:type:ShaderForge.SFN_Slider,id:7867,x:32233,y:32856,ptovrint:False,ptlb:node_7867,ptin:_node_7867,varname:node_7867,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2905983,max:1;n:type:ShaderForge.SFN_Multiply,id:1393,x:32878,y:32886,varname:node_1393,prsc:2|A-596-R,B-9203-OUT;n:type:ShaderForge.SFN_Tex2d,id:4226,x:32419,y:32989,ptovrint:False,ptlb:node_4226,ptin:_node_4226,varname:node_4226,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4111b3c9994f3374e94fe5e7a7529aaa,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:2234,x:32215,y:33246,varname:node_2234,prsc:2,spu:0.1,spv:0.05|UVIN-7196-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7196,x:32053,y:33246,varname:node_7196,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:5223,x:32677,y:33289,varname:node_5223,prsc:2|A-2519-R,B-4095-R,C-1304-RGB;n:type:ShaderForge.SFN_Add,id:2924,x:33046,y:32987,varname:node_2924,prsc:2|A-1393-OUT,B-2624-OUT;n:type:ShaderForge.SFN_Tex2d,id:2519,x:32386,y:33263,ptovrint:False,ptlb:node_2519,ptin:_node_2519,varname:node_2519,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2234-UVOUT;n:type:ShaderForge.SFN_Vector1,id:5514,x:32623,y:33548,varname:node_5514,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:2624,x:32818,y:33486,varname:node_2624,prsc:2|A-4095-R,B-5514-OUT;n:type:ShaderForge.SFN_Tex2d,id:7360,x:31510,y:33258,ptovrint:False,ptlb:node_7360,ptin:_node_7360,varname:node_7360,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f15404cf047b0804c8a781f8479ee5da,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:6956,x:33194,y:32577,varname:node_6956,prsc:2|A-596-R,B-5223-OUT,T-9374-OUT;n:type:ShaderForge.SFN_Vector1,id:9374,x:32965,y:32515,varname:node_9374,prsc:2,v1:0.5;proporder:1304-596-7867-4226-4095-2519;pass:END;sub:END;*/

Shader "Shader Forge/danhen" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,0.3931034,0,1)
        _node_596 ("node_596", 2D) = "white" {}
        _node_7867 ("node_7867", Range(0, 1)) = 0.2905983
        _node_4226 ("node_4226", 2D) = "white" {}
        _node_4095 ("node_4095", 2D) = "white" {}
        _node_2519 ("node_2519", 2D) = "white" {}
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
            uniform float4 _Color;
            uniform sampler2D _node_596; uniform float4 _node_596_ST;
            uniform sampler2D _node_4095; uniform float4 _node_4095_ST;
            uniform float _node_7867;
            uniform sampler2D _node_4226; uniform float4 _node_4226_ST;
            uniform sampler2D _node_2519; uniform float4 _node_2519_ST;
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
////// Emissive:
                float4 _node_596_var = tex2D(_node_596,TRANSFORM_TEX(i.uv0, _node_596));
                float4 node_2155 = _Time;
                float2 node_2234 = (i.uv0+node_2155.g*float2(0.1,0.05));
                float4 _node_2519_var = tex2D(_node_2519,TRANSFORM_TEX(node_2234, _node_2519));
                float4 _node_4095_var = tex2D(_node_4095,TRANSFORM_TEX(i.uv0, _node_4095));
                float3 emissive = lerp(float3(_node_596_var.r,_node_596_var.r,_node_596_var.r),(_node_2519_var.r*_node_4095_var.r*_Color.rgb),0.5);
                float3 finalColor = emissive;
                float4 _node_4226_var = tex2D(_node_4226,TRANSFORM_TEX(i.uv0, _node_4226));
                fixed4 finalRGBA = fixed4(finalColor,((_node_596_var.r*step(_node_7867,_node_4226_var.r))+(_node_4095_var.r*3.0)));
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
