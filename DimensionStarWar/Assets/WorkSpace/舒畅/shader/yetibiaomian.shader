// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:35215,y:32708,varname:node_4013,prsc:2|spec-6816-OUT,gloss-6816-OUT,emission-2589-OUT,clip-9291-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:33719,y:32663,ptovrint:False,ptlb:liuwen color,ptin:_liuwencolor,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9849898,c3:0.4558824,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8044,x:32624,y:32669,varname:node_8044,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2248-UVOUT,TEX-8217-TEX;n:type:ShaderForge.SFN_TexCoord,id:4864,x:32115,y:32793,varname:node_4864,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:2248,x:32403,y:32669,varname:node_2248,prsc:2,spu:0.05,spv:0.5|UVIN-4864-UVOUT;n:type:ShaderForge.SFN_Panner,id:4527,x:32403,y:32921,varname:node_4527,prsc:2,spu:-0.3,spv:-0.1|UVIN-4864-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5169,x:32624,y:32921,varname:_node_8044_copy,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-4527-UVOUT,TEX-8217-TEX;n:type:ShaderForge.SFN_Multiply,id:7313,x:32816,y:32669,varname:node_7313,prsc:2|A-9288-OUT,B-8044-R;n:type:ShaderForge.SFN_Vector1,id:9288,x:32591,y:32567,varname:node_9288,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Vector1,id:1554,x:32624,y:32842,varname:node_1554,prsc:2,v1:0.07;n:type:ShaderForge.SFN_Multiply,id:4371,x:32816,y:32921,varname:node_4371,prsc:2|A-1554-OUT,B-5169-R;n:type:ShaderForge.SFN_Add,id:5871,x:33019,y:32752,varname:node_5871,prsc:2|A-7313-OUT,B-4371-OUT;n:type:ShaderForge.SFN_Add,id:4634,x:33198,y:32836,varname:node_4634,prsc:2|A-5871-OUT,B-5435-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5435,x:32977,y:32957,varname:node_5435,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:1080,x:33366,y:32836,varname:node_1080,prsc:2,spu:0.2,spv:0.3|UVIN-4634-OUT;n:type:ShaderForge.SFN_Multiply,id:6062,x:33719,y:32895,varname:node_6062,prsc:2|A-9001-R,B-8832-OUT;n:type:ShaderForge.SFN_Vector1,id:8832,x:33547,y:33002,varname:node_8832,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:5952,x:33888,y:32874,varname:node_5952,prsc:2|A-1304-RGB,B-6062-OUT;n:type:ShaderForge.SFN_Color,id:7742,x:33888,y:33039,ptovrint:False,ptlb:waice,ptin:_waice,varname:node_7742,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6022313,c2:1,c3:0.2205882,c4:1;n:type:ShaderForge.SFN_Add,id:6768,x:34062,y:32874,varname:node_6768,prsc:2|A-5952-OUT,B-7742-RGB;n:type:ShaderForge.SFN_Lerp,id:5129,x:34448,y:32781,varname:node_5129,prsc:2|A-2731-RGB,B-6768-OUT,T-6027-VFACE;n:type:ShaderForge.SFN_FaceSign,id:6027,x:34287,y:32991,varname:node_6027,prsc:2,fstp:0;n:type:ShaderForge.SFN_Fresnel,id:8587,x:34412,y:32433,varname:node_8587,prsc:2|EXP-9209-OUT;n:type:ShaderForge.SFN_Multiply,id:8861,x:34705,y:32426,varname:node_8861,prsc:2|A-5408-RGB,B-8587-OUT,C-9882-OUT;n:type:ShaderForge.SFN_Color,id:5408,x:34425,y:32291,ptovrint:False,ptlb:fresnel color,ptin:_fresnelcolor,varname:node_5408,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.7811359,c3:0.3897059,c4:1;n:type:ShaderForge.SFN_Add,id:2589,x:34853,y:32780,varname:node_2589,prsc:2|A-8861-OUT,B-5129-OUT;n:type:ShaderForge.SFN_Vector1,id:6816,x:34918,y:32727,varname:node_6816,prsc:2,v1:0;n:type:ShaderForge.SFN_FragmentPosition,id:2808,x:32878,y:33279,varname:node_2808,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:2043,x:32878,y:33424,varname:node_2043,prsc:2;n:type:ShaderForge.SFN_Subtract,id:2349,x:33156,y:33320,varname:node_2349,prsc:2|A-2808-Y,B-2043-Y;n:type:ShaderForge.SFN_Add,id:6201,x:33444,y:33319,varname:node_6201,prsc:2|A-2349-OUT,B-2555-OUT;n:type:ShaderForge.SFN_Vector3,id:8464,x:33094,y:33584,varname:node_8464,prsc:2,v1:0,v2:1.5,v3:0;n:type:ShaderForge.SFN_ComponentMask,id:2555,x:33280,y:33584,varname:node_2555,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-8464-OUT;n:type:ShaderForge.SFN_Multiply,id:6858,x:33531,y:33584,varname:node_6858,prsc:2|A-2555-OUT,B-5190-OUT;n:type:ShaderForge.SFN_Slider,id:5190,x:33182,y:33759,ptovrint:False,ptlb:yemiangaodu,ptin:_yemiangaodu,varname:node_5190,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Subtract,id:2800,x:33711,y:33442,varname:node_2800,prsc:2|A-6201-OUT,B-6858-OUT;n:type:ShaderForge.SFN_Clamp01,id:9922,x:33918,y:33424,varname:node_9922,prsc:2|IN-2800-OUT;n:type:ShaderForge.SFN_OneMinus,id:2813,x:34113,y:33424,varname:node_2813,prsc:2|IN-9922-OUT;n:type:ShaderForge.SFN_TexCoord,id:1437,x:33580,y:33744,varname:node_1437,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:6031,x:33930,y:33754,varname:node_6031,prsc:2,spu:0.5,spv:0.1|UVIN-8334-OUT;n:type:ShaderForge.SFN_Tex2d,id:3489,x:34108,y:33754,ptovrint:False,ptlb:node_3489,ptin:_node_3489,varname:node_3489,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False|UVIN-6031-UVOUT;n:type:ShaderForge.SFN_Add,id:5559,x:34436,y:33642,varname:node_5559,prsc:2|A-2813-OUT,B-3489-R;n:type:ShaderForge.SFN_Multiply,id:9291,x:34765,y:33470,varname:node_9291,prsc:2|A-2813-OUT,B-6844-OUT;n:type:ShaderForge.SFN_Power,id:6844,x:34623,y:33664,varname:node_6844,prsc:2|VAL-5559-OUT,EXP-2195-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3467,x:34460,y:33815,ptovrint:False,ptlb:node_3467,ptin:_node_3467,varname:node_3467,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.4;n:type:ShaderForge.SFN_Vector2,id:5259,x:33580,y:33978,varname:node_5259,prsc:2,v1:1,v2:1;n:type:ShaderForge.SFN_Multiply,id:8334,x:33765,y:33808,varname:node_8334,prsc:2|A-1437-UVOUT,B-5259-OUT;n:type:ShaderForge.SFN_Color,id:2731,x:34217,y:32595,ptovrint:False,ptlb:neice color,ptin:_neicecolor,varname:node_2731,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.141,c2:0.4191176,c3:0,c4:1;n:type:ShaderForge.SFN_Slider,id:2195,x:34341,y:33934,ptovrint:False,ptlb:yemianbodongqiangdu,ptin:_yemianbodongqiangdu,varname:node_2195,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.06535619,max:0.1;n:type:ShaderForge.SFN_Tex2dAsset,id:8217,x:32198,y:32494,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8217,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:9209,x:34217,y:32447,varname:node_9209,prsc:2,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:9882,x:34549,y:32522,ptovrint:False,ptlb:FRESNEL,ptin:_FRESNEL,varname:node_9882,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Tex2d,id:9001,x:33557,y:32836,varname:node_9001,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-1080-UVOUT,TEX-8217-TEX;n:type:ShaderForge.SFN_Add,id:9208,x:33987,y:32522,varname:node_9208,prsc:2|A-1304-RGB,B-1955-OUT;n:type:ShaderForge.SFN_Vector1,id:1955,x:33767,y:32469,varname:node_1955,prsc:2,v1:0.5;proporder:8217-1304-7742-5408-5190-3467-3489-2731-2195-9882;pass:END;sub:END;*/

