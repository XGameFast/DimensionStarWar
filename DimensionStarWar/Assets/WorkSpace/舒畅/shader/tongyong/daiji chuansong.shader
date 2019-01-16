// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:1,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33314,y:32897,varname:node_4013,prsc:2|diff-2263-RGB,spec-3236-R,gloss-6232-R,normal-7642-RGB,emission-9097-OUT,transm-8959-RGB,clip-842-OUT;n:type:ShaderForge.SFN_Tex2d,id:2263,x:32308,y:32416,ptovrint:False,ptlb:base color,ptin:_basecolor,varname:node_2263,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8959,x:32308,y:33133,ptovrint:False,ptlb:AO,ptin:_AO,varname:node_8959,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3236,x:32308,y:32597,ptovrint:False,ptlb:metallic,ptin:_metallic,varname:node_3236,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7642,x:32308,y:32949,ptovrint:False,ptlb:normal,ptin:_normal,varname:node_7642,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:6232,x:32308,y:32771,ptovrint:False,ptlb:roughess,ptin:_roughess,varname:node_6232,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6066,x:31592,y:33449,ptovrint:False,ptlb:liuwen1,ptin:_liuwen1,varname:node_6066,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-773-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2732,x:31592,y:33638,ptovrint:False,ptlb:liuwen2,ptin:_liuwen2,varname:node_2732,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-1043-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9400,x:31548,y:34011,ptovrint:False,ptlb:rongjietex,ptin:_rongjietex,varname:node_9400,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0839562779f0c0543aaa239b78bd12b9,ntxv:0,isnm:False|UVIN-9436-OUT;n:type:ShaderForge.SFN_TexCoord,id:4003,x:31071,y:33560,varname:node_4003,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4448,x:31250,y:33560,varname:node_4448,prsc:2|A-4003-UVOUT,B-6759-OUT;n:type:ShaderForge.SFN_Vector2,id:6759,x:31071,y:33708,varname:node_6759,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_Panner,id:773,x:31431,y:33449,varname:node_773,prsc:2,spu:0.2,spv:0.3|UVIN-4448-OUT;n:type:ShaderForge.SFN_Panner,id:1043,x:31431,y:33638,varname:node_1043,prsc:2,spu:-0.3,spv:-0.2|UVIN-4448-OUT;n:type:ShaderForge.SFN_Add,id:9670,x:31786,y:33599,varname:node_9670,prsc:2|A-6066-RGB,B-2732-R;n:type:ShaderForge.SFN_Multiply,id:7024,x:31965,y:33577,varname:node_7024,prsc:2|A-2469-RGB,B-9670-OUT,C-6476-OUT;n:type:ShaderForge.SFN_Color,id:2469,x:31786,y:33449,ptovrint:False,ptlb:liuwen color,ptin:_liuwencolor,varname:node_2469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.06617647,c2:0.3431034,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:6476,x:31786,y:33747,varname:node_6476,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:9436,x:31378,y:34011,varname:node_9436,prsc:2|A-4003-UVOUT,B-9513-OUT;n:type:ShaderForge.SFN_Vector2,id:9513,x:31214,y:34029,varname:node_9513,prsc:2,v1:6,v2:2;n:type:ShaderForge.SFN_Step,id:276,x:31722,y:34028,varname:node_276,prsc:2|A-9400-R,B-6045-OUT;n:type:ShaderForge.SFN_Slider,id:2907,x:31057,y:34214,ptovrint:False,ptlb:rongjie,ptin:_rongjie,varname:node_2907,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_RemapRange,id:7970,x:31548,y:34214,varname:node_7970,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1.1|IN-6045-OUT;n:type:ShaderForge.SFN_Step,id:842,x:31722,y:34195,varname:node_842,prsc:2|A-9400-R,B-7970-OUT;n:type:ShaderForge.SFN_Subtract,id:9046,x:31890,y:34105,varname:node_9046,prsc:2|A-842-OUT,B-276-OUT;n:type:ShaderForge.SFN_Add,id:963,x:32295,y:33580,varname:node_963,prsc:2|A-7024-OUT,B-3067-OUT;n:type:ShaderForge.SFN_Multiply,id:3067,x:32088,y:34139,varname:node_3067,prsc:2|A-9046-OUT,B-6990-RGB;n:type:ShaderForge.SFN_Color,id:6990,x:31890,y:34252,ptovrint:False,ptlb:rongjiebian color,ptin:_rongjiebiancolor,varname:node_6990,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09558821,c2:0.9251521,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9534,x:32472,y:33520,varname:node_9534,prsc:2|A-7991-OUT,B-963-OUT;n:type:ShaderForge.SFN_Vector1,id:7991,x:32307,y:33520,varname:node_7991,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Multiply,id:6344,x:32643,y:33439,varname:node_6344,prsc:2|A-1891-OUT,B-9534-OUT;n:type:ShaderForge.SFN_Slider,id:1891,x:32317,y:33439,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_1891,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRange,id:6045,x:31378,y:34214,varname:node_6045,prsc:2,frmn:0,frmx:1,tomn:0.3,tomx:1|IN-2907-OUT;n:type:ShaderForge.SFN_Color,id:4007,x:32580,y:33725,ptovrint:False,ptlb:glow color,ptin:_glowcolor,varname:node_4007,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:0;n:type:ShaderForge.SFN_Add,id:9097,x:32901,y:33439,varname:node_9097,prsc:2|A-6344-OUT,B-6976-OUT;n:type:ShaderForge.SFN_Multiply,id:6976,x:32868,y:33760,varname:node_6976,prsc:2|A-4007-RGB,B-9267-R;n:type:ShaderForge.SFN_Tex2d,id:9267,x:32580,y:33892,ptovrint:False,ptlb:st glow,ptin:_stglow,varname:node_9267,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:2263-7642-3236-6232-8959-6066-2732-9400-2469-2907-6990-1891-4007-9267;pass:END;sub:END;*/

