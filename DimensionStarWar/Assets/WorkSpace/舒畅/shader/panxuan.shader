// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33290,y:32698,varname:node_4013,prsc:2|emission-2702-OUT;n:type:ShaderForge.SFN_Tex2d,id:7942,x:32369,y:32921,ptovrint:False,ptlb:node_7942,ptin:_node_7942,varname:node_7942,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:602b621dadc2e1f49b0300459962908f,ntxv:0,isnm:False|UVIN-1812-UVOUT;n:type:ShaderForge.SFN_Panner,id:1812,x:32183,y:32928,varname:node_1812,prsc:2,spu:1,spv:0|UVIN-8757-UVOUT,DIST-9655-OUT;n:type:ShaderForge.SFN_TexCoord,id:8757,x:31926,y:32919,varname:node_8757,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:411,x:32438,y:33303,varname:node_411,prsc:2|A-8757-U,B-4007-OUT,C-5284-OUT;n:type:ShaderForge.SFN_OneMinus,id:4007,x:32142,y:33381,varname:node_4007,prsc:2|IN-8757-U;n:type:ShaderForge.SFN_Multiply,id:2702,x:32765,y:33069,varname:node_2702,prsc:2|A-7942-RGB,B-411-OUT,C-8314-RGB,D-8716-OUT;n:type:ShaderForge.SFN_VertexColor,id:8314,x:31585,y:33242,varname:node_8314,prsc:2;n:type:ShaderForge.SFN_Add,id:19,x:31725,y:33371,varname:node_19,prsc:2|A-8314-A,B-2402-OUT;n:type:ShaderForge.SFN_Vector1,id:2402,x:31550,y:33403,varname:node_2402,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_Multiply,id:9655,x:31955,y:33333,varname:node_9655,prsc:2|A-19-OUT,B-5930-OUT;n:type:ShaderForge.SFN_Vector1,id:5930,x:31759,y:33542,varname:node_5930,prsc:2,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:8716,x:32588,y:33287,ptovrint:False,ptlb:zongqiang,ptin:_zongqiang,varname:node_8716,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:5284,x:32275,y:33431,varname:node_5284,prsc:2,v1:2;proporder:7942-8716;pass:END;sub:END;*/

Shader "Shader Forge/panxuan" {
    Properties {
        _node_7942 ("node_7942", 2D) = "white" {}
        _zongqiang ("zongqiang", Float ) = 1
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
            uniform sampler2D _node_7942; uniform float4 _node_7942_ST;
            uniform float _zongqiang;
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
////// Emissive:
                float2 node_1812 = (i.uv0+((i.vertexColor.a+(-0.5))*2.0)*float2(1,0));
                float4 _node_7942_var = tex2D(_node_7942,TRANSFORM_TEX(node_1812, _node_7942));
                float3 emissive = (_node_7942_var.rgb*(i.uv0.r*(1.0 - i.uv0.r)*2.0)*i.vertexColor.rgb*_zongqiang);
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
