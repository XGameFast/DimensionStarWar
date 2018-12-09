// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33602,y:32619,varname:node_4013,prsc:2|emission-881-OUT,alpha-8798-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32523,y:32877,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.25,c2:0.3793104,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6244,x:32309,y:33305,ptovrint:False,ptlb:node_6244,ptin:_node_6244,varname:node_6244,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:07586f7a4f9f26b4c94a1e9a15d23ab4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:820,x:32523,y:32518,ptovrint:False,ptlb:node_820,ptin:_node_820,varname:node_820,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:06dee04d7ea22fb43998f9cbff558da5,ntxv:0,isnm:False|UVIN-3088-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6589,x:32523,y:32704,ptovrint:False,ptlb:node_6589,ptin:_node_6589,varname:node_6589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0231329199d10a44b911680c40dc975e,ntxv:0,isnm:False|UVIN-9023-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:548,x:32496,y:32285,ptovrint:False,ptlb:node_548,ptin:_node_548,varname:node_548,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:20294435796a70a44b512a1aab4a56a3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5334,x:32969,y:32767,ptovrint:False,ptlb:node_5334,ptin:_node_5334,varname:node_5334,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:954f8b32c4db4c1499dd0d4a98d50e5e,ntxv:0,isnm:False|UVIN-3933-UVOUT;n:type:ShaderForge.SFN_Slider,id:927,x:32231,y:33139,ptovrint:False,ptlb:node_927,ptin:_node_927,varname:node_927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Step,id:2784,x:32641,y:33186,varname:node_2784,prsc:2|A-927-OUT,B-6244-R;n:type:ShaderForge.SFN_TexCoord,id:3933,x:32804,y:32822,varname:node_3933,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:3088,x:32344,y:32518,varname:node_3088,prsc:2,spu:0,spv:0.5|UVIN-2021-UVOUT;n:type:ShaderForge.SFN_Panner,id:9023,x:32344,y:32704,varname:node_9023,prsc:2,spu:0,spv:-0.3|UVIN-2021-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2021,x:32131,y:32548,varname:node_2021,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:5750,x:32727,y:32594,varname:node_5750,prsc:2|A-820-R,B-6589-R;n:type:ShaderForge.SFN_Multiply,id:5371,x:32899,y:32594,varname:node_5371,prsc:2|A-5750-OUT,B-1304-RGB;n:type:ShaderForge.SFN_Tex2d,id:1636,x:32496,y:32095,ptovrint:False,ptlb:node_1636,ptin:_node_1636,varname:node_1636,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f15404cf047b0804c8a781f8479ee5da,ntxv:0,isnm:False|UVIN-9385-UVOUT;n:type:ShaderForge.SFN_Power,id:8345,x:32685,y:32285,varname:node_8345,prsc:2|VAL-548-R,EXP-1913-OUT;n:type:ShaderForge.SFN_Vector1,id:1913,x:32496,y:32448,varname:node_1913,prsc:2,v1:2;n:type:ShaderForge.SFN_Panner,id:9385,x:32311,y:32102,varname:node_9385,prsc:2,spu:1,spv:1|UVIN-1416-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1416,x:32088,y:32118,varname:node_1416,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6704,x:32832,y:32219,varname:node_6704,prsc:2|A-1636-R,B-8345-OUT;n:type:ShaderForge.SFN_Color,id:675,x:32832,y:32050,ptovrint:False,ptlb:node_675,ptin:_node_675,varname:node_675,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4740484,c2:0.8087431,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:881,x:33271,y:32406,varname:node_881,prsc:2|A-2313-OUT,B-5371-OUT,C-3248-OUT;n:type:ShaderForge.SFN_Multiply,id:3248,x:33204,y:32719,varname:node_3248,prsc:2|A-5334-R,B-7544-RGB;n:type:ShaderForge.SFN_Color,id:7544,x:32995,y:32948,ptovrint:False,ptlb:node_7544,ptin:_node_7544,varname:node_7544,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.25,c2:0.8758624,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:218,x:33247,y:33048,varname:node_218,prsc:2|A-6704-OUT,B-5750-OUT,C-5334-R;n:type:ShaderForge.SFN_Multiply,id:2313,x:33054,y:32179,varname:node_2313,prsc:2|A-675-RGB,B-6704-OUT;n:type:ShaderForge.SFN_Multiply,id:8798,x:33456,y:33068,varname:node_8798,prsc:2|A-218-OUT,B-2784-OUT;proporder:1304-6244-927-5334-820-6589-548-1636-675-7544;pass:END;sub:END;*/

Shader "Shader Forge/niuxiudun" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.25,0.3793104,1,1)
        _node_6244 ("node_6244", 2D) = "white" {}
        _node_927 ("node_927", Range(0, 1)) = 0
        _node_5334 ("node_5334", 2D) = "white" {}
        _node_820 ("node_820", 2D) = "white" {}
        _node_6589 ("node_6589", 2D) = "white" {}
        _node_548 ("node_548", 2D) = "white" {}
        _node_1636 ("node_1636", 2D) = "white" {}
        [HDR]_node_675 ("node_675", Color) = (0.4740484,0.8087431,1,1)
        [HDR]_node_7544 ("node_7544", Color) = (0.25,0.8758624,1,1)
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
            uniform sampler2D _node_6244; uniform float4 _node_6244_ST;
            uniform sampler2D _node_820; uniform float4 _node_820_ST;
            uniform sampler2D _node_6589; uniform float4 _node_6589_ST;
            uniform sampler2D _node_548; uniform float4 _node_548_ST;
            uniform sampler2D _node_5334; uniform float4 _node_5334_ST;
            uniform float _node_927;
            uniform sampler2D _node_1636; uniform float4 _node_1636_ST;
            uniform float4 _node_675;
            uniform float4 _node_7544;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_3367 = _Time;
                float2 node_9385 = (i.uv0+node_3367.g*float2(1,1));
                float4 _node_1636_var = tex2D(_node_1636,TRANSFORM_TEX(node_9385, _node_1636));
                float4 _node_548_var = tex2D(_node_548,TRANSFORM_TEX(i.uv0, _node_548));
                float node_6704 = (_node_1636_var.r*pow(_node_548_var.r,2.0));
                float2 node_3088 = (i.uv0+node_3367.g*float2(0,0.5));
                float4 _node_820_var = tex2D(_node_820,TRANSFORM_TEX(node_3088, _node_820));
                float2 node_9023 = (i.uv0+node_3367.g*float2(0,-0.3));
                float4 _node_6589_var = tex2D(_node_6589,TRANSFORM_TEX(node_9023, _node_6589));
                float node_5750 = (_node_820_var.r+_node_6589_var.r);
                float4 _node_5334_var = tex2D(_node_5334,TRANSFORM_TEX(i.uv1, _node_5334));
                float3 emissive = ((_node_675.rgb*node_6704)+(node_5750*_Color.rgb)+(_node_5334_var.r*_node_7544.rgb));
                float3 finalColor = emissive;
                float4 _node_6244_var = tex2D(_node_6244,TRANSFORM_TEX(i.uv0, _node_6244));
                fixed4 finalRGBA = fixed4(finalColor,((node_6704+node_5750+_node_5334_var.r)*step(_node_927,_node_6244_var.r)));
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
