// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-7558-OUT,clip-7528-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:5623,x:31541,y:33156,cmnt:物件每个定点的世界坐标,varname:node_5623,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:7549,x:31466,y:33550,ptovrint:False,ptlb:Center,ptin:_Center,cmnt:物件世界坐标位置,varname:node_7549,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Distance,id:8669,x:32151,y:33181,varname:node_8669,prsc:2|A-6080-R,B-9806-R;n:type:ShaderForge.SFN_Distance,id:1078,x:32242,y:33466,varname:node_1078,prsc:2|A-6080-B,B-9806-B;n:type:ShaderForge.SFN_ValueProperty,id:3097,x:31801,y:32988,ptovrint:False,ptlb:Legthe,ptin:_Legthe,varname:node_3097,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Slider,id:1634,x:31598,y:32876,ptovrint:False,ptlb:Diss,ptin:_Diss,varname:node_1634,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:3122,x:32192,y:32890,varname:node_3122,prsc:2|A-1634-OUT,B-3097-OUT;n:type:ShaderForge.SFN_Step,id:2517,x:32402,y:33102,varname:node_2517,prsc:2|A-8669-OUT,B-3122-OUT;n:type:ShaderForge.SFN_Step,id:3109,x:32402,y:33240,varname:node_3109,prsc:2|A-1078-OUT,B-3122-OUT;n:type:ShaderForge.SFN_Multiply,id:7528,x:32586,y:33166,varname:node_7528,prsc:2|A-2517-OUT,B-3109-OUT,C-1284-OUT;n:type:ShaderForge.SFN_TexCoord,id:8677,x:31829,y:32611,varname:node_8677,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:6500,x:31829,y:32787,ptovrint:False,ptlb:NoiseSize,ptin:_NoiseSize,varname:node_6500,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:20,cur:20,max:80;n:type:ShaderForge.SFN_Multiply,id:4904,x:32204,y:32698,varname:node_4904,prsc:2|A-8677-UVOUT,B-6500-OUT;n:type:ShaderForge.SFN_Floor,id:4694,x:32369,y:32712,varname:node_4694,prsc:2|IN-4904-OUT;n:type:ShaderForge.SFN_Noise,id:5973,x:32565,y:32712,varname:node_5973,prsc:2|XY-4694-OUT;n:type:ShaderForge.SFN_Step,id:1284,x:32478,y:32823,varname:node_1284,prsc:2|A-5973-OUT,B-1634-OUT;n:type:ShaderForge.SFN_Tex2d,id:5699,x:31214,y:31962,ptovrint:False,ptlb:MainText,ptin:_MainText,varname:node_5699,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7283,x:31425,y:32003,varname:node_7283,prsc:2|A-5699-RGB,B-5699-A;n:type:ShaderForge.SFN_Color,id:5662,x:31195,y:32205,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_5662,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Divide,id:6879,x:31020,y:32576,varname:node_6879,prsc:2|A-8669-OUT,B-2781-OUT;n:type:ShaderForge.SFN_Multiply,id:5790,x:31480,y:32245,varname:node_5790,prsc:2|A-5662-RGB,B-7832-OUT;n:type:ShaderForge.SFN_Vector1,id:7832,x:31195,y:32366,varname:node_7832,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6329,x:31365,y:32542,varname:node_6329,prsc:2|A-5662-A,B-2613-OUT;n:type:ShaderForge.SFN_Slider,id:8171,x:30911,y:33309,ptovrint:False,ptlb:LightRange,ptin:_LightRange,varname:node_8171,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.5,cur:0.8516903,max:1;n:type:ShaderForge.SFN_Multiply,id:2781,x:31302,y:33215,varname:node_2781,prsc:2|A-8171-OUT,B-3097-OUT;n:type:ShaderForge.SFN_Multiply,id:7558,x:32007,y:32127,varname:node_7558,prsc:2|A-7283-OUT,B-5488-OUT;n:type:ShaderForge.SFN_Divide,id:4671,x:31022,y:32721,varname:node_4671,prsc:2|A-1078-OUT,B-2781-OUT;n:type:ShaderForge.SFN_Multiply,id:757,x:31365,y:32684,varname:node_757,prsc:2|A-5662-A,B-7012-OUT;n:type:ShaderForge.SFN_Slider,id:997,x:30904,y:32482,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_997,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1.548986,max:5;n:type:ShaderForge.SFN_Multiply,id:5488,x:31689,y:32303,varname:node_5488,prsc:2|A-5790-OUT,B-6824-OUT;n:type:ShaderForge.SFN_Multiply,id:6824,x:31565,y:32613,varname:node_6824,prsc:2|A-6329-OUT,B-757-OUT;n:type:ShaderForge.SFN_OneMinus,id:2613,x:31198,y:32599,varname:node_2613,prsc:2|IN-6879-OUT;n:type:ShaderForge.SFN_OneMinus,id:7012,x:31192,y:32729,varname:node_7012,prsc:2|IN-4671-OUT;n:type:ShaderForge.SFN_Transform,id:9407,x:31717,y:33156,varname:node_9407,prsc:2,tffrom:0,tfto:1|IN-5623-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:6080,x:31889,y:33156,varname:node_6080,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-9407-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:3342,x:31424,y:33368,varname:node_3342,prsc:2;n:type:ShaderForge.SFN_Transform,id:3319,x:31663,y:33351,varname:node_3319,prsc:2,tffrom:0,tfto:1|IN-3342-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:9806,x:31834,y:33351,varname:node_9806,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-3319-XYZ;proporder:7549-3097-1634-6500-5699-5662-8171-997;pass:END;sub:END;*/

