// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33835,y:32712,varname:node_4013,prsc:2|normal-405-RGB,emission-9595-OUT,clip-2227-OUT,olwid-5129-OUT,olcol-1443-RGB;n:type:ShaderForge.SFN_Fresnel,id:8134,x:32489,y:32377,varname:node_8134,prsc:2|EXP-5752-OUT;n:type:ShaderForge.SFN_Add,id:9595,x:33193,y:32727,varname:node_9595,prsc:2|A-6243-OUT,B-4865-OUT;n:type:ShaderForge.SFN_Multiply,id:6243,x:32696,y:32377,varname:node_6243,prsc:2|A-8134-OUT,B-9721-RGB;n:type:ShaderForge.SFN_Color,id:9721,x:32268,y:32516,ptovrint:False,ptlb:node_9721,ptin:_node_9721,varname:node_9721,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2794118,c2:0.9105477,c3:1,c4:1;n:type:ShaderForge.SFN_Panner,id:5185,x:32453,y:32910,varname:node_5185,prsc:2,spu:1,spv:0|UVIN-6020-UVOUT,DIST-4245-OUT;n:type:ShaderForge.SFN_TexCoord,id:6020,x:32234,y:32910,varname:node_6020,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:4245,x:32156,y:33089,ptovrint:False,ptlb:UVliudong,ptin:_UVliudong,varname:node_4245,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:-0.08043599,max:1;n:type:ShaderForge.SFN_Tex2d,id:1832,x:32686,y:32949,varname:node_1832,prsc:2,tex:b44785bd56eade34c934432331eedfee,ntxv:0,isnm:False|UVIN-5185-UVOUT,TEX-1560-TEX;n:type:ShaderForge.SFN_Tex2d,id:9148,x:32686,y:33124,varname:_node_1832_copy,prsc:2,tex:b44785bd56eade34c934432331eedfee,ntxv:0,isnm:False|TEX-1560-TEX;n:type:ShaderForge.SFN_Multiply,id:4972,x:32909,y:33033,varname:node_4972,prsc:2|A-1832-R,B-9148-R;n:type:ShaderForge.SFN_Slider,id:5129,x:33123,y:33117,ptovrint:False,ptlb:miaobian,ptin:_miaobian,varname:node_5129,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.02564112,max:1;n:type:ShaderForge.SFN_Color,id:1443,x:33092,y:33209,ptovrint:False,ptlb:bianse,ptin:_bianse,varname:node_1443,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.02307301,c2:0,c3:0.09558821,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:1560,x:32375,y:33197,ptovrint:False,ptlb:node_1560,ptin:_node_1560,varname:node_1560,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b44785bd56eade34c934432331eedfee,ntxv:0,isnm:False;n:type:ShaderForge.SFN_FaceSign,id:4091,x:32826,y:32831,varname:node_4091,prsc:2,fstp:0;n:type:ShaderForge.SFN_Lerp,id:4865,x:33007,y:32747,varname:node_4865,prsc:2|A-3371-OUT,B-8910-OUT,T-4091-VFACE;n:type:ShaderForge.SFN_Color,id:435,x:32522,y:32780,ptovrint:False,ptlb:beimian,ptin:_beimian,varname:node_435,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08131491,c2:0.05644465,c3:0.2132353,c4:1;n:type:ShaderForge.SFN_Color,id:9947,x:32663,y:32526,ptovrint:False,ptlb:zhengmian,ptin:_zhengmian,varname:node_9947,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5471603,c2:0.08434258,c3:0.9558824,c4:1;n:type:ShaderForge.SFN_Vector1,id:5752,x:32297,y:32396,varname:node_5752,prsc:2,v1:4;n:type:ShaderForge.SFN_Tex2d,id:6576,x:32268,y:32681,ptovrint:False,ptlb:node_6576,ptin:_node_6576,varname:node_6576,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:08b80d3219bb7b7489cc2cdf5c36c938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3371,x:32826,y:32640,varname:node_3371,prsc:2|A-9947-RGB,B-6576-R;n:type:ShaderForge.SFN_Multiply,id:8910,x:32715,y:32761,varname:node_8910,prsc:2|A-6576-R,B-435-RGB;n:type:ShaderForge.SFN_Tex2d,id:405,x:33158,y:32539,ptovrint:False,ptlb:node_405,ptin:_node_405,varname:node_405,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3fe2f328c1c92de449d7fc0b010110e3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:4956,x:32846,y:33409,varname:node_4956,prsc:2|A-5358-OUT,B-4988-OUT;n:type:ShaderForge.SFN_Vector1,id:6179,x:32192,y:33383,varname:node_6179,prsc:2,v1:3;n:type:ShaderForge.SFN_Power,id:5358,x:32632,y:33374,varname:node_5358,prsc:2|VAL-405-G,EXP-6179-OUT;n:type:ShaderForge.SFN_Multiply,id:2227,x:33191,y:33364,varname:node_2227,prsc:2|A-4972-OUT,B-4956-OUT;n:type:ShaderForge.SFN_Vector1,id:4988,x:32611,y:33542,varname:node_4988,prsc:2,v1:0.156;proporder:9721-4245-5129-1443-1560-435-9947-6576-405;pass:END;sub:END;*/

