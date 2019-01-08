// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33389,y:32598,varname:node_9361,prsc:2|custl-5247-OUT,alpha-1719-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7748,x:32159,y:32567,ptovrint:False,ptlb:fire tex,ptin:_firetex,varname:node_7748,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3291,x:32503,y:32910,ptovrint:False,ptlb:MASK,ptin:_MASK,varname:node_3291,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d3d16216642f99b4aa3faa653dbd2bd9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2270,x:32341,y:32408,varname:node_2270,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-5739-UVOUT,TEX-7748-TEX;n:type:ShaderForge.SFN_Tex2d,id:3699,x:32347,y:32732,varname:node_3699,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-6941-UVOUT,TEX-7748-TEX;n:type:ShaderForge.SFN_Panner,id:5739,x:32159,y:32408,varname:node_5739,prsc:2,spu:-0.7,spv:0.2|UVIN-5121-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5121,x:31957,y:32567,varname:node_5121,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:6941,x:32159,y:32732,varname:node_6941,prsc:2,spu:-0.5,spv:-0.3|UVIN-5121-UVOUT;n:type:ShaderForge.SFN_Multiply,id:5850,x:32518,y:32753,varname:node_5850,prsc:2|A-3699-R,B-4807-OUT;n:type:ShaderForge.SFN_Vector1,id:4807,x:32347,y:32857,varname:node_4807,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Add,id:7247,x:32693,y:32614,varname:node_7247,prsc:2|A-2270-R,B-5850-OUT;n:type:ShaderForge.SFN_Multiply,id:8259,x:32851,y:32729,varname:node_8259,prsc:2|A-7247-OUT,B-3291-R;n:type:ShaderForge.SFN_Multiply,id:5247,x:33149,y:32649,varname:node_5247,prsc:2|A-6897-RGB,B-4307-OUT;n:type:ShaderForge.SFN_Color,id:6897,x:32900,y:32522,ptovrint:False,ptlb:node_6897,ptin:_node_6897,varname:node_6897,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2794118,c2:0.7316431,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1719,x:33149,y:32812,varname:node_1719,prsc:2|A-4307-OUT,B-9766-OUT;n:type:ShaderForge.SFN_Slider,id:9766,x:32795,y:33034,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_9766,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:3327,x:32851,y:32865,varname:node_3327,prsc:2|A-3291-R,B-49-OUT;n:type:ShaderForge.SFN_Vector1,id:49,x:32503,y:33119,varname:node_49,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Add,id:4307,x:33001,y:32781,varname:node_4307,prsc:2|A-8259-OUT,B-3327-OUT;proporder:7748-3291-6897-9766;pass:END;sub:END;*/

Shader "Shader Forge/huo" {
    Properties {
        _firetex ("fire tex", 2D) = "white" {}
        _MASK ("MASK", 2D) = "white" {}
        [HDR]_node_6897 ("node_6897", Color) = (0.2794118,0.7316431,1,1)
        _alpha ("alpha", Range(0, 1)) = 1
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
            uniform sampler2D _firetex; uniform float4 _firetex_ST;
            uniform sampler2D _MASK; uniform float4 _MASK_ST;
            uniform float4 _node_6897;
            uniform float _alpha;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_1742 = _Time;
                float2 node_5739 = (i.uv0+node_1742.g*float2(-0.7,0.2));
                float4 node_2270 = tex2D(_firetex,TRANSFORM_TEX(node_5739, _firetex));
                float2 node_6941 = (i.uv0+node_1742.g*float2(-0.5,-0.3));
                float4 node_3699 = tex2D(_firetex,TRANSFORM_TEX(node_6941, _firetex));
                float4 _MASK_var = tex2D(_MASK,TRANSFORM_TEX(i.uv0, _MASK));
                float node_4307 = (((node_2270.r+(node_3699.r*0.3))*_MASK_var.r)+(_MASK_var.r*0.3));
                float3 finalColor = (_node_6897.rgb*node_4307);
                fixed4 finalRGBA = fixed4(finalColor,(node_4307*_alpha));
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
