// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:36173,y:32309,varname:node_4013,prsc:2|emission-8173-OUT,alpha-4212-R;n:type:ShaderForge.SFN_Color,id:1304,x:35329,y:32999,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:6134,x:33029,y:32961,varname:node_6134,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:4212,x:34328,y:32255,ptovrint:False,ptlb:node_4212,ptin:_node_4212,varname:node_4212,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4ef1fdc004d5f674395556ed9f59dbed,ntxv:0,isnm:False|UVIN-9366-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2096,x:32974,y:32559,ptovrint:False,ptlb:node_2096,ptin:_node_2096,varname:node_2096,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:77b70e79a6d16f44e9ae27b5675becc9,ntxv:0,isnm:False|UVIN-1043-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5016,x:32974,y:32363,ptovrint:False,ptlb:node_5016,ptin:_node_5016,varname:node_5016,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1c13640c96576d24f894a3b059c065d6,ntxv:0,isnm:False|UVIN-2158-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5637,x:33777,y:32512,ptovrint:False,ptlb:node_5637,ptin:_node_5637,varname:node_5637,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f7279f0df475ff548b6807c3f0b0dc7d,ntxv:0,isnm:False|UVIN-663-UVOUT;n:type:ShaderForge.SFN_Panner,id:2158,x:32794,y:32363,varname:node_2158,prsc:2,spu:0.05,spv:-0.05|UVIN-1328-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1328,x:32599,y:32363,varname:node_1328,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:1043,x:32794,y:32559,varname:node_1043,prsc:2,spu:-0.1,spv:0.15|UVIN-5970-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5970,x:32599,y:32559,varname:node_5970,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4399,x:33153,y:32508,varname:node_4399,prsc:2|A-5016-R,B-2096-R;n:type:ShaderForge.SFN_Add,id:852,x:33431,y:32512,varname:node_852,prsc:2|A-4361-OUT,B-1472-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1472,x:33205,y:32667,varname:node_1472,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:663,x:33604,y:32512,varname:node_663,prsc:2,spu:-0.1,spv:0.1|UVIN-852-OUT;n:type:ShaderForge.SFN_Multiply,id:8620,x:34043,y:32512,varname:node_8620,prsc:2|A-5681-OUT,B-1941-R;n:type:ShaderForge.SFN_Rotator,id:6972,x:33604,y:32750,varname:node_6972,prsc:2|UVIN-5000-UVOUT,SPD-2110-OUT;n:type:ShaderForge.SFN_TexCoord,id:5000,x:33391,y:32750,varname:node_5000,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Vector1,id:2110,x:33455,y:32952,varname:node_2110,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:3494,x:34515,y:32520,varname:node_3494,prsc:2|A-2894-OUT,B-1071-OUT;n:type:ShaderForge.SFN_Slider,id:1071,x:34201,y:32778,ptovrint:False,ptlb:node_1071,ptin:_node_1071,varname:node_1071,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6220599,max:1;n:type:ShaderForge.SFN_TexCoord,id:9366,x:34049,y:32228,varname:node_9366,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:6523,x:34025,y:32920,ptovrint:False,ptlb:node_6523,ptin:_node_6523,varname:node_6523,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6de5aa0482de57d43ae79e64e3fd91ef,ntxv:0,isnm:False|UVIN-7116-UVOUT;n:type:ShaderForge.SFN_Add,id:2894,x:34218,y:32600,varname:node_2894,prsc:2|A-8620-OUT,B-6523-R;n:type:ShaderForge.SFN_TexCoord,id:7116,x:33845,y:32920,varname:node_7116,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:1941,x:33890,y:32755,ptovrint:False,ptlb:node_1941,ptin:_node_1941,varname:node_1941,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:274543bcd91246e46a52b55bc7d81688,ntxv:0,isnm:False|UVIN-6972-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3873,x:34785,y:32545,varname:node_3873,prsc:2|A-4212-R,B-3494-OUT;n:type:ShaderForge.SFN_Multiply,id:3596,x:35009,y:32545,varname:node_3596,prsc:2|A-3873-OUT,B-1304-RGB;n:type:ShaderForge.SFN_Step,id:1058,x:34588,y:32669,varname:node_1058,prsc:2|A-1071-OUT,B-2894-OUT;n:type:ShaderForge.SFN_Tex2d,id:3661,x:34483,y:33244,ptovrint:False,ptlb:node_3661,ptin:_node_3661,varname:node_3661,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:746ee6ed9d3cb0c498118d8d6dc570b2,ntxv:0,isnm:False|UVIN-5786-UVOUT;n:type:ShaderForge.SFN_Rotator,id:5786,x:34282,y:33244,varname:node_5786,prsc:2|UVIN-1091-UVOUT,SPD-7623-OUT;n:type:ShaderForge.SFN_TexCoord,id:1091,x:34063,y:33244,varname:node_1091,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Vector1,id:7623,x:34133,y:33435,varname:node_7623,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:3785,x:34847,y:32854,varname:node_3785,prsc:2|A-1058-OUT,B-144-OUT,C-1372-OUT;n:type:ShaderForge.SFN_Add,id:7768,x:35225,y:32627,varname:node_7768,prsc:2|A-3596-OUT,B-3785-OUT,C-4090-OUT,D-9685-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1372,x:34588,y:33032,ptovrint:False,ptlb:node_1372,ptin:_node_1372,varname:node_1372,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Vector1,id:2456,x:33203,y:32275,varname:node_2456,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4361,x:33360,y:32347,varname:node_4361,prsc:2|A-2456-OUT,B-4399-OUT;n:type:ShaderForge.SFN_Add,id:8124,x:34346,y:32974,varname:node_8124,prsc:2|A-1071-OUT,B-3647-OUT;n:type:ShaderForge.SFN_Vector1,id:3647,x:34207,y:33082,varname:node_3647,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Step,id:4000,x:34588,y:32883,varname:node_4000,prsc:2|A-8124-OUT,B-2894-OUT;n:type:ShaderForge.SFN_Subtract,id:1434,x:35081,y:33333,varname:node_1434,prsc:2|A-2391-R,B-4000-OUT;n:type:ShaderForge.SFN_Tex2d,id:2391,x:34729,y:33416,ptovrint:False,ptlb:node_2391,ptin:_node_2391,varname:node_2391,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e28347dcd29848c4397fe3dac991d17c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4090,x:35248,y:33242,varname:node_4090,prsc:2|A-1252-OUT,B-1434-OUT;n:type:ShaderForge.SFN_Vector1,id:1252,x:35014,y:33206,varname:node_1252,prsc:2,v1:1.1;n:type:ShaderForge.SFN_Power,id:5681,x:33932,y:32366,varname:node_5681,prsc:2|VAL-5637-R,EXP-8866-OUT;n:type:ShaderForge.SFN_Vector1,id:8866,x:33712,y:32400,varname:node_8866,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Tex2d,id:9820,x:35000,y:33582,ptovrint:False,ptlb:node_9820,ptin:_node_9820,varname:node_9820,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a46531aa492d5974bb5ff9fe627db736,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3480,x:35491,y:33328,varname:node_3480,prsc:2|A-4090-OUT,B-8828-R;n:type:ShaderForge.SFN_OneMinus,id:6063,x:35240,y:33582,varname:node_6063,prsc:2|IN-9820-R;n:type:ShaderForge.SFN_Tex2d,id:8828,x:35240,y:33449,ptovrint:False,ptlb:node_8828,ptin:_node_8828,varname:node_8828,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f3878d79527ec7f48acfdd20b8251b71,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3655,x:35702,y:33328,varname:node_3655,prsc:2|A-3480-OUT,B-4761-RGB;n:type:ShaderForge.SFN_Color,id:4761,x:35457,y:33480,ptovrint:False,ptlb:node_4761,ptin:_node_4761,varname:node_4761,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.2965517,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:2694,x:35848,y:32595,varname:node_2694,prsc:2|A-7768-OUT,B-3655-OUT,T-6816-OUT;n:type:ShaderForge.SFN_Vector1,id:6816,x:35671,y:32732,varname:node_6816,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:7014,x:35912,y:33249,varname:node_7014,prsc:2|IN-3480-OUT;n:type:ShaderForge.SFN_Multiply,id:8173,x:36005,y:32918,varname:node_8173,prsc:2|A-7768-OUT,B-7014-OUT;n:type:ShaderForge.SFN_Tex2d,id:8895,x:34378,y:33653,ptovrint:False,ptlb:node_8895,ptin:_node_8895,varname:node_8895,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1fbb08182337c664ab3a8287f4e017a8,ntxv:0,isnm:False|UVIN-8150-UVOUT;n:type:ShaderForge.SFN_Panner,id:8150,x:34206,y:33653,varname:node_8150,prsc:2,spu:0.02,spv:0.05|UVIN-1279-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1279,x:34024,y:33653,varname:node_1279,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:144,x:34701,y:33261,varname:node_144,prsc:2|A-3661-RGB,B-8895-RGB;n:type:ShaderForge.SFN_Multiply,id:9685,x:34636,y:32098,varname:node_9685,prsc:2|A-5016-R,B-4212-R;proporder:1304-2096-5016-5637-1071-4212-6523-1941-3661-1372-2391-8828-8895;pass:END;sub:END;*/

