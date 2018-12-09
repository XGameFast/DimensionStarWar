// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34147,y:32976,varname:node_4013,prsc:2|emission-3604-OUT,alpha-793-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32790,y:32660,ptovrint:False,ptlb:niuquse,ptin:_niuquse,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1323529,c2:0.3178498,c3:1,c4:1;n:type:ShaderForge.SFN_Panner,id:457,x:32609,y:32809,varname:node_457,prsc:2,spu:0.2,spv:0.3|UVIN-6229-OUT;n:type:ShaderForge.SFN_Panner,id:7471,x:31712,y:32512,varname:node_7471,prsc:2,spu:-0.25,spv:-0.1|UVIN-6819-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:584,x:32790,y:32809,varname:node_584,prsc:2,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False|UVIN-457-UVOUT,TEX-9576-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:9576,x:31623,y:32899,ptovrint:False,ptlb:2,ptin:_2,varname:node_9576,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4964,x:33087,y:32809,varname:node_4964,prsc:2|A-1304-RGB,B-584-R;n:type:ShaderForge.SFN_Tex2d,id:4738,x:31880,y:32512,varname:node_4738,prsc:2,tex:29fdeb96a8a58844f88641ff8f07f2fb,ntxv:0,isnm:False|UVIN-7471-UVOUT,TEX-9576-TEX;n:type:ShaderForge.SFN_Tex2d,id:5788,x:31880,y:32702,ptovrint:False,ptlb:node_5788,ptin:_node_5788,varname:node_5788,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:627c197522a23124f9ad524d03f3229f,ntxv:0,isnm:False|UVIN-4173-UVOUT;n:type:ShaderForge.SFN_Panner,id:4173,x:31712,y:32702,varname:node_4173,prsc:2,spu:0.1,spv:0.2|UVIN-6819-UVOUT;n:type:ShaderForge.SFN_Add,id:8164,x:33421,y:32920,varname:node_8164,prsc:2|A-4964-OUT,B-6016-OUT,C-1180-OUT,D-7851-OUT,E-6016-OUT;n:type:ShaderForge.SFN_Tex2d,id:9395,x:32612,y:33045,ptovrint:False,ptlb:node_9395,ptin:_node_9395,varname:node_9395,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:56d5dab70eaa5784280803d34e7e7722,ntxv:0,isnm:False|UVIN-5295-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9116,x:32614,y:33404,ptovrint:False,ptlb:node_9116,ptin:_node_9116,varname:node_9116,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:22024a32ce7959b49aa37a4d47cace6d,ntxv:0,isnm:False|UVIN-4278-UVOUT;n:type:ShaderForge.SFN_Panner,id:5295,x:32434,y:33045,varname:node_5295,prsc:2,spu:0,spv:1|UVIN-6819-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6819,x:32123,y:33503,varname:node_6819,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:4278,x:32415,y:33404,varname:node_4278,prsc:2,spu:1,spv:0|UVIN-6819-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1180,x:32831,y:33062,varname:node_1180,prsc:2|A-9395-R,B-573-RGB;n:type:ShaderForge.SFN_Color,id:573,x:32612,y:33221,ptovrint:False,ptlb:xitiaose,ptin:_xitiaose,varname:node_573,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5740365,c3:0.1176471,c4:1;n:type:ShaderForge.SFN_Multiply,id:7851,x:32854,y:33404,varname:node_7851,prsc:2|A-9116-R,B-363-RGB;n:type:ShaderForge.SFN_Color,id:363,x:32614,y:33591,ptovrint:False,ptlb:cutiaose,ptin:_cutiaose,varname:node_363,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.3173428,c3:0.06617647,c4:1;n:type:ShaderForge.SFN_Add,id:793,x:33434,y:33239,varname:node_793,prsc:2|A-584-R,B-9395-R,C-9116-R,D-736-R;n:type:ShaderForge.SFN_Tex2d,id:736,x:32618,y:33768,ptovrint:False,ptlb:node_736,ptin:_node_736,varname:node_736,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bde1e6b11d570474db8fec4fb3e6420e,ntxv:0,isnm:False|UVIN-3233-UVOUT;n:type:ShaderForge.SFN_Panner,id:3233,x:32432,y:33768,varname:node_3233,prsc:2,spu:0,spv:0.5|UVIN-6819-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6016,x:32853,y:33768,varname:node_6016,prsc:2|A-736-R,B-2880-RGB;n:type:ShaderForge.SFN_Color,id:2880,x:32618,y:33946,ptovrint:False,ptlb:mijitiaose,ptin:_mijitiaose,varname:node_2880,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.03676468,c2:0.6014199,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:9838,x:33461,y:33111,ptovrint:False,ptlb:node_9838,ptin:_node_9838,varname:node_9838,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.7;n:type:ShaderForge.SFN_Multiply,id:3604,x:33723,y:32978,varname:node_3604,prsc:2|A-8164-OUT,B-9838-OUT;n:type:ShaderForge.SFN_Add,id:6229,x:32324,y:32813,varname:node_6229,prsc:2|A-4738-R,B-5788-R,C-6819-UVOUT;proporder:1304-9576-5788-9116-9395-573-363-736-2880-9838;pass:END;sub:END;*/

