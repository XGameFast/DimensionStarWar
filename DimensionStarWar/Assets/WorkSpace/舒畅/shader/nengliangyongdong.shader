// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-9090-OUT,alpha-5658-OUT;n:type:ShaderForge.SFN_Tex2d,id:2765,x:32417,y:33067,ptovrint:False,ptlb:node_2765,ptin:_node_2765,varname:node_2765,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:326a7beb60c6ef74e98a1b4a407d53aa,ntxv:0,isnm:False|UVIN-7034-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7954,x:32417,y:32851,ptovrint:False,ptlb:node_7954,ptin:_node_7954,varname:node_7954,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc9800798d84e334bbac2cd9b62a27bd,ntxv:0,isnm:False|UVIN-7536-UVOUT;n:type:ShaderForge.SFN_Panner,id:7536,x:32236,y:32851,varname:node_7536,prsc:2,spu:0.5,spv:0|UVIN-8544-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8544,x:31982,y:32851,varname:node_8544,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7034,x:32236,y:33067,varname:node_7034,prsc:2,spu:0.3,spv:0|UVIN-8544-UVOUT;n:type:ShaderForge.SFN_Lerp,id:2309,x:32677,y:33000,varname:node_2309,prsc:2|A-7954-R,B-2765-R,T-5671-OUT;n:type:ShaderForge.SFN_Slider,id:5671,x:32326,y:33218,ptovrint:False,ptlb:node_5671,ptin:_node_5671,varname:node_5671,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3846159,max:1;n:type:ShaderForge.SFN_Multiply,id:5658,x:32860,y:33000,varname:node_5658,prsc:2|A-2309-OUT,B-4540-A,C-4262-OUT;n:type:ShaderForge.SFN_VertexColor,id:4540,x:32677,y:33137,varname:node_4540,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9090,x:32855,y:32862,varname:node_9090,prsc:2|A-4540-RGB,B-2309-OUT,C-9077-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9077,x:32677,y:32919,ptovrint:False,ptlb:node_9077,ptin:_node_9077,varname:node_9077,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:22,x:32391,y:32652,varname:node_22,prsc:2|A-8544-U,B-5757-OUT,C-7092-OUT;n:type:ShaderForge.SFN_OneMinus,id:5757,x:32205,y:32652,varname:node_5757,prsc:2|IN-8544-U;n:type:ShaderForge.SFN_Vector1,id:7092,x:32205,y:32775,varname:node_7092,prsc:2,v1:4;n:type:ShaderForge.SFN_Clamp01,id:4262,x:32553,y:32652,varname:node_4262,prsc:2|IN-22-OUT;proporder:2765-7954-5671-9077;pass:END;sub:END;*/

Shader "Shader Forge/nengliangyongdong" {
    Properties {
        _node_2765 ("node_2765", 2D) = "white" {}
        _node_7954 ("node_7954", 2D) = "white" {}
        _node_5671 ("node_5671", Range(0, 1)) = 0.3846159
        _node_9077 ("node_9077", Float ) = 1
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
            uniform sampler2D _node_2765; uniform float4 _node_2765_ST;
            uniform sampler2D _node_7954; uniform float4 _node_7954_ST;
            uniform float _node_5671;
            uniform float _node_9077;
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
                float4 node_8258 = _Time;
                float2 node_7536 = (i.uv0+node_8258.g*float2(0.5,0));
                float4 _node_7954_var = tex2D(_node_7954,TRANSFORM_TEX(node_7536, _node_7954));
                float2 node_7034 = (i.uv0+node_8258.g*float2(0.3,0));
                float4 _node_2765_var = tex2D(_node_2765,TRANSFORM_TEX(node_7034, _node_2765));
                float node_2309 = lerp(_node_7954_var.r,_node_2765_var.r,_node_5671);
                float3 finalColor = (i.vertexColor.rgb*node_2309*_node_9077);
                fixed4 finalRGBA = fixed4(finalColor,(node_2309*i.vertexColor.a*saturate((i.uv0.r*(1.0 - i.uv0.r)*4.0))));
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
