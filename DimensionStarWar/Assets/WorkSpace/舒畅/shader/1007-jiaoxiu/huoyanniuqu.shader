// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32772,y:32382,varname:node_9361,prsc:2|custl-4415-OUT,alpha-1432-OUT;n:type:ShaderForge.SFN_Tex2d,id:9132,x:32137,y:32490,ptovrint:False,ptlb:node_9132,ptin:_node_9132,varname:node_9132,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:627c197522a23124f9ad524d03f3229f,ntxv:0,isnm:False|UVIN-1077-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6463,x:31613,y:32490,varname:node_6463,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4758,x:31825,y:32490,varname:node_4758,prsc:2|A-9189-OUT,B-584-OUT;n:type:ShaderForge.SFN_Vector2,id:584,x:31640,y:32615,varname:node_584,prsc:2,v1:1,v2:2;n:type:ShaderForge.SFN_Panner,id:1077,x:31970,y:32490,varname:node_1077,prsc:2,spu:0,spv:-1|UVIN-4758-OUT;n:type:ShaderForge.SFN_OneMinus,id:6332,x:31769,y:32756,varname:node_6332,prsc:2|IN-6463-V;n:type:ShaderForge.SFN_Multiply,id:5636,x:31970,y:32736,varname:node_5636,prsc:2|A-6463-V,B-6332-OUT,C-5292-OUT;n:type:ShaderForge.SFN_Vector1,id:5292,x:31769,y:32874,varname:node_5292,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:7436,x:32314,y:32639,varname:node_7436,prsc:2|A-9132-R,B-5636-OUT;n:type:ShaderForge.SFN_Multiply,id:4415,x:32567,y:32447,varname:node_4415,prsc:2|A-1118-RGB,B-7436-OUT,C-1428-OUT;n:type:ShaderForge.SFN_VertexColor,id:1118,x:32314,y:32757,varname:node_1118,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1432,x:32586,y:32717,varname:node_1432,prsc:2|A-7436-OUT,B-1118-A;n:type:ShaderForge.SFN_ValueProperty,id:1428,x:32314,y:32481,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_1428,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2dAsset,id:4606,x:31365,y:32115,ptovrint:False,ptlb:node_4606,ptin:_node_4606,varname:node_4606,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2759,x:31976,y:31987,varname:node_2759,prsc:2,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False|UVIN-9634-UVOUT,TEX-4606-TEX;n:type:ShaderForge.SFN_Tex2d,id:1710,x:31976,y:32183,varname:node_1710,prsc:2,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False|UVIN-6835-UVOUT,TEX-4606-TEX;n:type:ShaderForge.SFN_TexCoord,id:757,x:31519,y:32115,varname:node_757,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:9634,x:31771,y:31987,varname:node_9634,prsc:2,spu:0.3,spv:0.5|UVIN-757-UVOUT;n:type:ShaderForge.SFN_Panner,id:6835,x:31789,y:32183,varname:node_6835,prsc:2,spu:-0.5,spv:-0.15|UVIN-757-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7419,x:32143,y:32082,varname:node_7419,prsc:2|A-2759-R,B-1710-R,C-6562-OUT;n:type:ShaderForge.SFN_Add,id:9189,x:32168,y:32275,varname:node_9189,prsc:2|A-7419-OUT,B-6463-UVOUT;n:type:ShaderForge.SFN_Vector1,id:6562,x:31976,y:32146,varname:node_6562,prsc:2,v1:0.5;proporder:9132-1428-4606;pass:END;sub:END;*/

Shader "Shader Forge/huoyanniuqu" {
    Properties {
        _node_9132 ("node_9132", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
        _node_4606 ("node_4606", 2D) = "white" {}
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
            uniform sampler2D _node_9132; uniform float4 _node_9132_ST;
            uniform float _Intensity;
            uniform sampler2D _node_4606; uniform float4 _node_4606_ST;
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
                float4 node_3265 = _Time;
                float2 node_9634 = (i.uv1+node_3265.g*float2(0.3,0.5));
                float4 node_2759 = tex2D(_node_4606,TRANSFORM_TEX(node_9634, _node_4606));
                float2 node_6835 = (i.uv1+node_3265.g*float2(-0.5,-0.15));
                float4 node_1710 = tex2D(_node_4606,TRANSFORM_TEX(node_6835, _node_4606));
                float2 node_1077 = ((((node_2759.r*node_1710.r*0.5)+i.uv0)*float2(1,2))+node_3265.g*float2(0,-1));
                float4 _node_9132_var = tex2D(_node_9132,TRANSFORM_TEX(node_1077, _node_9132));
                float node_7436 = (_node_9132_var.r*(i.uv0.g*(1.0 - i.uv0.g)*3.0));
                float3 finalColor = (i.vertexColor.rgb*node_7436*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(node_7436*i.vertexColor.a));
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
