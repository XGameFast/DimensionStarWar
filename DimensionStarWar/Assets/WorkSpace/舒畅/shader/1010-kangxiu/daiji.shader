// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:1,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33020,y:32736,varname:node_4013,prsc:2|diff-2263-RGB,diffpow-8084-RGB,spec-3236-R,gloss-6232-R,normal-7642-RGB,emission-7246-OUT,transm-8959-RGB,clip-3631-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:31884,y:32908,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.05882353,c2:0.844219,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2263,x:32308,y:32416,ptovrint:False,ptlb:node_2263,ptin:_node_2263,varname:node_2263,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:006bec35849b96d43a7a758fafd55396,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1840,x:31671,y:33073,ptovrint:False,ptlb:node_1840,ptin:_node_1840,varname:node_1840,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:24fedf2c3a7653f49b60f6766f7d3b88,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8959,x:32308,y:33330,ptovrint:False,ptlb:node_8959,ptin:_node_8959,varname:node_8959,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:02659685c80b57b459dd4273b4cc8206,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8084,x:32308,y:32588,ptovrint:False,ptlb:node_8084,ptin:_node_8084,varname:node_8084,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e1c9bdf8941a4954495b5935f7eb0617,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3236,x:32308,y:32756,ptovrint:False,ptlb:node_3236,ptin:_node_3236,varname:node_3236,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7342d99b12ce41242b36adfb79fdae39,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7642,x:32308,y:33105,ptovrint:False,ptlb:node_7642,ptin:_node_7642,varname:node_7642,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:56b415bc66fbd2e42aff3a933c7d0b4d,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:6232,x:32308,y:32918,ptovrint:False,ptlb:node_6232,ptin:_node_6232,varname:node_6232,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5485e1903ae831446ae6720c9023893e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7246,x:32095,y:33070,varname:node_7246,prsc:2|A-1304-RGB,B-4499-OUT;n:type:ShaderForge.SFN_Tex2d,id:4709,x:31671,y:33265,ptovrint:False,ptlb:node_4709,ptin:_node_4709,varname:node_4709,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f15404cf047b0804c8a781f8479ee5da,ntxv:0,isnm:False|UVIN-7556-UVOUT;n:type:ShaderForge.SFN_Panner,id:7556,x:31512,y:33265,varname:node_7556,prsc:2,spu:0.1,spv:0.05|UVIN-6911-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6911,x:31352,y:33265,varname:node_6911,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:4499,x:32001,y:33254,varname:node_4499,prsc:2|A-1840-R,B-2548-OUT;n:type:ShaderForge.SFN_Multiply,id:2548,x:31850,y:33090,varname:node_2548,prsc:2|A-1840-R,B-4709-R;n:type:ShaderForge.SFN_Slider,id:3631,x:32633,y:33087,ptovrint:False,ptlb:xiaoshi,ptin:_xiaoshi,varname:node_3631,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:1304-2263-7642-3236-6232-8959-8084-1840-4709-3631;pass:END;sub:END;*/

