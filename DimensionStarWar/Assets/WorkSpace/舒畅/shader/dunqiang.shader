// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34463,y:31544,varname:node_4013,prsc:2|emission-1501-OUT,alpha-825-OUT;n:type:ShaderForge.SFN_Fresnel,id:9237,x:32299,y:32286,varname:node_9237,prsc:2|EXP-5606-OUT;n:type:ShaderForge.SFN_Panner,id:1609,x:32307,y:32495,varname:node_1609,prsc:2,spu:0.1,spv:-0.4|UVIN-3778-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:704,x:32250,y:31534,varname:node_704,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:9752,x:32311,y:32774,varname:node_9752,prsc:2,spu:-0.3,spv:-0.3|UVIN-7175-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7065,x:32683,y:32560,varname:node_7065,prsc:2|A-486-R,B-8204-R;n:type:ShaderForge.SFN_ValueProperty,id:5606,x:32123,y:32303,ptovrint:False,ptlb:Ffanwei,ptin:_Ffanwei,varname:node_5606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:9500,x:32866,y:32601,varname:node_9500,prsc:2|A-7065-OUT,B-7668-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7668,x:32666,y:32753,ptovrint:False,ptlb:wenliliangdu,ptin:_wenliliangdu,varname:node_7668,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Step,id:2222,x:33054,y:32601,varname:node_2222,prsc:2|A-9500-OUT,B-3577-OUT;n:type:ShaderForge.SFN_Color,id:605,x:32695,y:31783,ptovrint:False,ptlb:wangse,ptin:_wangse,varname:node_605,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.5034485,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:3683,x:34129,y:31974,ptovrint:False,ptlb:wangqiang,ptin:_wangqiang,varname:node_3683,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Multiply,id:6040,x:32474,y:31534,varname:node_6040,prsc:2|A-704-UVOUT,B-668-OUT;n:type:ShaderForge.SFN_Vector2,id:668,x:32250,y:31671,varname:node_668,prsc:2,v1:3,v2:1;n:type:ShaderForge.SFN_Multiply,id:4006,x:33115,y:31559,varname:node_4006,prsc:2|A-8606-OUT,B-248-R,C-6745-RGB;n:type:ShaderForge.SFN_ValueProperty,id:8606,x:32684,y:31457,ptovrint:False,ptlb:liuqiang,ptin:_liuqiang,varname:node_8606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:6745,x:32684,y:31293,ptovrint:False,ptlb:liuse,ptin:_liuse,varname:node_6745,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3235294,c2:0.6081135,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8204,x:32481,y:32774,ptovrint:False,ptlb:node_8204,ptin:_node_8204,varname:node_8204,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False|UVIN-9752-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:486,x:32477,y:32495,ptovrint:False,ptlb:node_486,ptin:_node_486,varname:node_486,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-1609-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2923,x:33022,y:33243,ptovrint:False,ptlb:node_2923,ptin:_node_2923,varname:node_2923,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6a340f64d0c419d44982d6cae286affe,ntxv:0,isnm:False|UVIN-5155-UVOUT;n:type:ShaderForge.SFN_Panner,id:5155,x:32823,y:33243,varname:node_5155,prsc:2,spu:0,spv:-1|UVIN-2910-UVOUT,DIST-7391-OUT;n:type:ShaderForge.SFN_Vector1,id:9846,x:32866,y:32767,varname:node_9846,prsc:2,v1:0.2549246;n:type:ShaderForge.SFN_Slider,id:7391,x:32323,y:33473,ptovrint:False,ptlb:chuxian/xiaoshi,ptin:_chuxianxiaoshi,varname:node_7391,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.3,cur:0.720208,max:1;n:type:ShaderForge.SFN_TexCoord,id:2910,x:32626,y:33243,varname:node_2910,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:3778,x:32133,y:32495,varname:node_3778,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:7175,x:32128,y:32774,varname:node_7175,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:248,x:32684,y:31534,ptovrint:False,ptlb:node_248,ptin:_node_248,varname:node_248,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e7b7fed7a9148144fb2b77cfc7b535da,ntxv:0,isnm:False|UVIN-6040-OUT;n:type:ShaderForge.SFN_Slider,id:3577,x:32709,y:32896,ptovrint:False,ptlb:node_3577,ptin:_node_3577,varname:node_3577,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1899237,max:1;n:type:ShaderForge.SFN_Multiply,id:396,x:33209,y:32335,varname:node_396,prsc:2|A-9237-OUT,B-2222-OUT;n:type:ShaderForge.SFN_Multiply,id:3316,x:33097,y:31881,varname:node_3316,prsc:2|A-248-R,B-605-RGB,C-787-OUT,D-9500-OUT;n:type:ShaderForge.SFN_Multiply,id:7256,x:33454,y:32716,varname:node_7256,prsc:2|A-396-OUT,B-2923-R;n:type:ShaderForge.SFN_ValueProperty,id:787,x:32855,y:31915,ptovrint:False,ptlb:node_787,ptin:_node_787,varname:node_787,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Add,id:8725,x:33339,y:31654,varname:node_8725,prsc:2|A-4006-OUT,B-3316-OUT;n:type:ShaderForge.SFN_Add,id:825,x:33806,y:32101,varname:node_825,prsc:2|A-3070-OUT,B-7256-OUT;n:type:ShaderForge.SFN_Multiply,id:3070,x:33551,y:32018,varname:node_3070,prsc:2|A-248-R,B-2923-R;n:type:ShaderForge.SFN_Multiply,id:7246,x:32743,y:32143,varname:node_7246,prsc:2|A-4391-RGB,B-9237-OUT;n:type:ShaderForge.SFN_Color,id:4391,x:32299,y:32022,ptovrint:False,ptlb:node_4391,ptin:_node_4391,varname:node_4391,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2941176,c2:0.5326573,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6848,x:33183,y:32146,varname:node_6848,prsc:2|A-7246-OUT,B-2923-R;n:type:ShaderForge.SFN_Add,id:1501,x:33780,y:31727,varname:node_1501,prsc:2|A-8725-OUT,B-6848-OUT;proporder:5606-7668-605-3683-8606-6745-486-8204-2923-7391-248-3577-787-4391;pass:END;sub:END;*/

