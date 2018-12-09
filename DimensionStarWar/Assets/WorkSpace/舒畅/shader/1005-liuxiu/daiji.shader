// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32959,y:32701,varname:node_4013,prsc:2|diff-759-RGB,emission-5747-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32295,y:32813,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.3711968,c3:0.08823532,c4:1;n:type:ShaderForge.SFN_Tex2d,id:3533,x:32295,y:32974,ptovrint:False,ptlb:node_3533,ptin:_node_3533,varname:node_3533,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b92481b2b57a15c41bc0080f8680f448,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:759,x:32410,y:32575,ptovrint:False,ptlb:node_759,ptin:_node_759,varname:node_759,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e50659c03ddda45dfb602abf6b254c54,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6828,x:32605,y:32891,varname:node_6828,prsc:2|A-1304-RGB,B-3533-RGB,C-930-OUT;n:type:ShaderForge.SFN_Sin,id:2134,x:31967,y:33161,varname:node_2134,prsc:2|IN-3233-T;n:type:ShaderForge.SFN_Time,id:3233,x:31796,y:33142,varname:node_3233,prsc:2;n:type:ShaderForge.SFN_Add,id:2256,x:32122,y:33161,varname:node_2256,prsc:2|A-2134-OUT,B-9161-OUT;n:type:ShaderForge.SFN_Vector1,id:9161,x:31967,y:33286,varname:node_9161,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:5124,x:32295,y:33161,varname:node_5124,prsc:2|A-2256-OUT,B-3480-OUT;n:type:ShaderForge.SFN_Vector1,id:3480,x:32122,y:33286,varname:node_3480,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Add,id:930,x:32454,y:33161,varname:node_930,prsc:2|A-5124-OUT,B-9161-OUT;n:type:ShaderForge.SFN_Multiply,id:5747,x:32793,y:32891,varname:node_5747,prsc:2|A-6828-OUT,B-4097-OUT;n:type:ShaderForge.SFN_Slider,id:4097,x:32612,y:33064,ptovrint:False,ptlb:faguang kongzhi,ptin:_faguangkongzhi,varname:node_4097,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:1304-759-3533-4097;pass:END;sub:END;*/

Shader "Shader Forge/daiji" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,0.3711968,0.08823532,1)
        _node_759 ("node_759", 2D) = "white" {}
        _node_3533 ("node_3533", 2D) = "white" {}
        _faguangkongzhi ("faguang kongzhi", Range(0, 1)) = 1
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
            uniform float4 _Color;
            uniform sampler2D _node_3533; uniform float4 _node_3533_ST;
            uniform sampler2D _node_759; uniform float4 _node_759_ST;
            uniform float _faguangkongzhi;
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
                float4 _node_759_var = tex2D(_node_759,TRANSFORM_TEX(i.uv0, _node_759));
                float3 diffuseColor = _node_759_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 _node_3533_var = tex2D(_node_3533,TRANSFORM_TEX(i.uv0, _node_3533));
                float4 node_3233 = _Time;
                float node_9161 = 1.0;
                float3 emissive = ((_Color.rgb*_node_3533_var.rgb*(((sin(node_3233.g)+node_9161)*0.1)+node_9161))*_faguangkongzhi);
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
            uniform float4 _Color;
            uniform sampler2D _node_3533; uniform float4 _node_3533_ST;
            uniform sampler2D _node_759; uniform float4 _node_759_ST;
            uniform float _faguangkongzhi;
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
                float4 _node_759_var = tex2D(_node_759,TRANSFORM_TEX(i.uv0, _node_759));
                float3 diffuseColor = _node_759_var.rgb;
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
