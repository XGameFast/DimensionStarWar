// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33066,y:32895,varname:node_4013,prsc:2|emission-2868-OUT,alpha-208-OUT;n:type:ShaderForge.SFN_Step,id:4887,x:32290,y:32993,varname:node_4887,prsc:2|A-5100-A,B-7423-R;n:type:ShaderForge.SFN_VertexColor,id:5100,x:31925,y:32915,varname:node_5100,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1846,x:32562,y:32871,varname:node_1846,prsc:2|A-6634-R,B-7154-OUT,C-5100-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7154,x:32290,y:32754,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_7154,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Step,id:9035,x:32290,y:33158,varname:node_9035,prsc:2|A-7046-OUT,B-7423-R;n:type:ShaderForge.SFN_Add,id:7046,x:32112,y:33158,varname:node_7046,prsc:2|A-5100-A,B-4228-OUT;n:type:ShaderForge.SFN_Vector1,id:4228,x:31925,y:33253,varname:node_4228,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Subtract,id:7071,x:32474,y:33139,varname:node_7071,prsc:2|A-4887-OUT,B-9035-OUT;n:type:ShaderForge.SFN_Multiply,id:8126,x:32643,y:33119,varname:node_8126,prsc:2|A-6634-R,B-7071-OUT,C-1877-RGB;n:type:ShaderForge.SFN_Color,id:1877,x:32474,y:33308,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_1877,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:2868,x:32821,y:32994,varname:node_2868,prsc:2|A-1846-OUT,B-8126-OUT;n:type:ShaderForge.SFN_Tex2d,id:7423,x:31925,y:33074,ptovrint:False,ptlb:dissolve,ptin:_dissolve,varname:node_7423,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7774a71f7ab329844a318e87fe48cba2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6634,x:32290,y:32834,ptovrint:False,ptlb:maintex,ptin:_maintex,varname:node_6634,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:208,x:32821,y:33153,varname:node_208,prsc:2|A-6634-R,B-4887-OUT;proporder:7154-1877-7423-6634;pass:END;sub:END;*/

Shader "Shader Forge/jianbianrongjie" {
    Properties {
        _liangdu ("liangdu", Float ) = 2
        [HDR]_biancolor ("bian color", Color) = (1,1,1,1)
        _dissolve ("dissolve", 2D) = "white" {}
        _maintex ("maintex", 2D) = "white" {}
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
            uniform float _liangdu;
            uniform float4 _biancolor;
            uniform sampler2D _dissolve; uniform float4 _dissolve_ST;
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
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
                float4 _maintex_var = tex2D(_maintex,TRANSFORM_TEX(i.uv0, _maintex));
                float4 _dissolve_var = tex2D(_dissolve,TRANSFORM_TEX(i.uv0, _dissolve));
                float node_4887 = step(i.vertexColor.a,_dissolve_var.r);
                float3 emissive = ((_maintex_var.r*_liangdu*i.vertexColor.rgb)+(_maintex_var.r*(node_4887-step((i.vertexColor.a+0.01),_dissolve_var.r))*_biancolor.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(_maintex_var.r*node_4887));
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
