// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33654,y:32662,varname:node_9361,prsc:2|custl-2446-OUT,voffset-1510-OUT;n:type:ShaderForge.SFN_ScreenPos,id:7314,x:32378,y:32716,varname:node_7314,prsc:2,sctp:0;n:type:ShaderForge.SFN_Slider,id:7129,x:32166,y:32901,ptovrint:False,ptlb:T,ptin:_T,varname:node_7129,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:6.964136,max:100;n:type:ShaderForge.SFN_Noise,id:2446,x:33034,y:32841,varname:node_2446,prsc:2|XY-7024-OUT;n:type:ShaderForge.SFN_Floor,id:7024,x:32808,y:32841,varname:node_7024,prsc:2|IN-7859-OUT;n:type:ShaderForge.SFN_Multiply,id:7859,x:32620,y:32841,varname:node_7859,prsc:2|A-7314-UVOUT,B-7129-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:3060,x:32323,y:33031,varname:node_3060,prsc:2;n:type:ShaderForge.SFN_Transform,id:752,x:32529,y:33031,varname:node_752,prsc:2,tffrom:0,tfto:1|IN-3060-XYZ;n:type:ShaderForge.SFN_Negate,id:156,x:32935,y:33047,varname:node_156,prsc:2|IN-1390-OUT;n:type:ShaderForge.SFN_Lerp,id:6312,x:33066,y:33132,varname:node_6312,prsc:2|A-156-OUT,B-8929-OUT,T-9162-OUT;n:type:ShaderForge.SFN_Vector1,id:8929,x:32828,y:33224,varname:node_8929,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector4Property,id:4187,x:32462,y:33378,ptovrint:False,ptlb:node_4187,ptin:_node_4187,varname:node_4187,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Transform,id:3425,x:32647,y:33378,varname:node_3425,prsc:2,tffrom:0,tfto:1|IN-4187-XYZ;n:type:ShaderForge.SFN_Lerp,id:384,x:33066,y:33305,varname:node_384,prsc:2|A-3425-XYZ,B-8929-OUT,T-9162-OUT;n:type:ShaderForge.SFN_Add,id:1510,x:33355,y:33179,varname:node_1510,prsc:2|A-6312-OUT,B-384-OUT;n:type:ShaderForge.SFN_RemapRange,id:3480,x:32046,y:33092,varname:node_3480,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7426-V;n:type:ShaderForge.SFN_Add,id:6458,x:32295,y:33201,varname:node_6458,prsc:2|A-1390-B,B-5146-OUT;n:type:ShaderForge.SFN_Multiply,id:5146,x:32046,y:33304,varname:node_5146,prsc:2|A-7277-OUT,B-7446-OUT;n:type:ShaderForge.SFN_Vector1,id:7277,x:31795,y:33263,varname:node_7277,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:7446,x:31718,y:33479,ptovrint:False,ptlb:Transform,ptin:_Transform,varname:node_7446,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Clamp01,id:9162,x:32479,y:33201,varname:node_9162,prsc:2|IN-6458-OUT;n:type:ShaderForge.SFN_TexCoord,id:7426,x:31815,y:32924,varname:node_7426,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ComponentMask,id:1390,x:32686,y:33037,varname:node_1390,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-752-XYZ;proporder:7129-4187-7446;pass:END;sub:END;*/

Shader "Shader Forge/growup" {
    Properties {
        _T ("T", Range(0, 100)) = 6.964136
        _node_4187 ("node_4187", Vector) = (0,0,0,0)
        _Transform ("Transform", Range(0, 1)) = 1
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _T;
            uniform float4 _node_4187;
            uniform float _Transform;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float3 node_1390 = mul( unity_WorldToObject, float4(mul(unity_ObjectToWorld, v.vertex).rgb,0) ).xyz.rgb.rgb;
                float node_8929 = 0.0;
                float node_9162 = saturate((node_1390.b+(2.0*_Transform)));
                v.vertex.xyz += (lerp((-1*node_1390),float3(node_8929,node_8929,node_8929),node_9162)+lerp(mul( unity_WorldToObject, float4(_node_4187.rgb,0) ).xyz.rgb,float3(node_8929,node_8929,node_8929),node_9162));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
                float2 node_7024 = floor(((sceneUVs * 2 - 1).rg*_T));
                float2 node_2446_skew = node_7024 + 0.2127+node_7024.x*0.3713*node_7024.y;
                float2 node_2446_rnd = 4.789*sin(489.123*(node_2446_skew));
                float node_2446 = frac(node_2446_rnd.x*node_2446_rnd.y*(1+node_2446_skew.x));
                float3 finalColor = float3(node_2446,node_2446,node_2446);
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
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _node_4187;
            uniform float _Transform;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float3 node_1390 = mul( unity_WorldToObject, float4(mul(unity_ObjectToWorld, v.vertex).rgb,0) ).xyz.rgb.rgb;
                float node_8929 = 0.0;
                float node_9162 = saturate((node_1390.b+(2.0*_Transform)));
                v.vertex.xyz += (lerp((-1*node_1390),float3(node_8929,node_8929,node_8929),node_9162)+lerp(mul( unity_WorldToObject, float4(_node_4187.rgb,0) ).xyz.rgb,float3(node_8929,node_8929,node_8929),node_9162));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
