// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34155,y:32270,varname:node_4013,prsc:2|diff-1157-OUT,emission-6608-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32872,y:32627,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.682353,c3:0.2058824,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4128,x:32680,y:32219,ptovrint:False,ptlb:node_4128,ptin:_node_4128,varname:node_4128,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e6d64d303fa53f1459af0424c3a0ded7,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:2117,x:32072,y:32463,varname:node_2117,prsc:2,spu:0.2,spv:0.1|UVIN-379-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:379,x:31851,y:32463,varname:node_379,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:5542,x:32298,y:32463,varname:node_5542,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2117-UVOUT,TEX-820-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:820,x:31745,y:32268,ptovrint:False,ptlb:node_820,ptin:_node_820,varname:node_820,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:623,x:32072,y:32630,varname:node_623,prsc:2,spu:-0.2,spv:-0.3|UVIN-379-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4993,x:32298,y:32662,varname:node_4993,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-623-UVOUT,TEX-820-TEX;n:type:ShaderForge.SFN_Multiply,id:4913,x:33096,y:32551,varname:node_4913,prsc:2|A-1738-OUT,B-1304-RGB,C-7044-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7044,x:32842,y:32821,ptovrint:False,ptlb:shuangseliuwen,ptin:_shuangseliuwen,varname:node_7044,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Power,id:1738,x:32723,y:32555,varname:node_1738,prsc:2|VAL-6547-OUT,EXP-1261-OUT;n:type:ShaderForge.SFN_Tex2d,id:4669,x:33083,y:32724,ptovrint:False,ptlb:node_4669,ptin:_node_4669,varname:node_4669,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0fadeb202e2c9b541844435092b5bf4b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2086,x:33332,y:32551,varname:node_2086,prsc:2|A-4913-OUT,B-4669-R;n:type:ShaderForge.SFN_Add,id:3996,x:33647,y:32551,varname:node_3996,prsc:2|A-2086-OUT,B-4470-OUT;n:type:ShaderForge.SFN_Multiply,id:1654,x:33096,y:32928,varname:node_1654,prsc:2|A-1738-OUT,B-5661-RGB,C-7044-OUT;n:type:ShaderForge.SFN_Color,id:5661,x:32853,y:32943,ptovrint:False,ptlb:node_5661,ptin:_node_5661,varname:node_5661,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1617647,c2:0.583773,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:4470,x:33457,y:32906,varname:node_4470,prsc:2|A-9944-OUT,B-1654-OUT;n:type:ShaderForge.SFN_OneMinus,id:9944,x:33288,y:32741,varname:node_9944,prsc:2|IN-4669-R;n:type:ShaderForge.SFN_Fresnel,id:4133,x:33540,y:32398,varname:node_4133,prsc:2|EXP-4533-OUT;n:type:ShaderForge.SFN_Vector1,id:4533,x:33347,y:32452,varname:node_4533,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:6608,x:33865,y:32403,varname:node_6608,prsc:2|A-4133-OUT,B-3996-OUT,C-1200-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1200,x:33647,y:32719,ptovrint:False,ptlb:zongqiang,ptin:_zongqiang,varname:node_1200,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Vector1,id:1261,x:32238,y:32220,varname:node_1261,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Multiply,id:6547,x:32533,y:32555,varname:node_6547,prsc:2|A-5542-R,B-4993-R;n:type:ShaderForge.SFN_Multiply,id:1157,x:32991,y:32278,varname:node_1157,prsc:2|A-4128-RGB,B-2598-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2598,x:32811,y:32351,ptovrint:False,ptlb:bense,ptin:_bense,varname:node_2598,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1304-4128-820-7044-4669-5661-1200-2598;pass:END;sub:END;*/

Shader "Shader Forge/jiyisuo" {
    Properties {
        _Color ("Color", Color) = (1,0.682353,0.2058824,1)
        _node_4128 ("node_4128", 2D) = "white" {}
        _node_820 ("node_820", 2D) = "white" {}
        _shuangseliuwen ("shuangseliuwen", Float ) = 2
        _node_4669 ("node_4669", 2D) = "white" {}
        _node_5661 ("node_5661", Color) = (0.1617647,0.583773,1,1)
        _zongqiang ("zongqiang", Float ) = 3
        _bense ("bense", Float ) = 1
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _node_4128; uniform float4 _node_4128_ST;
            uniform sampler2D _node_820; uniform float4 _node_820_ST;
            uniform float _shuangseliuwen;
            uniform sampler2D _node_4669; uniform float4 _node_4669_ST;
            uniform float4 _node_5661;
            uniform float _zongqiang;
            uniform float _bense;
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
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _node_4128_var = tex2D(_node_4128,TRANSFORM_TEX(i.uv0, _node_4128));
                float3 diffuseColor = (_node_4128_var.rgb*_bense);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_3176 = _Time;
                float2 node_2117 = (i.uv0+node_3176.g*float2(0.2,0.1));
                float4 node_5542 = tex2D(_node_820,TRANSFORM_TEX(node_2117, _node_820));
                float2 node_623 = (i.uv0+node_3176.g*float2(-0.2,-0.3));
                float4 node_4993 = tex2D(_node_820,TRANSFORM_TEX(node_623, _node_820));
                float node_1738 = pow((node_5542.r*node_4993.r),1.2);
                float4 _node_4669_var = tex2D(_node_4669,TRANSFORM_TEX(i.uv0, _node_4669));
                float3 emissive = (pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0)*(((node_1738*_Color.rgb*_shuangseliuwen)*_node_4669_var.r)+((1.0 - _node_4669_var.r)*(node_1738*_node_5661.rgb*_shuangseliuwen)))*_zongqiang);
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _node_4128; uniform float4 _node_4128_ST;
            uniform sampler2D _node_820; uniform float4 _node_820_ST;
            uniform float _shuangseliuwen;
            uniform sampler2D _node_4669; uniform float4 _node_4669_ST;
            uniform float4 _node_5661;
            uniform float _zongqiang;
            uniform float _bense;
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
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_4128_var = tex2D(_node_4128,TRANSFORM_TEX(i.uv0, _node_4128));
                float3 diffuseColor = (_node_4128_var.rgb*_bense);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
