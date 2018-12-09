// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33494,y:32690,varname:node_4013,prsc:2|emission-4579-OUT,alpha-6605-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32455,y:32600,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2599,x:32697,y:33064,ptovrint:False,ptlb:node_2599,ptin:_node_2599,varname:node_2599,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d6f89b8b897c34c4da2ecf4c59234f0b,ntxv:0,isnm:False|UVIN-2434-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:516,x:32684,y:32833,ptovrint:False,ptlb:node_516,ptin:_node_516,varname:node_516,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-796-UVOUT;n:type:ShaderForge.SFN_Panner,id:796,x:32521,y:32833,varname:node_796,prsc:2,spu:0.1,spv:0.3|UVIN-1307-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1307,x:32340,y:32833,varname:node_1307,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4579,x:32917,y:32866,varname:node_4579,prsc:2|A-1304-RGB,B-516-RGB;n:type:ShaderForge.SFN_VertexColor,id:8862,x:32697,y:33315,varname:node_8862,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6605,x:33289,y:33003,varname:node_6605,prsc:2|A-3667-OUT,B-8862-A,C-9769-OUT;n:type:ShaderForge.SFN_Panner,id:2434,x:32530,y:33028,varname:node_2434,prsc:2,spu:0,spv:0.2|UVIN-1307-UVOUT;n:type:ShaderForge.SFN_Slider,id:2626,x:32749,y:33157,ptovrint:False,ptlb:zheqiang,ptin:_zheqiang,varname:node_2626,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.641026,max:5;n:type:ShaderForge.SFN_Power,id:3667,x:33077,y:32984,varname:node_3667,prsc:2|VAL-2599-R,EXP-2626-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9769,x:33137,y:33221,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_9769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1304-2599-516-2626-9769;pass:END;sub:END;*/

Shader "Shader Forge/niuxiudaiji" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        _node_2599 ("node_2599", 2D) = "white" {}
        _node_516 ("node_516", 2D) = "white" {}
        _zheqiang ("zheqiang", Range(0, 5)) = 1.641026
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
            uniform float4 _Color;
            uniform sampler2D _node_2599; uniform float4 _node_2599_ST;
            uniform sampler2D _node_516; uniform float4 _node_516_ST;
            uniform float _zheqiang;
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
////// Lighting:
////// Emissive:
                float4 node_9434 = _Time;
                float2 node_796 = (i.uv0+node_9434.g*float2(0.1,0.3));
                float4 _node_516_var = tex2D(_node_516,TRANSFORM_TEX(node_796, _node_516));
                float3 emissive = (_Color.rgb*_node_516_var.rgb);
                float3 finalColor = emissive;
                float2 node_2434 = (i.uv0+node_9434.g*float2(0,0.2));
                float4 _node_2599_var = tex2D(_node_2599,TRANSFORM_TEX(node_2434, _node_2599));
                fixed4 finalRGBA = fixed4(finalColor,(pow(_node_2599_var.r,_zheqiang)*i.vertexColor.a*_liangdu));
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
