// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33124,y:32565,varname:node_9361,prsc:2|custl-4747-OUT,clip-1571-OUT;n:type:ShaderForge.SFN_Fresnel,id:8315,x:32240,y:32602,varname:node_8315,prsc:2|EXP-5772-OUT;n:type:ShaderForge.SFN_Vector1,id:5772,x:31990,y:32617,varname:node_5772,prsc:2,v1:1;n:type:ShaderForge.SFN_Color,id:6700,x:32432,y:32846,ptovrint:False,ptlb:node_6700,ptin:_node_6700,varname:node_6700,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.06325693,c2:0.2910302,c3:0.9558824,c4:1;n:type:ShaderForge.SFN_Add,id:4747,x:32668,y:32780,varname:node_4747,prsc:2|A-7519-OUT,B-6700-RGB;n:type:ShaderForge.SFN_Multiply,id:7519,x:32503,y:32641,varname:node_7519,prsc:2|A-8315-OUT,B-5277-RGB;n:type:ShaderForge.SFN_Color,id:5277,x:32240,y:32759,ptovrint:False,ptlb:node_5277,ptin:_node_5277,varname:node_5277,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.751724,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:7276,x:32366,y:33017,ptovrint:False,ptlb:dissolve,ptin:_dissolve,varname:node_7276,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Step,id:1571,x:32709,y:32977,varname:node_1571,prsc:2|A-7039-R,B-7276-OUT;n:type:ShaderForge.SFN_Tex2d,id:7039,x:32481,y:33128,ptovrint:False,ptlb:dissolvetex,ptin:_dissolvetex,varname:node_7039,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:959b620c5db1bbe458a611ce4276d3a4,ntxv:0,isnm:False;proporder:6700-5277-7276-7039;pass:END;sub:END;*/

Shader "Shader Forge/kuoloutu" {
    Properties {
        _node_6700 ("node_6700", Color) = (0.06325693,0.2910302,0.9558824,1)
        _node_5277 ("node_5277", Color) = (0,0.751724,1,1)
        _dissolve ("dissolve", Range(0, 1)) = 1
        _dissolvetex ("dissolvetex", 2D) = "white" {}
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
            uniform float4 _node_6700;
            uniform float4 _node_5277;
            uniform float _dissolve;
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
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
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                clip(step(_dissolvetex_var.r,_dissolve) - 0.5);
////// Lighting:
                float3 node_4747 = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0)*_node_5277.rgb)+_node_6700.rgb);
                float3 finalColor = node_4747;
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
            uniform float _dissolve;
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
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
            float4 frag(VertexOutput i) : COLOR {
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                clip(step(_dissolvetex_var.r,_dissolve) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