Shader "Shader Forge/daiji" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.05882353,0.844219,1,1)
        _node_2263 ("node_2263", 2D) = "white" {}
        _node_7642 ("node_7642", 2D) = "bump" {}
        _node_3236 ("node_3236", 2D) = "white" {}
        _node_6232 ("node_6232", 2D) = "white" {}
        _node_8959 ("node_8959", 2D) = "white" {}
        _node_8084 ("node_8084", 2D) = "white" {}
        _node_1840 ("node_1840", 2D) = "white" {}
        _node_4709 ("node_4709", 2D) = "white" {}
        _xiaoshi ("xiaoshi", Range(0, 1)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
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
            uniform float4 _Color;
            uniform sampler2D _node_2263; uniform float4 _node_2263_ST;
            uniform sampler2D _node_1840; uniform float4 _node_1840_ST;
            uniform sampler2D _node_8959; uniform float4 _node_8959_ST;
            uniform sampler2D _node_8084; uniform float4 _node_8084_ST;
            uniform sampler2D _node_3236; uniform float4 _node_3236_ST;
            uniform sampler2D _node_7642; uniform float4 _node_7642_ST;
            uniform sampler2D _node_6232; uniform float4 _node_6232_ST;
            uniform sampler2D _node_4709; uniform float4 _node_4709_ST;
            uniform float _xiaoshi;
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
                float3 _node_7642_var = UnpackNormal(tex2D(_node_7642,TRANSFORM_TEX(i.uv0, _node_7642)));
                float3 normalLocal = _node_7642_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                clip(_xiaoshi - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _node_6232_var = tex2D(_node_6232,TRANSFORM_TEX(i.uv0, _node_6232));
                float gloss = 1.0 - _node_6232_var.r; // Convert roughness to gloss
                float perceptualRoughness = _node_6232_var.r;
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
                float4 _node_3236_var = tex2D(_node_3236,TRANSFORM_TEX(i.uv0, _node_3236));
                float3 specularColor = _node_3236_var.r;
                float specularMonochrome;
                float4 _node_2263_var = tex2D(_node_2263,TRANSFORM_TEX(i.uv0, _node_2263));
                float3 diffuseColor = _node_2263_var.rgb; // Need this for specular when using metallic
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
                NdotL = dot( normalDirection, lightDirection );
                float4 _node_8084_var = tex2D(_node_8084,TRANSFORM_TEX(i.uv0, _node_8084));
                float3 forwardLight = pow(max(0.0, NdotL ), _node_8084_var.rgb);
                float4 _node_8959_var = tex2D(_node_8959,TRANSFORM_TEX(i.uv0, _node_8959));
                float3 backLight = pow(max(0.0, -NdotL ), _node_8084_var.rgb) * _node_8959_var.rgb;
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 NdotLWrap = max(0,NdotL);
                float nlPow5 = Pow5(1-NdotLWrap);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((forwardLight+backLight) + ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL)) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 _node_1840_var = tex2D(_node_1840,TRANSFORM_TEX(i.uv0, _node_1840));
                float4 node_5657 = _Time;
                float2 node_7556 = (i.uv0+node_5657.g*float2(0.1,0.05));
                float4 _node_4709_var = tex2D(_node_4709,TRANSFORM_TEX(node_7556, _node_4709));
                float3 emissive = (_Color.rgb*(_node_1840_var.r+(_node_1840_var.r*_node_4709_var.r)));
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
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
            uniform float4 _Color;
            uniform sampler2D _node_2263; uniform float4 _node_2263_ST;
            uniform sampler2D _node_1840; uniform float4 _node_1840_ST;
            uniform sampler2D _node_8959; uniform float4 _node_8959_ST;
            uniform sampler2D _node_8084; uniform float4 _node_8084_ST;
            uniform sampler2D _node_3236; uniform float4 _node_3236_ST;
            uniform sampler2D _node_7642; uniform float4 _node_7642_ST;
            uniform sampler2D _node_6232; uniform float4 _node_6232_ST;
            uniform sampler2D _node_4709; uniform float4 _node_4709_ST;
            uniform float _xiaoshi;
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
                float3 _node_7642_var = UnpackNormal(tex2D(_node_7642,TRANSFORM_TEX(i.uv0, _node_7642)));
                float3 normalLocal = _node_7642_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                clip(_xiaoshi - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _node_6232_var = tex2D(_node_6232,TRANSFORM_TEX(i.uv0, _node_6232));
                float gloss = 1.0 - _node_6232_var.r; // Convert roughness to gloss
                float perceptualRoughness = _node_6232_var.r;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float4 _node_3236_var = tex2D(_node_3236,TRANSFORM_TEX(i.uv0, _node_3236));
                float3 specularColor = _node_3236_var.r;
                float specularMonochrome;
                float4 _node_2263_var = tex2D(_node_2263,TRANSFORM_TEX(i.uv0, _node_2263));
                float3 diffuseColor = _node_2263_var.rgb; // Need this for specular when using metallic
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
                NdotL = dot( normalDirection, lightDirection );
                float4 _node_8084_var = tex2D(_node_8084,TRANSFORM_TEX(i.uv0, _node_8084));
                float3 forwardLight = pow(max(0.0, NdotL ), _node_8084_var.rgb);
                float4 _node_8959_var = tex2D(_node_8959,TRANSFORM_TEX(i.uv0, _node_8959));
                float3 backLight = pow(max(0.0, -NdotL ), _node_8084_var.rgb) * _node_8959_var.rgb;
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 NdotLWrap = max(0,NdotL);
                float nlPow5 = Pow5(1-NdotLWrap);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((forwardLight+backLight) + ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL)) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _xiaoshi;
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
            float4 frag(VertexOutput i) : COLOR {
                clip(_xiaoshi - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
