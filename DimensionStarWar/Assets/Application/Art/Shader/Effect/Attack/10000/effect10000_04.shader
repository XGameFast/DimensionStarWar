// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33269,y:32648,varname:node_9361,prsc:2|custl-183-OUT,alpha-1464-OUT,clip-1267-OUT;n:type:ShaderForge.SFN_TexCoord,id:5134,x:32238,y:32780,varname:node_5134,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:2019,x:32238,y:32944,varname:node_2019,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:2933,x:32641,y:32876,varname:node_2933,prsc:2|A-4023-UVOUT,B-2019-OUT;n:type:ShaderForge.SFN_OneMinus,id:1267,x:32765,y:32896,varname:node_1267,prsc:2|IN-2933-OUT;n:type:ShaderForge.SFN_Divide,id:9303,x:32672,y:32710,varname:node_9303,prsc:2|A-2933-OUT,B-4578-OUT;n:type:ShaderForge.SFN_Slider,id:4578,x:32250,y:32642,ptovrint:False,ptlb:Circle,ptin:_Circle,varname:node_4578,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:0.5;n:type:ShaderForge.SFN_Power,id:1276,x:32949,y:32584,varname:node_1276,prsc:2|VAL-9303-OUT,EXP-4920-OUT;n:type:ShaderForge.SFN_Exp,id:4920,x:32650,y:32524,varname:node_4920,prsc:2,et:1|IN-3046-OUT;n:type:ShaderForge.SFN_Slider,id:3046,x:32240,y:32510,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_3046,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.735043,max:5;n:type:ShaderForge.SFN_Multiply,id:183,x:33197,y:32412,varname:node_183,prsc:2|A-2987-RGB,B-2813-OUT,C-1276-OUT;n:type:ShaderForge.SFN_Color,id:2987,x:32949,y:32308,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_2987,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:2813,x:32965,y:32510,varname:node_2813,prsc:2,v1:2;n:type:ShaderForge.SFN_Parallax,id:4023,x:32415,y:33093,varname:node_4023,prsc:2|UVIN-5134-UVOUT,HEI-9581-OUT;n:type:ShaderForge.SFN_Slider,id:392,x:31614,y:33259,ptovrint:False,ptlb:Value,ptin:_Value,varname:node_392,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRange,id:9581,x:32183,y:33184,varname:node_9581,prsc:2,frmn:0,frmx:1,tomn:300,tomx:60|IN-617-OUT;n:type:ShaderForge.SFN_Multiply,id:1464,x:33024,y:33089,varname:node_1464,prsc:2|A-1276-OUT,B-4274-OUT;n:type:ShaderForge.SFN_Sin,id:4274,x:32460,y:33360,varname:node_4274,prsc:2|IN-6771-OUT;n:type:ShaderForge.SFN_RemapRange,id:6771,x:32287,y:33360,varname:node_6771,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3.14|IN-617-OUT;n:type:ShaderForge.SFN_Power,id:741,x:32850,y:33465,varname:node_741,prsc:2|VAL-4274-OUT,EXP-9692-OUT;n:type:ShaderForge.SFN_Exp,id:9692,x:32559,y:33565,varname:node_9692,prsc:2,et:1|IN-6403-OUT;n:type:ShaderForge.SFN_Vector1,id:6403,x:32287,y:33620,varname:node_6403,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Clamp01,id:617,x:31976,y:33324,varname:node_617,prsc:2|IN-392-OUT;proporder:4578-3046-2987-392;pass:END;sub:END;*/

Shader "Shader Forge/effect10000_04" {
    Properties {
        _Circle ("Circle", Range(0, 0.5)) = 0.5
        _Power ("Power", Range(0, 5)) = 1.735043
        _MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _Value ("Value", Range(0, 1)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _Circle;
            uniform float _Power;
            uniform float4 _MainColor;
            uniform float _Value;
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
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_617 = saturate(_Value);
                float node_2933 = distance((0.05*((node_617*-240.0+300.0) - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0).rg,float2(0.5,0.5));
                clip((1.0 - node_2933) - 0.5);
////// Lighting:
                float node_1276 = pow((node_2933/_Circle),exp2(_Power));
                float3 finalColor = (_MainColor.rgb*2.0*node_1276);
                float node_4274 = sin((node_617*3.14+0.0));
                fixed4 finalRGBA = fixed4(finalColor,(node_1276*node_4274));
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _Value;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_617 = saturate(_Value);
                float node_2933 = distance((0.05*((node_617*-240.0+300.0) - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0).rg,float2(0.5,0.5));
                clip((1.0 - node_2933) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
