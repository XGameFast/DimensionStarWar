// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-2320-OUT,clip-8938-OUT;n:type:ShaderForge.SFN_Tex2d,id:63,x:32434,y:32421,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_63,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:4290,x:31713,y:32947,ptovrint:False,ptlb:ClipPower,ptin:_ClipPower,varname:node_4290,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:250,max:300;n:type:ShaderForge.SFN_ScreenPos,id:250,x:31672,y:32639,varname:node_250,prsc:2,sctp:0;n:type:ShaderForge.SFN_Multiply,id:8332,x:32040,y:32762,varname:node_8332,prsc:2|A-2960-OUT,B-4290-OUT;n:type:ShaderForge.SFN_Vector1,id:1513,x:32277,y:33011,varname:node_1513,prsc:2,v1:0.5;n:type:ShaderForge.SFN_FragmentPosition,id:1045,x:31701,y:33131,varname:node_1045,prsc:2;n:type:ShaderForge.SFN_Color,id:2534,x:32504,y:33262,ptovrint:False,ptlb:RimCOlor,ptin:_RimCOlor,varname:node_2534,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:3804,x:32515,y:33411,varname:node_3804,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:838,x:32692,y:33291,varname:node_838,prsc:2|A-2534-RGB,B-3804-OUT;n:type:ShaderForge.SFN_Multiply,id:3426,x:32903,y:33129,varname:node_3426,prsc:2|A-8437-OUT,B-838-OUT;n:type:ShaderForge.SFN_Add,id:2960,x:32057,y:32571,varname:node_2960,prsc:2|A-4676-TSL,B-250-V;n:type:ShaderForge.SFN_Color,id:4883,x:32434,y:32610,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_4883,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Sin,id:5760,x:32229,y:32823,varname:node_5760,prsc:2|IN-8332-OUT;n:type:ShaderForge.SFN_Slider,id:3870,x:31464,y:32557,ptovrint:False,ptlb:RimSpeed,ptin:_RimSpeed,varname:node_3870,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.247863,max:5;n:type:ShaderForge.SFN_Multiply,id:8437,x:32685,y:32915,varname:node_8437,prsc:2|A-5760-OUT,B-1045-Y;n:type:ShaderForge.SFN_Multiply,id:2320,x:32749,y:32507,varname:node_2320,prsc:2|A-63-RGB,B-4883-RGB;n:type:ShaderForge.SFN_Time,id:4676,x:31592,y:32414,varname:node_4676,prsc:2;n:type:ShaderForge.SFN_Slider,id:3160,x:31544,y:33572,ptovrint:False,ptlb:Disso,ptin:_Disso,varname:node_3160,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Vector4Property,id:2799,x:31701,y:33275,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_2799,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:2678,x:31701,y:33444,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_2678,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.6;n:type:ShaderForge.SFN_Add,id:2169,x:31940,y:33316,varname:node_2169,prsc:2|A-2799-Y,B-4071-OUT;n:type:ShaderForge.SFN_Multiply,id:4071,x:32011,y:33512,varname:node_4071,prsc:2|A-2678-OUT,B-3160-OUT;n:type:ShaderForge.SFN_Step,id:8938,x:32228,y:33201,varname:node_8938,prsc:2|A-1045-Y,B-2169-OUT;proporder:63-4290-2534-4883-3870-3160-2799-2678;pass:END;sub:END;*/

Shader "Shader Forge/MonsterFadeDown" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _ClipPower ("ClipPower", Range(0, 300)) = 250
        [HDR]_RimCOlor ("RimCOlor", Color) = (0.5,0.5,0.5,1)
        _MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _RimSpeed ("RimSpeed", Range(0, 5)) = 3.247863
        _Disso ("Disso", Range(0, 1)) = 0
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1.6
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
            Blend SrcAlpha OneMinusSrcAlpha
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _MainColor;
            uniform float _Disso;
            uniform float4 _Center;
            uniform float _Height;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                clip(step(i.posWorld.g,(_Center.g+(_Height*_Disso))) - 0.5);
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor,1);
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
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _Disso;
            uniform float4 _Center;
            uniform float _Height;
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
                clip(step(i.posWorld.g,(_Center.g+(_Height*_Disso))) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
