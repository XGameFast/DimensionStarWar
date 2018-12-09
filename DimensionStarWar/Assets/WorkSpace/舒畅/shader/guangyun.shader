// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33660,y:32568,varname:node_4013,prsc:2|emission-5746-OUT,alpha-8501-OUT,clip-6036-OUT;n:type:ShaderForge.SFN_TexCoord,id:5136,x:32409,y:32741,varname:node_5136,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:8349,x:32409,y:32891,varname:node_8349,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:7975,x:32615,y:32741,varname:node_7975,prsc:2|A-5136-UVOUT,B-8349-OUT;n:type:ShaderForge.SFN_Divide,id:5142,x:32782,y:32741,varname:node_5142,prsc:2|A-7975-OUT,B-1496-OUT;n:type:ShaderForge.SFN_OneMinus,id:6036,x:32950,y:32741,varname:node_6036,prsc:2|IN-5142-OUT;n:type:ShaderForge.SFN_Slider,id:1496,x:32426,y:33001,ptovrint:False,ptlb:ZHEZHAODAXIAO,ptin:_ZHEZHAODAXIAO,varname:node_1496,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_VertexColor,id:9596,x:33206,y:32675,varname:node_9596,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5746,x:33447,y:32675,varname:node_5746,prsc:2|A-9596-RGB,B-5678-OUT,C-4393-OUT;n:type:ShaderForge.SFN_Multiply,id:8501,x:33447,y:32810,varname:node_8501,prsc:2|A-9596-A,B-5678-OUT;n:type:ShaderForge.SFN_Power,id:5678,x:33218,y:32833,varname:node_5678,prsc:2|VAL-6036-OUT,EXP-7137-OUT;n:type:ShaderForge.SFN_Slider,id:7626,x:32743,y:33010,ptovrint:False,ptlb:GUANGYUNDAXIAO,ptin:_GUANGYUNDAXIAO,varname:node_7626,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.581197,max:5;n:type:ShaderForge.SFN_Exp,id:7137,x:33057,y:33010,varname:node_7137,prsc:2,et:0|IN-7626-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4393,x:33206,y:32617,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_4393,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1496-7626-4393;pass:END;sub:END;*/

Shader "Shader Forge/guangyun" {
    Properties {
        _ZHEZHAODAXIAO ("ZHEZHAODAXIAO", Range(0, 1)) = 0.5
        _GUANGYUNDAXIAO ("GUANGYUNDAXIAO", Range(0, 5)) = 1.581197
        _liangdu ("liangdu", Float ) = 1
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
            uniform float _ZHEZHAODAXIAO;
            uniform float _GUANGYUNDAXIAO;
            uniform float _liangdu;
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
                float node_6036 = (1.0 - (distance(i.uv0,float2(0.5,0.5))/_ZHEZHAODAXIAO));
                clip(node_6036 - 0.5);
////// Lighting:
////// Emissive:
                float node_5678 = pow(node_6036,exp(_GUANGYUNDAXIAO));
                float3 emissive = (i.vertexColor.rgb*node_5678*_liangdu);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*node_5678));
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
            uniform float _ZHEZHAODAXIAO;
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
                float node_6036 = (1.0 - (distance(i.uv0,float2(0.5,0.5))/_ZHEZHAODAXIAO));
                clip(node_6036 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
