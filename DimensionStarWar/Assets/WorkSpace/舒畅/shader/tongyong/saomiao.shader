// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33352,y:32730,varname:node_9361,prsc:2|custl-7062-OUT,alpha-7379-OUT;n:type:ShaderForge.SFN_Tex2d,id:2633,x:32066,y:33006,ptovrint:False,ptlb:node_2633,ptin:_node_2633,varname:node_2633,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1c1dc9b2cc93d15468f7c8f4faeb55ec,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7601,x:32057,y:32652,ptovrint:False,ptlb:node_7601,ptin:_node_7601,varname:node_7601,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a12a870693898be4e82d880524c9a7cf,ntxv:0,isnm:False|UVIN-6512-OUT;n:type:ShaderForge.SFN_Add,id:8914,x:32985,y:33023,varname:node_8914,prsc:2|A-522-OUT,B-7938-OUT,C-9300-OUT;n:type:ShaderForge.SFN_Multiply,id:522,x:32527,y:32774,varname:node_522,prsc:2|A-7601-R,B-2633-R,C-7110-OUT;n:type:ShaderForge.SFN_Vector1,id:7110,x:32327,y:32875,varname:node_7110,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:79,x:32780,y:32755,varname:node_79,prsc:2|A-522-OUT,B-2377-RGB;n:type:ShaderForge.SFN_Color,id:2377,x:32527,y:32579,ptovrint:False,ptlb:node_2377,ptin:_node_2377,varname:node_2377,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2573529,c2:0.7848884,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8103,x:32629,y:33026,varname:node_8103,prsc:2|A-7938-OUT,B-1859-RGB;n:type:ShaderForge.SFN_Color,id:1859,x:32286,y:33241,ptovrint:False,ptlb:node_1859,ptin:_node_1859,varname:node_1859,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1176471,c2:0.342799,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:7062,x:32970,y:32857,varname:node_7062,prsc:2|A-79-OUT,B-8103-OUT,C-8201-OUT;n:type:ShaderForge.SFN_Multiply,id:7938,x:32465,y:33026,varname:node_7938,prsc:2|A-2633-R,B-5699-OUT;n:type:ShaderForge.SFN_Vector1,id:5699,x:32286,y:33163,varname:node_5699,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Power,id:2358,x:32539,y:33345,varname:node_2358,prsc:2|VAL-2633-R,EXP-6906-OUT;n:type:ShaderForge.SFN_Vector1,id:6906,x:32371,y:33401,varname:node_6906,prsc:2,v1:6;n:type:ShaderForge.SFN_Multiply,id:9300,x:32745,y:33442,varname:node_9300,prsc:2|A-2358-OUT,B-5084-OUT;n:type:ShaderForge.SFN_Multiply,id:8201,x:32773,y:33157,varname:node_8201,prsc:2|A-2377-RGB,B-9300-OUT;n:type:ShaderForge.SFN_Vector1,id:5084,x:32521,y:33476,varname:node_5084,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:7379,x:33178,y:33056,varname:node_7379,prsc:2|A-8914-OUT,B-3732-OUT;n:type:ShaderForge.SFN_Slider,id:3732,x:32935,y:33239,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_3732,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_TexCoord,id:6513,x:31128,y:32670,varname:node_6513,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:4829,x:31081,y:33110,ptovrint:False,ptlb:suofang,ptin:_suofang,varname:node_4829,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8585356,max:1;n:type:ShaderForge.SFN_Vector1,id:2739,x:31091,y:33030,varname:node_2739,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:9266,x:31298,y:32832,varname:node_9266,prsc:2|A-6513-UVOUT,B-2739-OUT;n:type:ShaderForge.SFN_Divide,id:5453,x:31482,y:32832,varname:node_5453,prsc:2|A-9266-OUT,B-4829-OUT;n:type:ShaderForge.SFN_Add,id:3348,x:31629,y:32671,varname:node_3348,prsc:2|A-6513-UVOUT,B-5453-OUT;n:type:ShaderForge.SFN_Lerp,id:6512,x:31794,y:32804,varname:node_6512,prsc:2|A-3348-OUT,B-2739-OUT,T-4829-OUT;proporder:2633-7601-2377-1859-3732-4829;pass:END;sub:END;*/

Shader "Shader Forge/saomiao" {
    Properties {
        _node_2633 ("node_2633", 2D) = "white" {}
        _node_7601 ("node_7601", 2D) = "white" {}
        _node_2377 ("node_2377", Color) = (0.2573529,0.7848884,1,1)
        _node_1859 ("node_1859", Color) = (0.1176471,0.342799,1,1)
        _Alpha ("Alpha", Range(0, 1)) = 1
        _suofang ("suofang", Range(0, 1)) = 0.8585356
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
            uniform sampler2D _node_2633; uniform float4 _node_2633_ST;
            uniform sampler2D _node_7601; uniform float4 _node_7601_ST;
            uniform float4 _node_2377;
            uniform float4 _node_1859;
            uniform float _Alpha;
            uniform float _suofang;
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
                float node_2739 = 0.5;
                float2 node_6512 = lerp((i.uv0+((i.uv0-node_2739)/_suofang)),float2(node_2739,node_2739),_suofang);
                float4 _node_7601_var = tex2D(_node_7601,TRANSFORM_TEX(node_6512, _node_7601));
                float4 _node_2633_var = tex2D(_node_2633,TRANSFORM_TEX(i.uv0, _node_2633));
                float node_522 = (_node_7601_var.r*_node_2633_var.r*2.0);
                float node_7938 = (_node_2633_var.r*0.8);
                float node_9300 = (pow(_node_2633_var.r,6.0)*2.0);
                float3 finalColor = ((node_522*_node_2377.rgb)+(node_7938*_node_1859.rgb)+(_node_2377.rgb*node_9300));
                fixed4 finalRGBA = fixed4(finalColor,((node_522+node_7938+node_9300)*_Alpha));
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
