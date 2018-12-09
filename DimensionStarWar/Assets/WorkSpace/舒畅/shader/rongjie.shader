// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32814,y:32793,varname:node_4013,prsc:2|emission-2868-OUT;n:type:ShaderForge.SFN_Tex2d,id:6908,x:31599,y:32872,ptovrint:False,ptlb:rongjieTex,ptin:_rongjieTex,varname:node_6908,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:4887,x:31975,y:32892,varname:node_4887,prsc:2|A-6908-R,B-5100-A;n:type:ShaderForge.SFN_VertexColor,id:5100,x:31599,y:33124,varname:node_5100,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2280,x:32441,y:32732,varname:node_2280,prsc:2|A-9810-R,B-4887-OUT,C-7154-OUT,D-5100-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7154,x:32119,y:32892,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_7154,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Step,id:9035,x:31975,y:33092,varname:node_9035,prsc:2|A-6908-R,B-4816-OUT;n:type:ShaderForge.SFN_Subtract,id:7071,x:32209,y:32986,varname:node_7071,prsc:2|A-9035-OUT,B-4887-OUT;n:type:ShaderForge.SFN_Multiply,id:8126,x:32441,y:32986,varname:node_8126,prsc:2|A-7071-OUT,B-1877-RGB,C-9473-OUT,D-9810-R;n:type:ShaderForge.SFN_Color,id:1877,x:32196,y:33176,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_1877,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8549696,c2:0.1911765,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:9473,x:32196,y:33353,ptovrint:False,ptlb:bian Intensity,ptin:_bianIntensity,varname:node_9473,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Add,id:2868,x:32613,y:32895,varname:node_2868,prsc:2|A-2280-OUT,B-8126-OUT;n:type:ShaderForge.SFN_Tex2d,id:9810,x:31993,y:32695,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_9810,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a07479fd0b3f6e4499a333401ffe4581,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:4816,x:31800,y:33202,varname:node_4816,prsc:2,frmn:0,frmx:1,tomn:0.01,tomx:1.01|IN-5100-A;proporder:6908-7154-1877-9473-9810;pass:END;sub:END;*/

Shader "Shader Forge/rongjie 1" {
    Properties {
        _rongjieTex ("rongjieTex", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 2
        [HDR]_biancolor ("bian color", Color) = (0.8549696,0.1911765,1,1)
        _bianIntensity ("bian Intensity", Float ) = 3
        _MainTex ("MainTex", 2D) = "white" {}
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
            Blend One One
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
            uniform sampler2D _rongjieTex; uniform float4 _rongjieTex_ST;
            uniform float _Intensity;
            uniform float4 _biancolor;
            uniform float _bianIntensity;
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
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _rongjieTex_var = tex2D(_rongjieTex,TRANSFORM_TEX(i.uv0, _rongjieTex));
                float node_4887 = step(_rongjieTex_var.r,i.vertexColor.a);
                float3 emissive = ((_MainTex_var.r*node_4887*_Intensity*i.vertexColor.rgb)+((step(_rongjieTex_var.r,(i.vertexColor.a*1.0+0.01))-node_4887)*_biancolor.rgb*_bianIntensity*_MainTex_var.r));
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