Shader "Shader Forge/chouyangkongdong" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _node_2096 ("node_2096", 2D) = "white" {}
        _node_5016 ("node_5016", 2D) = "white" {}
        _node_5637 ("node_5637", 2D) = "white" {}
        _node_1071 ("node_1071", Range(0, 1)) = 0.6220599
        _node_4212 ("node_4212", 2D) = "white" {}
        _node_6523 ("node_6523", 2D) = "white" {}
        _node_1941 ("node_1941", 2D) = "white" {}
        _node_3661 ("node_3661", 2D) = "white" {}
        _node_1372 ("node_1372", Float ) = 2
        _node_2391 ("node_2391", 2D) = "white" {}
        _node_8828 ("node_8828", 2D) = "white" {}
        _node_8895 ("node_8895", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _node_4212; uniform float4 _node_4212_ST;
            uniform sampler2D _node_2096; uniform float4 _node_2096_ST;
            uniform sampler2D _node_5016; uniform float4 _node_5016_ST;
            uniform sampler2D _node_5637; uniform float4 _node_5637_ST;
            uniform float _node_1071;
            uniform sampler2D _node_6523; uniform float4 _node_6523_ST;
            uniform sampler2D _node_1941; uniform float4 _node_1941_ST;
            uniform sampler2D _node_3661; uniform float4 _node_3661_ST;
            uniform float _node_1372;
            uniform sampler2D _node_2391; uniform float4 _node_2391_ST;
            uniform sampler2D _node_8828; uniform float4 _node_8828_ST;
            uniform sampler2D _node_8895; uniform float4 _node_8895_ST;
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
                float4 _node_4212_var = tex2D(_node_4212,TRANSFORM_TEX(i.uv1, _node_4212));
                float4 node_4773 = _Time;
                float2 node_2158 = (i.uv1+node_4773.g*float2(0.05,-0.05));
                float4 _node_5016_var = tex2D(_node_5016,TRANSFORM_TEX(node_2158, _node_5016));
                float2 node_1043 = (i.uv1+node_4773.g*float2(-0.1,0.15));
                float4 _node_2096_var = tex2D(_node_2096,TRANSFORM_TEX(node_1043, _node_2096));
                float2 node_663 = (((0.5*(_node_5016_var.r*_node_2096_var.r))+i.uv0)+node_4773.g*float2(-0.1,0.1));
                float4 _node_5637_var = tex2D(_node_5637,TRANSFORM_TEX(node_663, _node_5637));
                float node_6972_ang = node_4773.g;
                float node_6972_spd = 0.1;
                float node_6972_cos = cos(node_6972_spd*node_6972_ang);
                float node_6972_sin = sin(node_6972_spd*node_6972_ang);
                float2 node_6972_piv = float2(0.5,0.5);
                float2 node_6972 = (mul(i.uv1-node_6972_piv,float2x2( node_6972_cos, -node_6972_sin, node_6972_sin, node_6972_cos))+node_6972_piv);
                float4 _node_1941_var = tex2D(_node_1941,TRANSFORM_TEX(node_6972, _node_1941));
                float4 _node_6523_var = tex2D(_node_6523,TRANSFORM_TEX(i.uv1, _node_6523));
                float node_2894 = ((pow(_node_5637_var.r,0.7)*_node_1941_var.r)+_node_6523_var.r);
                float node_5786_ang = node_4773.g;
                float node_5786_spd = 0.3;
                float node_5786_cos = cos(node_5786_spd*node_5786_ang);
                float node_5786_sin = sin(node_5786_spd*node_5786_ang);
                float2 node_5786_piv = float2(0.5,0.5);
                float2 node_5786 = (mul(i.uv1-node_5786_piv,float2x2( node_5786_cos, -node_5786_sin, node_5786_sin, node_5786_cos))+node_5786_piv);
                float4 _node_3661_var = tex2D(_node_3661,TRANSFORM_TEX(node_5786, _node_3661));
                float2 node_8150 = (i.uv0+node_4773.g*float2(0.02,0.05));
                float4 _node_8895_var = tex2D(_node_8895,TRANSFORM_TEX(node_8150, _node_8895));
                float4 _node_2391_var = tex2D(_node_2391,TRANSFORM_TEX(i.uv0, _node_2391));
                float node_4090 = (1.1*(_node_2391_var.r-step((_node_1071+0.01),node_2894)));
                float3 node_7768 = (((_node_4212_var.r*step(node_2894,_node_1071))*_Color.rgb)+(step(_node_1071,node_2894)*(_node_3661_var.rgb+_node_8895_var.rgb)*_node_1372)+node_4090+(_node_5016_var.r*_node_4212_var.r));
                float4 _node_8828_var = tex2D(_node_8828,TRANSFORM_TEX(i.uv0, _node_8828));
                float node_3480 = (node_4090*_node_8828_var.r);
                float3 emissive = (node_7768*(1.0 - node_3480));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,_node_4212_var.r);
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
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