Shader "Shader Forge/testAddshaer" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _Legthe ("Legthe", Float ) = 5
        _Diss ("Diss", Range(0, 1)) = 0
        _NoiseSize ("NoiseSize", Range(20, 80)) = 20
        _MainText ("MainText", 2D) = "white" {}
        [HDR]_LitColor ("LitColor", Color) = (0.5,0.5,0.5,1)
        _LightRange ("LightRange", Range(0.5, 1)) = 0.8516903
        _Power ("Power", Range(1, 5)) = 1.548986
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _Legthe;
            uniform float _Diss;
            uniform float _NoiseSize;
            uniform sampler2D _MainText; uniform float4 _MainText_ST;
            uniform float4 _LitColor;
            uniform float _LightRange;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 node_6080 = mul( unity_WorldToObject, float4(i.posWorld.rgb,0) ).xyz.rgb.rgb;
                float3 node_9806 = mul( unity_WorldToObject, float4(objPos.rgb,0) ).xyz.rgb.rgb;
                float node_8669 = distance(node_6080.r,node_9806.r);
                float node_3122 = (_Diss*_Legthe);
                float node_1078 = distance(node_6080.b,node_9806.b);
                float2 node_4694 = floor((i.uv0*_NoiseSize));
                float2 node_5973_skew = node_4694 + 0.2127+node_4694.x*0.3713*node_4694.y;
                float2 node_5973_rnd = 4.789*sin(489.123*(node_5973_skew));
                float node_5973 = frac(node_5973_rnd.x*node_5973_rnd.y*(1+node_5973_skew.x));
                clip((step(node_8669,node_3122)*step(node_1078,node_3122)*step(node_5973,_Diss)) - 0.5);
////// Lighting:
                float4 _MainText_var = tex2D(_MainText,TRANSFORM_TEX(i.uv0, _MainText));
                float node_2781 = (_LightRange*_Legthe);
                float3 finalColor = ((_MainText_var.rgb*_MainText_var.a)*((_LitColor.rgb*2.0)*((_LitColor.a*(1.0 - (node_8669/node_2781)))*(_LitColor.a*(1.0 - (node_1078/node_2781))))));
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
            Cull Back
            
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
            uniform float _Legthe;
            uniform float _Diss;
            uniform float _NoiseSize;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 node_6080 = mul( unity_WorldToObject, float4(i.posWorld.rgb,0) ).xyz.rgb.rgb;
                float3 node_9806 = mul( unity_WorldToObject, float4(objPos.rgb,0) ).xyz.rgb.rgb;
                float node_8669 = distance(node_6080.r,node_9806.r);
                float node_3122 = (_Diss*_Legthe);
                float node_1078 = distance(node_6080.b,node_9806.b);
                float2 node_4694 = floor((i.uv0*_NoiseSize));
                float2 node_5973_skew = node_4694 + 0.2127+node_4694.x*0.3713*node_4694.y;
                float2 node_5973_rnd = 4.789*sin(489.123*(node_5973_skew));
                float node_5973 = frac(node_5973_rnd.x*node_5973_rnd.y*(1+node_5973_skew.x));
                clip((step(node_8669,node_3122)*step(node_1078,node_3122)*step(node_5973,_Diss)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
