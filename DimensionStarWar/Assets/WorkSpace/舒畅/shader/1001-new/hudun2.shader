// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33394,y:32571,varname:node_4013,prsc:2|custl-2734-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:3079,x:32400,y:32791,ptovrint:False,ptlb:saoguang tex,ptin:_saoguangtex,varname:node_3079,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:22b262f1ce84f4b4481a48fc17f89dff,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:935,x:32639,y:32621,varname:node_935,prsc:2,tex:22b262f1ce84f4b4481a48fc17f89dff,ntxv:0,isnm:False|UVIN-9376-UVOUT,TEX-3079-TEX;n:type:ShaderForge.SFN_Tex2d,id:6076,x:32639,y:32988,varname:node_6076,prsc:2,tex:22b262f1ce84f4b4481a48fc17f89dff,ntxv:0,isnm:False|UVIN-7375-UVOUT,TEX-3079-TEX;n:type:ShaderForge.SFN_TexCoord,id:6909,x:32131,y:32819,varname:node_6909,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:9376,x:32397,y:32622,varname:node_9376,prsc:2,spu:1,spv:0|UVIN-6909-UVOUT,DIST-498-A;n:type:ShaderForge.SFN_Panner,id:7375,x:32400,y:32988,varname:node_7375,prsc:2,spu:-1,spv:0|UVIN-6909-UVOUT,DIST-498-A;n:type:ShaderForge.SFN_Add,id:3592,x:33004,y:32810,varname:node_3592,prsc:2|A-3849-OUT,B-3282-OUT;n:type:ShaderForge.SFN_Tex2d,id:2897,x:32639,y:32791,ptovrint:False,ptlb:maintex,ptin:_maintex,varname:node_2897,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:93e16e47b6aa5ba4a82d46635fe2d7a0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3849,x:32842,y:32643,varname:node_3849,prsc:2|A-935-R,B-2897-R;n:type:ShaderForge.SFN_Multiply,id:3282,x:32846,y:32988,varname:node_3282,prsc:2|A-2897-R,B-6076-R;n:type:ShaderForge.SFN_VertexColor,id:498,x:32131,y:32957,varname:node_498,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2734,x:33199,y:32810,varname:node_2734,prsc:2|A-3592-OUT,B-498-RGB,C-5790-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5790,x:33004,y:32964,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_5790,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:3079-2897-5790;pass:END;sub:END;*/

Shader "Shader Forge/hudun2" {
    Properties {
        _saoguangtex ("saoguang tex", 2D) = "white" {}
        _maintex ("maintex", 2D) = "white" {}
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
            uniform sampler2D _saoguangtex; uniform float4 _saoguangtex_ST;
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
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
                float2 node_9376 = (i.uv0+i.vertexColor.a*float2(1,0));
                float4 node_935 = tex2D(_saoguangtex,TRANSFORM_TEX(node_9376, _saoguangtex));
                float4 _maintex_var = tex2D(_maintex,TRANSFORM_TEX(i.uv0, _maintex));
                float2 node_7375 = (i.uv0+i.vertexColor.a*float2(-1,0));
                float4 node_6076 = tex2D(_saoguangtex,TRANSFORM_TEX(node_7375, _saoguangtex));
                float3 finalColor = (((node_935.r*_maintex_var.r)+(_maintex_var.r*node_6076.r))*i.vertexColor.rgb*_Intensity);
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
