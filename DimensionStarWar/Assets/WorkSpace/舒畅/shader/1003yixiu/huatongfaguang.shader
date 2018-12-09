// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33332,y:32623,varname:node_4013,prsc:2|emission-2750-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32507,y:32635,ptovrint:False,ptlb:F Color,ptin:_FColor,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6352943,c2:0.1470588,c3:1,c4:1;n:type:ShaderForge.SFN_Fresnel,id:3955,x:32537,y:32798,varname:node_3955,prsc:2|EXP-5918-OUT;n:type:ShaderForge.SFN_Vector1,id:5918,x:32412,y:32867,varname:node_5918,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:6590,x:32795,y:32768,varname:node_6590,prsc:2|A-1304-RGB,B-3955-OUT;n:type:ShaderForge.SFN_Panner,id:2823,x:32381,y:32983,varname:node_2823,prsc:2,spu:0.2,spv:0.3|UVIN-1106-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1106,x:32220,y:32983,varname:node_1106,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6145,x:32808,y:33099,varname:node_6145,prsc:2|A-8958-R,B-8854-R;n:type:ShaderForge.SFN_Tex2dAsset,id:2203,x:32388,y:33146,ptovrint:False,ptlb:node_2203,ptin:_node_2203,varname:node_2203,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8958,x:32609,y:32983,varname:node_8958,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2823-UVOUT,TEX-2203-TEX;n:type:ShaderForge.SFN_Tex2d,id:8854,x:32609,y:33190,varname:node_8854,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-9790-UVOUT,TEX-2203-TEX;n:type:ShaderForge.SFN_Panner,id:9790,x:32388,y:33303,varname:node_9790,prsc:2,spu:-0.35,spv:-0.05|UVIN-1106-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9998,x:32971,y:33059,varname:node_9998,prsc:2|A-3955-OUT,B-6145-OUT,C-6979-RGB;n:type:ShaderForge.SFN_Color,id:6979,x:32808,y:33251,ptovrint:False,ptlb:liuwen color,ptin:_liuwencolor,varname:node_6979,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1911765,c2:0.3640973,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:2750,x:33106,y:32755,varname:node_2750,prsc:2|A-6590-OUT,B-9998-OUT;proporder:1304-2203-6979;pass:END;sub:END;*/

Shader "Shader Forge/huatongfaguang" {
    Properties {
        [HDR]_FColor ("F Color", Color) = (0.6352943,0.1470588,1,1)
        _node_2203 ("node_2203", 2D) = "white" {}
        [HDR]_liuwencolor ("liuwen color", Color) = (0.1911765,0.3640973,1,1)
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
            Blend One One
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
            uniform float4 _FColor;
            uniform sampler2D _node_2203; uniform float4 _node_2203_ST;
            uniform float4 _liuwencolor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float node_3955 = pow(1.0-max(0,dot(normalDirection, viewDirection)),1.5);
                float4 node_4988 = _Time;
                float2 node_2823 = (i.uv0+node_4988.g*float2(0.2,0.3));
                float4 node_8958 = tex2D(_node_2203,TRANSFORM_TEX(node_2823, _node_2203));
                float2 node_9790 = (i.uv0+node_4988.g*float2(-0.35,-0.05));
                float4 node_8854 = tex2D(_node_2203,TRANSFORM_TEX(node_9790, _node_2203));
                float3 emissive = ((_FColor.rgb*node_3955)+(node_3955*(node_8958.r*node_8854.r)*_liuwencolor.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
