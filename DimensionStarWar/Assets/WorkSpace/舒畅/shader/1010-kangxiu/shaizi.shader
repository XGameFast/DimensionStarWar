// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33215,y:32725,varname:node_4013,prsc:2|emission-3692-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32422,y:32659,ptovrint:False,ptlb:shuzi,ptin:_shuzi,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2867647,c2:0.6458419,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6031,x:32248,y:32778,ptovrint:False,ptlb:node_6031,ptin:_node_6031,varname:node_6031,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7f4c6e8d0424d8d4fa8937f3b8bd1688,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5651,x:32614,y:32784,varname:node_5651,prsc:2|A-1304-RGB,B-6031-R;n:type:ShaderForge.SFN_OneMinus,id:76,x:32413,y:32955,varname:node_76,prsc:2|IN-6031-R;n:type:ShaderForge.SFN_Color,id:1503,x:32413,y:33113,ptovrint:False,ptlb:shaimian,ptin:_shaimian,varname:node_1503,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3489856,c2:0.03676468,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3008,x:32615,y:33053,varname:node_3008,prsc:2|A-76-OUT,B-1503-RGB;n:type:ShaderForge.SFN_Add,id:3692,x:32793,y:32832,varname:node_3692,prsc:2|A-5651-OUT,B-3008-OUT,C-7204-OUT;n:type:ShaderForge.SFN_Tex2d,id:883,x:32427,y:33301,ptovrint:False,ptlb:node_883,ptin:_node_883,varname:node_883,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f21ef2b58fbdf47449eac2002d5e4ece,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7204,x:32690,y:33462,varname:node_7204,prsc:2|A-883-RGB,B-2281-OUT,C-7304-R,D-7086-RGB;n:type:ShaderForge.SFN_ValueProperty,id:2281,x:32416,y:33656,ptovrint:False,ptlb:node_2281,ptin:_node_2281,varname:node_2281,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:7304,x:32427,y:33477,ptovrint:False,ptlb:node_7304,ptin:_node_7304,varname:node_7304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-6185-UVOUT;n:type:ShaderForge.SFN_Panner,id:6185,x:32232,y:33477,varname:node_6185,prsc:2,spu:0.32,spv:0.2|UVIN-7688-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7688,x:32080,y:33492,varname:node_7688,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_VertexColor,id:7086,x:32416,y:33727,varname:node_7086,prsc:2;proporder:1304-6031-1503-883-2281-7304;pass:END;sub:END;*/

Shader "Shader Forge/shaizi" {
    Properties {
        [HDR]_shuzi ("shuzi", Color) = (0.2867647,0.6458419,1,1)
        _node_6031 ("node_6031", 2D) = "white" {}
        [HDR]_shaimian ("shaimian", Color) = (0.3489856,0.03676468,1,1)
        _node_883 ("node_883", 2D) = "white" {}
        _node_2281 ("node_2281", Float ) = 1
        _node_7304 ("node_7304", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _shuzi;
            uniform sampler2D _node_6031; uniform float4 _node_6031_ST;
            uniform float4 _shaimian;
            uniform sampler2D _node_883; uniform float4 _node_883_ST;
            uniform float _node_2281;
            uniform sampler2D _node_7304; uniform float4 _node_7304_ST;
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
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _node_6031_var = tex2D(_node_6031,TRANSFORM_TEX(i.uv0, _node_6031));
                float4 _node_883_var = tex2D(_node_883,TRANSFORM_TEX(i.uv0, _node_883));
                float4 node_7938 = _Time;
                float2 node_6185 = (i.uv0+node_7938.g*float2(0.32,0.2));
                float4 _node_7304_var = tex2D(_node_7304,TRANSFORM_TEX(node_6185, _node_7304));
                float3 emissive = ((_shuzi.rgb*_node_6031_var.r)+((1.0 - _node_6031_var.r)*_shaimian.rgb)+(_node_883_var.rgb*_node_2281*_node_7304_var.r*i.vertexColor.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
