// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33380,y:32697,varname:node_9361,prsc:2|custl-1516-OUT,alpha-5030-OUT;n:type:ShaderForge.SFN_Tex2d,id:260,x:32397,y:32909,ptovrint:False,ptlb:maintex,ptin:_maintex,varname:node_260,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-4597-UVOUT;n:type:ShaderForge.SFN_Panner,id:4597,x:32208,y:32909,varname:node_4597,prsc:2,spu:0,spv:-1|UVIN-1300-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1300,x:31996,y:32909,varname:node_1300,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9181,x:32606,y:32777,varname:node_9181,prsc:2|A-260-RGB,B-8749-RGB;n:type:ShaderForge.SFN_Color,id:8749,x:32443,y:33110,ptovrint:False,ptlb:liuwen color,ptin:_liuwencolor,varname:node_8749,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4185598,c2:1,c3:0.1397059,c4:1;n:type:ShaderForge.SFN_Multiply,id:8895,x:32652,y:33034,varname:node_8895,prsc:2|A-260-R,B-8749-A;n:type:ShaderForge.SFN_Fresnel,id:2442,x:32437,y:32586,varname:node_2442,prsc:2|EXP-9783-OUT;n:type:ShaderForge.SFN_Vector1,id:9783,x:32221,y:32620,varname:node_9783,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:5030,x:33124,y:33036,varname:node_5030,prsc:2|A-2442-OUT,B-1274-OUT;n:type:ShaderForge.SFN_Add,id:1516,x:32969,y:32746,varname:node_1516,prsc:2|A-8030-OUT,B-9181-OUT;n:type:ShaderForge.SFN_Multiply,id:8030,x:32698,y:32545,varname:node_8030,prsc:2|A-6850-RGB,B-2442-OUT;n:type:ShaderForge.SFN_Color,id:6850,x:32437,y:32416,ptovrint:False,ptlb:F color,ptin:_Fcolor,varname:node_6850,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6290061,c2:1,c3:0.1323529,c4:1;n:type:ShaderForge.SFN_Multiply,id:1274,x:32931,y:33055,varname:node_1274,prsc:2|A-2442-OUT,B-8895-OUT;proporder:260-8749-6850;pass:END;sub:END;*/

Shader "Shader Forge/zhutidan" {
    Properties {
        _maintex ("maintex", 2D) = "white" {}
        [HDR]_liuwencolor ("liuwen color", Color) = (0.4185598,1,0.1397059,1)
        [HDR]_Fcolor ("F color", Color) = (0.6290061,1,0.1323529,1)
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
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
            uniform float4 _liuwencolor;
            uniform float4 _Fcolor;
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
                float node_2442 = pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0);
                float4 node_6624 = _Time;
                float2 node_4597 = (i.uv0+node_6624.g*float2(0,-1));
                float4 _maintex_var = tex2D(_maintex,TRANSFORM_TEX(node_4597, _maintex));
                float3 finalColor = ((_Fcolor.rgb*node_2442)+(_maintex_var.rgb*_liuwencolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(node_2442+(node_2442*(_maintex_var.r*_liuwencolor.a))));
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
