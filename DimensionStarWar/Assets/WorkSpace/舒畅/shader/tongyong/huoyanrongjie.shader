// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34620,y:32471,varname:node_9361,prsc:2|custl-705-OUT,alpha-5423-OUT;n:type:ShaderForge.SFN_Panner,id:5959,x:32621,y:32823,varname:node_5959,prsc:2,spu:0,spv:-0.5|UVIN-8761-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8761,x:32344,y:32829,varname:node_8761,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Color,id:7919,x:33055,y:32543,ptovrint:False,ptlb:huoyanse,ptin:_huoyanse,varname:node_7919,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.3517241,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:7060,x:33226,y:32775,varname:node_7060,prsc:2|A-7919-RGB,B-1941-R;n:type:ShaderForge.SFN_Step,id:9716,x:33473,y:32998,varname:node_9716,prsc:2|A-2173-OUT,B-6362-OUT;n:type:ShaderForge.SFN_Panner,id:7085,x:32621,y:33015,varname:node_7085,prsc:2,spu:0,spv:-0.6|UVIN-8761-UVOUT;n:type:ShaderForge.SFN_Tex2dAsset,id:3748,x:32792,y:32572,ptovrint:False,ptlb:node_3748,ptin:_node_3748,varname:node_3748,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:77b70e79a6d16f44e9ae27b5675becc9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1941,x:32792,y:32823,varname:node_1941,prsc:2,tex:77b70e79a6d16f44e9ae27b5675becc9,ntxv:0,isnm:False|UVIN-5959-UVOUT,TEX-3748-TEX;n:type:ShaderForge.SFN_Tex2d,id:404,x:32792,y:32995,varname:node_404,prsc:2,tex:77b70e79a6d16f44e9ae27b5675becc9,ntxv:0,isnm:False|UVIN-7085-UVOUT,TEX-3748-TEX;n:type:ShaderForge.SFN_Power,id:2897,x:32958,y:33018,varname:node_2897,prsc:2|VAL-404-R,EXP-1798-OUT;n:type:ShaderForge.SFN_Vector1,id:1798,x:32792,y:33120,varname:node_1798,prsc:2,v1:0.6;n:type:ShaderForge.SFN_Distance,id:9175,x:32498,y:33225,varname:node_9175,prsc:2|A-8761-UVOUT,B-6659-OUT;n:type:ShaderForge.SFN_Vector2,id:6659,x:32328,y:33243,varname:node_6659,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_OneMinus,id:9426,x:32817,y:33225,varname:node_9426,prsc:2|IN-1572-OUT;n:type:ShaderForge.SFN_RemapRange,id:1572,x:32660,y:33225,varname:node_1572,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:1|IN-9175-OUT;n:type:ShaderForge.SFN_Multiply,id:6362,x:33134,y:33018,varname:node_6362,prsc:2|A-2897-OUT,B-9426-OUT;n:type:ShaderForge.SFN_Vector1,id:2173,x:33134,y:33137,varname:node_2173,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:497,x:33306,y:33176,varname:node_497,prsc:2|A-2173-OUT,B-6148-OUT;n:type:ShaderForge.SFN_Vector1,id:6148,x:33134,y:33196,varname:node_6148,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:5417,x:33473,y:33176,varname:node_5417,prsc:2|A-497-OUT,B-6362-OUT;n:type:ShaderForge.SFN_Subtract,id:4495,x:33666,y:32977,varname:node_4495,prsc:2|A-5417-OUT,B-9716-OUT;n:type:ShaderForge.SFN_Add,id:4045,x:34146,y:32622,varname:node_4045,prsc:2|A-7060-OUT,B-9373-OUT;n:type:ShaderForge.SFN_Multiply,id:9373,x:33948,y:32854,varname:node_9373,prsc:2|A-8583-OUT,B-4495-OUT;n:type:ShaderForge.SFN_Add,id:8583,x:33387,y:32575,varname:node_8583,prsc:2|A-3606-OUT,B-7919-RGB;n:type:ShaderForge.SFN_Vector1,id:3606,x:33232,y:32495,varname:node_3606,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:705,x:34386,y:32554,varname:node_705,prsc:2|A-4045-OUT,B-9450-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9450,x:34114,y:32522,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_9450,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:1758,x:33984,y:33191,varname:node_1758,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5423,x:34277,y:32991,varname:node_5423,prsc:2|A-5417-OUT,B-1758-A;proporder:7919-3748-9450;pass:END;sub:END;*/

Shader "Shader Forge/huoyanrongjie" {
    Properties {
        [HDR]_huoyanse ("huoyanse", Color) = (1,0.3517241,0,1)
        _node_3748 ("node_3748", 2D) = "white" {}
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
            uniform float4 _huoyanse;
            uniform sampler2D _node_3748; uniform float4 _node_3748_ST;
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
                float4 node_6577 = _Time;
                float2 node_5959 = (i.uv0+node_6577.g*float2(0,-0.5));
                float4 node_1941 = tex2D(_node_3748,TRANSFORM_TEX(node_5959, _node_3748));
                float node_2173 = 0.5;
                float2 node_7085 = (i.uv0+node_6577.g*float2(0,-0.6));
                float4 node_404 = tex2D(_node_3748,TRANSFORM_TEX(node_7085, _node_3748));
                float node_6362 = (pow(node_404.r,0.6)*(1.0 - (distance(i.uv0,float2(0.5,0.5))*2.0+0.0)));
                float node_5417 = step((node_2173-0.1),node_6362);
                float3 finalColor = (((_huoyanse.rgb*node_1941.r)+((0.3+_huoyanse.rgb)*(node_5417-step(node_2173,node_6362))))*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(node_5417*i.vertexColor.a));
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
