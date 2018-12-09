// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33409,y:32722,varname:node_9361,prsc:2|custl-2784-OUT,alpha-1602-OUT;n:type:ShaderForge.SFN_Tex2d,id:6852,x:32012,y:33093,ptovrint:False,ptlb:node_6852,ptin:_node_6852,varname:node_6852,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-2394-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:1657,x:32012,y:32878,ptovrint:False,ptlb:node_1657,ptin:_node_1657,varname:node_1657,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a3d07f6b87eb33540aca56fb46537065,ntxv:0,isnm:False|UVIN-2908-UVOUT;n:type:ShaderForge.SFN_Panner,id:2394,x:31801,y:33093,varname:node_2394,prsc:2,spu:0.6,spv:0.4|UVIN-9381-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9381,x:31583,y:33093,varname:node_9381,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8588,x:31865,y:33328,varname:node_8588,prsc:2|A-9381-V,B-224-OUT,C-7099-OUT;n:type:ShaderForge.SFN_OneMinus,id:224,x:31645,y:33328,varname:node_224,prsc:2|IN-9381-V;n:type:ShaderForge.SFN_Vector1,id:7099,x:31631,y:33468,varname:node_7099,prsc:2,v1:3;n:type:ShaderForge.SFN_Power,id:173,x:32031,y:33328,varname:node_173,prsc:2|VAL-8588-OUT,EXP-3207-OUT;n:type:ShaderForge.SFN_Vector1,id:3207,x:31800,y:33512,varname:node_3207,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:35,x:32200,y:33328,varname:node_35,prsc:2|A-173-OUT,B-9834-OUT;n:type:ShaderForge.SFN_Vector1,id:9834,x:32031,y:33455,varname:node_9834,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Panner,id:2908,x:31801,y:32878,varname:node_2908,prsc:2,spu:-0.5,spv:-0.8|UVIN-9381-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3646,x:32283,y:33035,varname:node_3646,prsc:2|A-1657-R,B-6852-R;n:type:ShaderForge.SFN_Multiply,id:2901,x:32446,y:33155,varname:node_2901,prsc:2|A-3646-OUT,B-35-OUT;n:type:ShaderForge.SFN_Step,id:1602,x:32789,y:33150,varname:node_1602,prsc:2|A-5337-A,B-2901-OUT;n:type:ShaderForge.SFN_Multiply,id:2784,x:32971,y:32807,varname:node_2784,prsc:2|A-9300-OUT,B-5337-RGB,C-2141-OUT;n:type:ShaderForge.SFN_VertexColor,id:5337,x:32446,y:33328,varname:node_5337,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:2141,x:32694,y:32781,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_2141,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Lerp,id:9300,x:32971,y:32942,varname:node_9300,prsc:2|A-6852-R,B-1602-OUT,T-7983-OUT;n:type:ShaderForge.SFN_Vector1,id:7983,x:32770,y:33064,varname:node_7983,prsc:2,v1:0.6;proporder:6852-1657-2141;pass:END;sub:END;*/

Shader "Shader Forge/bloom rongjei" {
    Properties {
        _node_6852 ("node_6852", 2D) = "white" {}
        _node_1657 ("node_1657", 2D) = "white" {}
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
            uniform sampler2D _node_6852; uniform float4 _node_6852_ST;
            uniform sampler2D _node_1657; uniform float4 _node_1657_ST;
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
                float4 node_7384 = _Time;
                float2 node_2394 = (i.uv0+node_7384.g*float2(0.6,0.4));
                float4 _node_6852_var = tex2D(_node_6852,TRANSFORM_TEX(node_2394, _node_6852));
                float2 node_2908 = (i.uv0+node_7384.g*float2(-0.5,-0.8));
                float4 _node_1657_var = tex2D(_node_1657,TRANSFORM_TEX(node_2908, _node_1657));
                float node_1602 = step(i.vertexColor.a,((_node_1657_var.r*_node_6852_var.r)*(pow((i.uv0.g*(1.0 - i.uv0.g)*3.0),2.0)*1.5)));
                float3 finalColor = (lerp(_node_6852_var.r,node_1602,0.6)*i.vertexColor.rgb*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,node_1602);
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
