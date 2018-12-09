// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33900,y:32725,varname:node_4013,prsc:2|diff-1320-OUT,spec-3837-OUT,normal-9332-RGB;n:type:ShaderForge.SFN_Tex2d,id:6780,x:32737,y:33144,ptovrint:False,ptlb:node_6780,ptin:_node_6780,varname:node_6780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f69c5c8a18b215641b8b8f785df5dd6d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9332,x:33357,y:33352,ptovrint:False,ptlb:node_9332,ptin:_node_9332,varname:node_9332,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:01aedbf5bb46a8e48a9329b4fa2fb3a8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:984,x:31929,y:32682,ptovrint:False,ptlb:node_984,ptin:_node_984,varname:node_984,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3b6a5ec00428aa34c8b222869a2d56b1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5657,x:32338,y:32682,varname:node_5657,prsc:2,tex:3b6a5ec00428aa34c8b222869a2d56b1,ntxv:0,isnm:False|UVIN-4928-OUT,TEX-984-TEX;n:type:ShaderForge.SFN_Tex2d,id:6385,x:32338,y:32862,varname:node_6385,prsc:2,tex:3b6a5ec00428aa34c8b222869a2d56b1,ntxv:0,isnm:False|UVIN-7939-OUT,TEX-984-TEX;n:type:ShaderForge.SFN_Tex2d,id:8209,x:32321,y:32500,varname:node_8209,prsc:2,tex:3b6a5ec00428aa34c8b222869a2d56b1,ntxv:0,isnm:False|UVIN-396-UVOUT,TEX-984-TEX;n:type:ShaderForge.SFN_TexCoord,id:396,x:31929,y:32509,varname:node_396,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4928,x:32144,y:32682,varname:node_4928,prsc:2|A-396-UVOUT,B-9990-OUT;n:type:ShaderForge.SFN_Multiply,id:7939,x:32122,y:32873,varname:node_7939,prsc:2|A-396-UVOUT,B-1442-OUT;n:type:ShaderForge.SFN_Vector1,id:9990,x:31929,y:32841,varname:node_9990,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:1442,x:31929,y:32897,varname:node_1442,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Add,id:8046,x:32517,y:32545,varname:node_8046,prsc:2|A-8209-R,B-8715-OUT;n:type:ShaderForge.SFN_Vector1,id:8715,x:32338,y:32638,varname:node_8715,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:2939,x:32517,y:32703,varname:node_2939,prsc:2|A-5657-R,B-8715-OUT;n:type:ShaderForge.SFN_Add,id:4920,x:32517,y:32880,varname:node_4920,prsc:2|A-6385-R,B-8715-OUT;n:type:ShaderForge.SFN_Multiply,id:7824,x:32702,y:32848,varname:node_7824,prsc:2|A-2939-OUT,B-4920-OUT;n:type:ShaderForge.SFN_Multiply,id:3767,x:32874,y:32717,varname:node_3767,prsc:2|A-8046-OUT,B-7824-OUT;n:type:ShaderForge.SFN_Lerp,id:3248,x:33062,y:32640,varname:node_3248,prsc:2|A-462-OUT,B-5742-OUT,T-3767-OUT;n:type:ShaderForge.SFN_Vector3,id:462,x:32874,y:32505,varname:node_462,prsc:2,v1:0.5,v2:0.5,v3:0.5;n:type:ShaderForge.SFN_Vector1,id:5742,x:32890,y:32619,varname:node_5742,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:1320,x:33375,y:32782,varname:node_1320,prsc:2|A-3248-OUT,B-6780-RGB;n:type:ShaderForge.SFN_Multiply,id:9485,x:33208,y:33115,varname:node_9485,prsc:2|A-6780-G,B-3767-OUT;n:type:ShaderForge.SFN_Lerp,id:3837,x:33423,y:33001,varname:node_3837,prsc:2|A-2339-OUT,B-2471-OUT,T-9485-OUT;n:type:ShaderForge.SFN_Vector1,id:2471,x:33208,y:33052,varname:node_2471,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Vector1,id:2339,x:33198,y:32989,varname:node_2339,prsc:2,v1:0.3;proporder:6780-984-9332;pass:END;sub:END;*/

Shader "Shader Forge/baiyingai" {
    Properties {
        _node_6780 ("node_6780", 2D) = "white" {}
        _node_984 ("node_984", 2D) = "white" {}
        _node_9332 ("node_9332", 2D) = "white" {}
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
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _node_6780; uniform float4 _node_6780_ST;
            uniform sampler2D _node_9332; uniform float4 _node_9332_ST;
            uniform sampler2D _node_984; uniform float4 _node_984_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _node_9332_var = tex2D(_node_9332,TRANSFORM_TEX(i.uv0, _node_9332));
                float3 normalLocal = _node_9332_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 0.5;
                float perceptualRoughness = 1.0 - 0.5;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float4 _node_6780_var = tex2D(_node_6780,TRANSFORM_TEX(i.uv0, _node_6780));
                float4 node_8209 = tex2D(_node_984,TRANSFORM_TEX(i.uv0, _node_984));
                float node_8715 = 0.5;
                float2 node_4928 = (i.uv0*0.5);
                float4 node_5657 = tex2D(_node_984,TRANSFORM_TEX(node_4928, _node_984));
                float2 node_7939 = (i.uv0*0.1);
                float4 node_6385 = tex2D(_node_984,TRANSFORM_TEX(node_7939, _node_984));
                float node_3767 = ((node_8209.r+node_8715)*((node_5657.r+node_8715)*(node_6385.r+node_8715)));
                float3 specularColor = lerp(0.3,0.1,(_node_6780_var.g*node_3767));
                float specularMonochrome;
                float node_5742 = 1.0;
                float3 diffuseColor = (lerp(float3(0.5,0.5,0.5),float3(node_5742,node_5742,node_5742),node_3767)*_node_6780_var.rgb); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
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
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _node_6780; uniform float4 _node_6780_ST;
            uniform sampler2D _node_9332; uniform float4 _node_9332_ST;
            uniform sampler2D _node_984; uniform float4 _node_984_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _node_9332_var = tex2D(_node_9332,TRANSFORM_TEX(i.uv0, _node_9332));
                float3 normalLocal = _node_9332_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 0.5;
                float perceptualRoughness = 1.0 - 0.5;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float4 _node_6780_var = tex2D(_node_6780,TRANSFORM_TEX(i.uv0, _node_6780));
                float4 node_8209 = tex2D(_node_984,TRANSFORM_TEX(i.uv0, _node_984));
                float node_8715 = 0.5;
                float2 node_4928 = (i.uv0*0.5);
                float4 node_5657 = tex2D(_node_984,TRANSFORM_TEX(node_4928, _node_984));
                float2 node_7939 = (i.uv0*0.1);
                float4 node_6385 = tex2D(_node_984,TRANSFORM_TEX(node_7939, _node_984));
                float node_3767 = ((node_8209.r+node_8715)*((node_5657.r+node_8715)*(node_6385.r+node_8715)));
                float3 specularColor = lerp(0.3,0.1,(_node_6780_var.g*node_3767));
                float specularMonochrome;
                float node_5742 = 1.0;
                float3 diffuseColor = (lerp(float3(0.5,0.5,0.5),float3(node_5742,node_5742,node_5742),node_3767)*_node_6780_var.rgb); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
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
