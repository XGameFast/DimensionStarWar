// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33610,y:32723,varname:node_9361,prsc:2|custl-1575-OUT,alpha-5472-OUT;n:type:ShaderForge.SFN_Tex2d,id:3957,x:32485,y:32807,ptovrint:False,ptlb:node_3957,ptin:_node_3957,varname:node_3957,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-6688-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7734,x:32060,y:32797,varname:node_7734,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Panner,id:6688,x:32323,y:32807,varname:node_6688,prsc:2,spu:0.5,spv:0.3|UVIN-7734-UVOUT;n:type:ShaderForge.SFN_Multiply,id:5270,x:33150,y:33260,varname:node_5270,prsc:2|A-1377-RGB,B-8767-RGB;n:type:ShaderForge.SFN_Tex2d,id:5573,x:32527,y:33058,ptovrint:False,ptlb:node_5573,ptin:_node_5573,varname:node_5573,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:26780b69480eadb4084030d8bf28872f,ntxv:0,isnm:False|UVIN-3697-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3697,x:32323,y:33048,varname:node_3697,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:1059,x:32872,y:33046,varname:node_1059,prsc:2|A-3957-R,B-5573-R;n:type:ShaderForge.SFN_Multiply,id:3228,x:32916,y:32784,varname:node_3228,prsc:2|A-1057-RGB,B-272-OUT;n:type:ShaderForge.SFN_Color,id:1057,x:32502,y:32639,ptovrint:False,ptlb:node_1057,ptin:_node_1057,varname:node_1057,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5716025,c3:0.02941179,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8767,x:32794,y:33394,ptovrint:False,ptlb:node_8767,ptin:_node_8767,varname:node_8767,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c4f8ddaa0d3047d4da8657565daad313,ntxv:0,isnm:False|UVIN-1577-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1139,x:32386,y:33393,varname:node_1139,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:1577,x:32616,y:33393,varname:node_1577,prsc:2,spu:0,spv:1|UVIN-1139-UVOUT,DIST-691-OUT;n:type:ShaderForge.SFN_RemapRange,id:691,x:32463,y:33588,varname:node_691,prsc:2,frmn:0,frmx:1,tomn:-0.6,tomx:0.6|IN-4907-OUT;n:type:ShaderForge.SFN_OneMinus,id:8696,x:32670,y:33628,varname:node_8696,prsc:2|IN-1139-V;n:type:ShaderForge.SFN_Step,id:4997,x:32861,y:33639,varname:node_4997,prsc:2|A-4907-OUT,B-8696-OUT;n:type:ShaderForge.SFN_Multiply,id:5472,x:33239,y:33015,varname:node_5472,prsc:2|A-1059-OUT,B-4997-OUT;n:type:ShaderForge.SFN_Add,id:1575,x:33161,y:32784,varname:node_1575,prsc:2|A-3228-OUT,B-5270-OUT;n:type:ShaderForge.SFN_Color,id:1377,x:32794,y:33225,ptovrint:False,ptlb:node_1377,ptin:_node_1377,varname:node_1377,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.7408722,c3:0.4632353,c4:1;n:type:ShaderForge.SFN_Add,id:272,x:32714,y:32807,varname:node_272,prsc:2|A-3957-RGB,B-5573-RGB;n:type:ShaderForge.SFN_Slider,id:4907,x:32043,y:33635,ptovrint:False,ptlb:chuxian/xiaoshi,ptin:_chuxianxiaoshi,varname:node_4907,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:3957-5573-1057-8767-1377-4907;pass:END;sub:END;*/

Shader "Shader Forge/hudun" {
    Properties {
        _node_3957 ("node_3957", 2D) = "white" {}
        _node_5573 ("node_5573", 2D) = "white" {}
        [HDR]_node_1057 ("node_1057", Color) = (1,0.5716025,0.02941179,1)
        _node_8767 ("node_8767", 2D) = "white" {}
        [HDR]_node_1377 ("node_1377", Color) = (1,0.7408722,0.4632353,1)
        _chuxianxiaoshi ("chuxian/xiaoshi", Range(0, 1)) = 0
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
            uniform sampler2D _node_3957; uniform float4 _node_3957_ST;
            uniform sampler2D _node_5573; uniform float4 _node_5573_ST;
            uniform float4 _node_1057;
            uniform sampler2D _node_8767; uniform float4 _node_8767_ST;
            uniform float4 _node_1377;
            uniform float _chuxianxiaoshi;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_1550 = _Time;
                float2 node_6688 = (i.uv1+node_1550.g*float2(0.5,0.3));
                float4 _node_3957_var = tex2D(_node_3957,TRANSFORM_TEX(node_6688, _node_3957));
                float4 _node_5573_var = tex2D(_node_5573,TRANSFORM_TEX(i.uv0, _node_5573));
                float2 node_1577 = (i.uv0+(_chuxianxiaoshi*1.2+-0.6)*float2(0,1));
                float4 _node_8767_var = tex2D(_node_8767,TRANSFORM_TEX(node_1577, _node_8767));
                float3 finalColor = ((_node_1057.rgb*(_node_3957_var.rgb+_node_5573_var.rgb))+(_node_1377.rgb*_node_8767_var.rgb));
                fixed4 finalRGBA = fixed4(finalColor,((_node_3957_var.r+_node_5573_var.r)*step(_chuxianxiaoshi,(1.0 - i.uv0.g))));
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
