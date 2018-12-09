// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33563,y:32657,varname:node_4013,prsc:2|emission-9370-R,alpha-9468-OUT;n:type:ShaderForge.SFN_Tex2d,id:9370,x:32797,y:32818,ptovrint:False,ptlb:node_9370,ptin:_node_9370,varname:node_9370,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f2ec27081656d8647b8be6525cc47884,ntxv:0,isnm:False|UVIN-7714-UVOUT;n:type:ShaderForge.SFN_Panner,id:7714,x:32628,y:32818,varname:node_7714,prsc:2,spu:0,spv:0.2|UVIN-4921-OUT;n:type:ShaderForge.SFN_TexCoord,id:8222,x:32268,y:32925,varname:node_8222,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:8637,x:31928,y:32508,ptovrint:False,ptlb:node_8637,ptin:_node_8637,varname:node_8637,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7369,x:32087,y:32723,varname:node_7369,prsc:2,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False|UVIN-8917-UVOUT,TEX-8637-TEX;n:type:ShaderForge.SFN_Tex2d,id:1502,x:32087,y:32873,varname:node_1502,prsc:2,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False|UVIN-7445-UVOUT,TEX-8637-TEX;n:type:ShaderForge.SFN_Panner,id:8917,x:31910,y:32713,varname:node_8917,prsc:2,spu:0.1,spv:0.3|UVIN-9590-UVOUT,DIST-5205-OUT;n:type:ShaderForge.SFN_Panner,id:7445,x:31910,y:32886,varname:node_7445,prsc:2,spu:-0.2,spv:-0.05|UVIN-9590-UVOUT,DIST-5205-OUT;n:type:ShaderForge.SFN_TexCoord,id:9590,x:31657,y:32783,varname:node_9590,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:5187,x:32268,y:32800,varname:node_5187,prsc:2|A-7369-R,B-1502-R;n:type:ShaderForge.SFN_Add,id:4921,x:32456,y:32818,varname:node_4921,prsc:2|A-5187-OUT,B-8222-UVOUT;n:type:ShaderForge.SFN_Slider,id:5205,x:31955,y:33202,ptovrint:False,ptlb:liudong/mingan,ptin:_liudongmingan,varname:node_5205,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:9468,x:33138,y:32980,varname:node_9468,prsc:2|A-9370-R,B-5205-OUT,C-8480-OUT;n:type:ShaderForge.SFN_Slider,id:8480,x:32734,y:33324,ptovrint:False,ptlb:mingan2,ptin:_mingan2,varname:node_8480,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4882896,max:1;proporder:9370-8637-5205-8480;pass:END;sub:END;*/

Shader "Shader Forge/rongpingliudong" {
    Properties {
        _node_9370 ("node_9370", 2D) = "white" {}
        _node_8637 ("node_8637", 2D) = "white" {}
        _liudongmingan ("liudong/mingan", Range(0, 1)) = 0
        _mingan2 ("mingan2", Range(0, 1)) = 0.4882896
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
            uniform sampler2D _node_9370; uniform float4 _node_9370_ST;
            uniform sampler2D _node_8637; uniform float4 _node_8637_ST;
            uniform float _liudongmingan;
            uniform float _mingan2;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_8716 = _Time;
                float2 node_8917 = (i.uv0+_liudongmingan*float2(0.1,0.3));
                float4 node_7369 = tex2D(_node_8637,TRANSFORM_TEX(node_8917, _node_8637));
                float2 node_7445 = (i.uv0+_liudongmingan*float2(-0.2,-0.05));
                float4 node_1502 = tex2D(_node_8637,TRANSFORM_TEX(node_7445, _node_8637));
                float2 node_7714 = (((node_7369.r*node_1502.r)+i.uv0)+node_8716.g*float2(0,0.2));
                float4 _node_9370_var = tex2D(_node_9370,TRANSFORM_TEX(node_7714, _node_9370));
                float3 emissive = float3(_node_9370_var.r,_node_9370_var.r,_node_9370_var.r);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(_node_9370_var.r*_liudongmingan*_mingan2));
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
