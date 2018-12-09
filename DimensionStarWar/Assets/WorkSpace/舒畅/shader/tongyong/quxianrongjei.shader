// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32996,y:32854,varname:node_4013,prsc:2|custl-8433-OUT,alpha-3790-OUT;n:type:ShaderForge.SFN_Tex2d,id:268,x:32040,y:32953,ptovrint:False,ptlb:node_268,ptin:_node_268,varname:node_268,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dd02387b2d9e12441bd1a0eb77293168,ntxv:0,isnm:False|UVIN-2639-OUT;n:type:ShaderForge.SFN_Step,id:5240,x:32359,y:32992,varname:node_5240,prsc:2|A-4358-OUT,B-268-R;n:type:ShaderForge.SFN_Slider,id:1681,x:31055,y:33227,ptovrint:False,ptlb:rongjie,ptin:_rongjie,varname:node_1681,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Step,id:6377,x:32359,y:33197,varname:node_6377,prsc:2|A-3535-OUT,B-268-R;n:type:ShaderForge.SFN_Subtract,id:3790,x:32581,y:33088,varname:node_3790,prsc:2|A-5240-OUT,B-6377-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9988,x:31327,y:32837,ptovrint:False,ptlb:node_9988,ptin:_node_9988,varname:node_9988,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8780,x:31537,y:32668,varname:node_8780,prsc:2,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False|UVIN-3335-UVOUT,TEX-9988-TEX;n:type:ShaderForge.SFN_Tex2d,id:7030,x:31542,y:33006,varname:node_7030,prsc:2,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False|UVIN-4519-UVOUT,TEX-9988-TEX;n:type:ShaderForge.SFN_Panner,id:3335,x:31327,y:32668,varname:node_3335,prsc:2,spu:0.2,spv:0.3|UVIN-6071-UVOUT;n:type:ShaderForge.SFN_Panner,id:4519,x:31327,y:33006,varname:node_4519,prsc:2,spu:-0.35,spv:-0.15|UVIN-6071-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6071,x:31080,y:32809,varname:node_6071,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:3326,x:31713,y:32777,varname:node_3326,prsc:2|A-8780-R,B-7030-R,C-7280-OUT;n:type:ShaderForge.SFN_Add,id:2639,x:31881,y:32867,varname:node_2639,prsc:2|A-3326-OUT,B-4474-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4474,x:31713,y:32991,varname:node_4474,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:7280,x:31450,y:32887,ptovrint:False,ptlb:UV niuqu,ptin:_UVniuqu,varname:node_7280,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.08208238,max:1;n:type:ShaderForge.SFN_RemapRange,id:8074,x:31832,y:33305,varname:node_8074,prsc:2,frmn:0.15,frmx:1,tomn:0,tomx:0.15|IN-4358-OUT;n:type:ShaderForge.SFN_Add,id:3535,x:32144,y:33244,varname:node_3535,prsc:2|A-4358-OUT,B-8074-OUT;n:type:ShaderForge.SFN_Multiply,id:8433,x:32793,y:32921,varname:node_8433,prsc:2|A-4368-RGB,B-3790-OUT;n:type:ShaderForge.SFN_Color,id:4368,x:32531,y:32706,ptovrint:False,ptlb:Main color,ptin:_Maincolor,varname:node_4368,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_RemapRange,id:4358,x:31443,y:33295,varname:node_4358,prsc:2,frmn:0,frmx:1,tomn:0.15,tomx:1|IN-1681-OUT;proporder:268-1681-9988-7280-4368;pass:END;sub:END;*/

Shader "Shader Forge/quxianrongjei" {
    Properties {
        _node_268 ("node_268", 2D) = "white" {}
        _rongjie ("rongjie", Range(0, 1)) = 0
        _node_9988 ("node_9988", 2D) = "white" {}
        _UVniuqu ("UV niuqu", Range(0, 1)) = 0.08208238
        _Maincolor ("Main color", Color) = (1,1,1,1)
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
            uniform sampler2D _node_268; uniform float4 _node_268_ST;
            uniform float _rongjie;
            uniform sampler2D _node_9988; uniform float4 _node_9988_ST;
            uniform float _UVniuqu;
            uniform float4 _Maincolor;
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
                float node_4358 = (_rongjie*0.85+0.15);
                float4 node_3231 = _Time;
                float2 node_3335 = (i.uv0+node_3231.g*float2(0.2,0.3));
                float4 node_8780 = tex2D(_node_9988,TRANSFORM_TEX(node_3335, _node_9988));
                float2 node_4519 = (i.uv0+node_3231.g*float2(-0.35,-0.15));
                float4 node_7030 = tex2D(_node_9988,TRANSFORM_TEX(node_4519, _node_9988));
                float2 node_2639 = ((node_8780.r*node_7030.r*_UVniuqu)+i.uv0);
                float4 _node_268_var = tex2D(_node_268,TRANSFORM_TEX(node_2639, _node_268));
                float node_3790 = (step(node_4358,_node_268_var.r)-step((node_4358+(node_4358*0.1764706+-0.02647059)),_node_268_var.r));
                float3 finalColor = (_Maincolor.rgb*node_3790);
                fixed4 finalRGBA = fixed4(finalColor,node_3790);
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
