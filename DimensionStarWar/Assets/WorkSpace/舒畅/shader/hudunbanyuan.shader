// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33790,y:32688,varname:node_4013,prsc:2|emission-8709-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32870,y:32466,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1691176,c2:1,c3:0.5186612,c4:1;n:type:ShaderForge.SFN_Tex2d,id:101,x:32843,y:33003,ptovrint:False,ptlb:node_101,ptin:_node_101,varname:node_101,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c4f8ddaa0d3047d4da8657565daad313,ntxv:0,isnm:False|UVIN-7284-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6151,x:32280,y:32622,varname:node_6151,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6922,x:32591,y:32615,varname:node_6922,prsc:2|A-6151-UVOUT,B-1078-OUT;n:type:ShaderForge.SFN_Vector2,id:1078,x:32407,y:32831,varname:node_1078,prsc:2,v1:1,v2:1;n:type:ShaderForge.SFN_Panner,id:7284,x:32675,y:33003,varname:node_7284,prsc:2,spu:0,spv:-1|UVIN-7838-UVOUT,DIST-1756-OUT;n:type:ShaderForge.SFN_TexCoord,id:7838,x:32182,y:32996,varname:node_7838,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8709,x:33585,y:32792,varname:node_8709,prsc:2|A-9919-OUT,B-1271-OUT;n:type:ShaderForge.SFN_Multiply,id:1271,x:33092,y:33204,varname:node_1271,prsc:2|A-101-R,B-7838-V;n:type:ShaderForge.SFN_Multiply,id:4951,x:33213,y:32831,varname:node_4951,prsc:2|A-1304-RGB,B-7804-R,C-6757-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6757,x:32978,y:32909,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_6757,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_VertexColor,id:1578,x:31981,y:33280,varname:node_1578,prsc:2;n:type:ShaderForge.SFN_Vector1,id:9844,x:32207,y:33439,varname:node_9844,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:1756,x:32597,y:33284,varname:node_1756,prsc:2|A-2808-OUT,B-4508-OUT;n:type:ShaderForge.SFN_Vector1,id:4508,x:32392,y:33439,varname:node_4508,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Fresnel,id:9187,x:32938,y:32318,varname:node_9187,prsc:2|EXP-622-OUT;n:type:ShaderForge.SFN_Multiply,id:563,x:33257,y:32471,varname:node_563,prsc:2|A-9187-OUT,B-1304-RGB,C-4454-OUT;n:type:ShaderForge.SFN_Add,id:9919,x:33411,y:32716,varname:node_9919,prsc:2|A-563-OUT,B-4951-OUT;n:type:ShaderForge.SFN_Subtract,id:2808,x:32392,y:33284,varname:node_2808,prsc:2|A-1578-A,B-9844-OUT;n:type:ShaderForge.SFN_Tex2d,id:7804,x:32796,y:32598,ptovrint:False,ptlb:node_7804,ptin:_node_7804,varname:node_7804,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d75710250eda6154eb6967dd13d7ca5a,ntxv:0,isnm:False|UVIN-6922-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4454,x:33153,y:32318,ptovrint:False,ptlb:fresnel qiangdu,ptin:_fresnelqiangdu,varname:node_4454,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:622,x:32758,y:32386,varname:node_622,prsc:2,v1:2;proporder:1304-101-6757-7804-4454;pass:END;sub:END;*/

Shader "Shader Forge/hudunbanyuan" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.1691176,1,0.5186612,1)
        _node_101 ("node_101", 2D) = "white" {}
        _liangdu ("liangdu", Float ) = 2
        _node_7804 ("node_7804", 2D) = "white" {}
        _fresnelqiangdu ("fresnel qiangdu", Float ) = 1
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
            uniform float4 _Color;
            uniform sampler2D _node_101; uniform float4 _node_101_ST;
            uniform float _liangdu;
            uniform sampler2D _node_7804; uniform float4 _node_7804_ST;
            uniform float _fresnelqiangdu;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
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
////// Lighting:
////// Emissive:
                float2 node_6922 = (i.uv1*float2(1,1));
                float4 _node_7804_var = tex2D(_node_7804,TRANSFORM_TEX(node_6922, _node_7804));
                float2 node_7284 = (i.uv0+((i.vertexColor.a-0.5)*1.2)*float2(0,-1));
                float4 _node_101_var = tex2D(_node_101,TRANSFORM_TEX(node_7284, _node_101));
                float3 emissive = (((pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_Color.rgb*_fresnelqiangdu)+(_Color.rgb*_node_7804_var.r*_liangdu))*(_node_101_var.r*i.uv0.g));
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
