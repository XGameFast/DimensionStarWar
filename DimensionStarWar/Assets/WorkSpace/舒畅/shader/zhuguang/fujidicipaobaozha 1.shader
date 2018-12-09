// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34163,y:32689,varname:node_4013,prsc:2|emission-4679-OUT,alpha-2876-OUT,voffset-1293-OUT;n:type:ShaderForge.SFN_Fresnel,id:4041,x:32770,y:32613,varname:node_4041,prsc:2|EXP-9507-OUT;n:type:ShaderForge.SFN_Vector1,id:9507,x:32601,y:32613,varname:node_9507,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:6661,x:33289,y:32773,varname:node_6661,prsc:2|A-1913-OUT,B-8894-R,C-7850-OUT,D-1503-RGB;n:type:ShaderForge.SFN_OneMinus,id:1913,x:32974,y:32613,varname:node_1913,prsc:2|IN-4041-OUT;n:type:ShaderForge.SFN_Panner,id:7347,x:32473,y:32758,varname:node_7347,prsc:2,spu:0,spv:-1|UVIN-274-UVOUT;n:type:ShaderForge.SFN_Add,id:7807,x:31917,y:33563,varname:node_7807,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:274,x:32221,y:32758,varname:node_274,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:7850,x:32942,y:32916,ptovrint:False,ptlb:node_7850,ptin:_node_7850,varname:node_7850,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:6461,x:32996,y:33270,varname:node_6461,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8894,x:32674,y:32758,ptovrint:False,ptlb:node_8894,ptin:_node_8894,varname:node_8894,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-7347-UVOUT;n:type:ShaderForge.SFN_Fresnel,id:3375,x:32958,y:32462,varname:node_3375,prsc:2|EXP-7499-OUT;n:type:ShaderForge.SFN_Vector1,id:7499,x:32770,y:32486,varname:node_7499,prsc:2,v1:3;n:type:ShaderForge.SFN_Add,id:7414,x:33518,y:32693,varname:node_7414,prsc:2|A-3297-OUT,B-6661-OUT;n:type:ShaderForge.SFN_Multiply,id:3297,x:33345,y:32446,varname:node_3297,prsc:2|A-3375-OUT,B-7774-OUT,C-1120-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7774,x:33136,y:32251,ptovrint:False,ptlb:bianyuanliang,ptin:_bianyuanliang,varname:node_7774,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Color,id:1120,x:32867,y:32259,ptovrint:False,ptlb:node_1120,ptin:_node_1120,varname:node_1120,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6617647,c2:0.02432957,c3:0.02432957,c4:1;n:type:ShaderForge.SFN_Multiply,id:2876,x:33598,y:33076,varname:node_2876,prsc:2|A-8514-OUT,B-6461-A;n:type:ShaderForge.SFN_Color,id:1503,x:32942,y:33033,ptovrint:False,ptlb:node_1503,ptin:_node_1503,varname:node_1503,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4411765,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:8514,x:33447,y:32981,varname:node_8514,prsc:2|A-3375-OUT,B-1913-OUT,C-1913-OUT;n:type:ShaderForge.SFN_Lerp,id:4679,x:33670,y:32563,varname:node_4679,prsc:2|A-3297-OUT,B-6661-OUT,T-1321-OUT;n:type:ShaderForge.SFN_Vector1,id:1321,x:33518,y:32626,varname:node_1321,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:1293,x:34005,y:33072,varname:node_1293,prsc:2|A-8894-R,B-9603-OUT,C-9789-OUT;n:type:ShaderForge.SFN_NormalVector,id:9603,x:33714,y:33156,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:9789,x:33667,y:33329,ptovrint:False,ptlb:pianyi,ptin:_pianyi,varname:node_9789,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:7850-8894-7774-1120-1503-9789;pass:END;sub:END;*/

Shader "Shader Forge/fujidiancipaobaozha" {
    Properties {
        _node_7850 ("node_7850", Float ) = 1
        _node_8894 ("node_8894", 2D) = "white" {}
        _bianyuanliang ("bianyuanliang", Float ) = 3
        _node_1120 ("node_1120", Color) = (0.6617647,0.02432957,0.02432957,1)
        _node_1503 ("node_1503", Color) = (0.4411765,0,0,1)
        _pianyi ("pianyi", Range(0, 1)) = 0
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
            uniform float _node_7850;
            uniform sampler2D _node_8894; uniform float4 _node_8894_ST;
            uniform float _bianyuanliang;
            uniform float4 _node_1120;
            uniform float4 _node_1503;
            uniform float _pianyi;
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
                float4 node_614 = _Time;
                float2 node_7347 = (o.uv0+node_614.g*float2(0,-1));
                float4 _node_8894_var = tex2Dlod(_node_8894,float4(TRANSFORM_TEX(node_7347, _node_8894),0.0,0));
                v.vertex.xyz += (_node_8894_var.r*v.normal*_pianyi);
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
                float node_3375 = pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0);
                float3 node_3297 = (node_3375*_bianyuanliang*_node_1120.rgb);
                float node_1913 = (1.0 - pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0));
                float4 node_614 = _Time;
                float2 node_7347 = (i.uv0+node_614.g*float2(0,-1));
                float4 _node_8894_var = tex2D(_node_8894,TRANSFORM_TEX(node_7347, _node_8894));
                float3 node_6661 = (node_1913*_node_8894_var.r*_node_7850*_node_1503.rgb);
                float3 emissive = lerp(node_3297,node_6661,0.5);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((node_3375+node_1913+node_1913)*i.vertexColor.a));
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
            uniform sampler2D _node_8894; uniform float4 _node_8894_ST;
            uniform float _pianyi;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_6758 = _Time;
                float2 node_7347 = (o.uv0+node_6758.g*float2(0,-1));
                float4 _node_8894_var = tex2Dlod(_node_8894,float4(TRANSFORM_TEX(node_7347, _node_8894),0.0,0));
                v.vertex.xyz += (_node_8894_var.r*v.normal*_pianyi);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
