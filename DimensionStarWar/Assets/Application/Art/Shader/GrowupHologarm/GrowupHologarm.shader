// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-9964-OUT,clip-9326-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:8484,x:30737,y:33452,varname:node_8484,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:8280,x:30737,y:33667,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_8280,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:5432,x:30998,y:33576,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_5432,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.6;n:type:ShaderForge.SFN_Slider,id:7483,x:30737,y:33928,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_7483,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:2384,x:31151,y:33814,varname:node_2384,prsc:2|A-5432-OUT,B-7483-OUT;n:type:ShaderForge.SFN_Add,id:4720,x:31344,y:33699,varname:node_4720,prsc:2|A-8280-Y,B-2384-OUT;n:type:ShaderForge.SFN_Step,id:9326,x:31911,y:33435,varname:node_9326,prsc:2|A-8484-Y,B-4720-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9973,x:31004,y:32591,varname:node_9973,prsc:2,sctp:1;n:type:ShaderForge.SFN_Slider,id:1678,x:31004,y:32764,ptovrint:False,ptlb:Grid,ptin:_Grid,varname:node_1678,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:247.0554,max:300;n:type:ShaderForge.SFN_Multiply,id:2335,x:31569,y:32681,varname:node_2335,prsc:2|A-9607-G,B-1678-OUT;n:type:ShaderForge.SFN_Sin,id:394,x:31723,y:32681,varname:node_394,prsc:2|IN-2335-OUT;n:type:ShaderForge.SFN_Panner,id:1378,x:31194,y:32591,varname:node_1378,prsc:2,spu:0,spv:0.1|UVIN-9973-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:9607,x:31358,y:32591,varname:node_9607,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1378-UVOUT;n:type:ShaderForge.SFN_Step,id:5101,x:31896,y:32734,varname:node_5101,prsc:2|A-394-OUT,B-4412-OUT;n:type:ShaderForge.SFN_Vector1,id:4412,x:31161,y:32859,varname:node_4412,prsc:2,v1:0;n:type:ShaderForge.SFN_If,id:893,x:32108,y:32884,varname:node_893,prsc:2|A-5101-OUT,B-4412-OUT,GT-5166-RGB,EQ-5182-RGB,LT-5182-RGB;n:type:ShaderForge.SFN_Color,id:5166,x:31161,y:32940,ptovrint:False,ptlb:LItColor,ptin:_LItColor,varname:node_5166,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:5182,x:30914,y:32967,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_5182,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:4338,x:32318,y:32989,varname:node_4338,prsc:2|A-893-OUT,B-6326-OUT;n:type:ShaderForge.SFN_Slider,id:4366,x:30706,y:33265,ptovrint:False,ptlb:Skingrowup,ptin:_Skingrowup,varname:node_4366,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Step,id:3283,x:31900,y:33208,varname:node_3283,prsc:2|A-4727-OUT,B-8484-Y;n:type:ShaderForge.SFN_Multiply,id:627,x:31330,y:33246,varname:node_627,prsc:2|A-5047-OUT,B-5432-OUT;n:type:ShaderForge.SFN_OneMinus,id:6326,x:32062,y:33055,varname:node_6326,prsc:2|IN-3283-OUT;n:type:ShaderForge.SFN_Add,id:9964,x:32784,y:33245,varname:node_9964,prsc:2|A-4338-OUT,B-9155-OUT;n:type:ShaderForge.SFN_Tex2d,id:9106,x:32328,y:33184,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_9106,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9155,x:32553,y:33491,varname:node_9155,prsc:2|A-9106-RGB,B-3283-OUT;n:type:ShaderForge.SFN_RemapRange,id:5047,x:31062,y:33264,varname:node_5047,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-4366-OUT;n:type:ShaderForge.SFN_Add,id:4727,x:31548,y:33342,varname:node_4727,prsc:2|A-627-OUT,B-8280-Y;proporder:7483-4366-8280-5432-1678-5166-5182-9106;pass:END;sub:END;*/

Shader "Shader Forge/GrowupHologarm" {
    Properties {
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 0
        _Skingrowup ("Skingrowup", Range(0, 1)) = 0
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1.6
        _Grid ("Grid", Range(0, 300)) = 247.0554
        _LItColor ("LItColor", Color) = (1,0,0,1)
        _BaseColor ("BaseColor", Color) = (0.5,0.5,0.5,1)
        _MainTex ("MainTex", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            uniform float _Grid;
            uniform float4 _LItColor;
            uniform float4 _BaseColor;
            uniform float _Skingrowup;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 projPos : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                clip(step(i.posWorld.g,(_Center.g+(_Height*_HologarmGrowup))) - 0.5);
////// Lighting:
                float4 node_6447 = _Time;
                float node_4412 = 0.0;
                float node_893_if_leA = step(step(sin(((float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg+node_6447.g*float2(0,0.1)).rg.g*_Grid)),node_4412),node_4412);
                float node_893_if_leB = step(node_4412,step(sin(((float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg+node_6447.g*float2(0,0.1)).rg.g*_Grid)),node_4412));
                float node_3283 = step((((_Skingrowup*-1.0+1.0)*_Height)+_Center.g),i.posWorld.g);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = ((lerp((node_893_if_leA*_BaseColor.rgb)+(node_893_if_leB*_LItColor.rgb),_BaseColor.rgb,node_893_if_leA*node_893_if_leB)*(1.0 - node_3283))+(_MainTex_var.rgb*node_3283));
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                clip(step(i.posWorld.g,(_Center.g+(_Height*_HologarmGrowup))) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
