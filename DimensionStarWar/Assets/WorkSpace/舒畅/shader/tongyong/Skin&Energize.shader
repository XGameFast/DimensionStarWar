// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:1,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33402,y:33001,varname:node_4013,prsc:2|diff-2263-RGB,spec-959-OUT,gloss-6232-R,normal-7642-RGB,emission-4488-OUT,transm-8959-RGB,clip-1952-OUT;n:type:ShaderForge.SFN_Tex2d,id:2263,x:33142,y:32445,ptovrint:False,ptlb:base color,ptin:_basecolor,varname:node_2263,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8959,x:33142,y:33162,ptovrint:False,ptlb:AO,ptin:_AO,varname:node_8959,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3236,x:32832,y:32589,ptovrint:False,ptlb:metallic,ptin:_metallic,varname:node_3236,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7642,x:33142,y:32978,ptovrint:False,ptlb:normal,ptin:_normal,varname:node_7642,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:6232,x:33142,y:32800,ptovrint:False,ptlb:roughess,ptin:_roughess,varname:node_6232,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4003,x:31526,y:33474,varname:node_4003,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:1043,x:31976,y:33492,varname:node_1043,prsc:2,spu:0,spv:1|UVIN-4003-UVOUT,DIST-6138-OUT;n:type:ShaderForge.SFN_Step,id:276,x:31977,y:33850,varname:node_276,prsc:2|A-9990-B,B-2907-OUT;n:type:ShaderForge.SFN_Slider,id:2907,x:31352,y:33902,ptovrint:False,ptlb:Dissolve,ptin:_Dissolve,varname:node_2907,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.1,cur:0.9917887,max:1.1;n:type:ShaderForge.SFN_Subtract,id:9046,x:32155,y:33838,varname:node_9046,prsc:2|A-1952-OUT,B-276-OUT;n:type:ShaderForge.SFN_Multiply,id:3067,x:32320,y:33838,varname:node_3067,prsc:2|A-9046-OUT,B-6990-RGB;n:type:ShaderForge.SFN_Color,id:6990,x:32156,y:33991,ptovrint:False,ptlb:Dissolvebian color,ptin:_Dissolvebiancolor,varname:node_6990,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09558821,c2:0.9251521,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:4007,x:32781,y:33756,ptovrint:False,ptlb:st glow color,ptin:_stglowcolor,varname:node_4007,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:0;n:type:ShaderForge.SFN_Multiply,id:6976,x:32962,y:33756,varname:node_6976,prsc:2|A-4007-RGB,B-4897-R;n:type:ShaderForge.SFN_Tex2d,id:9990,x:31765,y:33762,varname:node_9990,prsc:2,tex:f79973b9d5a511e4eabe2fc04c139a27,ntxv:0,isnm:False|UVIN-4003-UVOUT,TEX-6917-TEX;n:type:ShaderForge.SFN_Step,id:1952,x:31965,y:33971,varname:node_1952,prsc:2|A-9990-B,B-2414-OUT;n:type:ShaderForge.SFN_RemapRange,id:2414,x:31783,y:33999,varname:node_2414,prsc:2,frmn:0,frmx:1,tomn:0.01,tomx:1.01|IN-2907-OUT;n:type:ShaderForge.SFN_Multiply,id:3038,x:32345,y:33284,varname:node_3038,prsc:2|A-4897-G,B-535-OUT,C-6423-G;n:type:ShaderForge.SFN_Tex2d,id:6423,x:32152,y:33492,ptovrint:False,ptlb:saomiao,ptin:_saomiao,varname:node_6423,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:426e392ac715b4248aafc705aa010f0d,ntxv:0,isnm:False|UVIN-1043-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:6138,x:31797,y:33532,varname:node_6138,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:-0.5|IN-2907-OUT;n:type:ShaderForge.SFN_Multiply,id:2766,x:32574,y:33323,varname:node_2766,prsc:2|A-3038-OUT,B-7780-RGB;n:type:ShaderForge.SFN_Color,id:7780,x:32334,y:33492,ptovrint:False,ptlb:wangge color,ptin:_wanggecolor,varname:node_7780,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2058824,c2:0.7371196,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:4488,x:33142,y:33347,varname:node_4488,prsc:2|A-2766-OUT,B-8112-OUT,C-3067-OUT,D-6976-OUT;n:type:ShaderForge.SFN_Multiply,id:245,x:32334,y:33651,varname:node_245,prsc:2|A-6423-G,B-5353-RGB;n:type:ShaderForge.SFN_Color,id:5353,x:32152,y:33670,ptovrint:False,ptlb:di color,ptin:_dicolor,varname:node_5353,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.6275863,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4897,x:32152,y:33306,ptovrint:False,ptlb:wangge&st glow tex2,ptin:_wanggestglowtex2,varname:node_4897,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4ca4fc546005d08448f09ed8916dd7cf,ntxv:0,isnm:False|UVIN-4791-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4791,x:31976,y:33306,varname:node_4791,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:6917,x:31795,y:33157,ptovrint:False,ptlb:liuwen&dissolve tex,ptin:_liuwendissolvetex,varname:node_6917,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f79973b9d5a511e4eabe2fc04c139a27,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1419,x:31976,y:33049,varname:node_1419,prsc:2,tex:f79973b9d5a511e4eabe2fc04c139a27,ntxv:0,isnm:False|UVIN-136-UVOUT,TEX-6917-TEX;n:type:ShaderForge.SFN_Tex2d,id:1407,x:31976,y:33175,varname:node_1407,prsc:2,tex:f79973b9d5a511e4eabe2fc04c139a27,ntxv:0,isnm:False|UVIN-2545-UVOUT,TEX-6917-TEX;n:type:ShaderForge.SFN_Multiply,id:535,x:32152,y:33159,varname:node_535,prsc:2|A-1419-R,B-1407-R;n:type:ShaderForge.SFN_Panner,id:136,x:31795,y:32988,varname:node_136,prsc:2,spu:0.2,spv:-0.3|UVIN-4003-UVOUT;n:type:ShaderForge.SFN_Panner,id:2545,x:31795,y:33320,varname:node_2545,prsc:2,spu:-0.3,spv:-0.2|UVIN-4003-UVOUT;n:type:ShaderForge.SFN_Subtract,id:3101,x:32574,y:33539,varname:node_3101,prsc:2|A-245-OUT,B-3038-OUT;n:type:ShaderForge.SFN_Clamp01,id:8112,x:32747,y:33539,varname:node_8112,prsc:2|IN-3101-OUT;n:type:ShaderForge.SFN_Slider,id:3648,x:32992,y:32718,ptovrint:False,ptlb:Matallic Intensity,ptin:_MatallicIntensity,varname:node_3648,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:959,x:33316,y:32657,varname:node_959,prsc:2|A-3236-R,B-3648-OUT;proporder:2263-7642-3236-6232-8959-2907-6990-4007-7780-5353-4897-6917-3648-6423;pass:END;sub:END;*/

