// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32266,y:32752,varname:node_9361,prsc:2|custl-4409-OUT,alpha-8528-OUT;n:type:ShaderForge.SFN_Tex2d,id:5573,x:31616,y:32971,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5573,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6c25d971c08e0c54182e4cb853d923cf,ntxv:0,isnm:False|UVIN-8928-UVOUT;n:type:ShaderForge.SFN_Panner,id:8928,x:31415,y:32971,varname:node_8928,prsc:2,spu:1,spv:0|UVIN-977-UVOUT,DIST-3367-OUT;n:type:ShaderForge.SFN_TexCoord,id:977,x:31200,y:32971,varname:node_977,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4625,x:31527,y:33341,varname:node_4625,prsc:2|A-4719-OUT,B-13-OUT;n:type:ShaderForge.SFN_OneMinus,id:4719,x:31344,y:33295,varname:node_4719,prsc:2|IN-977-U;n:type:ShaderForge.SFN_Vector1,id:13,x:31263,y:33459,varname:node_13,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:8528,x:31770,y:33144,varname:node_8528,prsc:2|A-5573-R,B-4625-OUT,C-2318-OUT;n:type:ShaderForge.SFN_Tex2d,id:6446,x:31208,y:33580,ptovrint:False,ptlb:rongjieTex,ptin:_rongjieTex,varname:node_6446,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:959b620c5db1bbe458a611ce4276d3a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:2318,x:31471,y:33627,varname:node_2318,prsc:2|A-2156-A,B-6446-R;n:type:ShaderForge.SFN_Step,id:7860,x:31471,y:33853,varname:node_7860,prsc:2|A-2229-OUT,B-6446-R;n:type:ShaderForge.SFN_RemapRange,id:2229,x:31152,y:33871,varname:node_2229,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1.1|IN-2156-A;n:type:ShaderForge.SFN_Subtract,id:2000,x:31666,y:33733,varname:node_2000,prsc:2|A-2318-OUT,B-7860-OUT;n:type:ShaderForge.SFN_Multiply,id:1709,x:31918,y:33699,varname:node_1709,prsc:2|A-2982-RGB,B-2000-OUT;n:type:ShaderForge.SFN_Color,id:2982,x:31666,y:33577,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_2982,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:4409,x:32023,y:32922,varname:node_4409,prsc:2|A-8292-OUT,B-1709-OUT;n:type:ShaderForge.SFN_Multiply,id:8292,x:31844,y:32922,varname:node_8292,prsc:2|A-2156-RGB,B-5573-R;n:type:ShaderForge.SFN_VertexColor,id:2156,x:30768,y:33161,varname:node_2156,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:3367,x:31081,y:33267,varname:node_3367,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-2156-A;proporder:5573-6446-2982;pass:END;sub:END;*/

Shader "Shader Forge/xuli" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _rongjieTex ("rongjieTex", 2D) = "white" {}
        _biancolor ("bian color", Color) = (1,1,1,1)
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
                float2 node_8928 = (i.uv0+(i.vertexColor.a*2.0+-1.0)*float2(1,0));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_8928, _MainTex));
                float4 _rongjieTex_var = tex2D(_rongjieTex,TRANSFORM_TEX(i.uv0, _rongjieTex));
                float node_2318 = step(i.vertexColor.a,_rongjieTex_var.r);
                float3 finalColor = ((i.vertexColor.rgb*_MainTex_var.r)+(_biancolor.rgb*(node_2318-step((i.vertexColor.a*1.1+0.0),_rongjieTex_var.r))));
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.r*((1.0 - i.uv0.r)*3.0)*node_2318));
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