Shader "Shader Forge/yetibiaomian" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_liuwencolor ("liuwen color", Color) = (1,0.9849898,0.4558824,1)
        _waice ("waice", Color) = (0.6022313,1,0.2205882,1)
        [HDR]_fresnelcolor ("fresnel color", Color) = (1,0.7811359,0.3897059,1)
        _yemiangaodu ("yemiangaodu", Range(0, 1)) = 1
        _node_3467 ("node_3467", Float ) = 0.4
        _node_3489 ("node_3489", 2D) = "white" {}
        [HDR]_neicecolor ("neice color", Color) = (0.141,0.4191176,0,1)
        _yemianbodongqiangdu ("yemianbodongqiangdu", Range(0, 0.1)) = 0.06535619
        _FRESNEL ("FRESNEL", Float ) = 3
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _liuwencolor;
            uniform float4 _waice;
            uniform float4 _fresnelcolor;
            uniform float _yemiangaodu;
            uniform sampler2D _node_3489; uniform float4 _node_3489_ST;
            uniform float4 _neicecolor;
            uniform float _yemianbodongqiangdu;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _FRESNEL;
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
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
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
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_2555 = float3(0,1.5,0).g;
                float node_2813 = (1.0 - saturate((((i.posWorld.g-objPos.g)+node_2555)-(node_2555*_yemiangaodu))));
                float4 node_5861 = _Time;
                float2 node_6031 = ((i.uv0*float2(1,1))+node_5861.g*float2(0.5,0.1));
                float4 _node_3489_var = tex2D(_node_3489,TRANSFORM_TEX(node_6031, _node_3489));
                clip((node_2813*pow((node_2813+_node_3489_var.r),_yemianbodongqiangdu)) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float node_6816 = 0.0;
                float gloss = node_6816;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(node_6816,node_6816,node_6816);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
////// Emissive:
                float2 node_2248 = (i.uv0+node_5861.g*float2(0.05,0.5));
                float4 node_8044 = tex2D(_MainTex,TRANSFORM_TEX(node_2248, _MainTex));
                float2 node_4527 = (i.uv0+node_5861.g*float2(-0.3,-0.1));
                float4 _node_8044_copy = tex2D(_MainTex,TRANSFORM_TEX(node_4527, _MainTex));
                float2 node_1080 = ((((0.1*node_8044.r)+(0.07*_node_8044_copy.r))+i.uv0)+node_5861.g*float2(0.2,0.3));
                float4 node_9001 = tex2D(_MainTex,TRANSFORM_TEX(node_1080, _MainTex));
                float3 emissive = ((_fresnelcolor.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_FRESNEL)+lerp(_neicecolor.rgb,((_liuwencolor.rgb*(node_9001.r*0.5))+_waice.rgb),isFrontFace));
/// Final Color:
                float3 finalColor = specular + emissive;
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _liuwencolor;
            uniform float4 _waice;
            uniform float4 _fresnelcolor;
            uniform float _yemiangaodu;
            uniform sampler2D _node_3489; uniform float4 _node_3489_ST;
            uniform float4 _neicecolor;
            uniform float _yemianbodongqiangdu;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _FRESNEL;
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
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
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
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_2555 = float3(0,1.5,0).g;
                float node_2813 = (1.0 - saturate((((i.posWorld.g-objPos.g)+node_2555)-(node_2555*_yemiangaodu))));
                float4 node_3165 = _Time;
                float2 node_6031 = ((i.uv0*float2(1,1))+node_3165.g*float2(0.5,0.1));
                float4 _node_3489_var = tex2D(_node_3489,TRANSFORM_TEX(node_6031, _node_3489));
                clip((node_2813*pow((node_2813+_node_3489_var.r),_yemianbodongqiangdu)) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float node_6816 = 0.0;
                float gloss = node_6816;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(node_6816,node_6816,node_6816);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/// Final Color:
                float3 finalColor = specular;
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
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _yemiangaodu;
            uniform sampler2D _node_3489; uniform float4 _node_3489_ST;
            uniform float _yemianbodongqiangdu;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float node_2555 = float3(0,1.5,0).g;
                float node_2813 = (1.0 - saturate((((i.posWorld.g-objPos.g)+node_2555)-(node_2555*_yemiangaodu))));
                float4 node_4439 = _Time;
                float2 node_6031 = ((i.uv0*float2(1,1))+node_4439.g*float2(0.5,0.1));
                float4 _node_3489_var = tex2D(_node_3489,TRANSFORM_TEX(node_6031, _node_3489));
                clip((node_2813*pow((node_2813+_node_3489_var.r),_yemianbodongqiangdu)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