Shader "Shader Forge/hudun" {
    Properties {
        _node_9721 ("node_9721", Color) = (0.2794118,0.9105477,1,1)
        _UVliudong ("UVliudong", Range(-1, 1)) = -0.08043599
        _miaobian ("miaobian", Range(0, 1)) = 0.02564112
        _bianse ("bianse", Color) = (0.02307301,0,0.09558821,1)
        _node_1560 ("node_1560", 2D) = "white" {}
        _beimian ("beimian", Color) = (0.08131491,0.05644465,0.2132353,1)
        _zhengmian ("zhengmian", Color) = (0.5471603,0.08434258,0.9558824,1)
        _node_6576 ("node_6576", 2D) = "white" {}
        _node_405 ("node_405", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _UVliudong;
            uniform float _miaobian;
            uniform float4 _bianse;
            uniform sampler2D _node_1560; uniform float4 _node_1560_ST;
            uniform sampler2D _node_405; uniform float4 _node_405_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_miaobian,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float2 node_5185 = (i.uv0+_UVliudong*float2(1,0));
                float4 node_1832 = tex2D(_node_1560,TRANSFORM_TEX(node_5185, _node_1560));
                float4 _node_1832_copy = tex2D(_node_1560,TRANSFORM_TEX(i.uv0, _node_1560));
                float4 _node_405_var = tex2D(_node_405,TRANSFORM_TEX(i.uv0, _node_405));
                clip(((node_1832.r*_node_1832_copy.r)*step(pow(_node_405_var.g,3.0),0.156)) - 0.5);
                return fixed4(_bianse.rgb,0);
            }
            ENDCG
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _node_9721;
            uniform float _UVliudong;
            uniform sampler2D _node_1560; uniform float4 _node_1560_ST;
            uniform float4 _beimian;
            uniform float4 _zhengmian;
            uniform sampler2D _node_6576; uniform float4 _node_6576_ST;
            uniform sampler2D _node_405; uniform float4 _node_405_ST;
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
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
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _node_405_var = tex2D(_node_405,TRANSFORM_TEX(i.uv0, _node_405));
                float3 normalLocal = _node_405_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 node_5185 = (i.uv0+_UVliudong*float2(1,0));
                float4 node_1832 = tex2D(_node_1560,TRANSFORM_TEX(node_5185, _node_1560));
                float4 _node_1832_copy = tex2D(_node_1560,TRANSFORM_TEX(i.uv0, _node_1560));
                clip(((node_1832.r*_node_1832_copy.r)*step(pow(_node_405_var.g,3.0),0.156)) - 0.5);
////// Lighting:
////// Emissive:
                float4 _node_6576_var = tex2D(_node_6576,TRANSFORM_TEX(i.uv0, _node_6576));
                float3 emissive = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),4.0)*_node_9721.rgb)+lerp((_zhengmian.rgb*_node_6576_var.r),(_node_6576_var.r*_beimian.rgb),isFrontFace));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            uniform float _UVliudong;
            uniform sampler2D _node_1560; uniform float4 _node_1560_ST;
            uniform sampler2D _node_405; uniform float4 _node_405_ST;
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
                float2 node_5185 = (i.uv0+_UVliudong*float2(1,0));
                float4 node_1832 = tex2D(_node_1560,TRANSFORM_TEX(node_5185, _node_1560));
                float4 _node_1832_copy = tex2D(_node_1560,TRANSFORM_TEX(i.uv0, _node_1560));
                float4 _node_405_var = tex2D(_node_405,TRANSFORM_TEX(i.uv0, _node_405));
                clip(((node_1832.r*_node_1832_copy.r)*step(pow(_node_405_var.g,3.0),0.156)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
