// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-6624-OUT;n:type:ShaderForge.SFN_Tex2d,id:9273,x:32257,y:32967,ptovrint:False,ptlb:node_9273,ptin:_node_9273,varname:node_9273,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-6085-UVOUT;n:type:ShaderForge.SFN_Panner,id:6085,x:32101,y:32967,varname:node_6085,prsc:2,spu:-2,spv:0|UVIN-9738-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9738,x:31869,y:32967,varname:node_9738,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_OneMinus,id:9749,x:32159,y:32681,varname:node_9749,prsc:2|IN-9738-U;n:type:ShaderForge.SFN_OneMinus,id:9248,x:32159,y:32809,varname:node_9248,prsc:2|IN-9738-V;n:type:ShaderForge.SFN_Multiply,id:8447,x:32414,y:32727,varname:node_8447,prsc:2|A-9749-OUT,B-9248-OUT,C-9738-U,D-9738-V,E-6064-OUT;n:type:ShaderForge.SFN_Power,id:585,x:32589,y:32727,varname:node_585,prsc:2|VAL-8447-OUT,EXP-7528-OUT;n:type:ShaderForge.SFN_Vector1,id:7528,x:32439,y:32864,varname:node_7528,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6064,x:32285,y:32864,varname:node_6064,prsc:2,v1:15;n:type:ShaderForge.SFN_Multiply,id:6624,x:32816,y:32913,varname:node_6624,prsc:2|A-585-OUT,B-3778-OUT,C-3465-OUT,D-6606-RGB,E-6606-A;n:type:ShaderForge.SFN_ValueProperty,id:3465,x:32606,y:33035,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_3465,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:6606,x:32606,y:33099,varname:node_6606,prsc:2;n:type:ShaderForge.SFN_Power,id:3778,x:32458,y:32967,varname:node_3778,prsc:2|VAL-9273-B,EXP-2925-OUT;n:type:ShaderForge.SFN_Vector1,id:2925,x:32257,y:33137,varname:node_2925,prsc:2,v1:2;proporder:9273-3465;pass:END;sub:END;*/

Shader "Shader Forge/liudong" {
    Properties {
        _node_9273 ("node_9273", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
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
            Blend One One
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
            uniform sampler2D _node_9273; uniform float4 _node_9273_ST;
            uniform float _Intensity;
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
                float4 node_6986 = _Time;
                float2 node_6085 = (i.uv0+node_6986.g*float2(-2,0));
                float4 _node_9273_var = tex2D(_node_9273,TRANSFORM_TEX(node_6085, _node_9273));
                float3 finalColor = (pow(((1.0 - i.uv0.r)*(1.0 - i.uv0.g)*i.uv0.r*i.uv0.g*15.0),1.0)*pow(_node_9273_var.b,2.0)*_Intensity*i.vertexColor.rgb*i.vertexColor.a);
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