Shader "Shader Forge/daiji chuansong" {
    Properties {
        _basecolor ("base color", 2D) = "white" {}
        _normal ("normal", 2D) = "bump" {}
        _metallic ("metallic", 2D) = "bump" {}
        _roughess ("roughess", 2D) = "white" {}
        _AO ("AO", 2D) = "white" {}
        _liuwen1 ("liuwen1", 2D) = "white" {}
        _liuwen2 ("liuwen2", 2D) = "white" {}
        _rongjietex ("rongjietex", 2D) = "white" {}
        _liuwencolor ("liuwen color", Color) = (0.06617647,0.3431034,1,1)
        _rongjie ("rongjie", Range(0, 1)) = 0
        [HDR]_rongjiebiancolor ("rongjiebian color", Color) = (0.09558821,0.9251521,1,1)
        _alpha ("alpha", Range(0, 1)) = 1
        [HDR]_glowcolor ("glow color", Color) = (0,0,0,0)
        _stglow ("st glow", 2D) = "white" {}
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
            Cull Off
            
            
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
            uniform sampler2D _basecolor; uniform float4 _basecolor_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            uniform sampler2D _metallic; uniform float4 _metallic_ST;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            uniform sampler2D _roughess; uniform float4 _roughess_ST;
            uniform sampler2D _liuwen1; uniform float4 _liuwen1_ST;
            uniform sampler2D _liuwen2; uniform float4 _liuwen2_ST;
            uniform sampler2D _rongjietex; uniform float4 _rongjietex_ST;
            uniform float4 _liuwencolor;
            uniform float _rongjie;
            uniform float4 _rongjiebiancolor;
            uniform float _alpha;
            uniform float4 _glowcolor;
            uniform sampler2D _stglow; uniform float4 _stglow_ST;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _normal_var = UnpackNormal(tex2D(_normal,TRANSFORM_TEX(i.uv0, _normal)));
                float3 normalLocal = _normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 node_9436 = (i.uv0*float2(6,2));
                float4 _rongjietex_var = tex2D(_rongjietex,TRANSFORM_TEX(node_9436, _rongjietex));
                float node_6045 = (_rongjie*0.7+0.3);
                float node_842 = step(_rongjietex_var.r,(node_6045*1.1+0.0));
                clip(node_842 - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _roughess_var = tex2D(_roughess,TRANSFORM_TEX(i.uv0, _roughess));
                float gloss = 1.0 - _roughess_var.r; // Convert roughness to gloss
                float perceptualRoughness = _roughess_var.r;
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
                float4 _metallic_var = tex2D(_metallic,TRANSFORM_TEX(i.uv0, _metallic));
                float3 specularColor = _metallic_var.r;
                float specularMonochrome;
                float4 _basecolor_var = tex2D(_basecolor,TRANSFORM_TEX(i.uv0, _basecolor));
                float3 diffuseColor = _basecolor_var.rgb; // Need this for specular when using metallic
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
                float3 forwardLight = max(0.0, NdotL );
                float4 _AO_var = tex2D(_AO,TRANSFORM_TEX(i.uv0, _AO));
                float3 backLight = max(0.0, -NdotL ) * _AO_var.rgb;
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
                float4 node_5582 = _Time;
                float2 node_4448 = (i.uv0*float2(2,2));
                float2 node_773 = (node_4448+node_5582.g*float2(0.2,0.3));
                float4 _liuwen1_var = tex2D(_liuwen1,TRANSFORM_TEX(node_773, _liuwen1));
                float2 node_1043 = (node_4448+node_5582.g*float2(-0.3,-0.2));
                float4 _liuwen2_var = tex2D(_liuwen2,TRANSFORM_TEX(node_1043, _liuwen2));
                float4 _stglow_var = tex2D(_stglow,TRANSFORM_TEX(i.uv0, _stglow));
                float3 emissive = ((_alpha*(1.2*((_liuwencolor.rgb*(_liuwen1_var.rgb+_liuwen2_var.r)*2.0)+((node_842-step(_rongjietex_var.r,node_6045))*_rongjiebiancolor.rgb))))+(_glowcolor.rgb*_stglow_var.r));
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
            Cull Off
            
            
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
            uniform sampler2D _basecolor; uniform float4 _basecolor_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            uniform sampler2D _metallic; uniform float4 _metallic_ST;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            uniform sampler2D _roughess; uniform float4 _roughess_ST;
            uniform sampler2D _liuwen1; uniform float4 _liuwen1_ST;
            uniform sampler2D _liuwen2; uniform float4 _liuwen2_ST;
            uniform sampler2D _rongjietex; uniform float4 _rongjietex_ST;
            uniform float4 _liuwencolor;
            uniform float _rongjie;
            uniform float4 _rongjiebiancolor;
            uniform float _alpha;
            uniform float4 _glowcolor;
            uniform sampler2D _stglow; uniform float4 _stglow_ST;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _normal_var = UnpackNormal(tex2D(_normal,TRANSFORM_TEX(i.uv0, _normal)));
                float3 normalLocal = _normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 node_9436 = (i.uv0*float2(6,2));
                float4 _rongjietex_var = tex2D(_rongjietex,TRANSFORM_TEX(node_9436, _rongjietex));
                float node_6045 = (_rongjie*0.7+0.3);
                float node_842 = step(_rongjietex_var.r,(node_6045*1.1+0.0));
                clip(node_842 - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _roughess_var = tex2D(_roughess,TRANSFORM_TEX(i.uv0, _roughess));
                float gloss = 1.0 - _roughess_var.r; // Convert roughness to gloss
                float perceptualRoughness = _roughess_var.r;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float4 _metallic_var = tex2D(_metallic,TRANSFORM_TEX(i.uv0, _metallic));
                float3 specularColor = _metallic_var.r;
                float specularMonochrome;
                float4 _basecolor_var = tex2D(_basecolor,TRANSFORM_TEX(i.uv0, _basecolor));
                float3 diffuseColor = _basecolor_var.rgb; // Need this for specular when using metallic
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
                float3 forwardLight = max(0.0, NdotL );
                float4 _AO_var = tex2D(_AO,TRANSFORM_TEX(i.uv0, _AO));
                float3 backLight = max(0.0, -NdotL ) * _AO_var.rgb;
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
            Cull Off
            
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
            uniform sampler2D _rongjietex; uniform float4 _rongjietex_ST;
            uniform float _rongjie;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float2 node_9436 = (i.uv0*float2(6,2));
                float4 _rongjietex_var = tex2D(_rongjietex,TRANSFORM_TEX(node_9436, _rongjietex));
                float node_6045 = (_rongjie*0.7+0.3);
                float node_842 = step(_rongjietex_var.r,(node_6045*1.1+0.0));
                clip(node_842 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
