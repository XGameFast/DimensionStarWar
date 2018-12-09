// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33346,y:32320,varname:node_9361,prsc:2|custl-8151-OUT,alpha-6325-OUT,clip-595-OUT;n:type:ShaderForge.SFN_TexCoord,id:5466,x:31575,y:32477,varname:node_5466,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6022,x:31914,y:32508,varname:node_6022,prsc:2|A-5466-UVOUT,B-4778-OUT;n:type:ShaderForge.SFN_Slider,id:4778,x:31602,y:32671,ptovrint:False,ptlb:NoiseSide,ptin:_NoiseSide,varname:node_4778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:47.00854,max:100;n:type:ShaderForge.SFN_Floor,id:938,x:32098,y:32508,varname:node_938,prsc:2|IN-6022-OUT;n:type:ShaderForge.SFN_Noise,id:5070,x:32647,y:32826,varname:node_5070,prsc:2|XY-3377-OUT;n:type:ShaderForge.SFN_Step,id:5410,x:32270,y:32969,varname:node_5410,prsc:2|A-7863-OUT,B-2104-OUT;n:type:ShaderForge.SFN_Tex2d,id:6071,x:32392,y:32284,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_6071,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:38b395471a5dc7c438f2b5022ca1c7b9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:4117,x:32412,y:32464,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_4117,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:9452,x:32185,y:32680,varname:node_9452,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6255,x:32582,y:32482,varname:node_6255,prsc:2|A-4117-RGB,B-1278-OUT;n:type:ShaderForge.SFN_Multiply,id:6238,x:32762,y:32362,varname:node_6238,prsc:2|A-6071-R,B-6255-OUT;n:type:ShaderForge.SFN_Multiply,id:8151,x:32957,y:32418,varname:node_8151,prsc:2|A-6238-OUT,B-5410-OUT;n:type:ShaderForge.SFN_Slider,id:2864,x:31571,y:32764,ptovrint:False,ptlb:RamdonNoise,ptin:_RamdonNoise,varname:node_2864,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.5,cur:0.611145,max:1;n:type:ShaderForge.SFN_Multiply,id:3377,x:32275,y:32505,varname:node_3377,prsc:2|A-938-OUT,B-2864-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:8123,x:31161,y:32897,varname:node_8123,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:5301,x:31161,y:33076,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_5301,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Slider,id:2104,x:31161,y:33281,ptovrint:False,ptlb:Diss,ptin:_Diss,varname:node_2104,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:5;n:type:ShaderForge.SFN_Step,id:5951,x:32289,y:33168,varname:node_5951,prsc:2|A-5536-OUT,B-2104-OUT;n:type:ShaderForge.SFN_Multiply,id:595,x:32694,y:33016,varname:node_595,prsc:2|A-5410-OUT,B-5951-OUT,C-5145-OUT;n:type:ShaderForge.SFN_Divide,id:2295,x:31519,y:33406,varname:node_2295,prsc:2|A-2104-OUT,B-8886-OUT;n:type:ShaderForge.SFN_Vector1,id:8886,x:31307,y:33427,varname:node_8886,prsc:2,v1:5;n:type:ShaderForge.SFN_Step,id:5145,x:32470,y:33673,varname:node_5145,prsc:2|A-5070-OUT,B-2295-OUT;n:type:ShaderForge.SFN_Distance,id:7863,x:31571,y:32915,varname:node_7863,prsc:2|A-8123-X,B-5301-X;n:type:ShaderForge.SFN_Distance,id:5536,x:31576,y:33106,varname:node_5536,prsc:2|A-8123-Z,B-5301-Z;n:type:ShaderForge.SFN_Multiply,id:6325,x:32915,y:32642,varname:node_6325,prsc:2|A-6071-A,B-2295-OUT;n:type:ShaderForge.SFN_Multiply,id:1278,x:32346,y:32741,varname:node_1278,prsc:2|A-9452-OUT,B-5674-OUT;n:type:ShaderForge.SFN_Divide,id:5674,x:31532,y:33555,varname:node_5674,prsc:2|A-6687-OUT,B-8886-OUT;n:type:ShaderForge.SFN_Slider,id:6687,x:31052,y:33624,ptovrint:False,ptlb:LightDiss,ptin:_LightDiss,varname:node_6687,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:4778-6071-4117-2864-5301-2104-6687;pass:END;sub:END;*/

Shader "Shader Forge/groundEffect_dissvo" {
    Properties {
        _NoiseSide ("NoiseSide", Range(0, 100)) = 47.00854
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _RamdonNoise ("RamdonNoise", Range(0.5, 1)) = 0.611145
        _Center ("Center", Vector) = (0,0,0,0)
        _Diss ("Diss", Range(0, 5)) = 5
        _LightDiss ("LightDiss", Range(0, 1)) = 0
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
            uniform float _NoiseSide;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _MainColor;
            uniform float _RamdonNoise;
            uniform float4 _Center;
            uniform float _Diss;
            uniform float _LightDiss;
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
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_5410 = step(distance(i.posWorld.r,_Center.r),_Diss);
                float2 node_3377 = (floor((i.uv0*_NoiseSide))*_RamdonNoise);
                float2 node_5070_skew = node_3377 + 0.2127+node_3377.x*0.3713*node_3377.y;
                float2 node_5070_rnd = 4.789*sin(489.123*(node_5070_skew));
                float node_5070 = frac(node_5070_rnd.x*node_5070_rnd.y*(1+node_5070_skew.x));
                float node_8886 = 5.0;
                float node_2295 = (_Diss/node_8886);
                clip((node_5410*step(distance(i.posWorld.b,_Center.b),_Diss)*step(node_5070,node_2295)) - 0.5);
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = ((_MainTex_var.r*(_MainColor.rgb*(2.0*(_LightDiss/node_8886))))*node_5410);
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.a*node_2295));
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
            uniform float _NoiseSide;
            uniform float _RamdonNoise;
            uniform float4 _Center;
            uniform float _Diss;
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
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_5410 = step(distance(i.posWorld.r,_Center.r),_Diss);
                float2 node_3377 = (floor((i.uv0*_NoiseSide))*_RamdonNoise);
                float2 node_5070_skew = node_3377 + 0.2127+node_3377.x*0.3713*node_3377.y;
                float2 node_5070_rnd = 4.789*sin(489.123*(node_5070_skew));
                float node_5070 = frac(node_5070_rnd.x*node_5070_rnd.y*(1+node_5070_skew.x));
                float node_8886 = 5.0;
                float node_2295 = (_Diss/node_8886);
                clip((node_5410*step(distance(i.posWorld.b,_Center.b),_Diss)*step(node_5070,node_2295)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