Shader "Shader Forge/Skin&Energize" {
    Properties {
        _basecolor ("base color", 2D) = "white" {}
        _normal ("normal", 2D) = "bump" {}
        _metallic ("metallic", 2D) = "bump" {}
        _roughess ("roughess", 2D) = "white" {}
        _AO ("AO", 2D) = "white" {}
        _Dissolve ("Dissolve", Range(-0.1, 1.1)) = 0.9917887
        [HDR]_Dissolvebiancolor ("Dissolvebian color", Color) = (0.09558821,0.9251521,1,1)
        [HDR]_stglowcolor ("st glow color", Color) = (0,0,0,0)
        [HDR]_wanggecolor ("wangge color", Color) = (0.2058824,0.7371196,1,1)
        [HDR]_dicolor ("di color", Color) = (0,0.6275863,1,1)
        _wanggestglowtex2 ("wangge&st glow tex2", 2D) = "white" {}
        _liuwendissolvetex ("liuwen&dissolve tex", 2D) = "white" {}
        _MatallicIntensity ("Matallic Intensity", Range(0, 1)) = 0
        _saomiao ("saomiao", 2D) = "white" {}
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
            uniform float _Dissolve;
            uniform float4 _Dissolvebiancolor;
            uniform float4 _stglowcolor;
            uniform sampler2D _saomiao; uniform float4 _saomiao_ST;
            uniform float4 _wanggecolor;
            uniform float4 _dicolor;
            uniform sampler2D _wanggestglowtex2; uniform float4 _wanggestglowtex2_ST;
            uniform sampler2D _liuwendissolvetex; uniform float4 _liuwendissolvetex_ST;
            uniform float _MatallicIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
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
                float4 node_9990 = tex2D(_liuwendissolvetex,TRANSFORM_TEX(i.uv1, _liuwendissolvetex));
                float node_1952 = step(node_9990.b,(_Dissolve*1.0+0.01));
                clip(node_1952 - 0.5);
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
                float3 specularColor = (_metallic_var.r*_MatallicIntensity);
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
                float4 _wanggestglowtex2_var = tex2D(_wanggestglowtex2,TRANSFORM_TEX(i.uv0, _wanggestglowtex2));
                float4 node_5708 = _Time;
                float2 node_136 = (i.uv1+node_5708.g*float2(0.2,-0.3));
                float4 node_1419 = tex2D(_liuwendissolvetex,TRANSFORM_TEX(node_136, _liuwendissolvetex));
                float2 node_2545 = (i.uv1+node_5708.g*float2(-0.3,-0.2));
                float4 node_1407 = tex2D(_liuwendissolvetex,TRANSFORM_TEX(node_2545, _liuwendissolvetex));
                float2 node_1043 = (i.uv1+(_Dissolve*-1.0+0.5)*float2(0,1));
                float4 _saomiao_var = tex2D(_saomiao,TRANSFORM_TEX(node_1043, _saomiao));
                float node_3038 = (_wanggestglowtex2_var.g*(node_1419.r*node_1407.r)*_saomiao_var.g);
                float3 emissive = ((node_3038*_wanggecolor.rgb)+saturate(((_saomiao_var.g*_dicolor.rgb)-node_3038))+((node_1952-step(node_9990.b,_Dissolve))*_Dissolvebiancolor.rgb)+(_stglowcolor.rgb*_wanggestglowtex2_var.r));
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
            uniform float _Dissolve;
            uniform float4 _Dissolvebiancolor;
            uniform float4 _stglowcolor;
            uniform sampler2D _saomiao; uniform float4 _saomiao_ST;
            uniform float4 _wanggecolor;
            uniform float4 _dicolor;
            uniform sampler2D _wanggestglowtex2; uniform float4 _wanggestglowtex2_ST;
            uniform sampler2D _liuwendissolvetex; uniform float4 _liuwendissolvetex_ST;
            uniform float _MatallicIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
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
                float4 node_9990 = tex2D(_liuwendissolvetex,TRANSFORM_TEX(i.uv1, _liuwendissolvetex));
                float node_1952 = step(node_9990.b,(_Dissolve*1.0+0.01));
                clip(node_1952 - 0.5);
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
                float3 specularColor = (_metallic_var.r*_MatallicIntensity);
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
            uniform float _Dissolve;
            uniform sampler2D _liuwendissolvetex; uniform float4 _liuwendissolvetex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv1 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_9990 = tex2D(_liuwendissolvetex,TRANSFORM_TEX(i.uv1, _liuwendissolvetex));
                float node_1952 = step(node_9990.b,(_Dissolve*1.0+0.01));
                clip(node_1952 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
