// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33418,y:32690,varname:node_4013,prsc:2|emission-2634-OUT,clip-5028-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32538,y:32385,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5651116,c3:0.0147059,c4:1;n:type:ShaderForge.SFN_Tex2d,id:3058,x:32060,y:33030,ptovrint:False,ptlb:node_3058,ptin:_node_3058,varname:node_3058,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:627c197522a23124f9ad524d03f3229f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:2510,x:32827,y:32865,varname:node_2510,prsc:2|A-8860-OUT,B-3058-R;n:type:ShaderForge.SFN_Step,id:5028,x:32840,y:33218,varname:node_5028,prsc:2|A-7672-OUT,B-4360-OUT;n:type:ShaderForge.SFN_Multiply,id:8860,x:32607,y:32954,varname:node_8860,prsc:2|A-7088-A,B-6744-OUT;n:type:ShaderForge.SFN_Vector1,id:6744,x:32424,y:32998,varname:node_6744,prsc:2,v1:0.9;n:type:ShaderForge.SFN_Divide,id:4360,x:32566,y:33181,varname:node_4360,prsc:2|A-7088-A,B-3824-OUT;n:type:ShaderForge.SFN_Vector1,id:3824,x:32398,y:33202,varname:node_3824,prsc:2,v1:0.6;n:type:ShaderForge.SFN_Add,id:7672,x:32398,y:33287,varname:node_7672,prsc:2|A-3058-R,B-1587-OUT;n:type:ShaderForge.SFN_Vector1,id:1587,x:32202,y:33307,varname:node_1587,prsc:2,v1:-0.38;n:type:ShaderForge.SFN_Multiply,id:683,x:32757,y:32495,varname:node_683,prsc:2|A-1304-RGB,B-7088-A,C-4839-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4839,x:32509,y:32618,ptovrint:False,ptlb:node_4839,ptin:_node_4839,varname:node_4839,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Lerp,id:2634,x:33086,y:32522,varname:node_2634,prsc:2|A-3762-RGB,B-683-OUT,T-2510-OUT;n:type:ShaderForge.SFN_Color,id:3762,x:32788,y:32211,ptovrint:False,ptlb:node_3762,ptin:_node_3762,varname:node_3762,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_VertexColor,id:7088,x:32076,y:32571,varname:node_7088,prsc:2;proporder:1304-3058-4839-3762;pass:END;sub:END;*/

Shader "Shader Forge/rongjieyan" {
    Properties {
        _Color ("Color", Color) = (1,0.5651116,0.0147059,1)
        _node_3058 ("node_3058", 2D) = "white" {}
        _node_4839 ("node_4839", Float ) = 1
        _node_3762 ("node_3762", Color) = (0,0,0,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _node_3058; uniform float4 _node_3058_ST;
            uniform float _node_4839;
            uniform float4 _node_3762;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_3058_var = tex2D(_node_3058,TRANSFORM_TEX(i.uv0, _node_3058));
                clip(step((_node_3058_var.r+(-0.38)),(i.vertexColor.a/0.6)) - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = lerp(_node_3762.rgb,(_Color.rgb*i.vertexColor.a*_node_4839),step((i.vertexColor.a*0.9),_node_3058_var.r));
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
            uniform sampler2D _node_3058; uniform float4 _node_3058_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_3058_var = tex2D(_node_3058,TRANSFORM_TEX(i.uv0, _node_3058));
                clip(step((_node_3058_var.r+(-0.38)),(i.vertexColor.a/0.6)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
