// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-460-OUT,alpha-3050-A,clip-8434-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:3439,x:31813,y:33815,varname:node_3439,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:5643,x:31813,y:33975,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_5643,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Distance,id:9996,x:32167,y:33837,varname:node_9996,prsc:2|A-3439-X,B-5643-X;n:type:ShaderForge.SFN_Slider,id:3848,x:31798,y:33674,ptovrint:False,ptlb:Diss,ptin:_Diss,varname:node_3848,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Step,id:2681,x:32456,y:33824,varname:node_2681,prsc:2|A-9996-OUT,B-6221-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5797,x:31798,y:33575,ptovrint:False,ptlb:Legth,ptin:_Legth,varname:node_5797,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Multiply,id:6221,x:32211,y:33626,varname:node_6221,prsc:2|A-5797-OUT,B-3848-OUT;n:type:ShaderForge.SFN_Distance,id:5172,x:32167,y:33958,varname:node_5172,prsc:2|A-3439-Z,B-5643-Z;n:type:ShaderForge.SFN_Step,id:1116,x:32456,y:33953,varname:node_1116,prsc:2|A-5172-OUT,B-6221-OUT;n:type:ShaderForge.SFN_Multiply,id:999,x:32720,y:33877,varname:node_999,prsc:2|A-2681-OUT,B-1116-OUT;n:type:ShaderForge.SFN_Tex2d,id:3050,x:32241,y:32327,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_3050,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1075,x:32571,y:32512,varname:node_1075,prsc:2|A-3050-RGB,B-6824-RGB;n:type:ShaderForge.SFN_Color,id:6824,x:32241,y:32518,ptovrint:False,ptlb:gray,ptin:_gray,varname:node_6824,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:8218,x:31798,y:33422,ptovrint:False,ptlb:LightDiss,ptin:_LightDiss,varname:node_8218,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:2639,x:32241,y:32686,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_2639,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:9537,x:32607,y:33428,varname:node_9537,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:4524,x:32622,y:32781,varname:node_4524,prsc:2|A-6962-OUT,B-4756-OUT;n:type:ShaderForge.SFN_Multiply,id:4756,x:32834,y:33467,varname:node_4756,prsc:2|A-9537-OUT,B-8968-OUT;n:type:ShaderForge.SFN_Add,id:460,x:32807,y:32633,varname:node_460,prsc:2|A-1075-OUT,B-4524-OUT;n:type:ShaderForge.SFN_Multiply,id:7522,x:32211,y:33421,varname:node_7522,prsc:2|A-8218-OUT,B-5797-OUT;n:type:ShaderForge.SFN_Step,id:2461,x:32443,y:33452,varname:node_2461,prsc:2|A-9996-OUT,B-7522-OUT;n:type:ShaderForge.SFN_Step,id:7176,x:32443,y:33588,varname:node_7176,prsc:2|A-5172-OUT,B-7522-OUT;n:type:ShaderForge.SFN_Multiply,id:8968,x:32607,y:33500,varname:node_8968,prsc:2|A-2461-OUT,B-7176-OUT;n:type:ShaderForge.SFN_TexCoord,id:4305,x:31797,y:33136,varname:node_4305,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:7976,x:31797,y:33301,ptovrint:False,ptlb:NoiseSize,ptin:_NoiseSize,varname:node_7976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:10,cur:80,max:80;n:type:ShaderForge.SFN_Multiply,id:3051,x:32103,y:33140,varname:node_3051,prsc:2|A-4305-UVOUT,B-7976-OUT;n:type:ShaderForge.SFN_Floor,id:1048,x:32268,y:33140,varname:node_1048,prsc:2|IN-3051-OUT;n:type:ShaderForge.SFN_Noise,id:2972,x:32432,y:33140,varname:node_2972,prsc:2|XY-1048-OUT;n:type:ShaderForge.SFN_Step,id:1789,x:32443,y:33303,varname:node_1789,prsc:2|A-2972-OUT,B-3848-OUT;n:type:ShaderForge.SFN_Multiply,id:8434,x:33059,y:33557,varname:node_8434,prsc:2|A-1789-OUT,B-999-OUT;n:type:ShaderForge.SFN_Multiply,id:6962,x:32435,y:32664,varname:node_6962,prsc:2|A-3050-RGB,B-2639-RGB;proporder:5643-3848-5797-3050-6824-8218-2639-7976;pass:END;sub:END;*/

Shader "Shader Forge/RoomGroundOutLight" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _Diss ("Diss", Range(0, 1)) = 1
        _Legth ("Legth", Float ) = 5
        _MainTex ("MainTex", 2D) = "white" {}
        _gray ("gray", Color) = (0.5,0.5,0.5,1)
        _LightDiss ("LightDiss", Range(0, 1)) = 0
        [HDR]_LightColor ("LightColor", Color) = (0.5,0.5,0.5,1)
        _NoiseSize ("NoiseSize", Range(10, 80)) = 80
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Diss;
            uniform float _Legth;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _gray;
            uniform float _LightDiss;
            uniform float4 _LightColor;
            uniform float _NoiseSize;
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
                float2 node_1048 = floor((i.uv0*_NoiseSize));
                float2 node_2972_skew = node_1048 + 0.2127+node_1048.x*0.3713*node_1048.y;
                float2 node_2972_rnd = 4.789*sin(489.123*(node_2972_skew));
                float node_2972 = frac(node_2972_rnd.x*node_2972_rnd.y*(1+node_2972_skew.x));
                float node_9996 = distance(i.posWorld.r,_Center.r);
                float node_6221 = (_Legth*_Diss);
                float node_5172 = distance(i.posWorld.b,_Center.b);
                clip((step(node_2972,_Diss)*(step(node_9996,node_6221)*step(node_5172,node_6221))) - 0.5);
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_7522 = (_LightDiss*_Legth);
                float3 node_460 = ((_MainTex_var.rgb*_gray.rgb)+((_MainTex_var.rgb*_LightColor.rgb)*(2.0*(step(node_9996,node_7522)*step(node_5172,node_7522)))));
                float3 finalColor = node_460;
                fixed4 finalRGBA = fixed4(finalColor,_MainTex_var.a);
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
            uniform float _Diss;
            uniform float _Legth;
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
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 node_1048 = floor((i.uv0*_NoiseSize));
                float2 node_2972_skew = node_1048 + 0.2127+node_1048.x*0.3713*node_1048.y;
                float2 node_2972_rnd = 4.789*sin(489.123*(node_2972_skew));
                float node_2972 = frac(node_2972_rnd.x*node_2972_rnd.y*(1+node_2972_skew.x));
                float node_9996 = distance(i.posWorld.r,_Center.r);
                float node_6221 = (_Legth*_Diss);
                float node_5172 = distance(i.posWorld.b,_Center.b);
                clip((step(node_2972,_Diss)*(step(node_9996,node_6221)*step(node_5172,node_6221))) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
