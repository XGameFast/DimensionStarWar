// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33218,y:32937,varname:node_9361,prsc:2|custl-6974-OUT,alpha-7740-OUT;n:type:ShaderForge.SFN_Tex2d,id:5875,x:32356,y:32734,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5875,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8093,x:32757,y:33095,varname:node_8093,prsc:2|A-1228-OUT,B-5890-RGB;n:type:ShaderForge.SFN_Tex2d,id:2117,x:32098,y:32999,ptovrint:False,ptlb:rongjie Tex,ptin:_rongjieTex,varname:node_2117,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:5007,x:32356,y:33020,varname:node_5007,prsc:2|A-2117-R,B-9461-A;n:type:ShaderForge.SFN_RemapRange,id:3496,x:32115,y:33217,varname:node_3496,prsc:2,frmn:0,frmx:1,tomn:0.02,tomx:1.02|IN-5561-OUT;n:type:ShaderForge.SFN_Step,id:2311,x:32356,y:33195,varname:node_2311,prsc:2|A-2117-R,B-3496-OUT;n:type:ShaderForge.SFN_Subtract,id:1228,x:32559,y:33095,varname:node_1228,prsc:2|A-2311-OUT,B-5007-OUT;n:type:ShaderForge.SFN_Color,id:5890,x:32559,y:33253,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_5890,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7740,x:32893,y:33282,varname:node_7740,prsc:2|A-5875-R,B-2311-OUT,C-1244-OUT;n:type:ShaderForge.SFN_Multiply,id:4299,x:32764,y:32831,varname:node_4299,prsc:2|A-5875-R,B-9783-OUT,C-9461-RGB;n:type:ShaderForge.SFN_ValueProperty,id:9783,x:32356,y:32913,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_9783,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:6974,x:32949,y:32939,varname:node_6974,prsc:2|A-4299-OUT,B-8093-OUT;n:type:ShaderForge.SFN_VertexColor,id:9461,x:31627,y:33144,varname:node_9461,prsc:2;n:type:ShaderForge.SFN_Slider,id:1244,x:32508,y:33486,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_1244,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:5561,x:31918,y:33304,varname:node_5561,prsc:2|A-9461-A,B-3424-OUT;n:type:ShaderForge.SFN_Slider,id:3424,x:31548,y:33383,ptovrint:False,ptlb:shoudongkongzhi,ptin:_shoudongkongzhi,varname:node_3424,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:5875-2117-5890-9783-1244-3424;pass:END;sub:END;*/

Shader "Shader Forge/rongjie" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _rongjieTex ("rongjie Tex", 2D) = "white" {}
        [HDR]_biancolor ("bian color", Color) = (1,1,1,1)
        _Intensity ("Intensity", Float ) = 1
        _alpha ("alpha", Range(0, 1)) = 0
        _shoudongkongzhi ("shoudongkongzhi", Range(0, 1)) = 1
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _rongjieTex; uniform float4 _rongjieTex_ST;
            uniform float4 _biancolor;
            uniform float _Intensity;
            uniform float _alpha;
            uniform float _shoudongkongzhi;
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
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _rongjieTex_var = tex2D(_rongjieTex,TRANSFORM_TEX(i.uv0, _rongjieTex));
                float node_2311 = step(_rongjieTex_var.r,((i.vertexColor.a*_shoudongkongzhi)*1.0+0.02));
                float3 finalColor = ((_MainTex_var.r*_Intensity*i.vertexColor.rgb)+((node_2311-step(_rongjieTex_var.r,i.vertexColor.a))*_biancolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.r*node_2311*_alpha));
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
