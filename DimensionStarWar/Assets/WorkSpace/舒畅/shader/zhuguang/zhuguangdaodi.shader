// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33849,y:32720,varname:node_4013,prsc:2|emission-7432-OUT,alpha-6711-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32967,y:33142,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09558821,c2:0.438641,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8397,x:32750,y:32926,ptovrint:False,ptlb:node_8397,ptin:_node_8397,varname:node_8397,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:22b262f1ce84f4b4481a48fc17f89dff,ntxv:0,isnm:False|UVIN-5282-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1359,x:32362,y:32906,varname:node_1359,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:5282,x:32554,y:32906,varname:node_5282,prsc:2,spu:-1,spv:0|UVIN-1359-UVOUT,DIST-8718-OUT;n:type:ShaderForge.SFN_Add,id:7432,x:33300,y:32688,varname:node_7432,prsc:2|A-4377-OUT,B-5520-OUT;n:type:ShaderForge.SFN_Multiply,id:9423,x:32982,y:32983,varname:node_9423,prsc:2|A-634-B,B-8397-R;n:type:ShaderForge.SFN_Multiply,id:5520,x:33181,y:33015,varname:node_5520,prsc:2|A-9423-OUT,B-1304-RGB,C-6785-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6785,x:32967,y:33317,ptovrint:False,ptlb:saoguang,ptin:_saoguang,varname:node_6785,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_VertexColor,id:5715,x:32223,y:33314,varname:node_5715,prsc:2;n:type:ShaderForge.SFN_Add,id:4968,x:32428,y:33329,varname:node_4968,prsc:2|A-5715-A,B-6246-OUT;n:type:ShaderForge.SFN_Vector1,id:6246,x:32299,y:33565,varname:node_6246,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_Multiply,id:8718,x:32682,y:33346,varname:node_8718,prsc:2|A-4968-OUT,B-6247-OUT;n:type:ShaderForge.SFN_Vector1,id:6247,x:32507,y:33558,varname:node_6247,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:4377,x:33073,y:32546,varname:node_4377,prsc:2|A-634-B,B-3291-OUT,C-6974-RGB;n:type:ShaderForge.SFN_ValueProperty,id:3291,x:32767,y:32514,ptovrint:False,ptlb:wangge,ptin:_wangge,varname:node_3291,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:6711,x:33665,y:33015,varname:node_6711,prsc:2|A-4080-OUT,B-5715-A;n:type:ShaderForge.SFN_TexCoord,id:793,x:32187,y:32683,varname:node_793,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Add,id:4080,x:33426,y:33004,varname:node_4080,prsc:2|A-634-B,B-9423-OUT;n:type:ShaderForge.SFN_Color,id:6974,x:32883,y:32396,ptovrint:False,ptlb:node_6974,ptin:_node_6974,varname:node_6974,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3897059,c2:0.9494929,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:634,x:32722,y:32707,ptovrint:False,ptlb:node_634,ptin:_node_634,varname:node_634,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c7bc52daf2707d6409c8ba1ebc8706f1,ntxv:0,isnm:False|UVIN-793-UVOUT;proporder:1304-8397-6785-3291-6974-634;pass:END;sub:END;*/

Shader "Shader Forge/zhuguangdaodi" {
    Properties {
        _Color ("Color", Color) = (0.09558821,0.438641,1,1)
        _node_8397 ("node_8397", 2D) = "white" {}
        _saoguang ("saoguang", Float ) = 5
        _wangge ("wangge", Float ) = 1
        _node_6974 ("node_6974", Color) = (0.3897059,0.9494929,1,1)
        _node_634 ("node_634", 2D) = "white" {}
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
            uniform float4 _Color;
            uniform sampler2D _node_8397; uniform float4 _node_8397_ST;
            uniform float _saoguang;
            uniform float _wangge;
            uniform float4 _node_6974;
            uniform sampler2D _node_634; uniform float4 _node_634_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
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
                float4 _node_634_var = tex2D(_node_634,TRANSFORM_TEX(i.uv1, _node_634));
                float2 node_5282 = (i.uv0+((i.vertexColor.a+(-0.5))*2.0)*float2(-1,0));
                float4 _node_8397_var = tex2D(_node_8397,TRANSFORM_TEX(node_5282, _node_8397));
                float node_9423 = (_node_634_var.b*_node_8397_var.r);
                float3 emissive = ((_node_634_var.b*_wangge*_node_6974.rgb)+(node_9423*_Color.rgb*_saoguang));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((_node_634_var.b+node_9423)*i.vertexColor.a));
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
