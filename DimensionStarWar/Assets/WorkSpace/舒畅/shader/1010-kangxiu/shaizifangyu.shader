// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33834,y:32747,varname:node_4013,prsc:2|emission-2985-OUT,alpha-3759-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:31941,y:32438,ptovrint:False,ptlb:wenlu,ptin:_wenlu,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.05147058,c2:0.5682557,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2261,x:31948,y:32811,ptovrint:False,ptlb:node_2261,ptin:_node_2261,varname:node_2261,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7f4c6e8d0424d8d4fa8937f3b8bd1688,ntxv:0,isnm:False|UVIN-4092-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9466,x:31941,y:32248,ptovrint:False,ptlb:node_9466,ptin:_node_9466,varname:node_9466,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:215d05ed807d165459bc4b85db1677e4,ntxv:0,isnm:False|UVIN-4092-UVOUT;n:type:ShaderForge.SFN_Add,id:2985,x:32709,y:32655,varname:node_2985,prsc:2|A-5762-OUT,B-2681-OUT,C-9874-OUT,D-3595-RGB,E-5128-OUT;n:type:ShaderForge.SFN_Add,id:293,x:32692,y:32897,varname:node_293,prsc:2|A-2261-R,B-9466-R,C-6016-OUT;n:type:ShaderForge.SFN_Tex2d,id:734,x:31941,y:32068,ptovrint:False,ptlb:node_734,ptin:_node_734,varname:node_734,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f10995371424fbb4daecef9ce0ef40dc,ntxv:0,isnm:False|UVIN-1716-UVOUT;n:type:ShaderForge.SFN_Panner,id:1716,x:31797,y:32068,varname:node_1716,prsc:2,spu:0,spv:0.3|UVIN-4092-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4092,x:31567,y:32068,varname:node_4092,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:2681,x:32180,y:32265,varname:node_2681,prsc:2|A-9466-R,B-1304-RGB;n:type:ShaderForge.SFN_Multiply,id:5762,x:32211,y:32903,varname:node_5762,prsc:2|A-2261-RGB,B-9644-RGB;n:type:ShaderForge.SFN_Color,id:9644,x:31948,y:33004,ptovrint:False,ptlb:dianshu,ptin:_dianshu,varname:node_9644,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.02941179,c2:0.4778906,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:3865,x:31922,y:33347,varname:node_3865,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Color,id:3595,x:31948,y:33178,ptovrint:False,ptlb:node_3595,ptin:_node_3595,varname:node_3595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1617647,c2:0.2022309,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6016,x:32150,y:33278,varname:node_6016,prsc:2|A-3595-B,B-3865-OUT;n:type:ShaderForge.SFN_Multiply,id:9874,x:32422,y:32242,varname:node_9874,prsc:2|A-734-R,B-2681-OUT;n:type:ShaderForge.SFN_Step,id:8691,x:32777,y:33710,varname:node_8691,prsc:2|A-8846-R,B-4767-OUT;n:type:ShaderForge.SFN_Step,id:9395,x:32774,y:33437,varname:node_9395,prsc:2|A-8846-R,B-9639-OUT;n:type:ShaderForge.SFN_Add,id:9639,x:32568,y:33437,varname:node_9639,prsc:2|A-91-OUT,B-4767-OUT;n:type:ShaderForge.SFN_Vector1,id:91,x:32376,y:33407,varname:node_91,prsc:2,v1:0.02;n:type:ShaderForge.SFN_Subtract,id:4893,x:33010,y:33577,varname:node_4893,prsc:2|A-9395-OUT,B-8691-OUT;n:type:ShaderForge.SFN_Multiply,id:3759,x:33480,y:33023,varname:node_3759,prsc:2|A-293-OUT,B-9395-OUT;n:type:ShaderForge.SFN_Color,id:8442,x:33010,y:33427,ptovrint:False,ptlb:rongjiebian,ptin:_rongjiebian,varname:node_8442,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1102941,c2:0.8895538,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:5128,x:33221,y:33427,varname:node_5128,prsc:2|A-8442-RGB,B-4893-OUT;n:type:ShaderForge.SFN_VertexColor,id:5851,x:31985,y:33435,varname:node_5851,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8846,x:32376,y:33675,ptovrint:False,ptlb:node_8846,ptin:_node_8846,varname:node_8846,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b00e862cb4ddb8448890c6d7e73c5505,ntxv:0,isnm:False|UVIN-3886-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3886,x:32195,y:33655,varname:node_3886,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Subtract,id:4767,x:32349,y:33489,varname:node_4767,prsc:2|A-5851-A,B-2988-OUT;n:type:ShaderForge.SFN_Vector1,id:2988,x:32015,y:33617,varname:node_2988,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Slider,id:1792,x:31755,y:33711,ptovrint:False,ptlb:node_1792,ptin:_node_1792,varname:node_1792,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6661351,max:1;proporder:1304-2261-9466-734-9644-3595-8442-8846-1792;pass:END;sub:END;*/

Shader "Shader Forge/shaizifangyu" {
    Properties {
        [HDR]_wenlu ("wenlu", Color) = (0.05147058,0.5682557,1,1)
        _node_2261 ("node_2261", 2D) = "white" {}
        _node_9466 ("node_9466", 2D) = "white" {}
        _node_734 ("node_734", 2D) = "white" {}
        [HDR]_dianshu ("dianshu", Color) = (0.02941179,0.4778906,1,1)
        _node_3595 ("node_3595", Color) = (0.1617647,0.2022309,1,1)
        [HDR]_rongjiebian ("rongjiebian", Color) = (0.1102941,0.8895538,1,1)
        _node_8846 ("node_8846", 2D) = "white" {}
        _node_1792 ("node_1792", Range(0, 1)) = 0.6661351
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
            uniform float4 _wenlu;
            uniform sampler2D _node_2261; uniform float4 _node_2261_ST;
            uniform sampler2D _node_9466; uniform float4 _node_9466_ST;
            uniform sampler2D _node_734; uniform float4 _node_734_ST;
            uniform float4 _dianshu;
            uniform float4 _node_3595;
            uniform float4 _rongjiebian;
            uniform sampler2D _node_8846; uniform float4 _node_8846_ST;
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
////// Emissive:
                float4 _node_2261_var = tex2D(_node_2261,TRANSFORM_TEX(i.uv0, _node_2261));
                float4 _node_9466_var = tex2D(_node_9466,TRANSFORM_TEX(i.uv0, _node_9466));
                float3 node_2681 = (_node_9466_var.r*_wenlu.rgb);
                float4 node_5334 = _Time;
                float2 node_1716 = (i.uv0+node_5334.g*float2(0,0.3));
                float4 _node_734_var = tex2D(_node_734,TRANSFORM_TEX(node_1716, _node_734));
                float4 _node_8846_var = tex2D(_node_8846,TRANSFORM_TEX(i.uv1, _node_8846));
                float node_4767 = (i.vertexColor.a-0.1);
                float node_9395 = step(_node_8846_var.r,(0.02+node_4767));
                float3 emissive = ((_node_2261_var.rgb*_dianshu.rgb)+node_2681+(_node_734_var.r*node_2681)+_node_3595.rgb+(_rongjiebian.rgb*(node_9395-step(_node_8846_var.r,node_4767))));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((_node_2261_var.r+_node_9466_var.r+(_node_3595.b*0.2))*node_9395));
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
