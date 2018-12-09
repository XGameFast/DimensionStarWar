// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32859,y:32443,varname:node_9361,prsc:2|custl-6379-OUT;n:type:ShaderForge.SFN_Tex2d,id:4124,x:32054,y:32195,ptovrint:False,ptlb:node_4124,ptin:_node_4124,varname:node_4124,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e5f6fd6db856f86498203e8199e3d446,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:1355,x:32033,y:32686,ptovrint:False,ptlb:node_1355,ptin:_node_1355,varname:node_1355,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9064,x:32239,y:32540,varname:node_9064,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-1245-UVOUT,TEX-1355-TEX;n:type:ShaderForge.SFN_TexCoord,id:8653,x:31725,y:32694,varname:node_8653,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:1245,x:31921,y:32528,varname:node_1245,prsc:2,spu:-0.4,spv:-0.15|UVIN-8653-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6379,x:32545,y:32619,varname:node_6379,prsc:2|A-4984-OUT,B-9064-R,C-7721-RGB,D-8674-R;n:type:ShaderForge.SFN_Power,id:9214,x:32265,y:32327,varname:node_9214,prsc:2|VAL-4124-R,EXP-8941-OUT;n:type:ShaderForge.SFN_Vector1,id:8941,x:32054,y:32396,varname:node_8941,prsc:2,v1:5;n:type:ShaderForge.SFN_Color,id:7721,x:32385,y:32762,ptovrint:False,ptlb:node_7721,ptin:_node_7721,varname:node_7721,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.4760649,c3:0.07352942,c4:1;n:type:ShaderForge.SFN_Multiply,id:4984,x:32467,y:32327,varname:node_4984,prsc:2|A-9214-OUT,B-8941-OUT;n:type:ShaderForge.SFN_Tex2d,id:8674,x:32239,y:32707,varname:node_8674,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-6415-UVOUT,TEX-1355-TEX;n:type:ShaderForge.SFN_Panner,id:6415,x:31913,y:32857,varname:node_6415,prsc:2,spu:0.2,spv:0.3|UVIN-8653-UVOUT;proporder:4124-1355-7721;pass:END;sub:END;*/

Shader "Shader Forge/liudonghuoyan" {
    Properties {
        _node_4124 ("node_4124", 2D) = "white" {}
        _node_1355 ("node_1355", 2D) = "white" {}
        [HDR]_node_7721 ("node_7721", Color) = (1,0.4760649,0.07352942,1)
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
            uniform sampler2D _node_4124; uniform float4 _node_4124_ST;
            uniform sampler2D _node_1355; uniform float4 _node_1355_ST;
            uniform float4 _node_7721;
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
                float4 _node_4124_var = tex2D(_node_4124,TRANSFORM_TEX(i.uv0, _node_4124));
                float node_8941 = 5.0;
                float4 node_9895 = _Time;
                float2 node_1245 = (i.uv0+node_9895.g*float2(-0.4,-0.15));
                float4 node_9064 = tex2D(_node_1355,TRANSFORM_TEX(node_1245, _node_1355));
                float2 node_6415 = (i.uv0+node_9895.g*float2(0.2,0.3));
                float4 node_8674 = tex2D(_node_1355,TRANSFORM_TEX(node_6415, _node_1355));
                float3 finalColor = ((pow(_node_4124_var.r,node_8941)*node_8941)*node_9064.r*_node_7721.rgb*node_8674.r);
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
