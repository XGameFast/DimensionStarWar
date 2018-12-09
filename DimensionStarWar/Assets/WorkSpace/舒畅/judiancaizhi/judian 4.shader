// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34140,y:32697,varname:node_4013,prsc:2|emission-2590-OUT,clip-5839-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32967,y:32533,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Fresnel,id:7938,x:32783,y:32849,varname:node_7938,prsc:2|EXP-2748-OUT;n:type:ShaderForge.SFN_Slider,id:2748,x:32454,y:32943,ptovrint:False,ptlb:fangwei,ptin:_fangwei,varname:node_2748,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6410257,max:5;n:type:ShaderForge.SFN_Multiply,id:2376,x:33000,y:32919,varname:node_2376,prsc:2|A-7938-OUT,B-3371-OUT;n:type:ShaderForge.SFN_Slider,id:3371,x:32665,y:33103,ptovrint:False,ptlb:qiangsdu,ptin:_qiangsdu,varname:node_3371,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8333334,max:5;n:type:ShaderForge.SFN_Add,id:778,x:33206,y:32686,varname:node_778,prsc:2|A-1304-RGB,B-2376-OUT;n:type:ShaderForge.SFN_Add,id:2590,x:33550,y:32864,varname:node_2590,prsc:2|A-8704-OUT,B-7938-OUT,C-2984-OUT;n:type:ShaderForge.SFN_Vector1,id:2875,x:32679,y:32678,varname:node_2875,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:9350,x:33176,y:32603,varname:node_9350,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:8704,x:33346,y:32979,varname:node_8704,prsc:2|A-778-OUT,B-6346-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6346,x:33158,y:32996,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:node_6346,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_FragmentPosition,id:7499,x:32803,y:33239,varname:node_7499,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:1039,x:32803,y:33376,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_1039,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:8050,x:32803,y:33539,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_8050,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:5085,x:32659,y:33616,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_5085,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8939,x:32992,y:33566,varname:node_8939,prsc:2|A-8050-OUT,B-5085-OUT;n:type:ShaderForge.SFN_Add,id:4141,x:33153,y:33462,varname:node_4141,prsc:2|A-1039-Y,B-8939-OUT;n:type:ShaderForge.SFN_Step,id:5839,x:33351,y:33382,varname:node_5839,prsc:2|A-7499-Y,B-4141-OUT;n:type:ShaderForge.SFN_Add,id:3689,x:33324,y:33591,varname:node_3689,prsc:2|A-4141-OUT,B-9204-OUT;n:type:ShaderForge.SFN_Vector1,id:9204,x:33117,y:33701,varname:node_9204,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:4258,x:33508,y:33517,varname:node_4258,prsc:2|A-7499-Y,B-3689-OUT;n:type:ShaderForge.SFN_Subtract,id:3258,x:33647,y:33389,varname:node_3258,prsc:2|A-4258-OUT,B-5839-OUT;n:type:ShaderForge.SFN_Add,id:5267,x:33693,y:33150,varname:node_5267,prsc:2|A-2590-OUT,B-3258-OUT;n:type:ShaderForge.SFN_Multiply,id:2984,x:33477,y:32648,varname:node_2984,prsc:2|A-9350-OUT,B-778-OUT;proporder:1304-2748-3371-6346-1039-8050-5085;pass:END;sub:END;*/

Shader "Shader Forge/judian 4" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _fangwei ("fangwei", Range(0, 5)) = 0.6410257
        _qiangsdu ("qiangsdu", Range(0, 5)) = 0.8333334
        _Emission ("Emission", Float ) = 0.5
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 0
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
            uniform float4 _Color;
            uniform float _fangwei;
            uniform float _qiangsdu;
            uniform float _Emission;
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_4141 = (_Center.g+(_Height*_HologarmGrowup));
                float node_5839 = step(i.posWorld.g,node_4141);
                clip(node_5839 - 0.5);
////// Lighting:
////// Emissive:
                float node_7938 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_fangwei);
                float3 node_778 = (_Color.rgb+(node_7938*_qiangsdu));
                float3 node_2590 = ((node_778*_Emission)+node_7938+(0.2*node_778));
                float3 emissive = node_2590;
                float3 finalColor = emissive;
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
                float node_4141 = (_Center.g+(_Height*_HologarmGrowup));
                float node_5839 = step(i.posWorld.g,node_4141);
                clip(node_5839 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
