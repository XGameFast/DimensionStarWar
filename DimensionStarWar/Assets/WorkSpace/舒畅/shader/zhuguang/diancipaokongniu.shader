// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:1,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33673,y:32805,varname:node_4013,prsc:2|alpha-460-OUT,refract-8771-OUT;n:type:ShaderForge.SFN_Panner,id:8114,x:32282,y:33016,varname:node_8114,prsc:2,spu:0.1,spv:3|UVIN-7945-UVOUT;n:type:ShaderForge.SFN_Panner,id:2632,x:32282,y:33274,varname:node_2632,prsc:2,spu:-0.2,spv:4|UVIN-7945-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8110,x:32510,y:33274,ptovrint:False,ptlb:node_8110,ptin:_node_8110,varname:node_8110,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2632-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:81,x:32514,y:33016,ptovrint:False,ptlb:node_81,ptin:_node_81,varname:node_81,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False|UVIN-8114-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7945,x:31996,y:33119,varname:node_7945,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8718,x:32829,y:33145,varname:node_8718,prsc:2|A-81-R,B-8110-R;n:type:ShaderForge.SFN_Vector1,id:2783,x:32991,y:32874,varname:node_2783,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:2467,x:33051,y:33245,varname:node_2467,prsc:2|A-8718-OUT,B-4954-OUT;n:type:ShaderForge.SFN_Vector2,id:4954,x:32806,y:33395,varname:node_4954,prsc:2,v1:0.1691176,v2:0.1691176;n:type:ShaderForge.SFN_VertexColor,id:7730,x:33051,y:33417,varname:node_7730,prsc:2;n:type:ShaderForge.SFN_Multiply,id:460,x:33155,y:32968,varname:node_460,prsc:2|A-2783-OUT,B-7945-V;n:type:ShaderForge.SFN_Multiply,id:8771,x:33273,y:33300,varname:node_8771,prsc:2|A-2467-OUT,B-7730-A;proporder:8110-81;pass:END;sub:END;*/

Shader "Shader Forge/diancipaozhuti" {
    Properties {
        _node_8110 ("node_8110", 2D) = "white" {}
        _node_81 ("node_81", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Front
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
            uniform sampler2D _GrabTexture;
            uniform sampler2D _node_8110; uniform float4 _node_8110_ST;
            uniform sampler2D _node_81; uniform float4 _node_81_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 node_8442 = _Time;
                float2 node_8114 = (i.uv0+node_8442.g*float2(0.1,3));
                float4 _node_81_var = tex2D(_node_81,TRANSFORM_TEX(node_8114, _node_81));
                float2 node_2632 = (i.uv0+node_8442.g*float2(-0.2,4));
                float4 _node_8110_var = tex2D(_node_8110,TRANSFORM_TEX(node_2632, _node_8110));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (((_node_81_var.r*_node_8110_var.r)*float2(0.1691176,0.1691176))*i.vertexColor.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(0.0*i.uv0.g)),1);
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
            Cull Front
            
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
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
