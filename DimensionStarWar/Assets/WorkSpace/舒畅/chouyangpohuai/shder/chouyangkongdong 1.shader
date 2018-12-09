// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:35384,y:32620,varname:node_4013,prsc:2|emission-2510-OUT,alpha-2510-OUT;n:type:ShaderForge.SFN_Vector1,id:6134,x:33029,y:32961,varname:node_6134,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:2096,x:32974,y:32559,ptovrint:False,ptlb:node_2096,ptin:_node_2096,varname:node_2096,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:77b70e79a6d16f44e9ae27b5675becc9,ntxv:0,isnm:False|UVIN-1043-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5016,x:32974,y:32363,ptovrint:False,ptlb:node_5016,ptin:_node_5016,varname:node_5016,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1c13640c96576d24f894a3b059c065d6,ntxv:0,isnm:False|UVIN-2158-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5637,x:33799,y:32512,ptovrint:False,ptlb:node_5637,ptin:_node_5637,varname:node_5637,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f7279f0df475ff548b6807c3f0b0dc7d,ntxv:0,isnm:False|UVIN-663-UVOUT;n:type:ShaderForge.SFN_Panner,id:2158,x:32794,y:32363,varname:node_2158,prsc:2,spu:0.1,spv:-0.1|UVIN-1328-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1328,x:32599,y:32363,varname:node_1328,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:1043,x:32794,y:32559,varname:node_1043,prsc:2,spu:-0.2,spv:0.3|UVIN-5970-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5970,x:32599,y:32559,varname:node_5970,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4399,x:33205,y:32512,varname:node_4399,prsc:2|A-5016-R,B-2096-R;n:type:ShaderForge.SFN_Add,id:852,x:33431,y:32512,varname:node_852,prsc:2|A-4399-OUT,B-1472-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1472,x:33205,y:32667,varname:node_1472,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:663,x:33604,y:32512,varname:node_663,prsc:2,spu:-0.2,spv:0.2|UVIN-852-OUT;n:type:ShaderForge.SFN_Tex2d,id:8566,x:33959,y:32134,ptovrint:False,ptlb:node_8566,ptin:_node_8566,varname:node_8566,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7c9a572723eb7f74da91f5f93def136f,ntxv:0,isnm:False|UVIN-7832-UVOUT;n:type:ShaderForge.SFN_Panner,id:7832,x:33748,y:32134,varname:node_7832,prsc:2,spu:1,spv:1|UVIN-9928-UVOUT,DIST-7575-OUT;n:type:ShaderForge.SFN_TexCoord,id:9928,x:33560,y:32134,varname:node_9928,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:7575,x:33431,y:32316,ptovrint:False,ptlb:node_7575,ptin:_node_7575,varname:node_7575,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2222212,max:1;n:type:ShaderForge.SFN_Tex2d,id:9003,x:34003,y:32916,ptovrint:False,ptlb:node_9003,ptin:_node_9003,varname:node_9003,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9b0306aa8236a9f46a449ed73292733f,ntxv:0,isnm:False|UVIN-9529-UVOUT;n:type:ShaderForge.SFN_Panner,id:9529,x:33798,y:32916,varname:node_9529,prsc:2,spu:0.5,spv:0|UVIN-9615-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9615,x:33569,y:32916,varname:node_9615,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:6568,x:33798,y:33117,varname:node_6568,prsc:2,spu:-0.3,spv:0|UVIN-3943-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:500,x:33991,y:33117,ptovrint:False,ptlb:node_9003_copy,ptin:_node_9003_copy,varname:_node_9003_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9b0306aa8236a9f46a449ed73292733f,ntxv:0,isnm:False|UVIN-6568-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3943,x:33569,y:33117,varname:node_3943,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1631,x:34235,y:33023,varname:node_1631,prsc:2|A-9003-R,B-500-R;n:type:ShaderForge.SFN_Add,id:2510,x:34290,y:32836,varname:node_2510,prsc:2|A-9003-R,B-500-R;proporder:2096-5016-5637-9003-500;pass:END;sub:END;*/

Shader "Shader Forge/chouyangkongdongb 1" {
    Properties {
        _node_2096 ("node_2096", 2D) = "white" {}
        _node_5016 ("node_5016", 2D) = "white" {}
        _node_5637 ("node_5637", 2D) = "white" {}
        _node_9003 ("node_9003", 2D) = "white" {}
        _node_9003_copy ("node_9003_copy", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_9003; uniform float4 _node_9003_ST;
            uniform sampler2D _node_9003_copy; uniform float4 _node_9003_copy_ST;
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
                float4 node_858 = _Time;
                float2 node_9529 = (i.uv0+node_858.g*float2(0.5,0));
                float4 _node_9003_var = tex2D(_node_9003,TRANSFORM_TEX(node_9529, _node_9003));
                float2 node_6568 = (i.uv0+node_858.g*float2(-0.3,0));
                float4 _node_9003_copy_var = tex2D(_node_9003_copy,TRANSFORM_TEX(node_6568, _node_9003_copy));
                float node_2510 = (_node_9003_var.r+_node_9003_copy_var.r);
                float3 emissive = float3(node_2510,node_2510,node_2510);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,node_2510);
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
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
