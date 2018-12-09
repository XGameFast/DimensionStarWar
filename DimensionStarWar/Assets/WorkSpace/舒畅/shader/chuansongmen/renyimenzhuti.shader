// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33328,y:32759,varname:node_4013,prsc:2|emission-5831-OUT,alpha-5906-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32495,y:33168,ptovrint:False,ptlb:chuiwen,ptin:_chuiwen,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.04158188,c2:0.007352948,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5020,x:32386,y:32802,ptovrint:False,ptlb:node_5020,ptin:_node_5020,varname:node_5020,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f2ec27081656d8647b8be6525cc47884,ntxv:0,isnm:False|UVIN-7621-UVOUT;n:type:ShaderForge.SFN_Panner,id:7621,x:32225,y:32802,varname:node_7621,prsc:2,spu:-0.5,spv:-0.1|UVIN-2307-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2307,x:31861,y:32975,varname:node_2307,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:4120,x:32386,y:33053,ptovrint:False,ptlb:node_4120,ptin:_node_4120,varname:node_4120,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:959b620c5db1bbe458a611ce4276d3a4,ntxv:0,isnm:False|UVIN-9287-UVOUT;n:type:ShaderForge.SFN_Panner,id:9287,x:32225,y:33053,varname:node_9287,prsc:2,spu:-1,spv:0|UVIN-2307-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7821,x:32037,y:33117,varname:node_7821,prsc:2|A-2307-UVOUT,B-7535-OUT;n:type:ShaderForge.SFN_Vector2,id:7535,x:31843,y:33172,varname:node_7535,prsc:2,v1:1,v2:10;n:type:ShaderForge.SFN_Add,id:6639,x:32939,y:33056,varname:node_6639,prsc:2|A-5020-R,B-4120-R,C-3888-R;n:type:ShaderForge.SFN_Tex2d,id:3888,x:32385,y:33309,ptovrint:False,ptlb:node_3888,ptin:_node_3888,varname:node_3888,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:891299afa2f689743bbec498e582a78c,ntxv:0,isnm:False|UVIN-4834-UVOUT;n:type:ShaderForge.SFN_Panner,id:4834,x:32190,y:33309,varname:node_4834,prsc:2,spu:-2,spv:0|UVIN-7821-OUT;n:type:ShaderForge.SFN_Multiply,id:6927,x:32562,y:32650,varname:node_6927,prsc:2|A-5020-RGB,B-9528-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9528,x:32336,y:32684,ptovrint:False,ptlb:zihengwen,ptin:_zihengwen,varname:node_9528,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:9462,x:32625,y:32968,varname:node_9462,prsc:2|A-4120-R,B-1304-RGB;n:type:ShaderForge.SFN_Multiply,id:9100,x:32687,y:33399,varname:node_9100,prsc:2|A-3888-R,B-9802-RGB;n:type:ShaderForge.SFN_Color,id:9802,x:32504,y:33470,ptovrint:False,ptlb:tiaowenqian,ptin:_tiaowenqian,varname:node_9802,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.6147059,c3:0.03676468,c4:1;n:type:ShaderForge.SFN_Add,id:5831,x:32874,y:32719,varname:node_5831,prsc:2|A-6927-OUT,B-9462-OUT,C-9100-OUT;n:type:ShaderForge.SFN_VertexColor,id:5210,x:32899,y:32903,varname:node_5210,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5906,x:33130,y:32923,varname:node_5906,prsc:2|A-5210-A,B-6639-OUT;proporder:1304-5020-4120-3888-9528-9802;pass:END;sub:END;*/

Shader "Shader Forge/renyimenzhuti" {
    Properties {
        [HDR]_chuiwen ("chuiwen", Color) = (0.04158188,0.007352948,1,1)
        _node_5020 ("node_5020", 2D) = "white" {}
        _node_4120 ("node_4120", 2D) = "white" {}
        _node_3888 ("node_3888", 2D) = "white" {}
        _zihengwen ("zihengwen", Float ) = 1
        [HDR]_tiaowenqian ("tiaowenqian", Color) = (1,0.6147059,0.03676468,1)
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
            uniform float4 _chuiwen;
            uniform sampler2D _node_5020; uniform float4 _node_5020_ST;
            uniform sampler2D _node_4120; uniform float4 _node_4120_ST;
            uniform sampler2D _node_3888; uniform float4 _node_3888_ST;
            uniform float _zihengwen;
            uniform float4 _tiaowenqian;
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
                float4 node_5802 = _Time;
                float2 node_7621 = (i.uv0+node_5802.g*float2(-0.5,-0.1));
                float4 _node_5020_var = tex2D(_node_5020,TRANSFORM_TEX(node_7621, _node_5020));
                float2 node_9287 = (i.uv0+node_5802.g*float2(-1,0));
                float4 _node_4120_var = tex2D(_node_4120,TRANSFORM_TEX(node_9287, _node_4120));
                float2 node_4834 = ((i.uv0*float2(1,10))+node_5802.g*float2(-2,0));
                float4 _node_3888_var = tex2D(_node_3888,TRANSFORM_TEX(node_4834, _node_3888));
                float3 emissive = ((_node_5020_var.rgb*_zihengwen)+(_node_4120_var.r*_chuiwen.rgb)+(_node_3888_var.r*_tiaowenqian.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*(_node_5020_var.r+_node_4120_var.r+_node_3888_var.r)));
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
