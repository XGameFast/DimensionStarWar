// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33853,y:32731,varname:node_4013,prsc:2|custl-7128-OUT,alpha-5942-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:33043,y:32503,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.06617647,c2:0.4976674,c3:1,c4:1;n:type:ShaderForge.SFN_Panner,id:1005,x:32843,y:32993,varname:node_1005,prsc:2,spu:-1,spv:0|UVIN-2334-UVOUT,DIST-3604-OUT;n:type:ShaderForge.SFN_TexCoord,id:2334,x:32650,y:32993,varname:node_2334,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:3604,x:32584,y:33217,ptovrint:False,ptlb:kongzhi,ptin:_kongzhi,varname:node_3604,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:5942,x:33339,y:32985,varname:node_5942,prsc:2|A-3412-R,B-5482-R;n:type:ShaderForge.SFN_Multiply,id:7128,x:33456,y:32697,varname:node_7128,prsc:2|A-1304-RGB,B-5942-OUT;n:type:ShaderForge.SFN_Tex2d,id:3412,x:33027,y:32715,ptovrint:False,ptlb:node_3412,ptin:_node_3412,varname:node_3412,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:88f5b0cffb83d464a9c9511515ad5884,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5482,x:33057,y:33169,ptovrint:False,ptlb:node_5482,ptin:_node_5482,varname:node_5482,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b44785bd56eade34c934432331eedfee,ntxv:0,isnm:False|UVIN-1005-UVOUT;proporder:1304-3604-3412-5482;pass:END;sub:END;*/

Shader "Shader Forge/sayhello2" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.06617647,0.4976674,1,1)
        _kongzhi ("kongzhi", Range(-1, 1)) = 1
        _node_3412 ("node_3412", 2D) = "white" {}
        _node_5482 ("node_5482", 2D) = "white" {}
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
            uniform float4 _Color;
            uniform float _kongzhi;
            uniform sampler2D _node_3412; uniform float4 _node_3412_ST;
            uniform sampler2D _node_5482; uniform float4 _node_5482_ST;
            struct VertexInput {
                float4 vertex : POSITION;
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
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 _node_3412_var = tex2D(_node_3412,TRANSFORM_TEX(i.uv0, _node_3412));
                float2 node_1005 = (i.uv0+_kongzhi*float2(-1,0));
                float4 _node_5482_var = tex2D(_node_5482,TRANSFORM_TEX(node_1005, _node_5482));
                float node_5942 = (_node_3412_var.r*_node_5482_var.r);
                float3 finalColor = (_Color.rgb*node_5942);
                fixed4 finalRGBA = fixed4(finalColor,node_5942);
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
