// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33300,y:32655,varname:node_4013,prsc:2|emission-5001-OUT,alpha-2927-OUT;n:type:ShaderForge.SFN_Tex2d,id:705,x:32394,y:32626,varname:node_705,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-4279-UVOUT,TEX-2956-TEX;n:type:ShaderForge.SFN_Tex2d,id:2123,x:32240,y:33022,ptovrint:False,ptlb:node_2123,ptin:_node_2123,varname:node_2123,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:86dad683d5561f145a57a714ba14d85a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:4001,x:31923,y:32439,varname:node_4001,prsc:2,spu:0.4,spv:0.3|UVIN-8363-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8363,x:31683,y:32618,varname:node_8363,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:5031,x:32639,y:32836,varname:node_5031,prsc:2|A-705-R,B-3611-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:2956,x:31683,y:32804,ptovrint:False,ptlb:node_2956,ptin:_node_2956,varname:node_2956,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4886,x:32014,y:33022,varname:node_4886,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-4001-UVOUT,TEX-2956-TEX;n:type:ShaderForge.SFN_Add,id:6677,x:32170,y:32777,varname:node_6677,prsc:2|A-4886-R,B-8363-UVOUT;n:type:ShaderForge.SFN_Panner,id:4279,x:32195,y:32575,varname:node_4279,prsc:2,spu:0.2,spv:0.3|UVIN-6677-OUT;n:type:ShaderForge.SFN_Step,id:5104,x:32854,y:32962,varname:node_5104,prsc:2|A-5461-OUT,B-5031-OUT;n:type:ShaderForge.SFN_Slider,id:5461,x:32560,y:33078,ptovrint:False,ptlb:node_5461,ptin:_node_5461,varname:node_5461,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1463269,max:1;n:type:ShaderForge.SFN_Multiply,id:5001,x:32841,y:32683,varname:node_5001,prsc:2|A-3152-RGB,B-5031-OUT,C-6868-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6868,x:32657,y:32546,ptovrint:False,ptlb:node_6868,ptin:_node_6868,varname:node_6868,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:3152,x:32931,y:33106,varname:node_3152,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2927,x:33067,y:33023,varname:node_2927,prsc:2|A-5104-OUT,B-3152-A;n:type:ShaderForge.SFN_Power,id:3611,x:32399,y:33155,varname:node_3611,prsc:2|VAL-2123-R,EXP-4466-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4466,x:32141,y:33208,ptovrint:False,ptlb:node_4466,ptin:_node_4466,varname:node_4466,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.8;proporder:2123-2956-5461-6868-4466;pass:END;sub:END;*/

Shader "Shader Forge/shuiguodantuowei" {
    Properties {
        _node_2123 ("node_2123", 2D) = "white" {}
        _node_2956 ("node_2956", 2D) = "white" {}
        _node_5461 ("node_5461", Range(0, 1)) = 0.1463269
        _node_6868 ("node_6868", Float ) = 1
        _node_4466 ("node_4466", Float ) = 0.8
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
            uniform sampler2D _node_2123; uniform float4 _node_2123_ST;
            uniform sampler2D _node_2956; uniform float4 _node_2956_ST;
            uniform float _node_5461;
            uniform float _node_6868;
            uniform float _node_4466;
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
                float4 node_1819 = _Time;
                float2 node_4001 = (i.uv0+node_1819.g*float2(0.4,0.3));
                float4 node_4886 = tex2D(_node_2956,TRANSFORM_TEX(node_4001, _node_2956));
                float2 node_4279 = ((node_4886.r+i.uv0)+node_1819.g*float2(0.2,0.3));
                float4 node_705 = tex2D(_node_2956,TRANSFORM_TEX(node_4279, _node_2956));
                float4 _node_2123_var = tex2D(_node_2123,TRANSFORM_TEX(i.uv0, _node_2123));
                float node_5031 = (node_705.r*pow(_node_2123_var.r,_node_4466));
                float3 emissive = (i.vertexColor.rgb*node_5031*_node_6868);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(step(_node_5461,node_5031)*i.vertexColor.a));
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
