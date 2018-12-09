// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-1218-OUT,clip-6165-OUT;n:type:ShaderForge.SFN_Tex2d,id:8538,x:32062,y:32418,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8538,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Sin,id:3264,x:31302,y:32749,varname:node_3264,prsc:2|IN-6912-OUT;n:type:ShaderForge.SFN_Slider,id:426,x:30425,y:32733,ptovrint:False,ptlb:ClipPower,ptin:_ClipPower,varname:node_426,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:100,max:500;n:type:ShaderForge.SFN_Step,id:6165,x:31626,y:32757,varname:node_6165,prsc:2|A-3264-OUT,B-4460-OUT;n:type:ShaderForge.SFN_Vector1,id:4460,x:31302,y:32909,varname:node_4460,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Color,id:5797,x:32062,y:32604,ptovrint:False,ptlb:LItColor,ptin:_LItColor,varname:node_5797,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ScreenPos,id:5095,x:30405,y:32422,varname:node_5095,prsc:2,sctp:0;n:type:ShaderForge.SFN_Panner,id:5809,x:30582,y:32422,varname:node_5809,prsc:2,spu:0,spv:-0.5|UVIN-5095-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6912,x:31101,y:32598,varname:node_6912,prsc:2|A-2773-G,B-426-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2773,x:30778,y:32458,varname:node_2773,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5809-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1218,x:32346,y:32608,varname:node_1218,prsc:2|A-5797-RGB,B-337-OUT,C-8538-RGB;n:type:ShaderForge.SFN_Vector1,id:337,x:32069,y:32897,varname:node_337,prsc:2,v1:2;proporder:8538-426-5797;pass:END;sub:END;*/

Shader "Shader Forge/towerhologarm" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _ClipPower ("ClipPower", Range(0, 500)) = 100
        [HDR]_LItColor ("LItColor", Color) = (0.5,0.5,0.5,1)
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _ClipPower;
            uniform float4 _LItColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 node_7199 = _Time;
                clip(step(sin((((sceneUVs * 2 - 1).rg+node_7199.g*float2(0,-0.5)).rg.g*_ClipPower)),0.5) - 0.5);
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = (_LItColor.rgb*2.0*_MainTex_var.rgb);
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
            uniform float _ClipPower;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 node_641 = _Time;
                clip(step(sin((((sceneUVs * 2 - 1).rg+node_641.g*float2(0,-0.5)).rg.g*_ClipPower)),0.5) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
