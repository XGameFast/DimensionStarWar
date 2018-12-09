// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33275,y:32740,varname:node_9361,prsc:2|custl-5840-RGB,alpha-3564-OUT;n:type:ShaderForge.SFN_Panner,id:9907,x:32166,y:32837,varname:node_9907,prsc:2,spu:-0.03,spv:-0.5|UVIN-7664-OUT;n:type:ShaderForge.SFN_TexCoord,id:3552,x:31768,y:32838,varname:node_3552,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:2416,x:32120,y:32601,ptovrint:False,ptlb:node_2416,ptin:_node_2416,varname:node_2416,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6114,x:32447,y:32660,varname:node_6114,prsc:2,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False|UVIN-9907-UVOUT,TEX-2416-TEX;n:type:ShaderForge.SFN_Tex2d,id:617,x:32443,y:33121,varname:node_617,prsc:2,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False|UVIN-3644-UVOUT,TEX-2416-TEX;n:type:ShaderForge.SFN_Panner,id:3644,x:32164,y:33119,varname:node_3644,prsc:2,spu:0.05,spv:-0.3|UVIN-7664-OUT;n:type:ShaderForge.SFN_Multiply,id:7664,x:31997,y:32859,varname:node_7664,prsc:2|A-3552-UVOUT,B-5718-OUT;n:type:ShaderForge.SFN_Vector2,id:5718,x:31755,y:33002,varname:node_5718,prsc:2,v1:1,v2:2;n:type:ShaderForge.SFN_Step,id:633,x:32764,y:33040,varname:node_633,prsc:2|A-6114-R,B-617-R;n:type:ShaderForge.SFN_Color,id:5840,x:32787,y:32685,ptovrint:False,ptlb:color,ptin:_color,varname:node_5840,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9191176,c2:0.9933063,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3564,x:33093,y:33008,varname:node_3564,prsc:2|A-633-OUT,B-3783-A;n:type:ShaderForge.SFN_VertexColor,id:3783,x:32755,y:33224,varname:node_3783,prsc:2;proporder:2416-5840;pass:END;sub:END;*/

Shader "Shader Forge/kuosanbowen" {
    Properties {
        _node_2416 ("node_2416", 2D) = "white" {}
        _color ("color", Color) = (0.9191176,0.9933063,1,1)
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
            Cull Off
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
            uniform sampler2D _node_2416; uniform float4 _node_2416_ST;
            uniform float4 _color;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float3 finalColor = _color.rgb;
                float4 node_5065 = _Time;
                float2 node_7664 = (i.uv0*float2(1,2));
                float2 node_9907 = (node_7664+node_5065.g*float2(-0.03,-0.5));
                float4 node_6114 = tex2D(_node_2416,TRANSFORM_TEX(node_9907, _node_2416));
                float2 node_3644 = (node_7664+node_5065.g*float2(0.05,-0.3));
                float4 node_617 = tex2D(_node_2416,TRANSFORM_TEX(node_3644, _node_2416));
                fixed4 finalRGBA = fixed4(finalColor,(step(node_6114.r,node_617.r)*i.vertexColor.a));
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
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
