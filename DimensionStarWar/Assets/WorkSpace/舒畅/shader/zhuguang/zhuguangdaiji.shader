// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33588,y:32713,varname:node_4013,prsc:2|diff-8147-RGB,emission-897-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32887,y:32874,ptovrint:False,ptlb:dianxianse,ptin:_dianxianse,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.5862069,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9779,x:32573,y:33190,ptovrint:False,ptlb:node_9779,ptin:_node_9779,varname:node_9779,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:670feb4598dbb3440ae8187349042f4e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8147,x:32660,y:32558,ptovrint:False,ptlb:node_8147,ptin:_node_8147,varname:node_8147,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:714b0bddc3ac243408d0144966586341,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:580,x:32533,y:32979,varname:node_580,prsc:2,spu:0,spv:-0.2|UVIN-9634-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9634,x:32330,y:32979,varname:node_9634,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:3015,x:32944,y:33110,varname:node_3015,prsc:2|A-9789-R,B-9779-R,C-9789-R,D-9789-R,E-9789-R;n:type:ShaderForge.SFN_Multiply,id:897,x:33177,y:33025,varname:node_897,prsc:2|A-1304-RGB,B-3015-OUT,C-5357-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5357,x:32955,y:33259,ptovrint:False,ptlb:node_5357,ptin:_node_5357,varname:node_5357,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:9789,x:32697,y:32979,ptovrint:False,ptlb:node_9789,ptin:_node_9789,varname:node_9789,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eface21f3d925b14db56d7481fda443b,ntxv:0,isnm:False|UVIN-580-UVOUT;proporder:1304-8147-9779-5357-9789;pass:END;sub:END;*/

Shader "Shader Forge/zhuguangdaiji" {
    Properties {
        _dianxianse ("dianxianse", Color) = (0,0.5862069,1,1)
        _node_8147 ("node_8147", 2D) = "white" {}
        _node_9779 ("node_9779", 2D) = "white" {}
        _node_5357 ("node_5357", Float ) = 1
        _node_9789 ("node_9789", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _dianxianse;
            uniform sampler2D _node_9779; uniform float4 _node_9779_ST;
            uniform sampler2D _node_8147; uniform float4 _node_8147_ST;
            uniform float _node_5357;
            uniform sampler2D _node_9789; uniform float4 _node_9789_ST;
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
                float4 _node_8147_var = tex2D(_node_8147,TRANSFORM_TEX(i.uv0, _node_8147));
                float3 diffuseColor = _node_8147_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_9289 = _Time;
                float2 node_580 = (i.uv0+node_9289.g*float2(0,-0.2));
                float4 _node_9789_var = tex2D(_node_9789,TRANSFORM_TEX(node_580, _node_9789));
                float4 _node_9779_var = tex2D(_node_9779,TRANSFORM_TEX(i.uv0, _node_9779));
                float3 emissive = (_dianxianse.rgb*(_node_9789_var.r*_node_9779_var.r*_node_9789_var.r*_node_9789_var.r*_node_9789_var.r)*_node_5357);
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _dianxianse;
            uniform sampler2D _node_9779; uniform float4 _node_9779_ST;
            uniform sampler2D _node_8147; uniform float4 _node_8147_ST;
            uniform float _node_5357;
            uniform sampler2D _node_9789; uniform float4 _node_9789_ST;
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_8147_var = tex2D(_node_8147,TRANSFORM_TEX(i.uv0, _node_8147));
                float3 diffuseColor = _node_8147_var.rgb;
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
