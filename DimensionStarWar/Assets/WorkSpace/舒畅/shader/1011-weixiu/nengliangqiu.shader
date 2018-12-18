// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33394,y:32676,varname:node_9361,prsc:2|custl-6166-OUT,alpha-3387-OUT;n:type:ShaderForge.SFN_Fresnel,id:3243,x:32137,y:32454,varname:node_3243,prsc:2|EXP-8088-OUT;n:type:ShaderForge.SFN_Vector1,id:8088,x:31949,y:32477,varname:node_8088,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:9415,x:32913,y:32794,varname:node_9415,prsc:2|A-4870-OUT,B-3285-RGB;n:type:ShaderForge.SFN_Color,id:3285,x:32715,y:32813,ptovrint:False,ptlb:node_3285,ptin:_node_3285,varname:node_3285,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1075368,c2:0.461171,c3:0.8602941,c4:1;n:type:ShaderForge.SFN_Panner,id:8370,x:31959,y:32997,varname:node_8370,prsc:2,spu:-0.6,spv:-0.2|UVIN-8572-OUT;n:type:ShaderForge.SFN_TexCoord,id:2667,x:31600,y:33009,varname:node_2667,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:9384,x:31959,y:33159,ptovrint:False,ptlb:node_9384,ptin:_node_9384,varname:node_9384,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5053,x:32137,y:32997,varname:node_5053,prsc:2,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False|UVIN-8370-UVOUT,TEX-9384-TEX;n:type:ShaderForge.SFN_Multiply,id:140,x:32633,y:33154,varname:node_140,prsc:2|A-5053-B,B-6908-B,C-8714-OUT;n:type:ShaderForge.SFN_Tex2d,id:6908,x:32137,y:33229,varname:node_6908,prsc:2,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False|UVIN-245-UVOUT,TEX-9384-TEX;n:type:ShaderForge.SFN_Panner,id:245,x:31971,y:33305,varname:node_245,prsc:2,spu:-0.3,spv:-0.5|UVIN-8572-OUT;n:type:ShaderForge.SFN_Multiply,id:8572,x:31786,y:33043,varname:node_8572,prsc:2|A-2667-UVOUT,B-1612-OUT;n:type:ShaderForge.SFN_Vector2,id:1612,x:31639,y:33160,varname:node_1612,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_Multiply,id:9537,x:32853,y:33236,varname:node_9537,prsc:2|A-140-OUT,B-1720-RGB;n:type:ShaderForge.SFN_Color,id:1720,x:32633,y:33305,ptovrint:False,ptlb:node_1720,ptin:_node_1720,varname:node_1720,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.8758622,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:6166,x:33207,y:32840,varname:node_6166,prsc:2|A-9415-OUT,B-9537-OUT;n:type:ShaderForge.SFN_OneMinus,id:8714,x:32454,y:32974,varname:node_8714,prsc:2|IN-3243-OUT;n:type:ShaderForge.SFN_Add,id:1704,x:33046,y:32995,varname:node_1704,prsc:2|A-4870-OUT,B-140-OUT;n:type:ShaderForge.SFN_Clamp01,id:3387,x:33207,y:32995,varname:node_3387,prsc:2|IN-1704-OUT;n:type:ShaderForge.SFN_Multiply,id:7512,x:32482,y:32733,varname:node_7512,prsc:2|A-3243-OUT,B-3776-OUT;n:type:ShaderForge.SFN_Add,id:3776,x:32321,y:32744,varname:node_3776,prsc:2|A-3279-R,B-3474-R;n:type:ShaderForge.SFN_Tex2d,id:3474,x:32137,y:32710,varname:node_3474,prsc:2,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False|UVIN-5682-UVOUT,TEX-9384-TEX;n:type:ShaderForge.SFN_Tex2d,id:3279,x:32137,y:32578,varname:node_3279,prsc:2,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False|UVIN-7639-UVOUT,TEX-9384-TEX;n:type:ShaderForge.SFN_Panner,id:7639,x:31921,y:32568,varname:node_7639,prsc:2,spu:0.2,spv:0.4|UVIN-2667-UVOUT;n:type:ShaderForge.SFN_Panner,id:5682,x:31921,y:32762,varname:node_5682,prsc:2,spu:-0.3,spv:-0.1|UVIN-2667-UVOUT;n:type:ShaderForge.SFN_Slider,id:1665,x:32382,y:32568,ptovrint:False,ptlb:node_1665,ptin:_node_1665,varname:node_1665,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1410256,max:1;n:type:ShaderForge.SFN_Divide,id:4870,x:32715,y:32568,varname:node_4870,prsc:2|A-7512-OUT,B-1665-OUT;proporder:3285-9384-1720-1665;pass:END;sub:END;*/

Shader "Shader Forge/nengliangqiu" {
    Properties {
        [HDR]_node_3285 ("node_3285", Color) = (0.1075368,0.461171,0.8602941,1)
        _node_9384 ("node_9384", 2D) = "white" {}
        [HDR]_node_1720 ("node_1720", Color) = (0,0.8758622,1,1)
        _node_1665 ("node_1665", Range(0, 1)) = 0.1410256
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
            uniform float4 _node_3285;
            uniform sampler2D _node_9384; uniform float4 _node_9384_ST;
            uniform float4 _node_1720;
            uniform float _node_1665;
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
                float node_3243 = pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0);
                float4 node_6860 = _Time;
                float2 node_7639 = (i.uv0+node_6860.g*float2(0.2,0.4));
                float4 node_3279 = tex2D(_node_9384,TRANSFORM_TEX(node_7639, _node_9384));
                float2 node_5682 = (i.uv0+node_6860.g*float2(-0.3,-0.1));
                float4 node_3474 = tex2D(_node_9384,TRANSFORM_TEX(node_5682, _node_9384));
                float node_7512 = (node_3243*(node_3279.r+node_3474.r));
                float node_4870 = (node_7512/_node_1665);
                float2 node_8572 = (i.uv0*float2(2,2));
                float2 node_8370 = (node_8572+node_6860.g*float2(-0.6,-0.2));
                float4 node_5053 = tex2D(_node_9384,TRANSFORM_TEX(node_8370, _node_9384));
                float2 node_245 = (node_8572+node_6860.g*float2(-0.3,-0.5));
                float4 node_6908 = tex2D(_node_9384,TRANSFORM_TEX(node_245, _node_9384));
                float node_140 = (node_5053.b*node_6908.b*(1.0 - node_3243));
                float3 finalColor = ((node_4870*_node_3285.rgb)+(node_140*_node_1720.rgb));
                fixed4 finalRGBA = fixed4(finalColor,saturate((node_4870+node_140)));
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
