// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:35098,y:32680,varname:node_4013,prsc:2|custl-2589-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:34325,y:32940,ptovrint:False,ptlb:liuwen color,ptin:_liuwencolor,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9849898,c3:0.4558824,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8044,x:33230,y:32946,varname:node_8044,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2248-UVOUT,TEX-8217-TEX;n:type:ShaderForge.SFN_TexCoord,id:4864,x:32836,y:33177,varname:node_4864,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:2248,x:33056,y:32946,varname:node_2248,prsc:2,spu:0.05,spv:0.5|UVIN-4864-UVOUT;n:type:ShaderForge.SFN_Panner,id:4527,x:33040,y:33198,varname:node_4527,prsc:2,spu:-0.3,spv:-0.1|UVIN-4864-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5169,x:33230,y:33198,varname:_node_8044_copy,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-4527-UVOUT,TEX-8217-TEX;n:type:ShaderForge.SFN_Multiply,id:7313,x:33422,y:32946,varname:node_7313,prsc:2|A-9288-OUT,B-8044-R;n:type:ShaderForge.SFN_Vector1,id:9288,x:33230,y:32880,varname:node_9288,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Vector1,id:1554,x:33230,y:33129,varname:node_1554,prsc:2,v1:0.07;n:type:ShaderForge.SFN_Multiply,id:4371,x:33422,y:33198,varname:node_4371,prsc:2|A-1554-OUT,B-5169-R;n:type:ShaderForge.SFN_Add,id:5871,x:33625,y:33029,varname:node_5871,prsc:2|A-7313-OUT,B-4371-OUT;n:type:ShaderForge.SFN_Add,id:4634,x:33804,y:33113,varname:node_4634,prsc:2|A-5871-OUT,B-4864-UVOUT;n:type:ShaderForge.SFN_Panner,id:1080,x:33972,y:33113,varname:node_1080,prsc:2,spu:0.2,spv:0.3|UVIN-4634-OUT;n:type:ShaderForge.SFN_Multiply,id:6062,x:34325,y:33131,varname:node_6062,prsc:2|A-9001-R,B-8832-OUT;n:type:ShaderForge.SFN_Vector1,id:8832,x:34163,y:33253,varname:node_8832,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:5952,x:34494,y:33121,varname:node_5952,prsc:2|A-1304-RGB,B-6062-OUT;n:type:ShaderForge.SFN_Add,id:6768,x:34668,y:33151,varname:node_6768,prsc:2|A-5952-OUT,B-2731-RGB;n:type:ShaderForge.SFN_Fresnel,id:8587,x:34325,y:32696,varname:node_8587,prsc:2|EXP-9209-OUT;n:type:ShaderForge.SFN_Multiply,id:8861,x:34487,y:32678,varname:node_8861,prsc:2|A-5408-RGB,B-8587-OUT,C-9882-OUT;n:type:ShaderForge.SFN_Color,id:5408,x:34325,y:32550,ptovrint:False,ptlb:fresnel color,ptin:_fresnelcolor,varname:node_5408,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8541642,c3:0.5670415,c4:1;n:type:ShaderForge.SFN_Add,id:2589,x:34853,y:32780,varname:node_2589,prsc:2|A-8861-OUT,B-6768-OUT;n:type:ShaderForge.SFN_Color,id:2731,x:34494,y:32952,ptovrint:False,ptlb:neice color,ptin:_neicecolor,varname:node_2731,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.141,c2:0.4191176,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:8217,x:32836,y:33018,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8217,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:9209,x:34148,y:32718,varname:node_9209,prsc:2,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:9882,x:34325,y:32837,ptovrint:False,ptlb:FRESNEL,ptin:_FRESNEL,varname:node_9882,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Tex2d,id:9001,x:34163,y:33113,varname:node_9001,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-1080-UVOUT,TEX-8217-TEX;proporder:8217-1304-5408-2731-9882;pass:END;sub:END;*/

Shader "Shader Forge/pingzi" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_liuwencolor ("liuwen color", Color) = (1,0.9849898,0.4558824,1)
        [HDR]_fresnelcolor ("fresnel color", Color) = (1,0.8541642,0.5670415,1)
        [HDR]_neicecolor ("neice color", Color) = (0.141,0.4191176,0,1)
        _FRESNEL ("FRESNEL", Float ) = 2
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            uniform float4 _liuwencolor;
            uniform float4 _fresnelcolor;
            uniform float4 _neicecolor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _FRESNEL;
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
                float4 node_4024 = _Time;
                float2 node_2248 = (i.uv0+node_4024.g*float2(0.05,0.5));
                float4 node_8044 = tex2D(_MainTex,TRANSFORM_TEX(node_2248, _MainTex));
                float2 node_4527 = (i.uv0+node_4024.g*float2(-0.3,-0.1));
                float4 _node_8044_copy = tex2D(_MainTex,TRANSFORM_TEX(node_4527, _MainTex));
                float2 node_1080 = ((((0.1*node_8044.r)+(0.07*_node_8044_copy.r))+i.uv0)+node_4024.g*float2(0.2,0.3));
                float4 node_9001 = tex2D(_MainTex,TRANSFORM_TEX(node_1080, _MainTex));
                float3 node_6768 = ((_liuwencolor.rgb*(node_9001.r*0.5))+_neicecolor.rgb);
                float3 finalColor = ((_fresnelcolor.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_FRESNEL)+node_6768);
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
