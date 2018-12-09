// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33712,y:32695,varname:node_4013,prsc:2|emission-6834-OUT,alpha-841-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32755,y:32414,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08233644,c2:0.06925824,c3:0.4485294,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1485,x:32570,y:32818,ptovrint:False,ptlb:node_1485,ptin:_node_1485,varname:node_1485,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-80-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6603,x:32570,y:33040,ptovrint:False,ptlb:node_6603,ptin:_node_6603,varname:node_6603,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-7126-UVOUT;n:type:ShaderForge.SFN_Panner,id:80,x:32415,y:32818,varname:node_80,prsc:2,spu:0.2,spv:0.1|UVIN-2028-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2028,x:32203,y:32818,varname:node_2028,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7126,x:32415,y:33040,varname:node_7126,prsc:2,spu:-0.15,spv:-0.3|UVIN-3630-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3630,x:32203,y:33040,varname:node_3630,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9839,x:32833,y:32963,varname:node_9839,prsc:2|A-1485-R,B-6603-B;n:type:ShaderForge.SFN_Fresnel,id:3108,x:32670,y:32588,varname:node_3108,prsc:2|EXP-7729-OUT;n:type:ShaderForge.SFN_Vector1,id:7729,x:32376,y:32646,varname:node_7729,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:1386,x:33158,y:32731,varname:node_1386,prsc:2|A-7963-RGB,B-9839-OUT,C-6898-OUT;n:type:ShaderForge.SFN_Add,id:5752,x:33028,y:32950,varname:node_5752,prsc:2|A-3108-OUT,B-9839-OUT;n:type:ShaderForge.SFN_Multiply,id:5119,x:33137,y:32487,varname:node_5119,prsc:2|A-3108-OUT,B-1304-RGB;n:type:ShaderForge.SFN_Color,id:7963,x:32872,y:32705,ptovrint:False,ptlb:node_7963,ptin:_node_7963,varname:node_7963,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08088237,c2:0.9239351,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:6834,x:33368,y:32678,varname:node_6834,prsc:2|A-5119-OUT,B-1386-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6898,x:32885,y:32881,ptovrint:False,ptlb:liuwen,ptin:_liuwen,varname:node_6898,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_VertexColor,id:1095,x:33092,y:33169,varname:node_1095,prsc:2;n:type:ShaderForge.SFN_Multiply,id:841,x:33410,y:33070,varname:node_841,prsc:2|A-5752-OUT,B-1095-A;proporder:1304-1485-6603-7963-6898;pass:END;sub:END;*/

Shader "Shader Forge/zhuguangtou" {
    Properties {
        _Color ("Color", Color) = (0.08233644,0.06925824,0.4485294,1)
        _node_1485 ("node_1485", 2D) = "white" {}
        _node_6603 ("node_6603", 2D) = "white" {}
        _node_7963 ("node_7963", Color) = (0.08088237,0.9239351,1,1)
        _liuwen ("liuwen", Float ) = 2
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
            uniform sampler2D _node_1485; uniform float4 _node_1485_ST;
            uniform sampler2D _node_6603; uniform float4 _node_6603_ST;
            uniform float4 _node_7963;
            uniform float _liuwen;
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
////// Lighting:
////// Emissive:
                float node_3108 = pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0);
                float4 node_3917 = _Time;
                float2 node_80 = (i.uv0+node_3917.g*float2(0.2,0.1));
                float4 _node_1485_var = tex2D(_node_1485,TRANSFORM_TEX(node_80, _node_1485));
                float2 node_7126 = (i.uv0+node_3917.g*float2(-0.15,-0.3));
                float4 _node_6603_var = tex2D(_node_6603,TRANSFORM_TEX(node_7126, _node_6603));
                float node_9839 = (_node_1485_var.r*_node_6603_var.b);
                float3 emissive = ((node_3108*_Color.rgb)+(_node_7963.rgb*node_9839*_liuwen));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((node_3108+node_9839)*i.vertexColor.a));
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
