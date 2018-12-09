// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33815,y:32669,varname:node_4013,prsc:2|emission-9602-OUT,alpha-6606-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32517,y:32393,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7720588,c2:0.9339756,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:877,x:32131,y:33014,ptovrint:False,ptlb:jiebing,ptin:_jiebing,varname:node_877,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9086168,max:1;n:type:ShaderForge.SFN_Step,id:373,x:32916,y:32839,varname:node_373,prsc:2|A-5054-B,B-877-OUT;n:type:ShaderForge.SFN_Tex2d,id:5054,x:32617,y:32781,ptovrint:False,ptlb:node_5054,ptin:_node_5054,varname:node_5054,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0ab64991ea79a6944a80b524cd0f9704,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2726,x:32928,y:32646,ptovrint:False,ptlb:node_2726,ptin:_node_2726,varname:node_2726,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6984d0f0a51ba3b42af582ce5758453e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:308,x:33171,y:32632,varname:node_308,prsc:2|A-1304-RGB,B-2726-B;n:type:ShaderForge.SFN_Multiply,id:252,x:33192,y:32897,varname:node_252,prsc:2|A-2726-B,B-373-OUT;n:type:ShaderForge.SFN_Tex2d,id:5489,x:32734,y:33409,ptovrint:False,ptlb:node_5489,ptin:_node_5489,varname:node_5489,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28cad48a0e53b324f9cf1ad3c03a76f1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:2794,x:33405,y:32939,varname:node_2794,prsc:2|A-252-OUT,B-2707-OUT,T-2488-OUT;n:type:ShaderForge.SFN_Vector1,id:2488,x:33299,y:33107,varname:node_2488,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:2707,x:33102,y:33171,varname:node_2707,prsc:2|A-7607-OUT,B-5489-R;n:type:ShaderForge.SFN_Vector1,id:2208,x:32288,y:33192,varname:node_2208,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:7607,x:32585,y:33139,varname:node_7607,prsc:2|A-877-OUT,B-2208-OUT;n:type:ShaderForge.SFN_Tex2d,id:6406,x:32823,y:32182,ptovrint:False,ptlb:node_6406,ptin:_node_6406,varname:node_6406,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f15404cf047b0804c8a781f8479ee5da,ntxv:0,isnm:False|UVIN-1064-UVOUT;n:type:ShaderForge.SFN_Panner,id:1064,x:32646,y:32182,varname:node_1064,prsc:2,spu:0.1,spv:0.05|UVIN-6273-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6273,x:32457,y:32182,varname:node_6273,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9274,x:33110,y:32208,varname:node_9274,prsc:2|A-6406-R,B-2726-B,C-1185-R,D-1185-R,E-1185-R;n:type:ShaderForge.SFN_Add,id:9602,x:33510,y:32470,varname:node_9602,prsc:2|A-7823-OUT,B-308-OUT;n:type:ShaderForge.SFN_Color,id:3172,x:33299,y:32070,ptovrint:False,ptlb:liuwen,ptin:_liuwen,varname:node_3172,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1617647,c2:0.479716,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7823,x:33510,y:32254,varname:node_7823,prsc:2|A-3172-RGB,B-9274-OUT;n:type:ShaderForge.SFN_Tex2d,id:1185,x:32224,y:32404,ptovrint:False,ptlb:node_1185,ptin:_node_1185,varname:node_1185,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:95450a34df3571d47bf19f79077026c1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6606,x:33636,y:32992,varname:node_6606,prsc:2|A-2794-OUT,B-4653-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4653,x:33493,y:33083,ptovrint:False,ptlb:toumingdu,ptin:_toumingdu,varname:node_4653,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;proporder:1304-877-2726-5054-5489-6406-3172-1185-4653;pass:END;sub:END;*/

Shader "Shader Forge/dongping" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.7720588,0.9339756,1,1)
        _jiebing ("jiebing", Range(0, 1)) = 0.9086168
        _node_2726 ("node_2726", 2D) = "white" {}
        _node_5054 ("node_5054", 2D) = "white" {}
        _node_5489 ("node_5489", 2D) = "white" {}
        _node_6406 ("node_6406", 2D) = "white" {}
        [HDR]_liuwen ("liuwen", Color) = (0.1617647,0.479716,1,1)
        _node_1185 ("node_1185", 2D) = "white" {}
        _toumingdu ("toumingdu", Float ) = 0
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
            uniform float _jiebing;
            uniform sampler2D _node_5054; uniform float4 _node_5054_ST;
            uniform sampler2D _node_2726; uniform float4 _node_2726_ST;
            uniform sampler2D _node_5489; uniform float4 _node_5489_ST;
            uniform sampler2D _node_6406; uniform float4 _node_6406_ST;
            uniform float4 _liuwen;
            uniform sampler2D _node_1185; uniform float4 _node_1185_ST;
            uniform float _toumingdu;
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
////// Emissive:
                float4 node_5330 = _Time;
                float2 node_1064 = (i.uv0+node_5330.g*float2(0.1,0.05));
                float4 _node_6406_var = tex2D(_node_6406,TRANSFORM_TEX(node_1064, _node_6406));
                float4 _node_2726_var = tex2D(_node_2726,TRANSFORM_TEX(i.uv0, _node_2726));
                float4 _node_1185_var = tex2D(_node_1185,TRANSFORM_TEX(i.uv0, _node_1185));
                float3 emissive = ((_liuwen.rgb*(_node_6406_var.r*_node_2726_var.b*_node_1185_var.r*_node_1185_var.r*_node_1185_var.r))+(_Color.rgb*_node_2726_var.b));
                float3 finalColor = emissive;
                float4 _node_5054_var = tex2D(_node_5054,TRANSFORM_TEX(i.uv0, _node_5054));
                float4 _node_5489_var = tex2D(_node_5489,TRANSFORM_TEX(i.uv0, _node_5489));
                fixed4 finalRGBA = fixed4(finalColor,(lerp((_node_2726_var.b*step(_node_5054_var.b,_jiebing)),((_jiebing*1.5)*_node_5489_var.r),0.5)*_toumingdu));
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
