// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33361,y:32457,varname:node_9361,prsc:2|custl-5836-OUT,alpha-166-OUT,clip-3586-OUT;n:type:ShaderForge.SFN_TexCoord,id:2404,x:32083,y:32734,varname:node_2404,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Distance,id:2943,x:32275,y:32714,varname:node_2943,prsc:2|A-586-OUT,B-2404-UVOUT;n:type:ShaderForge.SFN_Vector2,id:586,x:32083,y:32651,varname:node_586,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_RemapRange,id:6985,x:32435,y:32714,varname:node_6985,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:1|IN-2943-OUT;n:type:ShaderForge.SFN_OneMinus,id:3586,x:32592,y:32714,varname:node_3586,prsc:2|IN-6985-OUT;n:type:ShaderForge.SFN_Power,id:1902,x:32784,y:32714,varname:node_1902,prsc:2|VAL-3586-OUT,EXP-467-OUT;n:type:ShaderForge.SFN_VertexColor,id:3400,x:32784,y:32578,varname:node_3400,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5836,x:33011,y:32578,varname:node_5836,prsc:2|A-3400-RGB,B-1902-OUT,C-919-OUT;n:type:ShaderForge.SFN_Vector1,id:467,x:32435,y:32877,varname:node_467,prsc:2,v1:2.5;n:type:ShaderForge.SFN_Multiply,id:166,x:33011,y:32694,varname:node_166,prsc:2|A-3400-A,B-1902-OUT;n:type:ShaderForge.SFN_ValueProperty,id:919,x:32784,y:32506,ptovrint:False,ptlb:qiangdu,ptin:_qiangdu,varname:node_919,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:919;pass:END;sub:END;*/

Shader "Shader Forge/Alpha guangyun" {
    Properties {
        _qiangdu ("qiangdu", Float ) = 1
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
            uniform float _qiangdu;
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
                float node_3586 = (1.0 - (distance(float2(0.5,0.5),i.uv0)*2.0+0.0));
                clip(node_3586 - 0.5);
////// Lighting:
                float node_1902 = pow(node_3586,2.5);
                float3 finalColor = (i.vertexColor.rgb*node_1902*_qiangdu);
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*node_1902));
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
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float node_3586 = (1.0 - (distance(float2(0.5,0.5),i.uv0)*2.0+0.0));
                clip(node_3586 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
