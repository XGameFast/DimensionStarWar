// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34393,y:32676,varname:node_4013,prsc:2|emission-950-OUT,alpha-9360-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32925,y:32633,ptovrint:False,ptlb:bianse,ptin:_bianse,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3970588,c2:0.6507099,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6633,x:32828,y:32817,ptovrint:False,ptlb:node_6633,ptin:_node_6633,varname:node_6633,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0e54ee3595ac28a4a82637ce25d86a34,ntxv:0,isnm:False|UVIN-1614-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4805,x:32316,y:32807,varname:node_4805,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6834,x:32509,y:32817,varname:node_6834,prsc:2|A-4805-UVOUT,B-1863-OUT;n:type:ShaderForge.SFN_Vector2,id:1863,x:32306,y:32949,varname:node_1863,prsc:2,v1:3,v2:1;n:type:ShaderForge.SFN_Panner,id:1614,x:32671,y:32817,varname:node_1614,prsc:2,spu:0.2,spv:0|UVIN-6834-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9871,x:32201,y:33145,ptovrint:False,ptlb:node_9871,ptin:_node_9871,varname:node_9871,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:169,x:32901,y:33138,varname:node_169,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-6926-UVOUT,TEX-9871-TEX;n:type:ShaderForge.SFN_Tex2d,id:8762,x:32901,y:33359,varname:node_8762,prsc:2,tex:fa3668ccc5fd83c4da015569ee6d940e,ntxv:0,isnm:False|UVIN-4290-UVOUT,TEX-9871-TEX;n:type:ShaderForge.SFN_Panner,id:6926,x:32729,y:33138,varname:node_6926,prsc:2,spu:0.3,spv:0.1|UVIN-6810-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6810,x:32504,y:33138,varname:node_6810,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Add,id:4708,x:33843,y:33000,varname:node_4708,prsc:2|A-6633-R,B-169-R,C-8762-R,D-5207-R,E-5207-B;n:type:ShaderForge.SFN_Panner,id:4290,x:32729,y:33359,varname:node_4290,prsc:2,spu:-0.2,spv:-0.2|UVIN-6810-UVOUT;n:type:ShaderForge.SFN_Add,id:2864,x:33485,y:33287,varname:node_2864,prsc:2|A-9197-OUT,B-6810-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5207,x:33581,y:32723,ptovrint:False,ptlb:node_5207,ptin:_node_5207,varname:node_5207,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:16293a7e0ee325f4d9527036319b55c7,ntxv:0,isnm:False|UVIN-9459-UVOUT;n:type:ShaderForge.SFN_Rotator,id:9459,x:33426,y:32723,varname:node_9459,prsc:2|UVIN-2864-OUT,SPD-3193-OUT;n:type:ShaderForge.SFN_Add,id:950,x:34076,y:32745,varname:node_950,prsc:2|A-3070-OUT,B-5674-OUT;n:type:ShaderForge.SFN_Multiply,id:5674,x:33132,y:32665,varname:node_5674,prsc:2|A-1304-RGB,B-6633-R;n:type:ShaderForge.SFN_Multiply,id:3070,x:33867,y:32668,varname:node_3070,prsc:2|A-5784-OUT,B-5207-RGB;n:type:ShaderForge.SFN_ValueProperty,id:5784,x:33548,y:32606,ptovrint:False,ptlb:caise,ptin:_caise,varname:node_5784,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:9197,x:33125,y:33211,varname:node_9197,prsc:2|A-169-R,B-8762-R,C-5479-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5479,x:33037,y:33463,ptovrint:False,ptlb:niuqu,ptin:_niuqu,varname:node_5479,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:3193,x:33303,y:32893,varname:node_3193,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_VertexColor,id:7063,x:33843,y:33235,varname:node_7063,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9360,x:34063,y:33032,varname:node_9360,prsc:2|A-4708-OUT,B-7063-A;proporder:1304-6633-9871-5207-5784-5479;pass:END;sub:END;*/

Shader "Shader Forge/renyimenmian" {
    Properties {
        [HDR]_bianse ("bianse", Color) = (0.3970588,0.6507099,1,1)
        _node_6633 ("node_6633", 2D) = "white" {}
        _node_9871 ("node_9871", 2D) = "white" {}
        _node_5207 ("node_5207", 2D) = "white" {}
        _caise ("caise", Float ) = 1
        _niuqu ("niuqu", Float ) = 0.5
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
            uniform float4 _bianse;
            uniform sampler2D _node_6633; uniform float4 _node_6633_ST;
            uniform sampler2D _node_9871; uniform float4 _node_9871_ST;
            uniform sampler2D _node_5207; uniform float4 _node_5207_ST;
            uniform float _caise;
            uniform float _niuqu;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
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
                float4 node_2539 = _Time;
                float node_9459_ang = node_2539.g;
                float node_9459_spd = (-0.5);
                float node_9459_cos = cos(node_9459_spd*node_9459_ang);
                float node_9459_sin = sin(node_9459_spd*node_9459_ang);
                float2 node_9459_piv = float2(0.5,0.5);
                float2 node_6926 = (i.uv1+node_2539.g*float2(0.3,0.1));
                float4 node_169 = tex2D(_node_9871,TRANSFORM_TEX(node_6926, _node_9871));
                float2 node_4290 = (i.uv1+node_2539.g*float2(-0.2,-0.2));
                float4 node_8762 = tex2D(_node_9871,TRANSFORM_TEX(node_4290, _node_9871));
                float2 node_9459 = (mul(((node_169.r*node_8762.r*_niuqu)+i.uv1)-node_9459_piv,float2x2( node_9459_cos, -node_9459_sin, node_9459_sin, node_9459_cos))+node_9459_piv);
                float4 _node_5207_var = tex2D(_node_5207,TRANSFORM_TEX(node_9459, _node_5207));
                float2 node_1614 = ((i.uv0*float2(3,1))+node_2539.g*float2(0.2,0));
                float4 _node_6633_var = tex2D(_node_6633,TRANSFORM_TEX(node_1614, _node_6633));
                float3 emissive = ((_caise*_node_5207_var.rgb)+(_bianse.rgb*_node_6633_var.r));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((_node_6633_var.r+node_169.r+node_8762.r+_node_5207_var.r+_node_5207_var.b)*i.vertexColor.a));
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
