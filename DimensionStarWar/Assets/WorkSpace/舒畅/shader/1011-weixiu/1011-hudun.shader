// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:31721,y:32139,varname:node_9361,prsc:2|custl-7461-OUT,alpha-9343-OUT;n:type:ShaderForge.SFN_Tex2d,id:8315,x:30738,y:32307,ptovrint:False,ptlb:node_8315,ptin:_node_8315,varname:node_8315,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d0cad44178b4428449ae28bc741164c7,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4981,x:31132,y:32213,varname:node_4981,prsc:2|A-4211-RGB,B-8315-R;n:type:ShaderForge.SFN_Color,id:4211,x:30738,y:32127,ptovrint:False,ptlb:node_4211,ptin:_node_4211,varname:node_4211,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8102,x:30738,y:32503,ptovrint:False,ptlb:node_8102,ptin:_node_8102,varname:node_8102,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:536afdb46b57ee949b7d69005b4d0cb0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:7005,x:31356,y:32463,varname:node_7005,prsc:2|A-8315-R,B-8102-R;n:type:ShaderForge.SFN_Multiply,id:9343,x:31539,y:32485,varname:node_9343,prsc:2|A-7005-OUT,B-8402-OUT,C-3015-A;n:type:ShaderForge.SFN_Slider,id:8402,x:31199,y:32614,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_8402,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Add,id:7461,x:31476,y:32257,varname:node_7461,prsc:2|A-4981-OUT,B-6147-OUT;n:type:ShaderForge.SFN_Multiply,id:6147,x:31132,y:32440,varname:node_6147,prsc:2|A-8102-R,B-7049-RGB;n:type:ShaderForge.SFN_Color,id:7049,x:30738,y:32672,ptovrint:False,ptlb:node_7049,ptin:_node_7049,varname:node_7049,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1029412,c2:0.4803245,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:3015,x:31338,y:32725,varname:node_3015,prsc:2;proporder:8315-4211-8102-8402-7049;pass:END;sub:END;*/

Shader "Shader Forge/1011-hudun" {
    Properties {
        _node_8315 ("node_8315", 2D) = "white" {}
        [HDR]_node_4211 ("node_4211", Color) = (1,1,1,1)
        _node_8102 ("node_8102", 2D) = "white" {}
        _alpha ("alpha", Range(0, 1)) = 1
        _node_7049 ("node_7049", Color) = (0.1029412,0.4803245,1,1)
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
            uniform sampler2D _node_8315; uniform float4 _node_8315_ST;
            uniform float4 _node_4211;
            uniform sampler2D _node_8102; uniform float4 _node_8102_ST;
            uniform float _alpha;
            uniform float4 _node_7049;
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
                float4 _node_8315_var = tex2D(_node_8315,TRANSFORM_TEX(i.uv0, _node_8315));
                float4 _node_8102_var = tex2D(_node_8102,TRANSFORM_TEX(i.uv0, _node_8102));
                float3 finalColor = ((_node_4211.rgb*_node_8315_var.r)+(_node_8102_var.r*_node_7049.rgb));
                fixed4 finalRGBA = fixed4(finalColor,((_node_8315_var.r+_node_8102_var.r)*_alpha*i.vertexColor.a));
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