Shader "Shader Forge/dunqiang" {
    Properties {
        _Ffanwei ("Ffanwei", Float ) = 1.5
        _wenliliangdu ("wenliliangdu", Float ) = 2
        [HDR]_wangse ("wangse", Color) = (0,0.5034485,1,1)
        _wangqiang ("wangqiang", Float ) = 3
        _liuqiang ("liuqiang", Float ) = 1
        [HDR]_liuse ("liuse", Color) = (0.3235294,0.6081135,1,1)
        _node_486 ("node_486", 2D) = "white" {}
        _node_8204 ("node_8204", 2D) = "white" {}
        _node_2923 ("node_2923", 2D) = "white" {}
        _chuxianxiaoshi ("chuxian/xiaoshi", Range(-0.3, 1)) = 0.720208
        _node_248 ("node_248", 2D) = "white" {}
        _node_3577 ("node_3577", Range(0, 1)) = 0.1899237
        _node_787 ("node_787", Float ) = 5
        _node_4391 ("node_4391", Color) = (0.2941176,0.5326573,1,1)
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
            uniform float _Ffanwei;
            uniform float _wenliliangdu;
            uniform float4 _wangse;
            uniform float _liuqiang;
            uniform float4 _liuse;
            uniform sampler2D _node_8204; uniform float4 _node_8204_ST;
            uniform sampler2D _node_486; uniform float4 _node_486_ST;
            uniform sampler2D _node_2923; uniform float4 _node_2923_ST;
            uniform float _chuxianxiaoshi;
            uniform sampler2D _node_248; uniform float4 _node_248_ST;
            uniform float _node_3577;
            uniform float _node_787;
            uniform float4 _node_4391;
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
                float2 node_6040 = (i.uv0*float2(3,1));
                float4 _node_248_var = tex2D(_node_248,TRANSFORM_TEX(node_6040, _node_248));
                float4 node_7231 = _Time;
                float2 node_1609 = (i.uv0+node_7231.g*float2(0.1,-0.4));
                float4 _node_486_var = tex2D(_node_486,TRANSFORM_TEX(node_1609, _node_486));
                float2 node_9752 = (i.uv0+node_7231.g*float2(-0.3,-0.3));
                float4 _node_8204_var = tex2D(_node_8204,TRANSFORM_TEX(node_9752, _node_8204));
                float node_9500 = ((_node_486_var.r*_node_8204_var.r)*_wenliliangdu);
                float node_9237 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_Ffanwei);
                float2 node_5155 = (i.uv0+_chuxianxiaoshi*float2(0,-1));
                float4 _node_2923_var = tex2D(_node_2923,TRANSFORM_TEX(node_5155, _node_2923));
                float3 emissive = (((_liuqiang*_node_248_var.r*_liuse.rgb)+(_node_248_var.r*_wangse.rgb*_node_787*node_9500))+((_node_4391.rgb*node_9237)*_node_2923_var.r));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((_node_248_var.r*_node_2923_var.r)+((node_9237*step(node_9500,_node_3577))*_node_2923_var.r)));
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
