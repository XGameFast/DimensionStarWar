// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33325,y:32735,varname:node_4013,prsc:2|emission-7847-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32341,y:32548,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:3343,x:32483,y:32874,ptovrint:False,ptlb:node_3343,ptin:_node_3343,varname:node_3343,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2549c32777151394ea1d2fcae8536ecf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3469,x:32341,y:32738,ptovrint:False,ptlb:node_3469,ptin:_node_3469,varname:node_3469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4bb35f3eed25cd6478f5f48927c24aec,ntxv:0,isnm:False|UVIN-25-UVOUT;n:type:ShaderForge.SFN_Step,id:1870,x:32959,y:33138,varname:node_1870,prsc:2|A-1211-R,B-266-A;n:type:ShaderForge.SFN_Multiply,id:7787,x:32635,y:32695,varname:node_7787,prsc:2|A-1304-RGB,B-3469-R,C-3469-A;n:type:ShaderForge.SFN_Tex2d,id:1211,x:32568,y:33132,ptovrint:False,ptlb:node_1211,ptin:_node_1211,varname:node_1211,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0059cb7c980cd614ca3d3371cf4f9a7c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7847,x:33101,y:32910,varname:node_7847,prsc:2|A-2146-OUT,B-1870-OUT,C-266-RGB;n:type:ShaderForge.SFN_Rotator,id:25,x:32162,y:32738,varname:node_25,prsc:2|UVIN-4713-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4713,x:31984,y:32738,varname:node_4713,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:2146,x:32867,y:32709,varname:node_2146,prsc:2|A-7787-OUT,B-4740-OUT;n:type:ShaderForge.SFN_VertexColor,id:266,x:32441,y:33346,varname:node_266,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4740,x:32728,y:32903,varname:node_4740,prsc:2|A-3343-RGB,B-3960-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3960,x:32437,y:33057,ptovrint:False,ptlb:yuanpanliangdu,ptin:_yuanpanliangdu,varname:node_3960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1304-3343-1211-3469-3960;pass:END;sub:END;*/

Shader "Shader Forge/diancipaorongjie" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _node_3343 ("node_3343", 2D) = "white" {}
        _node_1211 ("node_1211", 2D) = "white" {}
        _node_3469 ("node_3469", 2D) = "white" {}
        _yuanpanliangdu ("yuanpanliangdu", Float ) = 1
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
            uniform float4 _Color;
            uniform sampler2D _node_3343; uniform float4 _node_3343_ST;
            uniform sampler2D _node_3469; uniform float4 _node_3469_ST;
            uniform sampler2D _node_1211; uniform float4 _node_1211_ST;
            uniform float _yuanpanliangdu;
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
                float4 node_4367 = _Time;
                float node_25_ang = node_4367.g;
                float node_25_spd = 1.0;
                float node_25_cos = cos(node_25_spd*node_25_ang);
                float node_25_sin = sin(node_25_spd*node_25_ang);
                float2 node_25_piv = float2(0.5,0.5);
                float2 node_25 = (mul(i.uv0-node_25_piv,float2x2( node_25_cos, -node_25_sin, node_25_sin, node_25_cos))+node_25_piv);
                float4 _node_3469_var = tex2D(_node_3469,TRANSFORM_TEX(node_25, _node_3469));
                float4 _node_3343_var = tex2D(_node_3343,TRANSFORM_TEX(i.uv0, _node_3343));
                float4 _node_1211_var = tex2D(_node_1211,TRANSFORM_TEX(i.uv0, _node_1211));
                float3 emissive = (((_Color.rgb*_node_3469_var.r*_node_3469_var.a)+(_node_3343_var.rgb*_yuanpanliangdu))*step(_node_1211_var.r,i.vertexColor.a)*i.vertexColor.rgb);
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
