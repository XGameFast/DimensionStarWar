// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33305,y:32726,varname:node_9361,prsc:2|custl-7003-OUT,alpha-7727-OUT;n:type:ShaderForge.SFN_Tex2d,id:1039,x:32575,y:32805,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1039,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1efb15cfdc087fc4185601ce1c5ba9dc,ntxv:0,isnm:False|UVIN-425-OUT;n:type:ShaderForge.SFN_TexCoord,id:2287,x:32360,y:33027,varname:node_2287,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:7727,x:32957,y:33026,varname:node_7727,prsc:2|A-1039-R,B-7895-OUT,C-5985-A;n:type:ShaderForge.SFN_Step,id:7895,x:32718,y:33098,varname:node_7895,prsc:2|A-2287-U,B-5985-A;n:type:ShaderForge.SFN_VertexColor,id:5985,x:32453,y:33349,varname:node_5985,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7003,x:32893,y:32833,varname:node_7003,prsc:2|A-1039-R,B-5985-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:350,x:31714,y:32853,ptovrint:False,ptlb:node_350,ptin:_node_350,varname:node_350,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6021,x:32087,y:32759,varname:node_6021,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-8073-UVOUT,TEX-350-TEX;n:type:ShaderForge.SFN_Tex2d,id:6710,x:32087,y:32947,varname:node_6710,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-1479-UVOUT,TEX-350-TEX;n:type:ShaderForge.SFN_TexCoord,id:532,x:31569,y:32853,varname:node_532,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:8073,x:31908,y:32759,varname:node_8073,prsc:2,spu:0.2,spv:0.3|UVIN-532-UVOUT;n:type:ShaderForge.SFN_Panner,id:1479,x:31908,y:32947,varname:node_1479,prsc:2,spu:-0.35,spv:-0.25|UVIN-532-UVOUT;n:type:ShaderForge.SFN_Multiply,id:347,x:32254,y:32822,varname:node_347,prsc:2|A-6021-R,B-6710-R,C-3295-OUT;n:type:ShaderForge.SFN_Add,id:425,x:32409,y:32822,varname:node_425,prsc:2|A-347-OUT,B-2287-UVOUT;n:type:ShaderForge.SFN_Vector1,id:3295,x:32072,y:32886,varname:node_3295,prsc:2,v1:0.1;proporder:1039-350;pass:END;sub:END;*/

Shader "Shader Forge/benghuai" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _node_350 ("node_350", 2D) = "white" {}
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _node_350; uniform float4 _node_350_ST;
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
                float4 node_4294 = _Time;
                float2 node_8073 = (i.uv0+node_4294.g*float2(0.2,0.3));
                float4 node_6021 = tex2D(_node_350,TRANSFORM_TEX(node_8073, _node_350));
                float2 node_1479 = (i.uv0+node_4294.g*float2(-0.35,-0.25));
                float4 node_6710 = tex2D(_node_350,TRANSFORM_TEX(node_1479, _node_350));
                float2 node_425 = ((node_6021.r*node_6710.r*0.1)+i.uv0);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_425, _MainTex));
                float3 finalColor = (_MainTex_var.r*i.vertexColor.rgb);
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.r*step(i.uv0.r,i.vertexColor.a)*i.vertexColor.a));
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
