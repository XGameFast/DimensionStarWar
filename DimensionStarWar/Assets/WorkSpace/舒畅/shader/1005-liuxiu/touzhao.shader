// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33667,y:32690,varname:node_4013,prsc:2|emission-3423-OUT,alpha-3338-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32681,y:32998,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.75,c3:0.375,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4515,x:32681,y:32801,ptovrint:False,ptlb:node_4515,ptin:_node_4515,varname:node_4515,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:78c21f8cad6aed94797b5c6a4053f7c5,ntxv:0,isnm:False|UVIN-6008-UVOUT;n:type:ShaderForge.SFN_Fresnel,id:4064,x:32652,y:32575,varname:node_4064,prsc:2|EXP-8965-OUT;n:type:ShaderForge.SFN_Vector1,id:8965,x:32471,y:32640,varname:node_8965,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:3423,x:33326,y:32691,varname:node_3423,prsc:2|A-9728-OUT,B-2443-OUT,C-5851-OUT;n:type:ShaderForge.SFN_Add,id:1272,x:33037,y:32960,varname:node_1272,prsc:2|A-4064-OUT,B-4515-R;n:type:ShaderForge.SFN_Multiply,id:2443,x:32876,y:32911,varname:node_2443,prsc:2|A-4515-RGB,B-1304-RGB;n:type:ShaderForge.SFN_Sin,id:2126,x:32087,y:32898,varname:node_2126,prsc:2|IN-6970-TDB;n:type:ShaderForge.SFN_Time,id:6970,x:31927,y:32877,varname:node_6970,prsc:2;n:type:ShaderForge.SFN_Panner,id:6008,x:32512,y:32801,varname:node_6008,prsc:2,spu:1,spv:0|UVIN-8779-UVOUT,DIST-9144-OUT;n:type:ShaderForge.SFN_TexCoord,id:8779,x:32193,y:32730,varname:node_8779,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9728,x:32858,y:32533,varname:node_9728,prsc:2|A-4064-OUT,B-1304-RGB;n:type:ShaderForge.SFN_Slider,id:5992,x:32419,y:33209,ptovrint:False,ptlb:zhaozi xiaoshi,ptin:_zhaozixiaoshi,varname:node_5992,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:-1,max:1;n:type:ShaderForge.SFN_Multiply,id:3338,x:33271,y:32960,varname:node_3338,prsc:2|A-1024-OUT,B-1272-OUT;n:type:ShaderForge.SFN_Step,id:1024,x:33059,y:33214,varname:node_1024,prsc:2|A-5992-OUT,B-555-OUT;n:type:ShaderForge.SFN_Tex2d,id:6058,x:32498,y:33325,ptovrint:False,ptlb:node_6058,ptin:_node_6058,varname:node_6058,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:51367dfeea6195443b62d62e70f7435b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:555,x:32676,y:33342,varname:node_555,prsc:2|A-6058-R,B-1805-OUT;n:type:ShaderForge.SFN_Vector1,id:1805,x:32498,y:33476,varname:node_1805,prsc:2,v1:0.9;n:type:ShaderForge.SFN_Step,id:8144,x:33059,y:33422,varname:node_8144,prsc:2|A-7369-OUT,B-555-OUT;n:type:ShaderForge.SFN_Add,id:7369,x:32872,y:33422,varname:node_7369,prsc:2|A-5992-OUT,B-919-OUT;n:type:ShaderForge.SFN_Vector1,id:919,x:32676,y:33476,varname:node_919,prsc:2,v1:0.03;n:type:ShaderForge.SFN_Subtract,id:1219,x:33270,y:33323,varname:node_1219,prsc:2|A-1024-OUT,B-8144-OUT;n:type:ShaderForge.SFN_Add,id:3582,x:32862,y:33057,varname:node_3582,prsc:2|A-1304-RGB,B-6595-OUT;n:type:ShaderForge.SFN_Vector1,id:6595,x:32676,y:33138,varname:node_6595,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:5851,x:33454,y:33207,varname:node_5851,prsc:2|A-3582-OUT,B-1219-OUT;n:type:ShaderForge.SFN_RemapRange,id:9144,x:32291,y:32898,varname:node_9144,prsc:2,frmn:-1,frmx:1,tomn:-0.2,tomx:0.2|IN-2126-OUT;proporder:1304-4515-5992-6058;pass:END;sub:END;*/

Shader "Shader Forge/touzhao" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,0.75,0.375,1)
        _node_4515 ("node_4515", 2D) = "white" {}
        _zhaozixiaoshi ("zhaozi xiaoshi", Range(-1, 1)) = -1
        _node_6058 ("node_6058", 2D) = "white" {}
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
            uniform sampler2D _node_4515; uniform float4 _node_4515_ST;
            uniform float _zhaozixiaoshi;
            uniform sampler2D _node_6058; uniform float4 _node_6058_ST;
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
                float node_4064 = pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0);
                float4 node_6970 = _Time;
                float2 node_6008 = (i.uv0+(sin(node_6970.b)*0.2+0.0)*float2(1,0));
                float4 _node_4515_var = tex2D(_node_4515,TRANSFORM_TEX(node_6008, _node_4515));
                float4 _node_6058_var = tex2D(_node_6058,TRANSFORM_TEX(i.uv0, _node_6058));
                float node_555 = (_node_6058_var.r*0.9);
                float node_1024 = step(_zhaozixiaoshi,node_555);
                float3 emissive = ((node_4064*_Color.rgb)+(_node_4515_var.rgb*_Color.rgb)+((_Color.rgb+0.1)*(node_1024-step((_zhaozixiaoshi+0.03),node_555))));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(node_1024*(node_4064+_node_4515_var.r)));
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
