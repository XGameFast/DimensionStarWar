// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33806,y:32803,varname:node_4013,prsc:2|alpha-460-OUT,refract-6397-OUT;n:type:ShaderForge.SFN_Vector1,id:2783,x:32991,y:32874,varname:node_2783,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:2467,x:33082,y:33248,varname:node_2467,prsc:2|A-4842-R,B-4954-OUT;n:type:ShaderForge.SFN_Vector2,id:4954,x:32806,y:33395,varname:node_4954,prsc:2,v1:0.1691176,v2:0.1691176;n:type:ShaderForge.SFN_VertexColor,id:7730,x:32824,y:33502,varname:node_7730,prsc:2;n:type:ShaderForge.SFN_Multiply,id:460,x:33537,y:33048,varname:node_460,prsc:2|A-1091-R,B-2783-OUT;n:type:ShaderForge.SFN_Multiply,id:8771,x:33273,y:33300,varname:node_8771,prsc:2|A-2467-OUT,B-7730-A,C-1091-R;n:type:ShaderForge.SFN_Multiply,id:6397,x:33534,y:33309,varname:node_6397,prsc:2|A-8771-OUT,B-141-OUT;n:type:ShaderForge.SFN_ValueProperty,id:141,x:33343,y:33453,ptovrint:False,ptlb:zongqiang,ptin:_zongqiang,varname:node_141,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Panner,id:9477,x:32231,y:33137,varname:node_9477,prsc:2,spu:0.1,spv:0.3|UVIN-2173-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2173,x:32009,y:33262,varname:node_2173,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:542,x:32231,y:33318,varname:node_542,prsc:2,spu:-0.3,spv:-0.1|UVIN-2173-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4340,x:32576,y:33248,varname:node_4340,prsc:2|A-2434-R,B-8696-R;n:type:ShaderForge.SFN_Add,id:4293,x:32747,y:33248,varname:node_4293,prsc:2|A-4340-OUT,B-2173-UVOUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6523,x:32213,y:32940,ptovrint:False,ptlb:node_6523,ptin:_node_6523,varname:node_6523,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2434,x:32421,y:33137,varname:node_2434,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-9477-UVOUT,TEX-6523-TEX;n:type:ShaderForge.SFN_Tex2d,id:8696,x:32421,y:33306,varname:node_8696,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-542-UVOUT,TEX-6523-TEX;n:type:ShaderForge.SFN_Tex2d,id:4842,x:32900,y:33248,varname:node_4842,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-4293-OUT,TEX-6523-TEX;n:type:ShaderForge.SFN_Tex2d,id:1091,x:33164,y:33031,ptovrint:False,ptlb:node_1091,ptin:_node_1091,varname:node_1091,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7da0332b47d17754baa6d352c51ac125,ntxv:0,isnm:False;proporder:141-6523-1091;pass:END;sub:END;*/

Shader "Shader Forge/rongpingniuqu" {
    Properties {
        _zongqiang ("zongqiang", Float ) = 1
        _node_6523 ("node_6523", 2D) = "white" {}
        _node_1091 ("node_1091", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
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
            uniform sampler2D _GrabTexture;
            uniform float _zongqiang;
            uniform sampler2D _node_6523; uniform float4 _node_6523_ST;
            uniform sampler2D _node_1091; uniform float4 _node_1091_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_7268 = _Time;
                float2 node_9477 = (i.uv0+node_7268.g*float2(0.1,0.3));
                float4 node_2434 = tex2D(_node_6523,TRANSFORM_TEX(node_9477, _node_6523));
                float2 node_542 = (i.uv0+node_7268.g*float2(-0.3,-0.1));
                float4 node_8696 = tex2D(_node_6523,TRANSFORM_TEX(node_542, _node_6523));
                float2 node_4293 = ((node_2434.r*node_8696.r)+i.uv0);
                float4 node_4842 = tex2D(_node_6523,TRANSFORM_TEX(node_4293, _node_6523));
                float4 _node_1091_var = tex2D(_node_1091,TRANSFORM_TEX(i.uv0, _node_1091));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (((node_4842.r*float2(0.1691176,0.1691176))*i.vertexColor.a*_node_1091_var.r)*_zongqiang);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(_node_1091_var.r*0.0)),1);
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
