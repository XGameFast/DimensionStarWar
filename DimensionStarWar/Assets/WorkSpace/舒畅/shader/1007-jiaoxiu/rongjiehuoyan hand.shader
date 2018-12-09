// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33773,y:32706,varname:node_4013,prsc:2|custl-3909-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32841,y:32653,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:7108,x:32043,y:32857,varname:node_7108,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:5587,x:32253,y:32857,varname:node_5587,prsc:2,spu:0.5,spv:-1|UVIN-7108-UVOUT;n:type:ShaderForge.SFN_Panner,id:7739,x:32253,y:33044,varname:node_7739,prsc:2,spu:-0.7,spv:-0.7|UVIN-7108-UVOUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5000,x:32207,y:32652,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5000,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f6da0f1d159175148aaf4f33905b3f4d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6628,x:32420,y:32857,varname:node_6628,prsc:2,tex:f6da0f1d159175148aaf4f33905b3f4d,ntxv:0,isnm:False|UVIN-5587-UVOUT,TEX-5000-TEX;n:type:ShaderForge.SFN_Tex2d,id:6016,x:32420,y:33044,varname:node_6016,prsc:2,tex:f6da0f1d159175148aaf4f33905b3f4d,ntxv:0,isnm:False|UVIN-7739-UVOUT,TEX-5000-TEX;n:type:ShaderForge.SFN_Step,id:1608,x:32652,y:32990,varname:node_1608,prsc:2|A-6016-R,B-6628-R;n:type:ShaderForge.SFN_Multiply,id:5353,x:33020,y:33000,varname:node_5353,prsc:2|A-1608-OUT,B-6174-R,C-4400-OUT;n:type:ShaderForge.SFN_Multiply,id:3909,x:33506,y:32798,varname:node_3909,prsc:2|A-1304-RGB,B-4181-OUT,C-2128-OUT,D-2128-OUT,E-2128-OUT;n:type:ShaderForge.SFN_Multiply,id:2128,x:33393,y:33133,varname:node_2128,prsc:2|A-4181-OUT,B-9010-OUT,C-5622-A;n:type:ShaderForge.SFN_Slider,id:9010,x:32987,y:33224,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_9010,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Add,id:3481,x:32499,y:33254,varname:node_3481,prsc:2|A-6016-R,B-2793-OUT;n:type:ShaderForge.SFN_Vector1,id:2793,x:32317,y:33288,varname:node_2793,prsc:2,v1:0.02;n:type:ShaderForge.SFN_Divide,id:4400,x:32705,y:33232,varname:node_4400,prsc:2|A-6628-R,B-3481-OUT;n:type:ShaderForge.SFN_Clamp01,id:4181,x:33192,y:33000,varname:node_4181,prsc:2|IN-5353-OUT;n:type:ShaderForge.SFN_Tex2d,id:6174,x:32710,y:32789,ptovrint:False,ptlb:node_6174,ptin:_node_6174,varname:node_6174,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7da0332b47d17754baa6d352c51ac125,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:5622,x:33089,y:33323,varname:node_5622,prsc:2;proporder:1304-5000-9010-6174;pass:END;sub:END;*/

Shader "Shader Forge/rongjiehuoyan hand" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _alpha ("alpha", Range(0, 1)) = 1
        _node_6174 ("node_6174", 2D) = "white" {}
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
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _alpha;
            uniform sampler2D _node_6174; uniform float4 _node_6174_ST;
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
                float4 node_4383 = _Time;
                float2 node_7739 = (i.uv0+node_4383.g*float2(-0.7,-0.7));
                float4 node_6016 = tex2D(_MainTex,TRANSFORM_TEX(node_7739, _MainTex));
                float2 node_5587 = (i.uv0+node_4383.g*float2(0.5,-1));
                float4 node_6628 = tex2D(_MainTex,TRANSFORM_TEX(node_5587, _MainTex));
                float4 _node_6174_var = tex2D(_node_6174,TRANSFORM_TEX(i.uv0, _node_6174));
                float node_3481 = (node_6016.r+0.02);
                float node_4181 = saturate((step(node_6016.r,node_6628.r)*_node_6174_var.r*(node_6628.r/node_3481)));
                float node_2128 = (node_4181*_alpha*i.vertexColor.a);
                float3 finalColor = (_Color.rgb*node_4181*node_2128*node_2128*node_2128);
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