Shader "Shader Forge/chuansongmen" {
    Properties {
        [HDR]_niuquse ("niuquse", Color) = (0.1323529,0.3178498,1,1)
        _2 ("2", 2D) = "white" {}
        _node_5788 ("node_5788", 2D) = "white" {}
        _node_9116 ("node_9116", 2D) = "white" {}
        _node_9395 ("node_9395", 2D) = "white" {}
        [HDR]_xitiaose ("xitiaose", Color) = (1,0.5740365,0.1176471,1)
        [HDR]_cutiaose ("cutiaose", Color) = (1,0.3173428,0.06617647,1)
        _node_736 ("node_736", 2D) = "white" {}
        [HDR]_mijitiaose ("mijitiaose", Color) = (0.03676468,0.6014199,1,1)
        _node_9838 ("node_9838", Float ) = 0.7
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
            uniform float4 _niuquse;
            uniform sampler2D _2; uniform float4 _2_ST;
            uniform sampler2D _node_5788; uniform float4 _node_5788_ST;
            uniform sampler2D _node_9395; uniform float4 _node_9395_ST;
            uniform sampler2D _node_9116; uniform float4 _node_9116_ST;
            uniform float4 _xitiaose;
            uniform float4 _cutiaose;
            uniform sampler2D _node_736; uniform float4 _node_736_ST;
            uniform float4 _mijitiaose;
            uniform float _node_9838;
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
                float4 node_230 = _Time;
                float2 node_7471 = (i.uv0+node_230.g*float2(-0.25,-0.1));
                float4 node_4738 = tex2D(_2,TRANSFORM_TEX(node_7471, _2));
                float2 node_4173 = (i.uv0+node_230.g*float2(0.1,0.2));
                float4 _node_5788_var = tex2D(_node_5788,TRANSFORM_TEX(node_4173, _node_5788));
                float2 node_457 = ((node_4738.r+_node_5788_var.r+i.uv0)+node_230.g*float2(0.2,0.3));
                float4 node_584 = tex2D(_2,TRANSFORM_TEX(node_457, _2));
                float2 node_3233 = (i.uv0+node_230.g*float2(0,0.5));
                float4 _node_736_var = tex2D(_node_736,TRANSFORM_TEX(node_3233, _node_736));
                float3 node_6016 = (_node_736_var.r*_mijitiaose.rgb);
                float2 node_5295 = (i.uv0+node_230.g*float2(0,1));
                float4 _node_9395_var = tex2D(_node_9395,TRANSFORM_TEX(node_5295, _node_9395));
                float2 node_4278 = (i.uv0+node_230.g*float2(1,0));
                float4 _node_9116_var = tex2D(_node_9116,TRANSFORM_TEX(node_4278, _node_9116));
                float3 emissive = (((_niuquse.rgb*node_584.r)+node_6016+(_node_9395_var.r*_xitiaose.rgb)+(_node_9116_var.r*_cutiaose.rgb)+node_6016)*_node_9838);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(node_584.r+_node_9395_var.r+_node_9116_var.r+_node_736_var.r));
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
