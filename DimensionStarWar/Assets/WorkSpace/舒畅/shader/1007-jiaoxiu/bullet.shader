// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34615,y:32717,varname:node_9361,prsc:2|custl-7887-OUT,alpha-8722-OUT;n:type:ShaderForge.SFN_Tex2d,id:5702,x:33776,y:33063,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5702,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bd21193edaf3131419523f381e72ecfd,ntxv:0,isnm:False|UVIN-3290-OUT;n:type:ShaderForge.SFN_Panner,id:9010,x:32972,y:32685,varname:node_9010,prsc:2,spu:-1,spv:1|UVIN-8887-OUT;n:type:ShaderForge.SFN_TexCoord,id:6691,x:32486,y:32834,varname:node_6691,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:173,x:32972,y:32843,ptovrint:False,ptlb:niudong Tex,ptin:_niudongTex,varname:node_173,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1166,x:33145,y:32685,varname:node_1166,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-9010-UVOUT,TEX-173-TEX;n:type:ShaderForge.SFN_Tex2d,id:8784,x:33159,y:32998,varname:node_8784,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-9210-UVOUT,TEX-173-TEX;n:type:ShaderForge.SFN_Panner,id:9210,x:32972,y:32998,varname:node_9210,prsc:2,spu:-0.8,spv:-0.8|UVIN-8887-OUT;n:type:ShaderForge.SFN_Multiply,id:4038,x:33379,y:32800,varname:node_4038,prsc:2|A-1166-R,B-8784-R,C-3272-OUT;n:type:ShaderForge.SFN_Add,id:3290,x:33595,y:32882,varname:node_3290,prsc:2|A-4038-OUT,B-6691-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:3272,x:33159,y:33127,varname:node_3272,prsc:2|IN-6691-U;n:type:ShaderForge.SFN_Add,id:9526,x:34182,y:32809,varname:node_9526,prsc:2|A-7340-OUT,B-9006-OUT;n:type:ShaderForge.SFN_Multiply,id:8887,x:32707,y:32667,varname:node_8887,prsc:2|A-6691-UVOUT,B-8116-OUT;n:type:ShaderForge.SFN_Vector2,id:8116,x:32526,y:32670,varname:node_8116,prsc:2,v1:1,v2:4;n:type:ShaderForge.SFN_Multiply,id:9006,x:34030,y:32972,varname:node_9006,prsc:2|A-9258-RGB,B-5702-R;n:type:ShaderForge.SFN_VertexColor,id:9258,x:33776,y:33293,varname:node_9258,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8722,x:34144,y:33119,varname:node_8722,prsc:2|A-5702-R,B-9258-A;n:type:ShaderForge.SFN_Multiply,id:7340,x:33925,y:32792,varname:node_7340,prsc:2|A-6915-RGB,B-4038-OUT;n:type:ShaderForge.SFN_Color,id:6915,x:33726,y:32581,ptovrint:False,ptlb:niudong color,ptin:_niudongcolor,varname:node_6915,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7887,x:34398,y:32824,varname:node_7887,prsc:2|A-9526-OUT,B-9015-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9015,x:34182,y:32960,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_9015,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:5702-173-6915-9015;pass:END;sub:END;*/

Shader "Shader Forge/bullet" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _niudongTex ("niudong Tex", 2D) = "white" {}
        _niudongcolor ("niudong color", Color) = (1,1,1,1)
        _Intensity ("Intensity", Float ) = 1
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _niudongTex; uniform float4 _niudongTex_ST;
            uniform float4 _niudongcolor;
            uniform float _Intensity;
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
                float4 node_1934 = _Time;
                float2 node_8887 = (i.uv0*float2(1,4));
                float2 node_9010 = (node_8887+node_1934.g*float2(-1,1));
                float4 node_1166 = tex2D(_niudongTex,TRANSFORM_TEX(node_9010, _niudongTex));
                float2 node_9210 = (node_8887+node_1934.g*float2(-0.8,-0.8));
                float4 node_8784 = tex2D(_niudongTex,TRANSFORM_TEX(node_9210, _niudongTex));
                float node_4038 = (node_1166.r*node_8784.r*(1.0 - i.uv0.r));
                float2 node_3290 = (node_4038+i.uv0);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_3290, _MainTex));
                float3 finalColor = (((_niudongcolor.rgb*node_4038)+(i.vertexColor.rgb*_MainTex_var.r))*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.r*i.vertexColor.a));
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
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
