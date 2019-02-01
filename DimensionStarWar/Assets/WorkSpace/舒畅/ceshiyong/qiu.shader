// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-2586-RGB,clip-9456-OUT;n:type:ShaderForge.SFN_Tex2d,id:2586,x:32477,y:32680,ptovrint:False,ptlb:node_2586,ptin:_node_2586,varname:node_2586,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:01d555b5bd692104eba95d0bd7e28db4,ntxv:0,isnm:False|UVIN-8975-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2044,x:32499,y:32972,ptovrint:False,ptlb:node_2044,ptin:_node_2044,varname:node_2044,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a12a870693898be4e82d880524c9a7cf,ntxv:0,isnm:False|UVIN-8084-OUT;n:type:ShaderForge.SFN_TexCoord,id:8975,x:32269,y:32680,varname:node_8975,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:7712,x:32109,y:32972,varname:node_7712,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Step,id:5955,x:32827,y:33017,varname:node_5955,prsc:2|A-2044-R,B-7669-OUT;n:type:ShaderForge.SFN_Slider,id:7669,x:32408,y:33174,ptovrint:False,ptlb:node_7669,ptin:_node_7669,varname:node_7669,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.1,cur:0.0867184,max:1;n:type:ShaderForge.SFN_Multiply,id:8084,x:32332,y:32972,varname:node_8084,prsc:2|A-7712-UVOUT,B-156-OUT;n:type:ShaderForge.SFN_Vector2,id:156,x:32154,y:33105,varname:node_156,prsc:2,v1:4,v2:4;n:type:ShaderForge.SFN_Step,id:9614,x:32847,y:33238,varname:node_9614,prsc:2|A-2933-OUT,B-9812-OUT;n:type:ShaderForge.SFN_Slider,id:9812,x:32034,y:33338,ptovrint:False,ptlb:node_9812,ptin:_node_9812,varname:node_9812,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:9456,x:33007,y:33017,varname:node_9456,prsc:2|A-5955-OUT,B-9614-OUT;n:type:ShaderForge.SFN_Tex2d,id:3615,x:32171,y:33472,ptovrint:False,ptlb:node_3615,ptin:_node_3615,varname:node_3615,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:584f7c52b17daab49bca6cd496f4a666,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2933,x:32554,y:33247,varname:node_2933,prsc:2|A-7712-V,B-3615-R;proporder:2586-2044-7669-9812-3615;pass:END;sub:END;*/

Shader "Shader Forge/qiu" {
    Properties {
        _node_2586 ("node_2586", 2D) = "white" {}
        _node_2044 ("node_2044", 2D) = "white" {}
        _node_7669 ("node_7669", Range(-0.1, 1)) = 0.0867184
        _node_9812 ("node_9812", Range(0, 1)) = 1
        _node_3615 ("node_3615", 2D) = "white" {}
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
            uniform sampler2D _node_2586; uniform float4 _node_2586_ST;
            uniform sampler2D _node_2044; uniform float4 _node_2044_ST;
            uniform float _node_7669;
            uniform float _node_9812;
            uniform sampler2D _node_3615; uniform float4 _node_3615_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 node_8084 = (i.uv1*float2(4,4));
                float4 _node_2044_var = tex2D(_node_2044,TRANSFORM_TEX(node_8084, _node_2044));
                float4 _node_3615_var = tex2D(_node_3615,TRANSFORM_TEX(i.uv0, _node_3615));
                clip((step(_node_2044_var.r,_node_7669)*step((i.uv1.g*_node_3615_var.r),_node_9812)) - 0.5);
////// Lighting:
                float4 _node_2586_var = tex2D(_node_2586,TRANSFORM_TEX(i.uv0, _node_2586));
                float3 finalColor = _node_2586_var.rgb;
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
            uniform sampler2D _node_2044; uniform float4 _node_2044_ST;
            uniform float _node_7669;
            uniform float _node_9812;
            uniform sampler2D _node_3615; uniform float4 _node_3615_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float2 uv1 : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 node_8084 = (i.uv1*float2(4,4));
                float4 _node_2044_var = tex2D(_node_2044,TRANSFORM_TEX(node_8084, _node_2044));
                float4 _node_3615_var = tex2D(_node_3615,TRANSFORM_TEX(i.uv0, _node_3615));
                clip((step(_node_2044_var.r,_node_7669)*step((i.uv1.g*_node_3615_var.r),_node_9812)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
