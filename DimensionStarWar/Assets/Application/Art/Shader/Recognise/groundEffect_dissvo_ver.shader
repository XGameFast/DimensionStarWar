// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33307,y:32806,varname:node_9361,prsc:2|custl-6801-OUT,clip-6190-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:8745,x:30908,y:33311,varname:node_8745,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:7243,x:30908,y:33483,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_7243,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:5145,x:31137,y:33794,ptovrint:False,ptlb:Length,ptin:_Length,varname:node_5145,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:50;n:type:ShaderForge.SFN_Slider,id:7289,x:31059,y:33929,ptovrint:False,ptlb:Diss,ptin:_Diss,varname:node_7289,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:3629,x:31382,y:33830,varname:node_3629,prsc:2|A-5145-OUT,B-7289-OUT;n:type:ShaderForge.SFN_Tex2d,id:1154,x:31616,y:32531,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1154,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3141,x:31895,y:32572,varname:node_3141,prsc:2|A-1154-RGB,B-1154-A;n:type:ShaderForge.SFN_Color,id:2251,x:31587,y:32724,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_2251,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:1887,x:31587,y:32895,varname:node_1887,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:2925,x:31895,y:32776,varname:node_2925,prsc:2|A-2251-RGB,B-1887-OUT;n:type:ShaderForge.SFN_Add,id:4328,x:31637,y:33752,varname:node_4328,prsc:2|A-7243-Y,B-3629-OUT;n:type:ShaderForge.SFN_Slider,id:4079,x:31340,y:34113,ptovrint:False,ptlb:LitRange,ptin:_LitRange,varname:node_4079,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.01,max:5;n:type:ShaderForge.SFN_Multiply,id:7927,x:31717,y:34137,varname:node_7927,prsc:2|A-4079-OUT,B-5325-OUT;n:type:ShaderForge.SFN_Vector1,id:5325,x:31341,y:34236,varname:node_5325,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Divide,id:9008,x:31854,y:33190,varname:node_9008,prsc:2|A-8745-Y,B-3890-OUT;n:type:ShaderForge.SFN_Step,id:6190,x:32582,y:33383,varname:node_6190,prsc:2|A-8745-Y,B-4328-OUT;n:type:ShaderForge.SFN_Step,id:5791,x:32098,y:32635,varname:node_5791,prsc:2|A-3800-OUT,B-3141-OUT;n:type:ShaderForge.SFN_Vector1,id:3800,x:31908,y:32690,varname:node_3800,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:6801,x:32514,y:32908,varname:node_6801,prsc:2|A-5791-OUT,B-7758-OUT,C-2925-OUT;n:type:ShaderForge.SFN_Add,id:3890,x:31412,y:33529,varname:node_3890,prsc:2|A-7243-Y,B-5145-OUT;n:type:ShaderForge.SFN_Power,id:7758,x:32217,y:33207,varname:node_7758,prsc:2|VAL-9008-OUT,EXP-9785-OUT;n:type:ShaderForge.SFN_Exp,id:9785,x:31999,y:33422,varname:node_9785,prsc:2,et:1|IN-9849-OUT;n:type:ShaderForge.SFN_Slider,id:9849,x:31604,y:33528,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_9849,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.1,max:5;proporder:7243-5145-7289-1154-2251-4079-9849;pass:END;sub:END;*/

Shader "Shader Forge/groundEffect_dissvo_vet" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _Length ("Length", Float ) = 50
        _Diss ("Diss", Range(0, 1)) = 1
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _LitRange ("LitRange", Range(0.01, 5)) = 0.01
        _Power ("Power", Range(0.1, 5)) = 0.1
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
            uniform float4 _Center;
            uniform float _Length;
            uniform float _Diss;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _MainColor;
            uniform float _Power;
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
                clip(step(i.posWorld.g,(_Center.g+(_Length*_Diss))) - 0.5);
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_9008 = (i.posWorld.g/(_Center.g+_Length));
                float3 finalColor = (step(0.1,(_MainTex_var.rgb*_MainTex_var.a))*pow(node_9008,exp2(_Power))*(_MainColor.rgb*2.0));
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
            uniform float4 _Center;
            uniform float _Length;
            uniform float _Diss;
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
                clip(step(i.posWorld.g,(_Center.g+(_Length*_Diss))) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
