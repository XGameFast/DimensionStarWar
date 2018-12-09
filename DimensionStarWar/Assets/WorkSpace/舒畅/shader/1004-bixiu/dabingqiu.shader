// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33622,y:32727,varname:node_4013,prsc:2|custl-5623-OUT,alpha-8922-OUT,voffset-1435-OUT;n:type:ShaderForge.SFN_Multiply,id:1435,x:33236,y:33129,varname:node_1435,prsc:2|A-7711-R,B-9779-OUT,C-7210-OUT;n:type:ShaderForge.SFN_Tex2d,id:7711,x:32462,y:33089,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_7711,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:959b620c5db1bbe458a611ce4276d3a4,ntxv:0,isnm:False|UVIN-3679-UVOUT;n:type:ShaderForge.SFN_Panner,id:3679,x:32284,y:33089,varname:node_3679,prsc:2,spu:0.3,spv:0.5|UVIN-9076-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9076,x:32104,y:33089,varname:node_9076,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:9779,x:32772,y:33345,ptovrint:False,ptlb:qifudu,ptin:_qifudu,varname:node_9779,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.03369141,max:1;n:type:ShaderForge.SFN_Power,id:2522,x:32720,y:33083,varname:node_2522,prsc:2|VAL-7711-R,EXP-862-OUT;n:type:ShaderForge.SFN_Vector1,id:862,x:32479,y:33272,varname:node_862,prsc:2,v1:6;n:type:ShaderForge.SFN_Tex2d,id:5650,x:32469,y:32470,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5650,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f34e4e9b24534d04ab6ccf037bb07d6e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5159,x:32688,y:32808,varname:node_5159,prsc:2|A-8833-RGB,B-2522-OUT;n:type:ShaderForge.SFN_Color,id:8833,x:32436,y:32664,ptovrint:False,ptlb:liuwencolor,ptin:_liuwencolor,varname:node_8833,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5661765,c2:0.9679153,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:5623,x:33194,y:32745,varname:node_5623,prsc:2|A-7365-OUT,B-5159-OUT,C-2919-OUT;n:type:ShaderForge.SFN_NormalVector,id:7210,x:32959,y:33448,prsc:2,pt:False;n:type:ShaderForge.SFN_Power,id:7365,x:32769,y:32474,varname:node_7365,prsc:2|VAL-5650-RGB,EXP-7609-OUT;n:type:ShaderForge.SFN_Vector1,id:7609,x:32490,y:32384,varname:node_7609,prsc:2,v1:2;n:type:ShaderForge.SFN_Fresnel,id:2919,x:32902,y:32333,varname:node_2919,prsc:2|EXP-2686-OUT;n:type:ShaderForge.SFN_Vector1,id:2686,x:32744,y:32301,varname:node_2686,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:8922,x:33194,y:32910,varname:node_8922,prsc:2|A-2919-OUT,B-5650-B;proporder:7711-9779-5650-8833;pass:END;sub:END;*/

Shader "Shader Forge/dabingqiu" {
    Properties {
        _mask ("mask", 2D) = "white" {}
        _qifudu ("qifudu", Range(0, 1)) = 0.03369141
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_liuwencolor ("liuwencolor", Color) = (0.5661765,0.9679153,1,1)
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
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _qifudu;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _liuwencolor;
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
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_7818 = _Time;
                float2 node_3679 = (o.uv0+node_7818.g*float2(0.3,0.5));
                float4 _mask_var = tex2Dlod(_mask,float4(TRANSFORM_TEX(node_3679, _mask),0.0,0));
                v.vertex.xyz += (_mask_var.r*_qifudu*v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_7818 = _Time;
                float2 node_3679 = (i.uv0+node_7818.g*float2(0.3,0.5));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_3679, _mask));
                float node_2919 = pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0);
                float3 finalColor = (pow(_MainTex_var.rgb,2.0)+(_liuwencolor.rgb*pow(_mask_var.r,6.0))+node_2919);
                fixed4 finalRGBA = fixed4(finalColor,(node_2919+_MainTex_var.b));
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
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _qifudu;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_5262 = _Time;
                float2 node_3679 = (o.uv0+node_5262.g*float2(0.3,0.5));
                float4 _mask_var = tex2Dlod(_mask,float4(TRANSFORM_TEX(node_3679, _mask),0.0,0));
                v.vertex.xyz += (_mask_var.r*_qifudu*v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
