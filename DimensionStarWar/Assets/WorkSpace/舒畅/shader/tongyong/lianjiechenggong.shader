// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33485,y:32675,varname:node_9361,prsc:2|custl-6124-OUT,alpha-4700-OUT;n:type:ShaderForge.SFN_Tex2d,id:1435,x:32439,y:33110,ptovrint:False,ptlb:node_1435,ptin:_node_1435,varname:node_1435,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:abd694e8aedecca4f99099e74f4d2426,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:6369,x:32978,y:32906,varname:node_6369,prsc:2|A-8280-B,B-2950-OUT;n:type:ShaderForge.SFN_Rotator,id:7872,x:32451,y:32910,varname:node_7872,prsc:2|UVIN-54-UVOUT,SPD-9173-OUT;n:type:ShaderForge.SFN_TexCoord,id:54,x:32059,y:32898,varname:node_54,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:7873,x:32220,y:32678,ptovrint:False,ptlb:suihuan,ptin:_suihuan,varname:node_7873,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fbacdf0a829e79242b4d5ccd0ce27ba8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8280,x:32658,y:32859,varname:node_8280,prsc:2,tex:fbacdf0a829e79242b4d5ccd0ce27ba8,ntxv:0,isnm:False|UVIN-7872-UVOUT,TEX-7873-TEX;n:type:ShaderForge.SFN_Tex2d,id:7366,x:32673,y:32633,varname:node_7366,prsc:2,tex:fbacdf0a829e79242b4d5ccd0ce27ba8,ntxv:0,isnm:False|UVIN-7634-UVOUT,TEX-7873-TEX;n:type:ShaderForge.SFN_Multiply,id:794,x:32866,y:32633,varname:node_794,prsc:2|A-7366-RGB,B-2181-OUT;n:type:ShaderForge.SFN_Rotator,id:7634,x:32453,y:32462,varname:node_7634,prsc:2|UVIN-4358-UVOUT,SPD-3956-OUT;n:type:ShaderForge.SFN_TexCoord,id:4358,x:32220,y:32452,varname:node_4358,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:3956,x:32273,y:32596,varname:node_3956,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_Vector3,id:2181,x:32677,y:32445,varname:node_2181,prsc:2,v1:0.5,v2:0.5,v3:0.8;n:type:ShaderForge.SFN_Add,id:8230,x:33107,y:32749,varname:node_8230,prsc:2|A-794-OUT,B-8280-RGB,C-932-OUT;n:type:ShaderForge.SFN_Multiply,id:932,x:32947,y:33187,varname:node_932,prsc:2|A-1435-R,B-6172-RGB;n:type:ShaderForge.SFN_Color,id:6172,x:32661,y:33343,ptovrint:False,ptlb:dihuan color,ptin:_dihuancolor,varname:node_6172,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2627595,c2:0.5698156,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Multiply,id:2950,x:32675,y:33096,varname:node_2950,prsc:2|A-1435-R,B-942-OUT;n:type:ShaderForge.SFN_Slider,id:942,x:32328,y:33323,ptovrint:False,ptlb:dihuan alpha,ptin:_dihuanalpha,varname:node_942,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5273641,max:1;n:type:ShaderForge.SFN_Multiply,id:6124,x:33301,y:32749,varname:node_6124,prsc:2|A-8230-OUT,B-4989-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4989,x:33084,y:32645,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_4989,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:3934,x:33143,y:33094,varname:node_3934,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4700,x:33321,y:32984,varname:node_4700,prsc:2|A-6369-OUT,B-3934-A;n:type:ShaderForge.SFN_Vector1,id:9173,x:32245,y:33023,varname:node_9173,prsc:2,v1:0.3;proporder:1435-7873-6172-942-4989;pass:END;sub:END;*/

Shader "Shader Forge/lianjiechenggong" {
    Properties {
        _node_1435 ("node_1435", 2D) = "white" {}
        _suihuan ("suihuan", 2D) = "white" {}
        [HDR]_dihuancolor ("dihuan color", Color) = (0.2627595,0.5698156,0.9926471,1)
        _dihuanalpha ("dihuan alpha", Range(0, 1)) = 0.5273641
        _Intensity ("Intensity", Float ) = 1
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
            uniform sampler2D _node_1435; uniform float4 _node_1435_ST;
            uniform sampler2D _suihuan; uniform float4 _suihuan_ST;
            uniform float4 _dihuancolor;
            uniform float _dihuanalpha;
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
                float4 node_24 = _Time;
                float node_7634_ang = node_24.g;
                float node_7634_spd = (-0.5);
                float node_7634_cos = cos(node_7634_spd*node_7634_ang);
                float node_7634_sin = sin(node_7634_spd*node_7634_ang);
                float2 node_7634_piv = float2(0.5,0.5);
                float2 node_7634 = (mul(i.uv0-node_7634_piv,float2x2( node_7634_cos, -node_7634_sin, node_7634_sin, node_7634_cos))+node_7634_piv);
                float4 node_7366 = tex2D(_suihuan,TRANSFORM_TEX(node_7634, _suihuan));
                float node_7872_ang = node_24.g;
                float node_7872_spd = 0.3;
                float node_7872_cos = cos(node_7872_spd*node_7872_ang);
                float node_7872_sin = sin(node_7872_spd*node_7872_ang);
                float2 node_7872_piv = float2(0.5,0.5);
                float2 node_7872 = (mul(i.uv0-node_7872_piv,float2x2( node_7872_cos, -node_7872_sin, node_7872_sin, node_7872_cos))+node_7872_piv);
                float4 node_8280 = tex2D(_suihuan,TRANSFORM_TEX(node_7872, _suihuan));
                float4 _node_1435_var = tex2D(_node_1435,TRANSFORM_TEX(i.uv0, _node_1435));
                float3 finalColor = (((node_7366.rgb*float3(0.5,0.5,0.8))+node_8280.rgb+(_node_1435_var.r*_dihuancolor.rgb))*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,((node_8280.b+(_node_1435_var.r*_dihuanalpha))*i.vertexColor.a));
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
