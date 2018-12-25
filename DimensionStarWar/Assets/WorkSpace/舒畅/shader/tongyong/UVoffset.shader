// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33347,y:32685,varname:node_9361,prsc:2|custl-6224-OUT,alpha-3449-OUT;n:type:ShaderForge.SFN_Tex2d,id:2186,x:32676,y:32737,ptovrint:False,ptlb:Maintex,ptin:_Maintex,varname:node_2186,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2267-UVOUT;n:type:ShaderForge.SFN_Panner,id:2267,x:32447,y:32737,varname:node_2267,prsc:2,spu:1,spv:0|UVIN-2237-UVOUT,DIST-9919-OUT;n:type:ShaderForge.SFN_TexCoord,id:2237,x:32254,y:32737,varname:node_2237,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_VertexColor,id:8752,x:32029,y:32939,varname:node_8752,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:9919,x:32254,y:32939,varname:node_9919,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8752-A;n:type:ShaderForge.SFN_Multiply,id:7449,x:32692,y:33025,varname:node_7449,prsc:2|A-2237-U,B-3265-OUT,C-8205-OUT;n:type:ShaderForge.SFN_OneMinus,id:2858,x:32376,y:33047,varname:node_2858,prsc:2|IN-2237-U;n:type:ShaderForge.SFN_Vector1,id:8205,x:32533,y:33160,varname:node_8205,prsc:2,v1:8;n:type:ShaderForge.SFN_Multiply,id:6224,x:32919,y:32754,varname:node_6224,prsc:2|A-2186-R,B-8752-RGB,C-7627-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7627,x:32676,y:32915,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_7627,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Power,id:3031,x:32849,y:33025,varname:node_3031,prsc:2|VAL-7449-OUT,EXP-9-OUT;n:type:ShaderForge.SFN_Vector1,id:9,x:32692,y:33150,varname:node_9,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Clamp01,id:3565,x:33002,y:33093,varname:node_3565,prsc:2|IN-3031-OUT;n:type:ShaderForge.SFN_Multiply,id:3449,x:33172,y:33037,varname:node_3449,prsc:2|A-2186-R,B-3565-OUT;n:type:ShaderForge.SFN_Power,id:3265,x:32533,y:33047,varname:node_3265,prsc:2|VAL-2858-OUT,EXP-6931-OUT;n:type:ShaderForge.SFN_Vector1,id:6931,x:32376,y:33160,varname:node_6931,prsc:2,v1:3;proporder:2186-7627;pass:END;sub:END;*/

Shader "Shader Forge/UVoffset" {
    Properties {
        _Maintex ("Maintex", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _Maintex; uniform float4 _Maintex_ST;
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
                float2 node_2267 = (i.uv0+(i.vertexColor.a*2.0+-1.0)*float2(1,0));
                float4 _Maintex_var = tex2D(_Maintex,TRANSFORM_TEX(node_2267, _Maintex));
                float3 finalColor = (_Maintex_var.r*i.vertexColor.rgb*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(_Maintex_var.r*saturate(pow((i.uv0.r*pow((1.0 - i.uv0.r),3.0)*8.0),0.8))));
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
