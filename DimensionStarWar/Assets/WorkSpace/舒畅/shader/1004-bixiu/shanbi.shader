// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34108,y:32565,varname:node_4013,prsc:2|custl-8048-OUT,alpha-3322-OUT,clip-1287-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32761,y:32562,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1102941,c2:0.4845841,c3:1,c4:1;n:type:ShaderForge.SFN_Step,id:9955,x:32803,y:32902,varname:node_9955,prsc:2|A-7494-A,B-3909-R;n:type:ShaderForge.SFN_RemapRange,id:563,x:32549,y:33143,varname:node_563,prsc:2,frmn:0,frmx:1,tomn:0.1,tomx:1|IN-7494-A;n:type:ShaderForge.SFN_Step,id:3424,x:32803,y:33143,varname:node_3424,prsc:2|A-563-OUT,B-3909-R;n:type:ShaderForge.SFN_Multiply,id:3539,x:33326,y:32559,varname:node_3539,prsc:2|A-1304-RGB,B-5340-OUT;n:type:ShaderForge.SFN_Multiply,id:5868,x:33326,y:32730,varname:node_5868,prsc:2|A-8857-RGB,B-3424-OUT;n:type:ShaderForge.SFN_Color,id:8857,x:32761,y:32735,ptovrint:False,ptlb:Main color,ptin:_Maincolor,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.125,c2:0.7103447,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:8048,x:33597,y:32662,varname:node_8048,prsc:2|A-3539-OUT,B-5868-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:472,x:32173,y:32768,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_472,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e3c6141c240afdf448a1285d11599bb8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3909,x:32414,y:32732,varname:node_3909,prsc:2,tex:e3c6141c240afdf448a1285d11599bb8,ntxv:0,isnm:False|TEX-472-TEX;n:type:ShaderForge.SFN_Tex2d,id:9694,x:32549,y:33359,varname:node_9694,prsc:2,tex:e3c6141c240afdf448a1285d11599bb8,ntxv:0,isnm:False|TEX-472-TEX;n:type:ShaderForge.SFN_Subtract,id:4430,x:32803,y:33373,varname:node_4430,prsc:2|A-9694-R,B-7494-A;n:type:ShaderForge.SFN_Subtract,id:6044,x:32803,y:33512,varname:node_6044,prsc:2|A-9694-R,B-563-OUT;n:type:ShaderForge.SFN_Divide,id:2048,x:33104,y:33374,varname:node_2048,prsc:2|A-4430-OUT,B-6044-OUT;n:type:ShaderForge.SFN_OneMinus,id:4021,x:33267,y:33374,varname:node_4021,prsc:2|IN-2048-OUT;n:type:ShaderForge.SFN_Power,id:1885,x:33508,y:33220,varname:node_1885,prsc:2|VAL-4021-OUT,EXP-2248-OUT;n:type:ShaderForge.SFN_Vector1,id:2248,x:33267,y:33170,varname:node_2248,prsc:2,v1:3.3;n:type:ShaderForge.SFN_Add,id:3322,x:33495,y:32894,varname:node_3322,prsc:2|A-9955-OUT,B-5340-OUT;n:type:ShaderForge.SFN_Clamp01,id:5340,x:33712,y:33256,varname:node_5340,prsc:2|IN-1885-OUT;n:type:ShaderForge.SFN_VertexColor,id:7494,x:32142,y:33168,varname:node_7494,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:8188,x:32575,y:33653,varname:node_8188,prsc:2,frmn:0,frmx:1,tomn:-0.1,tomx:1|IN-7494-A;n:type:ShaderForge.SFN_Step,id:1287,x:32803,y:33671,varname:node_1287,prsc:2|A-8188-OUT,B-3909-R;proporder:1304-8857-472;pass:END;sub:END;*/

Shader "Shader Forge/shanbi" {
    Properties {
        _biancolor ("bian color", Color) = (0.1102941,0.4845841,1,1)
        _Maincolor ("Main color", Color) = (0.125,0.7103447,1,1)
        _MainTex ("MainTex", 2D) = "white" {}
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
            uniform float4 _biancolor;
            uniform float4 _Maincolor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_3909 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(step((i.vertexColor.a*1.1+-0.1),node_3909.r) - 0.5);
////// Lighting:
                float4 node_9694 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_563 = (i.vertexColor.a*0.9+0.1);
                float node_5340 = saturate(pow((1.0 - ((node_9694.r-i.vertexColor.a)/(node_9694.r-node_563))),3.3));
                float3 finalColor = ((_biancolor.rgb*node_5340)+(_Maincolor.rgb*step(node_563,node_3909.r)));
                fixed4 finalRGBA = fixed4(finalColor,(step(i.vertexColor.a,node_3909.r)+node_5340));
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_3909 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(step((i.vertexColor.a*1.1+-0.1),node_3909.r) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
