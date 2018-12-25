// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34108,y:33024,varname:node_9361,prsc:2|custl-6826-OUT,clip-5464-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5413,x:32847,y:33251,ptovrint:False,ptlb:liudongtex,ptin:_liudongtex,varname:node_5413,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2259,x:33092,y:33119,varname:node_2259,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-7695-UVOUT,TEX-5413-TEX;n:type:ShaderForge.SFN_Tex2d,id:8956,x:33092,y:33368,varname:node_8956,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2474-UVOUT,TEX-5413-TEX;n:type:ShaderForge.SFN_Panner,id:7695,x:32847,y:33072,varname:node_7695,prsc:2,spu:0.2,spv:0.3|UVIN-1474-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1474,x:32668,y:33251,varname:node_1474,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:2474,x:32847,y:33413,varname:node_2474,prsc:2,spu:-0.4,spv:-0.1|UVIN-1474-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9335,x:33285,y:33288,varname:node_9335,prsc:2|A-2259-R,B-8956-R;n:type:ShaderForge.SFN_Fresnel,id:1391,x:33285,y:33005,varname:node_1391,prsc:2|EXP-6693-OUT;n:type:ShaderForge.SFN_Vector1,id:6693,x:33104,y:33039,varname:node_6693,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:5478,x:33500,y:33233,varname:node_5478,prsc:2|A-1391-OUT,B-9335-OUT;n:type:ShaderForge.SFN_Multiply,id:28,x:33699,y:33144,varname:node_28,prsc:2|A-4193-RGB,B-5478-OUT,C-8178-OUT;n:type:ShaderForge.SFN_VertexColor,id:4193,x:33285,y:33144,varname:node_4193,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:5712,x:33285,y:33433,ptovrint:False,ptlb:rongjie,ptin:_rongjie,varname:node_5712,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0839562779f0c0543aaa239b78bd12b9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:5464,x:33500,y:33450,varname:node_5464,prsc:2|A-5712-R,B-4193-A;n:type:ShaderForge.SFN_ValueProperty,id:8178,x:33500,y:33178,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_8178,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:6826,x:33885,y:33125,varname:node_6826,prsc:2|A-6071-RGB,B-28-OUT;n:type:ShaderForge.SFN_Color,id:6071,x:33709,y:33002,ptovrint:False,ptlb:di,ptin:_di,varname:node_6071,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1138625,c2:0.1550739,c3:0.5735294,c4:1;proporder:5413-5712-8178-6071;pass:END;sub:END;*/

Shader "Shader Forge/weiba" {
    Properties {
        _liudongtex ("liudongtex", 2D) = "white" {}
        _rongjie ("rongjie", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
        _di ("di", Color) = (0.1138625,0.1550739,0.5735294,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _liudongtex; uniform float4 _liudongtex_ST;
            uniform sampler2D _rongjie; uniform float4 _rongjie_ST;
            uniform float _Intensity;
            uniform float4 _di;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
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
                float4 _rongjie_var = tex2D(_rongjie,TRANSFORM_TEX(i.uv0, _rongjie));
                clip(step(_rongjie_var.r,i.vertexColor.a) - 0.5);
////// Lighting:
                float4 node_7401 = _Time;
                float2 node_7695 = (i.uv0+node_7401.g*float2(0.2,0.3));
                float4 node_2259 = tex2D(_liudongtex,TRANSFORM_TEX(node_7695, _liudongtex));
                float2 node_2474 = (i.uv0+node_7401.g*float2(-0.4,-0.1));
                float4 node_8956 = tex2D(_liudongtex,TRANSFORM_TEX(node_2474, _liudongtex));
                float node_5478 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0)+(node_2259.r*node_8956.r));
                float3 finalColor = (_di.rgb+(i.vertexColor.rgb*node_5478*_Intensity));
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
            uniform sampler2D _rongjie; uniform float4 _rongjie_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _rongjie_var = tex2D(_rongjie,TRANSFORM_TEX(i.uv0, _rongjie));
                clip(step(_rongjie_var.r,i.vertexColor.a) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
